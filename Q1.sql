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
