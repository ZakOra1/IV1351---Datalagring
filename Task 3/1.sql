SELECT 
    TO_CHAR(scheduled_time, 'Mon') AS month,
    EXTRACT(MONTH FROM scheduled_time) AS month_number,
    COUNT(*) AS total_lessons,
    SUM(CASE WHEN lesson_type = 'Individual' THEN 1 ELSE 0 END) AS individual_lessons,
    SUM(CASE WHEN lesson_type = 'Group' THEN 1 ELSE 0 END) AS group_lessons,
    SUM(CASE WHEN lesson_type = 'Ensemble' THEN 1 ELSE 0 END) AS ensemble_lessons
FROM lesson
WHERE EXTRACT(YEAR FROM scheduled_time) = 2025
GROUP BY EXTRACT(MONTH FROM scheduled_time), TO_CHAR(scheduled_time, 'Mon')
ORDER BY month_number;
