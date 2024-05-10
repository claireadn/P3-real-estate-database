SELECT 
    r.nom_reg, COUNT(code_type_local) AS nb_appart
FROM
    region AS r
        JOIN
    departement AS d ON r.id_reg = d.id_reg
        JOIN
    commune AS c ON d.id_dep = c.id_dep
        JOIN
    bien AS b ON c.id_com = b.id_com
        JOIN
    vente AS v ON b.id_bien = v.id_bien
WHERE
    b.code_type_local LIKE 2
        AND v.date_mutation BETWEEN '2020-01-01' AND '2020-06-30'
GROUP BY r.nom_reg
ORDER BY nb_appart DESC;
