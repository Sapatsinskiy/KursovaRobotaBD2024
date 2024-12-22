CREATE TRIGGER trg_PreventInvalidSubscriptions
ON Autor_fans
INSTEAD OF INSERT
AS
BEGIN
    -- ��������, �� ����� �� ���������� �� ����
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.Autor_id = i.User_id
    )
    BEGIN
        RAISERROR('����� �� ���� ���������� �� ����.', 16, 1);
        RETURN;
    END

    -- �������� �� �������� �������
    IF EXISTS (
        SELECT 1
        FROM Autor_fans af
        INNER JOIN inserted i ON af.Autor_id = i.Autor_id AND af.User_id = i.User_id
    )
    BEGIN
        RAISERROR('��� ���������� ��� ��������� �� ����� ������.', 16, 1);
        RETURN;
    END

    -- ������� �����, ���� �������� �������
    INSERT INTO Autor_fans (Autor_id, User_id, Fan_date)
    SELECT Autor_id, User_id, GETDATE()
    FROM inserted;
END;
