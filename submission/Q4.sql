-- Please use online MySQL compiler (https://www.mycompiler.io/new/mysql)
-- If using https://www.mycompiler.io/new/mysql, please paste and run all queries from Q1.sql to Q5.sql in the same editor/session

-- The selected date range is 2023-09-01 to 2023-09-10 for the following queries
-- Number of scans conducted in the above date range
SELECT COUNT(*) AS `scan_count`
FROM `scan`
WHERE `scanned_at` BETWEEN "2023-09-01" AND "2023-09-10";

-- Number of tests conducted in the above date range
SELECT COUNT(*) AS `test_count`
FROM `test`
WHERE `tested_at` BETWEEN "2023-09-01" AND "2023-09-10";

-- Number of unique employees who self reported symptoms in the above date range
SELECT COUNT(DISTINCT(`employee_id`)) AS `employees_who_self_reported`
FROM `symptom`
WHERE `reported_at` BETWEEN "2023-09-01" AND "2023-09-10";

-- Number of positive tests in the above date range
SELECT COUNT(*) AS `positive_test_count`
FROM `test`
WHERE `tested_at` BETWEEN "2023-09-01" AND "2023-09-10"
AND `result` = "POSITIVE";
