WITH vente_s1 AS (
	SELECT ROUND(COUNT(id_vente),2) AS vente_trimestre_1
	FROM vente AS v
	WHERE v.date_mutation BETWEEN '2020-01-01' AND '2020-03-31'),
vente_s2 AS (
 SELECT ROUND(COUNT(id_vente),2) AS vente_trimestre_2
 FROM vente AS v
 WHERE v.date_mutation BETWEEN '2020-04-01' AND '2020-06-31')
SELECT ROUND(((vente_trimestre_2 - vente_trimestre_1) / vente_trimestre_1 * 100), 2) AS evol_ventes
FROM vente_s1, vente_s2;