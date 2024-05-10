WITH valeur_par_ville AS (
SELECT d.code_dep, c.nom_com, AVG(v.valeur_fonciere) as valeur
FROM vente AS v
JOIN bien AS b ON v.id_bien = b.id_bien
JOIN commune AS c ON b.id_com = c.id_com
JOIN departement AS d ON c.id_dep = d.id_dep
WHERE d.code_dep IN ('06', 13, 33, 59, 69)
GROUP BY d.code_dep, c.nom_com)
SELECT code_dep AS "Département", nom_com AS "Commune", 
ROUND(valeur, 2) AS "Prix moyen"
FROM (
SELECT code_dep, nom_com, valeur,
rank() OVER (PARTITION BY code_dep ORDER BY valeur DESC) AS rang
FROM valeur_par_ville) AS resultat WHERE rang <= 3;