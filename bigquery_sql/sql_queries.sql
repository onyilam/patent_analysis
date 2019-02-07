 /*get the number of patents by patent family group by year. */

SELECT group_id, cg.title, CAST(SUBSTR(p.date, 1, 4) AS INT64) year, count(patent_id) cnt
FROM `patents-public-data.patentsview.cpc_current` cc
JOIN `patents-public-data.patentsview.cpc_group` cg
ON cg.id = cc.group_id
JOIN `patents-public-data.patentsview.patent` p
ON p.id = cc.patent_id
GROUP BY year, cg.title, group_id


 /*get patents information (first claim, year, group name, assignee) for family G06 since 2000 */

SELECT group_id, cg.title group_name, CAST(SUBSTR(p.date, 1, 4) AS INT64) year, cl.text, cl.patent_id, assignee_id, a.type, a.name_first, a.name_last, a.organization
FROM `patents-public-data.patentsview.cpc_current` cc
JOIN `patents-public-data.patentsview.cpc_group` cg
ON cg.id = cc.group_id
JOIN `patents-public-data.patentsview.patent` p
ON p.id = cc.patent_id
JOIN `patents-public-data.patentsview.claim` cl
on p.id = cl.patent_id
JOIN `patents-public-data.patentsview.patent_assignee` pa
on pa.patent_id = cl.patent_id
JOIN `patents-public-data.patentsview.assignee` a
on pa.assignee_id = a.id
WHERE SUBSTR(group_id, 1, 3) in ('G06')
AND CAST(SUBSTR(p.date, 1, 4) AS INT64) > 1999
AND cl.sequence = '1'
