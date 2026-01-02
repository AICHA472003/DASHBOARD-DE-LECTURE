-- Étape 1 : Compter le nombre total d’articles
SELECT COUNT(*) AS total_articles
FROM Article;

-- Étape 2 : Trouver la date de publication la plus récente
SELECT MAX(date_pub) AS derniere_publication
FROM Article;

-- Étape 3 : Compter le nombre d’articles par utilisateur
SELECT id_utilisateur, COUNT(*) AS nb_articles
FROM Article
GROUP BY id_utilisateur;

-- Étape 4 : Afficher uniquement les utilisateurs ayant publié au moins 3 articles
SELECT id_utilisateur, COUNT(*) AS nb_articles
FROM Article
GROUP BY id_utilisateur
HAVING COUNT(*) >= 3;

-- Étape 5 : Calculer la moyenne du nombre de vues (si le champ nb_vues existe)
SELECT AVG(nb_vues) AS moyenne_vues
FROM Article;
