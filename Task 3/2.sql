SELECT
    CASE
        WHEN sibling_id IS NULL THEN 0
        ELSE 1
    END AS "No of Siblings",
    COUNT(*) AS "No of Students"
FROM student
GROUP BY
    CASE
        WHEN sibling_id IS NULL THEN 0
        ELSE 1
    END
UNION ALL
SELECT
    2 AS "No of Siblings",
    COUNT(*) AS "No of Students"
FROM student
WHERE sibling_id IS NOT NULL
GROUP BY sibling_id
HAVING COUNT(sibling_id) > 1;