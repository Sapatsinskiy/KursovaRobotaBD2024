using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace usingbd
{
    public partial class Form1 : Form
    {
        private string connectionString = "Server=MSI;Database=stories_site;Trusted_Connection=True;";
        public Form1()
        {
            InitializeComponent();
            LoadTables();
            shadowUpdate("UpdateMainLikes");
            shadowUpdate("UpdateMainWatches");
        }
        private void LoadTables()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = @"
                    SELECT TABLE_NAME 
                    FROM INFORMATION_SCHEMA.TABLES 
                    WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME != 'sysdiagrams'"; 
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    listBoxTables.Items.Clear();
                    while (reader.Read())
                    {
                        listBoxTables.Items.Add(reader["TABLE_NAME"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Помилка при завантаженні таблиць: " + ex.Message);
                }
            }
        }

        private void LoadTableContent(string tableName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = $"SELECT * FROM [{tableName}]";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    dataGridViewTable.DataSource = table;
                    labelInfo.Text = "Таблиця: " + tableName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Помилка при завантаженні даних таблиці: " + ex.Message);
                }
            }
        }


        bool showStatisticDetails = false;
        string[] statistics = { "Кількість зареєстрованих користувачів",
             "Кількість написаних історій",
             "Кількість лайків історій",
             "Кількість підписок",
            "Топ 10 історій",
            "Топ 10 авторів"};

        string[] details = { "Інформація про історії", 
            "Підрахунок фанатів", 
            "Фанати автора",
            "Коментрі до історії",
            "Підписки користувача на історії",
            "Розділи історії",
        };
        bool needKey = false;
        string procedureName = "";
        string procedure = "";
        string Key1 = "";
        object Value1 = null;
        string Key2 = "";
        object Value2 = null;
        private void listBoxTables_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            if (listBoxTables.SelectedItem != null)
            {
                if (showStatisticDetails == false)
                {
                    string tableName = listBoxTables.SelectedItem.ToString();
                    LoadTableContent(tableName);
                    buttonSave.Visible = true;
                }
                else
                {
                    

                    procedureName = listBoxTables.SelectedItem.ToString();

                    switch (procedureName)
                    {
                        case "Інформація про історії":
                            procedure="GetStoryDetails";
                            needKey = false;
                            break;
                        case "Підрахунок фанатів":
                            procedure = "CountAuthorsFans";
                            needKey = false;
                            break;
                        case "Топ 10 історій":
                            procedure = "GetTop10StoriesByViews";
                            needKey = false;
                            break;
                        case "Топ 10 авторів":
                            procedure = "GetTop10Authors";
                            needKey = false;
                            break;
                        case "Фанати автора":
                            procedure = "GetAuthorFans";
                            needKey = true;
                            Key1 = "@AuthorId";
                            Key2 = null;
                            labelMesValue1.Text = "(id автора)";
                            labelMesValue2.Text = "(заблоковане)";
                            dataGridViewTable.DataSource = null;
                            break;
                        case "Коментрі до історії":
                            procedure = "GetStoryComments";
                            needKey = true;
                            Key1 = "@StoryId";
                            Key2 = null;
                            labelMesValue1.Text = "(id історії)";
                            labelMesValue2.Text = "(заблоковане)";
                            dataGridViewTable.DataSource = null;
                            break;
                        case "Підписки користувача на історії":
                            procedure = "GetUserFollowedStories";
                            needKey = true;
                            Key1 = "@UserId";
                            Key2 = null;
                            labelMesValue1.Text = "(id користувача)";
                            labelMesValue2.Text = "(заблоковане)";
                            dataGridViewTable.DataSource = null;
                            break;
                        case "Розділи історії":
                            procedure = "GetStorySections";
                            needKey = true;
                            Key1 = "@StoryId";
                            Key2 = null;
                            labelMesValue1.Text = "(id історії)";
                            labelMesValue2.Text = "(заблоковане)";
                            dataGridViewTable.DataSource = null;
                            break;
                        case "Кількість зареєстрованих користувачів":
                            procedure = "GetUserRegistrationStatistics";
                            needKey = true;
                            Key1 = "@Month";
                            Key2 = "@Year";
                            labelMesValue1.Text = "(місяць)";
                            labelMesValue2.Text = "(рік)";
                            showProcedureWithParameters(procedure, procedureName, null, null, null, null);
                            textBoxValue2.Enabled = true;
                            break;
                        case "Кількість написаних історій":
                            procedure = "GetStoriesStatistics";
                            needKey = true;
                            Key1 = "@Month";
                            Key2 = "@Year";
                            labelMesValue1.Text = "(місяць)";
                            labelMesValue2.Text = "(рік)";
                            showProcedureWithParameters(procedure, procedureName, null, null, null, null);
                            textBoxValue2.Enabled = true;
                            break;
                        case "Кількість лайків історій":
                            procedure = "GetStoryLikesStatistics";
                            needKey = true;
                            Key1 = "@Month";
                            Key2 = "@Year";
                            labelMesValue1.Text = "(місяць)";
                            labelMesValue2.Text = "(рік)";
                            showProcedureWithParameters(procedure, procedureName, null, null, null, null);
                            textBoxValue2.Enabled = true;
                            break;
                        case "Кількість підписок":
                            procedure = "GetAutorFansStatistics";
                            needKey = true;
                            Key1 = "@Month";
                            Key2 = "@Year";
                            labelMesValue1.Text = "(місяць)";
                            labelMesValue2.Text = "(рік)";
                            showProcedureWithParameters(procedure, procedureName, null, null, null, null);
                            textBoxValue2.Enabled = true;
                            break;
                    }
                    if (needKey == false)
                    {
                        showProcedure(procedure, procedureName);
                        panelHelpProcedure.Visible = false;
                    }
                    else
                    {
                        panelHelpProcedure.Visible = true;
                    }
                    
                }
            }
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            if (listBoxTables.SelectedItem != null)
            {
                string tableName = listBoxTables.SelectedItem.ToString();
                DialogResult result = MessageBox.Show("Ви впевнені, що хочете зберегти зміни?",
                                                      "Підтвердження",
                                                      MessageBoxButtons.YesNo,
                                                      MessageBoxIcon.Question);

                if (result == DialogResult.Yes)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            connection.Open();
                            SqlDataAdapter adapter = new SqlDataAdapter($"SELECT * FROM [{tableName}]", connection);
                            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);

                            DataTable changes = ((DataTable)dataGridViewTable.DataSource).GetChanges();
                            if (changes != null)
                            {
                                adapter.UpdateCommand = builder.GetUpdateCommand();
                                adapter.InsertCommand = builder.GetInsertCommand();
                                adapter.DeleteCommand = builder.GetDeleteCommand();

                                adapter.Update(changes); // Застосовуємо зміни до бази даних
                                ((DataTable)dataGridViewTable.DataSource).AcceptChanges(); // Очищаємо зміни
                                MessageBox.Show("Зміни успішно збережені.");

                                LoadTableContent(tableName);
                                shadowUpdate("UpdateMainLikes");
                                shadowUpdate("UpdateMainWatches");
                            }
                            else
                            {
                                MessageBox.Show("Немає змін для збереження.");
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Помилка при збереженні змін: " + ex.Message);
                        }
                    }
                }
            }
        }

        void showProcedure(string comandName, string message)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(comandName, connection);
                    command.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    dataGridViewTable.DataSource = table;

                    labelInfo.Text = message;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Помилка при виконанні процедури: " + ex.Message);
                }
            }
        }
        void showProcedureWithParameters(string commandName, string message,
                                  string paramKey1, object paramValue1,
                                  string paramKey2 = null, object paramValue2 = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(commandName, connection);
                    command.CommandType = CommandType.StoredProcedure;


                    if (!string.IsNullOrEmpty(paramKey1))
                    {
                        command.Parameters.Add(new SqlParameter(paramKey1, paramValue1 ?? DBNull.Value));
                    }

                    if (!string.IsNullOrEmpty(paramKey2))
                    {
                        command.Parameters.Add(new SqlParameter(paramKey2, paramValue2 ?? DBNull.Value));
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    dataGridViewTable.DataSource = table;
                    labelInfo.Text = message;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Помилка при виконанні процедури: " + ex.Message);
                }
            }
        }


        private void buttonShowTables_Click(object sender, EventArgs e)
        {
            labelMesValue1.Text = "(заблоковане)";
            labelMesValue2.Text = "(заблоковане)";
            textBoxValue2.Enabled = false;
            showStatisticDetails = false;
            panelHelpProcedure.Visible = false;
            listBoxTables.Items.Clear();
            buttonSave.Visible = true;
            LoadTables();
        }

        private void buttonShowStatistic_Click(object sender, EventArgs e)
        {
            labelMesValue1.Text = "(заблоковане)";
            labelMesValue2.Text = "(заблоковане)";
            showStatisticDetails = true;
            buttonSave.Visible = false;
            listBoxTables.Items.Clear();
            for (int i = 0; i < statistics.Length; i++)
            {
                listBoxTables.Items.Add(statistics[i]);
            }
        }

        private void buttonShowDetails_Click(object sender, EventArgs e)
        {
            labelMesValue1.Text = "(заблоковане)";
            labelMesValue2.Text = "(заблоковане)";
            textBoxValue2.Enabled = false; 
            showStatisticDetails = true;
            buttonSave.Visible = false;
            listBoxTables.Items.Clear();
            for (int i = 0; i < details.Length; i++)
            {
                listBoxTables.Items.Add(details[i]);
            }
        }

        private void buttonFind_Click(object sender, EventArgs e)
        {
            string find = textBoxFind.Text.Trim();

            if (string.IsNullOrEmpty(find))
            {
                MessageBox.Show("Будь ласка, введіть текст для пошуку.");
                return;
            }

            int cTrue = 0;
            string[] searchParts = find.Split(',');

            for (int i = 0; i < searchParts.Length; i++)
            {
                if (searchParts[i].Length >= 3)
                {
                    cTrue += 1;
                }
            }

            if (cTrue == searchParts.Length)
            {
                bool found = false;
                int firstMatchIndex = -1;

                foreach (DataGridViewRow row in dataGridViewTable.Rows)
                {
                    row.Selected = false;
                }

                foreach (DataGridViewRow row in dataGridViewTable.Rows)
                {
                    bool match = true;

                    foreach (string searchPart in searchParts)
                    {
                        bool partFound = false;
                        foreach (DataGridViewCell cell in row.Cells)
                        {
                            if (cell.Value != null)
                            {
                                string cellValue = cell.Value.ToString().ToLower();
                                string searchValue = searchPart.Trim().ToLower();

                                if (cellValue.Contains(searchValue))
                                {
                                    partFound = true;
                                    break;
                                }
                            }
                        }

                        if (!partFound)
                        {
                            match = false;
                            break;
                        }
                    }

                    if (match)
                    {
                        row.Selected = true;
                        found = true;

                        if (firstMatchIndex == -1)
                        {
                            firstMatchIndex = row.Index;
                        }
                    }
                }

                if (found)
                {
                    if (firstMatchIndex != -1)
                    {
                        dataGridViewTable.FirstDisplayedScrollingRowIndex = firstMatchIndex;
                    }
                }
                else
                {
                    MessageBox.Show("Не знайдено елементів, що відповідають пошуку.");
                }
            }
            else
            {
                MessageBox.Show("Слово для пошуку має бути не менше 3 символів.");
            }
        }

        private void buttonForProcedure_Click(object sender, EventArgs e)
        {
            Value1 = textBoxValue1.Text;
            Value2 = textBoxValue2.Text;
            if(textBoxValue1.Text.Length > 0)
            {
                showProcedureWithParameters(procedure, procedureName, Key1, Value1, Key2, Value2);
                textBoxValue1.Text = "";
            }
            else
            {
                MessageBox.Show("Введіть значення для пошуку");
            }

        }
        void shadowUpdate(string commandName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(commandName, connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {                   
                }
            }
        }

    }
}
