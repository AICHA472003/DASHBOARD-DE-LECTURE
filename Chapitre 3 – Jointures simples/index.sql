-- Étape 1 : INNER JOIN basique
-- Affiche les articles avec le nom de leur auteur
SELECT a.titre, a.date_pub, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id;

-- Étape 2 : INNER JOIN avec filtre
-- Affiche uniquement les articles écrits par l'utilisateur "Alice"
SELECT a.titre, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id
WHERE u.nom = 'Alice';

-- Étape 3 : LEFT JOIN
-- Affiche tous les articles, même ceux sans auteur
SELECT a.titre, u.nom
FROM Article a
LEFT JOIN Utilisateur u ON a.id_utilisateur = u.id;

-- Étape 4 : Jointure avec 3 tables
-- Affiche les articles, leurs auteurs et leurs commentaires
SELECT a.titre, u.nom, c.contenu
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id
INNER JOIN Commentaire c ON a.id = c.id_article;
