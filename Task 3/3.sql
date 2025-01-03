WITH lesson_count AS (
    SELECT 
        l.instructor_id,
        i.first_name,
        i.last_name,
        COUNT(*) AS no_of_lessons
    FROM 
        lesson l
    INNER JOIN 
        instructor i ON l.instructor_id = i.instructor_id
    WHERE 
        EXTRACT(MONTH FROM l.scheduled_time) = EXTRACT(MONTH FROM CURRENT_DATE)
        AND EXTRACT(YEAR FROM l.scheduled_time) = EXTRACT(YEAR FROM CURRENT_DATE)
    GROUP BY 
        l.instructor_id, i.first_name, i.last_name
)
SELECT 
    instructor_id,
    first_name,
    last_name,
    no_of_lessons
FROM 
    lesson_count
WHERE 
    no_of_lessons > 0
ORDER BY 
    no_of_lessons DESC;
