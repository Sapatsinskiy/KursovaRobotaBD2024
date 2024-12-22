CREATE TRIGGER trg_check_section_date
ON dbo.Sections
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @story_id INT, @created_date DATE, @story_created_date DATE;

    -- �������� �������� � ���������� �����
    SELECT 
        @story_id = Story_id,
        @created_date = Created_date
    FROM inserted;

    -- ���������� ���� ��������� �����
    SELECT 
        @story_created_date = Created_date
    FROM dbo.Stories
    WHERE Id = @story_id;

    -- ����������, �� ���� ��������� ������ ����� ��� ������� ��� ��������� �����
    IF @created_date < @story_created_date
    BEGIN
        RAISERROR ('���� ��������� ������ �� ���� ���� ����� ���� ��������� �����.', 16, 1);
        RETURN;
    END

    -- ���� �������� �������, ���������� ��� � ������� Sections
    INSERT INTO dbo.Sections (Section_name, Section_text_file, Story_id, Created_date, Watches)
    SELECT Section_name, Section_text_file, Story_id, Created_date, Watches
    FROM inserted;
END;
