SELECT
    TO_CHAR(l.scheduled_time, 'Mon') AS "Month",
    COUNT(DISTINCT l.lesson_id) AS "Total",
    COUNT(DISTINCT il.lesson_id) AS "Individual",
    COUNT(DISTINCT gl.lesson_id) AS "Group",
    COUNT(DISTINCT e.lesson_id) AS "Ensemble"
FROM
    lesson l
LEFT JOIN
    individual_lesson il ON l.lesson_id = il.lesson_id
LEFT JOIN
    group_lesson gl ON l.lesson_id = gl.lesson_id
LEFT JOIN
    ensemble e ON l.lesson_id = e.lesson_id
GROUP BY
    TO_CHAR(l.scheduled_time, 'Mon')
ORDER BY
    TO_DATE(TO_CHAR(l.scheduled_time, 'Mon'), 'Mon');