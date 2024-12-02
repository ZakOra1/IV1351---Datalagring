SELECT 
    TO_CHAR(l.scheduled_time, 'Day') AS "Day",
    e.genre AS "Genre",
    CASE 
        WHEN (e.max_reg_students - COUNT(rs.student_id)) = 0 THEN 'No Seats'
        WHEN (e.max_reg_students - COUNT(rs.student_id)) 
            BETWEEN 1 AND 2 THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No of Free Seats"
FROM 
    ensemble e
JOIN 
    lesson l ON e.lesson_id = l.lesson_id
LEFT JOIN 
    registered_students rs ON e.lesson_id = rs.lesson_id
WHERE 
    l.scheduled_time >= (DATE_TRUNC('week', CURRENT_DATE) + INTERVAL '7 days') 
    AND l.scheduled_time < (DATE_TRUNC('week', CURRENT_DATE) + INTERVAL '14 days')
GROUP BY 
    e.lesson_id, l.scheduled_time, e.genre, e.max_reg_students
ORDER BY 
    e.genre, EXTRACT(DOW FROM l.scheduled_time);