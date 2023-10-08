SELECT COUNT(*) AS `scan_count`
FROM `scan`
WHERE `scanned_at` BETWEEN "2023-09-01" AND "2023-09-05";

SELECT COUNT(*) AS `test_count`
FROM `test`
WHERE `tested_at` BETWEEN "2023-09-01" AND "2023-09-10";

SELECT COUNT(DISTINCT(`employee_id`)) AS `employees_who_self_reported`
FROM `symptom`
WHERE `reported_at` BETWEEN "2023-09-01" AND "2023-09-10";

SELECT COUNT(*) AS `employees_who_self_reported`
FROM `symptom`
WHERE `reported_at` BETWEEN "2023-09-01" AND "2023-09-10";

SELECT COUNT(*) AS `positive_test_count`
FROM `test`
WHERE `tested_at` BETWEEN "2023-09-01" AND "2023-09-10"
AND `result` = "POSITIVE";
