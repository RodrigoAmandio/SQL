CREATE OR REPLACE VIEW "public"."vw_gt_100_big_bag" 
AS 
SELECT trunc(a.produceddate) AS data_mes,
       a.date_inserted_date,
       a.date_reviewed,
       a.descript,
       sum(a.qtde) AS quantidade,
       avg(a.gt) AS gt,
       avg(a.lod) AS lod,
       avg(a.gt) * sum(a.qtde) * ( 1::double precision - avg(a.lod) ) AS total_liquido

FROM   (SELECT DISTINCT vw_mes_big_bag.produceddate,
			vw_composite_reviewed.date_inserted_date,
                        vw_composite_reviewed.date_reviewed,
                        vw_mes_big_bag.descript,
                        vw_composite_reviewed.s_batch_name,
                        sum(vw_mes_big_bag.quantity) AS qtde,
			      
                              
	CASE
                         WHEN vw_composite_reviewed.s_batch_name::text IS NOT NULL
                         	THEN (SELECT "max"(vw_composite_reviewed.gt) AS "max" FROM vw_composite_reviewed
                         	WHERE vw_composite_reviewed.s_batch_name::text = vw_mes_big_bag.descript::text)

                         	ELSE (SELECT vw_composta_no_dup.gt FROM vw_composta_no_dup
                                WHERE vw_composta_no_dup."data" = trunc("max"(vw_mes_big_bag.produceddate)))
                         END AS gt,
                              
	CASE
                         WHEN vw_composite_reviewed.s_batch_name::text IS NOT NULL
                         	THEN (SELECT "max"(vw_composite_reviewed.lod) AS "max" FROM vw_composite_reviewed
                                WHERE  vw_composite_reviewed.s_batch_name::text = vw_mes_big_bag.descript::text)

                         	ELSE (SELECT vw_composta_no_dup.lod FROM   vw_composta_no_dup
                                WHERE  vw_composta_no_dup."data" = trunc("max"(vw_mes_big_bag.produceddate)))
                         END AS lod

        FROM vw_mes_big_bag

        LEFT JOIN (SELECT vw_composite_reviewed.s_batch_name,
                          "max"(vw_composite_reviewed.date_inserted_date) AS date_inserted_date,
                          "max"(vw_composite_reviewed.date_reviewed) AS date_reviewed FROM vw_composite_reviewed
                   GROUP BY vw_composite_reviewed.s_batch_name) vw_composite_reviewed
        ON vw_composite_reviewed.s_batch_name::text = vw_mes_big_bag.descript::text

        GROUP BY vw_mes_big_bag.produceddate,
                 vw_composite_reviewed.date_inserted_date,
                 vw_composite_reviewed.date_reviewed,
                 vw_mes_big_bag.descript) a

GROUP BY trunc(a.produceddate),
           a.date_inserted_date,
           a.date_reviewed,
           a.descript;

GRANT SELECT ON VW_GT_100_BIG_BAG TO labproc_sjc;
