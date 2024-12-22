CREATE TRIGGER trg_DeleteComments_Users
ON Users
AFTER DELETE
AS
BEGIN
    DELETE FROM Coments
    WHERE User_id IN (SELECT Id FROM DELETED);
END;

