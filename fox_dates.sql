CREATE VIEW vw_fox_dates_direct_view AS
SELECT
	(CURRENT_DATE::DATE + (i * interval '1 day'))::DATE AS dates,
	to_char((CURRENT_DATE::DATE + (i * interval '1 day')), 'Day') AS day_of_week,
        EXTRACT(DAY FROM (CURRENT_DATE::DATE + (i * interval '1 day'))) AS day_number
FROM generate_series(0, 50, 1) i
WHERE
	to_char((CURRENT_DATE::DATE + (i * interval '1 day')), 'Day') = 'Wednesday' AND
         EXTRACT(Day FROM (CURRENT_DATE::DATE + (i * interval '1 day'))) BETWEEN 7 AND 14
ORDER BY dates ASC
LIMIT 1;
