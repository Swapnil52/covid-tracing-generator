SELECT `symptom_id`, COUNT(*) `times_self_reported`
FROM `symptom`
GROUP BY `symptom_id`
ORDER BY `times_self_reported` DESC
LIMIT 1;