-- Please use MySQL Ver 8.1.0 locally

-- The sickest floor can be said to be the the floor which had the most number of distinct employees who either self reported a symptom or had a positive test
-- This can be calculated by taking the union of the distinct employee IDs who reported a symptom and had a positive test, followed by joining with the employee table,
-- grouping by floor number and aggregating the number of rows, sorting in descending order and returning the first row
SELECT `floor_number`, COUNT(*) AS `sick_count`
FROM `employee`
JOIN (
	SELECT distinct(`employee_id`) AS `employee_id`
	FROM `symptom`
	UNION
	SELECT distinct(`employee_id`) AS `employee_id`
	FROM `test`
	WHERE `result` = "POSITIVE"
) `sick_employee`
ON `employee`.`id` = `sick_employee`.`employee_id`
GROUP BY `floor_number`
ORDER BY `sick_count` DESC
LIMIT 1;
