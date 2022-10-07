SELECT CONCAT(LEFT(regexp_replace(
			regexp_replace(
				SPLIT_PART(s_x_comment,'PL',1), '[^\w]+','','g'), '[a-zA-Z]+','','g'),5),
			 '.',
			 SUBSTRING(regexp_replace(
			regexp_replace(
				SPLIT_PART(s_x_comment,'PL',1), '[^\w]+','','g'), '[a-zA-Z]+','','g') FROM 6 FOR 3))::NUMERIC 
				AS peso_bruto,
				
		CONCAT(LEFT(regexp_replace(
			regexp_replace(
				SPLIT_PART(s_x_comment,'PL',2), '[^\w]+','','g'), '[a-zA-Z]+','','g'),5),
			 '.',
			 SUBSTRING(regexp_replace(
			regexp_replace(
				SPLIT_PART(s_x_comment,'PL',2), '[^\w]+','','g'), '[a-zA-Z]+','','g') FROM 6 FOR 3))::NUMERIC 
				AS peso_liquido,
		
		s_x_container_id AS numero_container,
		S_BATCH_NAME AS numero_lote,
		DATE_INSERTED AS data_chegada,
		ROUND(R_REPORTED_VALUE/100,5) AS cloretos,
		CASE WHEN(ROUND(R_REPORTED_VALUE/100,5)) IS NULL THEN 'Não analisado' ELSE 'Aprovado' END AS status,
		CASE WHEN(supplier_name = 'Monsanto Luling, Louisiana USA') THEN 'Importado' ELSE 'Nacional' END AS origem

FROM containers_pia;
