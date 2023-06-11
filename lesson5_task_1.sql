CREATE VIEW users20 AS 
SELECT a.firstname, 
	   a.lastname, 
       a.hometown,
       a.gender
FROM(SELECT *, 
			TIMESTAMPDIFF(YEAR, p.birthday, curdate()) AS age
	 FROM profiles AS p, 
		  users AS u
	 WHERE p.user_id=u.id
     HAVING age<20) AS a;

SELECT * FROM users20;

DROP VIEW users20;