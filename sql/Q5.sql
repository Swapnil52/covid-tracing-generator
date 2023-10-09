-- Which test lead to the greatest number of mandatory notifications and to which employee did that test belong?

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
