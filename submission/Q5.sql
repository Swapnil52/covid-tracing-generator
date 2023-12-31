-- Please use online MySQL compiler (https://www.mycompiler.io/new/mysql)
-- If using https://www.mycompiler.io/new/mysql, please paste and run all queries from Q1.sql to Q5.sql in the same editor/session

-- Which test lead to the greatest number of mandatory notifications and to which employee did that test belong?
-- This can be done by counting the number of notifications per test_id using a group by query, joining with the test table on test_id,
-- ordering by count and returning the first row
SELECT `test_id`, `test`.`employee_id` AS `originating_employee`, `result`, `notification_count`
FROM (
	SELECT `test_id`, COUNT(*) AS `notification_count`
	FROM `notification`
	WHERE `type` = "MANDATORY"
	GROUP BY `test_id`
) `test_notification_count`
JOIN `test`
ON `test_id` = `test`.`id`
ORDER BY `test_notification_count`.`notification_count` DESC
LIMIT 1;
