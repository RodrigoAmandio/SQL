CREATE VIEW bags_sharepoint_unpivot AS
SELECT TRIM(LEADING 'BS' FROM (SPLIT_PART(lote_bags,' ',1) || 
SPLIT_PART(lote_bags,' ',2) || 
SPLIT_PART(lote_bags,' ',3) || 
SPLIT_PART(lote_bags,' ',4))) AS lote_bags, 
data_lote,turno,big_bag_utilizado,reutilizacao,t.*,pallet_ok,bag_og,etiqueta_ok 
FROM bags_sharepoint_full_join c
CROSS JOIN LATERAL(
VALUES
	(c.número_bag_1,c.bag1,c.tara_bag1,c.numero_lacre_bag1,c.operador_bag1),
	(c.número_bag_2,c.bag2,c.tara_bag2,c.numero_lacre_bag2,c.operador_bag2),
	(c.número_bag_3,c.bag3,c.tara_bag3,c.numero_lacre_bag3,c.operador_bag3),
	(c.número_bag_4,c.bag4,c.tara_bag4,c.numero_lacre_bag4,c.operador_bag4),
	(c.número_bag_5,c.bag5,c.tara_bag5,c.numero_lacre_bag5,c.operador_bag5),
	(c.número_bag_6,c.bag6,c.tara_bag6,c.numero_lacre_bag6,c.operador_bag6),
	(c.número_bag_7,c.bag7,c.tara_bag7,c.numero_lacre_bag7,c.operador_bag7),
	(c.número_bag_8,c.bag8,c.tara_bag8,c.numero_lacre_bag8,c.operador_bag8),
	(c.número_bag_9,c.bag9,c.tara_bag9,c.numero_lacre_bag9,c.operador_bag9),
	(c.número_bag_10,c.bag10,c.tara_bag10,c.numero_lacre_bag10,c.operador_bag10),
	(c.número_bag_11,c.bag11,c.tara_bag11,c.numero_lacre_bag11,c.operador_bag11),
	(c.número_bag_12,c.bag12,c.tara_bag12,c.numero_lacre_bag12,c.operador_bag12),
	(c.número_bag_13,c.bag13,c.tara_bag13,c.numero_lacre_bag13,c.operador_bag13),
	(c.número_bag_14,c.bag14,c.tara_bag14,c.numero_lacre_bag14,c.operador_bag14),
	(c.número_bag_15,c.bag15,c.tara_bag15,c.numero_lacre_bag15,c.operador_bag15),
	(c.número_bag_16,c.bag16,c.tara_bag16,c.numero_lacre_bag16,c.operador_bag16),
	(c.número_bag_17,c.bag17,c.tara_bag17,c.numero_lacre_bag17,c.operador_bag17),
	(c.número_bag_18,c.bag18,c.tara_bag18,c.numero_lacre_bag18,c.operador_bag18),
	(c.número_bag_19,c.bag19,c.tara_bag19,c.numero_lacre_bag19,c.operador_bag19),
	(c.número_bag_20,c.bag20,c.tara_bag20,c.numero_lacre_bag20,c.operador_bag20))	
	AS t(numero_bag,peso_liquido,tara,lacre,operador )
