SELECT 
    b.nb_pieces,
    COUNT(b.code_type_local) AS nb_appart,
    ROUND(COUNT(b.code_type_local) * 100.00 / (SELECT 
                    COUNT(b.code_type_local)
                FROM
                    bien AS b
                WHERE
                    b.code_type_local LIKE 2),
            2) AS proportion_ventes
FROM
    bien AS b
GROUP BY nb_pieces
ORDER BY proportion_ventes DESC;