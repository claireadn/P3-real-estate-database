SELECT 
    COUNT(b.id_bien) AS nb_ventes
FROM
    vente AS v
        JOIN
    bien AS b ON v.id_bien = b.id_bien
WHERE
    b.code_type_local LIKE 2
        AND v.date_mutation BETWEEN '2020-01-01' AND '2020-06-30';