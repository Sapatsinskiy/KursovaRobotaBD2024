CREATE OR ALTER TRIGGER trg_PreventDuplicateLikes
ON follow_story
INSTEAD OF INSERT
AS
BEGIN
    -- �������� �� �������� ��������
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN follow_story fs ON fs.User_id = i.User_id AND fs.Story_id = i.Story_id
    )
    BEGIN
        RAISERROR('��� ���������� ��� �������� ���� ��� �����.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    
    -- ��������, �� ���������� �� � ������� �����
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Stories s ON i.Story_id = s.Id
        WHERE i.User_id = s.Autor_id
    )
    BEGIN
        RAISERROR('����� ����� �� ���� ������� ���� ���� �����.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    
    -- �������, ���� �������� �������
    INSERT INTO follow_story (Story_id, User_id)
    SELECT Story_id, User_id
    FROM inserted;
END;


