CREATE TRIGGER trg_DeleteUserFollow_Story
ON Users
AFTER DELETE
AS
BEGIN
    DELETE FROM Follow_story
    WHERE User_id IN (SELECT Id FROM DELETED);
END;