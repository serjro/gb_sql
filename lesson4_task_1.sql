SELECT 	l.user_id, 
		COUNT(l.user_id) as likes,
        TIMESTAMPDIFF(YEAR, p.birthday, curdate()) AS age
FROM 	likes as l,
        profiles as p
WHERE l.user_id=p.user_id
GROUP BY user_id
HAVING age<12;