CREATE TRIGGER trg_DeleteFan_User
ON Users
AFTER DELETE
AS
BEGIN
    DELETE FROM Autor_fans
    WHERE Autor_id IN (SELECT Id FROM DELETED);
END;

