CREATE TRIGGER trg_check_story_date_and_author
ON dbo.Stories
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @user_id INT, @created_date DATE, @registration_date DATE, @is_autor INT;

    -- �������� �������� � ���������� �����
    SELECT 
        @user_id = Autor_id,
        @created_date = Created_date
    FROM inserted;

    -- ����������, �� ���� ��������� ���������� � �� � �� �������
    SELECT 
        @registration_date = Registration_date,
        @is_autor = is_autor
    FROM dbo.Users
    WHERE Id = @user_id;

    -- ����������, �� ���� ��������� ����� ����� ��� ������� ��� ��������� �����������
    IF @created_date < @registration_date
    BEGIN
        RAISERROR ('���� ��������� ����� �� ���� ���� ����� ���� ��������� �����������.', 16, 1);
        RETURN;
    END

    -- ����������, �� ���������� � �������
    IF @is_autor != 1
    BEGIN
        RAISERROR ('���������� �� � �������.', 16, 1);
        RETURN;
    END

    -- ���� �������� �������, ���������� ��� � ������� Stories
    INSERT INTO dbo.Stories (Story_name, About_story, Autor_id, Category_id, Created_date, Main_likes, Main_watches)
    SELECT Story_name, About_story, Autor_id, Category_id, Created_date, Main_likes, Main_watches
    FROM inserted;
END;
