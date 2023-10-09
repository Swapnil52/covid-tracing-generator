-- Please use MySQL Ver 8.1.0 locally

-- The selected date range is 2023-09-01 to 2023-09-10 for the following queries
-- Number of scans conducted
SELECT COUNT(*) AS `scan_count`
FROM `scan`
WHERE `scanned_at` BETWEEN "2023-09-01" AND "2023-09-10";

-- Number of tests conducted
SELECT COUNT(*) AS `test_count`
FROM `test`
WHERE `tested_at` BETWEEN "2023-09-01" AND "2023-09-10";

-- Number of unique employees who self reported symptoms
SELECT COUNT(DISTINCT(`employee_id`)) AS `employees_who_self_reported`
FROM `symptom`
WHERE `reported_at` BETWEEN "2023-09-01" AND "2023-09-10";

SELECT COUNT(*) AS `positive_test_count`
FROM `test`
WHERE `tested_at` BETWEEN "2023-09-01" AND "2023-09-10"
AND `result` = "POSITIVE";
