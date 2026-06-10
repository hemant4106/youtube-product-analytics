SELECT
    DATE_TRUNC('week', event_time)::DATE AS week,
    COUNT(DISTINCT user_id) AS wau
FROM youtube_events
GROUP BY week
ORDER BY week;