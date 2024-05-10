SELECT 
    r.nom_reg,
    ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
            2) AS prix_mcarrez
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
        AND b.nb_pieces > 4
GROUP BY r.nom_reg
ORDER BY prix_mcarrez DESC;