DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old SELECT * FROM users;
DROP PROCEDURE IF EXISTS to_old;
DELIMITER //
CREATE PROCEDURE to_old(user_id INT)
BEGIN
START TRANSACTION;
SET @id=(SELECT max(id) FROM users_old)+1;
INSERT INTO users_old SELECT @id,firstname, lastname, email FROM users WHERE id=user_id;
DELETE FROM users WHERE id=user_id LIMIT 1;
COMMIT;
END //
DELIMITER ;

CALL to_old(1);