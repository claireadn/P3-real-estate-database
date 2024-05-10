SELECT 
    (SELECT 
            ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
                        2)
        FROM
            vente AS v
                JOIN
            bien AS b ON v.id_bien = b.id_bien
        WHERE
            b.nb_pieces LIKE 2) AS prix_mcarrez_2,
    (SELECT 
            ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
                        2)
        FROM
            vente AS v
                JOIN
            bien AS b ON v.id_bien = b.id_bien
        WHERE
            b.nb_pieces LIKE 3) AS prix_mcarrez_3,
    ROUND(((SELECT 
                    ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
                                2)
                FROM
                    vente AS v
                        JOIN
                    bien AS b ON v.id_bien = b.id_bien
                WHERE
                    b.nb_pieces LIKE 2) - (SELECT 
                    ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
                                2)
                FROM
                    vente AS v
                        JOIN
                    bien AS b ON v.id_bien = b.id_bien
                WHERE
                    b.nb_pieces LIKE 3)) / (SELECT 
                    ROUND(AVG(v.valeur_fonciere / b.surf_carrez),
                                2)
                FROM
                    vente AS v
                        JOIN
                    bien AS b ON v.id_bien = b.id_bien
                WHERE
                    b.nb_pieces LIKE 3) * 100.00,
            2) AS diff_pourcentage;