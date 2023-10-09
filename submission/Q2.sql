-- Please use MySQL Ver 8.1.0 locally

-- The most reported symptom will be the symptom_id with the maximum frequency in the symptom table.
-- We calculate this by grouping by symptom_id and counting the number of rows, sorting in descending order and returning the first row
SELECT `symptom_id`, COUNT(*) `times_self_reported`
FROM `symptom`
GROUP BY `symptom_id`
ORDER BY `times_self_reported` DESC
LIMIT 1;