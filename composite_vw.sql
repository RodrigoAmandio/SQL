CREATE OR REPLACE VIEW composite_vw AS
SELECT lims_data.date_inserted_date, lims_data.s_batch_name,

	CONCAT(lims_data.date_inserted_date,' ', lims_data.date_inserted_time)::TIMESTAMP AS date_inserted_datetime,

	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000002506') THEN value_data ELSE NUll
		END) AS gt,
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000026') THEN value_data ELSE NUll
		END) AS lod,
	SUM(
		CASE
		WHEN (lims_data.tag = 'BFC-77973-012-77') THEN value_data ELSE NUll
		END) AS teor,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000630') THEN value_data ELSE NUll
		END) AS formol,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'BFC-77973-012-80') THEN value_data ELSE NUll
		END) AS nmg,	
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000030') THEN value_data ELSE NUll
		END) AS carvao,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'BFC-77973-012-76') THEN value_data ELSE NUll
		END) AS gi
		
FROM lims_data
WHERE lims_data.s_batch_name LIKE '%GT%'
GROUP BY lims_data.s_batch_name, lims_data.date_inserted_date,lims_data.date_inserted_time
ORDER BY CONCAT(lims_data.date_inserted_date,' ', lims_data.date_inserted_time)
