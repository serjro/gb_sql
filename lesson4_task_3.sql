SELECT * 
FROM profiles
WHERE user_id NOT IN (SELECT distinct(from_user_id) 
					  FROM messages);