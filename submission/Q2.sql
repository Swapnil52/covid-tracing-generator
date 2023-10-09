-- Please use online MySQL compiler (https://www.mycompiler.io/new/mysql)
-- If using https://www.mycompiler.io/new/mysql, please paste and run all queries from Q1.sql to Q5.sql in the same editor/session

-- The most reported symptom will be the symptom_id with the maximum frequency in the symptom table.
-- We calculate this by grouping by symptom_id and counting the number of rows, sorting in descending order and returning the first row
SELECT `symptom_id`, COUNT(*) `times_self_reported`
FROM `symptom`
GROUP BY `symptom_id`
ORDER BY `times_self_reported` DESC
LIMIT 1;