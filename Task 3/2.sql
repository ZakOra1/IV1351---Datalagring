SELECT 
    CASE
        WHEN sibling_count = 0 THEN '0'
        WHEN sibling_count = 1 THEN '1'
        ELSE '2+'
    END AS no_of_siblings,
    COUNT(*) AS no_of_students
FROM (
    SELECT 
        s.student_id,
        COUNT(ss.sibling_id) AS sibling_count
    FROM student s
    LEFT JOIN student_sibling ss ON s.student_id = ss.student_id
    GROUP BY s.student_id
) subquery
GROUP BY no_of_siblings
ORDER BY no_of_siblings;
