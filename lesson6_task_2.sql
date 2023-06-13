DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS CHAR(50) DETERMINISTIC
BEGIN
SET @t=HOUR(CURRENT_TIME());
RETURN IF(0<=@t AND @t<6,"Доброй ночи",
	IF(6<=@t AND @t<12,"Доброе утро",
    IF(12<=@t AND @t<18,"Добрый день","Добрый вечер")));
END //
DELIMITER ;

SELECT hello();
