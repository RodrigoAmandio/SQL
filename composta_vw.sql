CREATE OR REPLACE VIEW composta_vw AS
SELECT lims_data.date_inserted_date, lims_data.s_batch_name,

	CONCAT(lims_data.date_inserted_date,' ', lims_data.date_inserted_time)::TIMESTAMP AS date_inserted_datetime,

	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000661') THEN value_data ELSE NUll
		END) AS gt,
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000664') THEN value_data ELSE NUll
		END) AS ampa,
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000662') THEN value_data ELSE NUll
		END) AS nmg,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000001923') THEN value_data ELSE NUll
		END) AS po4,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000663') THEN value_data ELSE NUll
		END) AS gi,	
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000014') THEN value_data ELSE NUll
		END) AS cloretos,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000011') THEN value_data ELSE NUll
		END) AS lod,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000001855') THEN value_data ELSE NUll
		END) AS formol,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC000000000120') THEN value_data ELSE NUll
		END) AS glicina,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC000000002490') THEN value_data ELSE NUll
		END) AS nfg
		
FROM lims_data
WHERE lims_data.s_batch_name LIKE '%GL%' AND lims_data.s_batch_name NOT LIKE '%-%'
GROUP BY lims_data.s_batch_name, lims_data.date_inserted_date,lims_data.date_inserted_time
ORDER BY CONCAT(lims_data.date_inserted_date,' ', lims_data.date_inserted_time)
