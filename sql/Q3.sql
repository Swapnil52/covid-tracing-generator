SELECT `floor_number`
FROM (
	SELECT `floor_number`, COUNT(*) as `sick_on_floor`
	FROM `employee_case` JOIN `employee`
	ON `employee_case`.`employee_id` = `employee`.`id`
	WHERE `resolution` = "SICK"
	GROUP BY `floor_number`
) `floor_sick`
ORDER BY `sick_on_floor` DESC
LIMIT 1;