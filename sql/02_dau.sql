SELECT
    DATE(event_time) AS day,
    COUNT(DISTINCT user_id) AS dau
FROM youtube_events
GROUP BY day
ORDER BY day;