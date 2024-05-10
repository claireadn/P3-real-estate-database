SELECT 
    c.nom_com,
    c.pop_total,
    ROUND(CONVERT(COUNT(b.id_bien), UNSIGNED) / c.pop_total * 1000,
            2) AS nb_ventes_habt1000
FROM
    bien AS b
        JOIN
    commune AS c ON b.id_com = c.id_com
WHERE
    c.pop_total > 10000
GROUP BY c.nom_com , c.pop_total
ORDER BY nb_ventes_habt1000 DESC
LIMIT 20;