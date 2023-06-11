SELECT DENSE_RANK()
       OVER(ORDER BY s.mess) 'rank',
       s.firstname, 
	   s.lastname, 
       s.mess
FROM(
		SELECT u.*,
			   COUNT(m.from_user_id) AS mess
		FROM users AS u, 
			 messages AS m
		WHERE u.id=m.from_user_id
		GROUP BY u.id) AS s;