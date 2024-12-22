CREATE TRIGGER trg_check_section_date
ON dbo.Sections
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @story_id INT, @created_date DATE, @story_created_date DATE;

    -- Отримуємо значення з вставлених даних
    SELECT 
        @story_id = Story_id,
        @created_date = Created_date
    FROM inserted;

    -- Перевіряємо дату створення історії
    SELECT 
        @story_created_date = Created_date
    FROM dbo.Stories
    WHERE Id = @story_id;

    -- Перевіряємо, чи дата створення розділу більша або дорівнює даті створення історії
    IF @created_date < @story_created_date
    BEGIN
        RAISERROR ('Дата створення розділу не може бути раніше дати створення історії.', 16, 1);
        RETURN;
    END

    -- Якщо перевірка пройшла, вставляємо дані в таблицю Sections
    INSERT INTO dbo.Sections (Section_name, Section_text_file, Story_id, Created_date, Watches)
    SELECT Section_name, Section_text_file, Story_id, Created_date, Watches
    FROM inserted;
END;
