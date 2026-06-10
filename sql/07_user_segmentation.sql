WITH user_activity AS (

SELECT
    user_id,
    COUNT(*) AS activity_count

FROM youtube_events

GROUP BY user_id

)

SELECT

CASE

WHEN activity_count >= 5
THEN 'Power User'

WHEN activity_count >= 2
THEN 'Regular User'

ELSE 'Casual User'

END AS segment,

COUNT(*) AS users

FROM user_activity

GROUP BY segment

ORDER BY users DESC;