SELECT 
    d.nom_dep,
    ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
            2) AS prix_mcarrez
FROM
    departement AS d
        JOIN
    commune AS c ON c.id_dep = d.id_dep
        JOIN
    bien AS b ON b.id_com = c.id_com
        JOIN
    vente AS v ON v.id_bien = b.id_bien
GROUP BY d.nom_dep
ORDER BY prix_mcarrez DESC
LIMIT 10;