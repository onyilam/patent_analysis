 /*get the number of patents by patent family group by year. */

SELECT group_id, cg.title, CAST(SUBSTR(p.date, 1, 4) AS INT64) year, count(patent_id) cnt
FROM `patents-public-data.patentsview.cpc_current` cc
JOIN `patents-public-data.patentsview.cpc_group` cg
ON cg.id = cc.group_id
JOIN `patents-public-data.patentsview.patent` p
ON p.id = cc.patent_id
GROUP BY year, cg.title, group_id
