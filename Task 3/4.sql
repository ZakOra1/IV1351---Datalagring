SELECT 
    to_char(l.scheduled_time, 'Dy') AS Day, 
    l.genre AS Genre, 
    CASE
        WHEN (l.max_reg_students - COALESCE(rs.student_count, 0)) = 0 THEN 'No Seats'
        WHEN (l.max_reg_students - COALESCE(rs.student_count, 0)) <= 2 THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS no_of_free_seats
FROM lesson l
LEFT JOIN (
    SELECT 
        lesson_id, 
        COUNT(student_id) AS student_count
    FROM registered_students
    GROUP BY lesson_id
) rs ON l.lesson_id = rs.lesson_id
WHERE 
    l.lesson_type = 'Ensemble' 
    AND l.scheduled_time BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL '7 days')
ORDER BY 
    l.genre, 
    l.scheduled_time;
