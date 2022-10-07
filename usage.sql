CREATE VIEW usage_catalizador AS
SELECT 
data_producao,
massa_kg,
producao_dia,
numero_massa,
cgp,
ROUND(producao_dia/massa_kg,0)::INTEGER AS usage_diario,
SUM(ROUND(producao_dia/massa_kg,0)) OVER (PARTITION BY COUNT(1) ORDER BY data_producao) AS usage_acumulado,

CASE
	WHEN((massa_kg - LAG(massa_kg, 1) OVER (ORDER BY data_producao) < 0 AND
		 cgp - LAG(cgp, 1) OVER (ORDER BY data_producao) < 0) OR 
		 numero_massa - LAG(numero_massa, 1) OVER (ORDER BY data_producao) > 0) THEN data_producao - interval '1 day'
		 ELSE NULL
END::DATE AS massa_nova

FROM usage
GROUP BY data_producao,massa_kg,producao_dia,numero_massa,cgp
ORDER BY data_producao;

SELECT * FROM usage_catalizador
