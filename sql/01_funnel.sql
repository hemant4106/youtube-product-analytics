SELECT
    event_type,
    COUNT(DISTINCT user_id) AS users
FROM youtube_events
GROUP BY event_type;

WITH funnel AS (
    SELECT
        event_type,
        COUNT(DISTINCT user_id) AS users
    FROM youtube_events
    GROUP BY event_type
)

SELECT
    ROUND(
        (
            SELECT users
            FROM funnel
            WHERE event_type = 'cart'
        ) * 100.0
        /
        (
            SELECT users
            FROM funnel
            WHERE event_type = 'view'
        ),
        2
    ) AS view_to_like_pct,

    ROUND(
        (
            SELECT users
            FROM funnel
            WHERE event_type = 'purchase'
        ) * 100.0
        /
        (
            SELECT users
            FROM funnel
            WHERE event_type = 'cart'
        ),
        2
    ) AS like_to_subscribe_pct,

    ROUND(
        (
            SELECT users
            FROM funnel
            WHERE event_type = 'purchase'
        ) * 100.0
        /
        (
            SELECT users
            FROM funnel
            WHERE event_type = 'view'
        ),
        2
    ) AS overall_conversion_pct;