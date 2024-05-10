SELECT 
    (SELECT 
            COUNT(DISTINCT id_vente)
        FROM
            vente AS v
        WHERE
            v.date_mutation BETWEEN '2020-01-01' AND '2020-03-31') AS vente_trimestre_1,
    (SELECT 
            COUNT(DISTINCT id_vente)
        FROM
            vente AS v
        WHERE
            v.date_mutation BETWEEN '2020-04-01' AND '2020-06-30') AS vente_trimestre_2,
    ROUND((((SELECT 
                    COUNT(DISTINCT id_vente) AS vente_trimestre_2
                FROM
                    vente AS v
                WHERE
                    v.date_mutation BETWEEN '2020-04-01' AND '2020-06-30') - (SELECT 
                    COUNT(DISTINCT id_vente) AS vente_trimestre_1
                FROM
                    vente AS v
                WHERE
                    v.date_mutation BETWEEN '2020-01-01' AND '2020-03-31')) / (SELECT 
                    COUNT(DISTINCT id_vente) AS vente_trimestre_1
                FROM
                    vente AS v
                WHERE
                    v.date_mutation BETWEEN '2020-01-01' AND '2020-03-31') * 100),
            2) AS evol_ventes;