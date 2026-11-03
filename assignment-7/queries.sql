-- Question 1: the last 20 messages in #general, newest first.
-- Returns: time, username, text (20 rows).
SELECT m.sent_at, u.username, m.body
FROM messages m
JOIN users u ON u.id = m.user_id
WHERE m.channel_id = (SELECT id FROM channels WHERE name = 'general')
ORDER BY m.sent_at DESC, m.id DESC
LIMIT 20;

-- Question 2: how many messages each user has written, including users with 0.
-- Returns: username, message_count (4 rows).
SELECT u.username, COUNT(m.id) AS message_count
FROM users u
LEFT JOIN messages m ON m.user_id = u.id
GROUP BY u.id, u.username
ORDER BY message_count DESC;