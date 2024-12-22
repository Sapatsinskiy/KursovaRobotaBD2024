CREATE TRIGGER check_coment_date
ON Coments
FOR INSERT
AS
BEGIN
    DECLARE @story_created_date DATE;
    
    SELECT @story_created_date = Created_date
    FROM Stories
    WHERE id = (SELECT Story_id FROM inserted);
    
    IF (SELECT Created_date FROM inserted) < @story_created_date
    BEGIN
        RAISERROR('���� ��������� ��������� ������� ���� ������ ��� ����� ��� ��������� �����', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
