WITH current_month_lessons AS (
    SELECT
        instructor_id,
        COUNT(*) AS lesson_count
    FROM
        lesson
    WHERE
        DATE_TRUNC('month', scheduled_time) = DATE_TRUNC('month', CURRENT_DATE)
    GROUP BY
        instructor_id
)
SELECT
    i.instructor_id,
    i.first_name,
    i.last_name,
    cml.lesson_count AS "No of Lessons"
FROM
    current_month_lessons cml
JOIN
    instructor i ON cml.instructor_id = i.instructor_id
WHERE
    -- cml.lesson_count > specific_number
    cml.lesson_count > 1
ORDER BY
    cml.lesson_count DESC;