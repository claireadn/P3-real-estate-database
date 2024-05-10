SELECT 
    c.nom_com, COUNT(b.id_bien) AS nb_ventes
FROM
    bien AS b
        JOIN
    vente AS v ON b.id_bien = v.id_bien
        JOIN
    commune AS c ON b.id_com = c.id_com
WHERE
    v.date_mutation BETWEEN '2020-01-01' AND '2020-03-31'
GROUP BY c.nom_com
HAVING nb_ventes >= 50
ORDER BY nb_ventes DESC;