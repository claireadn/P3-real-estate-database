# Créez et utilisez une base de données immobilière avec SQL

Le directeur de Laplace Immo, un réseau national d’agences immobilières, est sensible depuis quelques temps à l’importance des données et il pense que l’agence doit se démarquer de la concurrence en créant un modèle pour mieux prévoir le prix de vente des biens immobiliers.

La base de données sera utiliser pour analyser le marché et aider les différentes agences régionales à mieux accompagner leurs clients.

**(Find the English translation below.)**

## Missions

**Mission 1 : Validation du schéma relationnel**

* Les données suivantes sont mises à disposition :
    - Des données extraites du site open data des Demandes de valeurs foncières (DVF)
    - Des données de l'INSEE avec les résultats des recensements de la population
    - Des données de data.gouv sur les régions, avec le référentiel géographique français, communes, unités urbaines, aires urbaines, départements, académies, régions.

**A faire :**
* Préparer le dictionnaire des données en respectant le template pour répertorier et décrire les données importantes à stocker. Il faut remplir pour les trois fichiers de données.
* Modifier le schéma relationnel qu’il prenne en compte les nouvelles données région et population. → Mieux visualiser les différentes entités, associations et cardinalités de la base de données.
* Présentation du nouveau schéma relationnel normalisé (suivre la norme 3NF) de la base de données. → Donnera lieu à la création de nouvelles tables.

**Mission 2 : Modification de la base de données**

* Implémentation des tables dans la base de données en respectant le compte rendu de la réunion.
* Utilisation de SQLite. Mais possible d’utiliser MySQL ou postgreSQL.

**A faire :**
* Faire les requêtes pour extraire les données sous forme de document PDF (résultats de requêtes ainsi que la requête associée). → Utilise des alias pour que ce soit plus lisible + demandes spécifiques du compte-rendu de réunion.

## Compétences évaluées

* Effectuer des requêtes SQL pour répondre à une problématique métier
* Créer des tables dans une base de données
* Charger des données dans une base de données
* Mettre à jour un catalogue de données
* Créer le schéma d'une base de données

## Livrable

* Dictionnaire des données.
* Schéma relationnel normalisé modifié.
* Base de données opérationnelle avec les données du 1er semestre 2020 (captures d’écran directement du système de gestion de base de données des tables construites).
* Document avec les requêtes et les résultats.

.

# Create and use a real estate database with SQL

The director of Laplace Immo, a national network of real estate agencies, has been aware of the importance of data for some time and believes that the agency needs to set itself apart from the competition by creating a model to better predict the sale price of properties.

The database will be used to analyze the market and help the various regional agencies to better support their customers.

## Missions

**Mission 1: Validation of the relational schema** 

* The following data are made available:
    - Data extracted from the open data site, Demandes de valeurs foncières (DVF)
    - Data from INSEE with population census results
    - Data from data.gouv on regions, with the French geographical reference system, communes, urban units, urban areas, départements, académies, regions.

**To do:**
* Prepare the data dictionary following the template for listing and describing the important data to be stored. All three data files must be completed.
* Modify the relational schema to take into account the new regional and population data. → Better visualize the various entities, associations and cardinalities in the database.
* Presentation of the new standardized relational schema (following the 3NF standard) for the database. → Will result in the creation of new tables.

**Mission 2: Modification of the database.

* Implementation of tables in the database in accordance with the meeting report.
* Use of SQLite. But it's possible to use MySQL or postgreSQL.

**To do:**
* Make queries to extract data as a PDF document (query results and associated query). → Use aliases to make it more readable + specific requests from meeting report.

## Skills assessed

* Perform SQL queries in response to a business problem.
* Create tables in a database.
* Load data into a database.
* Update a data catalog.
* Create a database schema.
  
## Deliverable

* Data dictionary.
* Modified normalized relational schema.
* Operational database with data for 1st half of 2020 (screenshots directly from the database management system of the tables built).
* Document with queries and results.
