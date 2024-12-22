CREATE TRIGGER trg_PreventInvalidSubscriptions
ON Autor_fans
INSTEAD OF INSERT
AS
BEGIN
    -- Перевірка, чи автор не підписується на себе
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.Autor_id = i.User_id
    )
    BEGIN
        RAISERROR('Автор не може підписатися на себе.', 16, 1);
        RETURN;
    END

    -- Перевірка на дублікати підписок
    IF EXISTS (
        SELECT 1
        FROM Autor_fans af
        INNER JOIN inserted i ON af.Autor_id = i.Autor_id AND af.User_id = i.User_id
    )
    BEGIN
        RAISERROR('Цей користувач вже підписаний на цього автора.', 16, 1);
        RETURN;
    END

    -- Вставка даних, якщо перевірки пройдені
    INSERT INTO Autor_fans (Autor_id, User_id, Fan_date)
    SELECT Autor_id, User_id, GETDATE()
    FROM inserted;
END;
