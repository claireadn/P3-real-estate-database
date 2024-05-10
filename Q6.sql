SELECT 
    b.id_bien,
    r.nom_reg,
    c.nom_com,
    b.surf_carrez,
    v.valeur_fonciere
FROM
    bien AS b
        JOIN
    vente AS v ON b.id_bien = v.id_bien
        JOIN
    commune AS c ON b.id_com = c.id_com
        JOIN
    departement AS d ON c.id_dep = d.id_dep
        JOIN
    region AS r ON d.id_reg = r.id_reg
WHERE
    code_type_local LIKE 2
ORDER BY valeur_fonciere DESC
LIMIT 10;
