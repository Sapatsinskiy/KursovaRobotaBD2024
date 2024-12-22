CREATE TRIGGER trg_check_story_date_and_author
ON dbo.Stories
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @user_id INT, @created_date DATE, @registration_date DATE, @is_autor INT;

    -- Отримуємо значення з вставлених даних
    SELECT 
        @user_id = Autor_id,
        @created_date = Created_date
    FROM inserted;

    -- Перевіряємо, чи існує відповідний користувач і чи є він автором
    SELECT 
        @registration_date = Registration_date,
        @is_autor = is_autor
    FROM dbo.Users
    WHERE Id = @user_id;

    -- Перевіряємо, чи дата створення історії більша або дорівнює даті реєстрації користувача
    IF @created_date < @registration_date
    BEGIN
        RAISERROR ('Дата створення історії не може бути раніше дати реєстрації користувача.', 16, 1);
        RETURN;
    END

    -- Перевіряємо, чи користувач є автором
    IF @is_autor != 1
    BEGIN
        RAISERROR ('Користувач не є автором.', 16, 1);
        RETURN;
    END

    -- Якщо перевірки пройшли, вставляємо дані в таблицю Stories
    INSERT INTO dbo.Stories (Story_name, About_story, Autor_id, Category_id, Created_date, Main_likes, Main_watches)
    SELECT Story_name, About_story, Autor_id, Category_id, Created_date, Main_likes, Main_watches
    FROM inserted;
END;
