SELECT `symptom_id`
FROM (
	SELECT `symptom_id`, COUNT(*) `times_self_reported`
	FROM `symptom`
	GROUP BY `symptom_id`
) `frequency`
ORDER BY `frequency`.`times_self_reported` DESC
LIMIT 1;
