CREATE OR REPLACE VIEW oxidacao_vw AS
SELECT lims_data.date_inserted_date, lims_data.s_batch_name,

	--CONCAT(date_inserted_date,' ',date_inserted_time)::TIMESTAMP AS date_inserted_datetime,

	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000642') THEN value_data ELSE NUll
		END) AS gi,
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000057') THEN value_data ELSE NUll
		END) AS glicina,
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000649') THEN value_data ELSE NUll
		END) AS ida,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'BFC-S_BFC-003-136') THEN value_data ELSE NUll
		END) AS acf,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000644') THEN value_data ELSE NUll
		END) AS gt,	
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'BFC-S_BFC-003-137') THEN value_data ELSE NUll
		END) AS nfg,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000643') THEN value_data ELSE NUll
		END) AS ampa,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'BFC-S_BFC-003-138') THEN value_data ELSE NUll
		END) AS nmg,
		
	SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000001215') THEN value_data ELSE NUll
		END) AS po4,
		
	
SUM(
		CASE
		WHEN (lims_data.tag = 'LBFC00000000648') THEN value_data ELSE NUll
		END) AS formol,
	SUM(
		CASE
		WHEN (tag = 'LBFC00000000644') THEN ROUND((LN((value_data*100)+1)*37.189) + 22.368,2) ELSE NUll
		END) AS curva_solubilidade    
FROM lims_data
WHERE lims_data.s_batch_name LIKE '%OX%'
GROUP BY lims_data.s_batch_name, lims_data.date_inserted_date
ORDER BY lims_data.s_batch_name
