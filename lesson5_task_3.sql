SELECT *,
		TIMESTAMPDIFF(MINUTE, created_at, LEAD(created_at) OVER(ORDER BY created_at)) 'minutes'
FROM messages
ORDER BY created_at;