-- Création de la table Utilisateur
CREATE TABLE Utilisateur (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100),
    mot_de_passe VARCHAR(100)
);

-- Création de la table Article
CREATE TABLE Article (
    id_article INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200),
    contenu TEXT,
    date_pub DATE,
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

-- Étape 1 : Insérer un utilisateur
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES ('Alice', 'alice@test.com', '1234');

-- Étape 2 : Insérer un article
INSERT INTO Article (titre, contenu, date_pub, id_utilisateur)
VALUES ('Bienvenue sur le blog', 'Ceci est le premier article.', '2025-07-18', 1);

-- Étape 3 : Insertion multiple d’utilisateurs
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES
    ('Bob', 'bob@test.com', 'passbob'),
    ('Charlie', 'charlie@test.com', 'passcharlie');

-- Étape 4 : Vérifier les données
SELECT * FROM Utilisateur;
SELECT * FROM Article;
