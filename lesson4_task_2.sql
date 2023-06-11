SELECT 	g.gender, 
		SUM(g.likes) as likes
FROM
		(SELECT l.user_id,
				COUNT(l.user_id) as likes, 
                p.gender 
		FROM profiles AS p, likes AS l 
        WHERE p.user_id=l.user_id 
        GROUP BY l.user_id) AS g
GROUP BY g.gender;