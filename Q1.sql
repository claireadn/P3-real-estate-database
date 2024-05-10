# Query 1
SELECT 
    COUNT(b.id_bien) AS nb_ventes
FROM
    vente AS v
        JOIN
    bien AS b ON v.id_bien = b.id_bien
WHERE
    b.code_type_local LIKE 2
        AND v.date_mutation BETWEEN '2020-01-01' AND '2020-06-30';

# Query 2
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

# Query 3
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

# Query 4
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
ORDER BY proportion_ventes DESC;

# Query 5
SELECT 
    r.nom_reg,
    r.id_reg,
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
    d.id_reg LIKE 'R11'
        AND code_type_local LIKE 1
GROUP BY r.id_reg;

# Query 6
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

# Query 7
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

# Query 8
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

# Query 9
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

# Query 10
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

# Query 11
WITH valeur_par_ville AS (
SELECT 
    d.code_dep, c.nom_com, AVG(v.valeur_fonciere) AS valeur
FROM 
    vente AS v
JOIN 
    bien AS b ON v.id_bien = b.id_bien
JOIN 
    commune AS c ON b.id_com = c.id_com
JOIN 
    departement AS d ON c.id_dep = d.id_dep
WHERE 
    d.code_dep IN ('06', 13, 33, 59, 69)
GROUP BY d.code_dep, c.nom_com)
SELECT 
    code_dep AS "Département", nom_com AS "Commune", 
    ROUND(valeur, 2) AS "Prix moyen"
FROM 
    (SELECT code_dep, nom_com, valeur,
    rank() OVER (PARTITION 
    BY code_dep 
    ORDER BY valeur DESC) AS rang
FROM valeur_par_ville) 
    AS resultat 
    WHERE rang <= 3;

# Query 12
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
