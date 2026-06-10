WITH first_activity AS (

SELECT
    user_id,
    MIN(DATE(event_time)) AS first_date

FROM youtube_events

GROUP BY user_id

)

SELECT

COUNT(DISTINCT fa.user_id) AS d1_users

FROM first_activity fa

JOIN youtube_events e

ON fa.user_id = e.user_id

AND DATE(e.event_time) =
fa.first_date + INTERVAL '1 day';



-- d7

WITH first_activity AS (

SELECT
    user_id,
    MIN(DATE(event_time)) AS first_date

FROM youtube_events

GROUP BY user_id

)

SELECT

COUNT(DISTINCT fa.user_id) AS d7_users

FROM first_activity fa

JOIN youtube_events e

ON fa.user_id = e.user_id

AND DATE(e.event_time) =
fa.first_date + INTERVAL '7 day';