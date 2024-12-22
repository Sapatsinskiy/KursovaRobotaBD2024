CREATE OR ALTER TRIGGER trg_PreventDuplicateLikes
ON follow_story
INSTEAD OF INSERT
AS
BEGIN
    -- Перевірка на наявність дубліката
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN follow_story fs ON fs.User_id = i.User_id AND fs.Story_id = i.Story_id
    )
    BEGIN
        RAISERROR('Цей користувач вже поставив лайк цій історії.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    
    -- Перевірка, чи користувач не є автором історії
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Stories s ON i.Story_id = s.Id
        WHERE i.User_id = s.Autor_id
    )
    BEGIN
        RAISERROR('Автор історії не може ставити лайк своїй історії.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    
    -- Вставка, якщо перевірки пройдені
    INSERT INTO follow_story (Story_id, User_id)
    SELECT Story_id, User_id
    FROM inserted;
END;


