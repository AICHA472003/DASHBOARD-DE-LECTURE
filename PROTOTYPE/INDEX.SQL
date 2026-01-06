-- =====================================
-- BASE DE DONNÉES : Gestion-projets
-- =====================================

DROP DATABASE IF EXISTS Gestion_projets;
CREATE DATABASE Gestion_projets;
USE Gestion_projets;

-- =====================================
-- 1️⃣ CRÉATION DES TABLES
-- =====================================

CREATE TABLE Employe (
    id_Employe INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    poste VARCHAR(50) NOT NULL
);

CREATE TABLE Projet (
    id_projet INT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    dateDeb DATE NOT NULL,
    dateFin DATE NOT NULL,
    chef_id INT,
    FOREIGN KEY (chef_id) REFERENCES Employe(id_Employe)
);

CREATE TABLE Tache (
    id_tache INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    priorite INT NOT NULL,
    etat VARCHAR(30) NOT NULL,
    id_projet INT NOT NULL,
    FOREIGN KEY (id_projet) REFERENCES Projet(id_projet)
);

-- =====================================
-- 2️⃣ ALIMENTATION DE LA BASE (INSERT)
-- =====================================

INSERT INTO Employe VALUES
(1, 'DHIMIN', 'AICHA', 'Développeur'),
(2, 'CHATTE', 'SOULAIMANE', 'Chef de projet'),
(3, 'EL FAQIHI', 'AYOUB', 'Développeur'),
(4, 'ALAMI', 'AHMED', 'Développeur');

INSERT INTO Projet VALUES
(234, 'Site E-commerce Beauty', '2024-01-01', '2025-12-31', 2),
(98, 'Application Mobile', '2023-06-01', '2025-03-15', 1),
(123, 'Projet Test', '2024-03-01', '2026-09-30', 2);

INSERT INTO Tache VALUES
(1, 'Conception BD', 1, 'Terminée', 234),
(2, 'Développement Front-end', 2, 'En cours', 234),
(3, 'Tests unitaires', 3, 'Non commencée', 234),
(4, 'Développement Backend', 1, 'Terminée', 98),
(5, 'Tests finaux', 2, 'Terminée', 98),
(6, 'Planification', 1, 'Non commencée', 123);


-- =====================================
-- 3️⃣ REQUÊTES SELECT
-- =====================================

-- Afficher tous les projets
SELECT titre, dateDeb, dateFin FROM Projet;

-- Employés dont le nom commence par 'EL'
SELECT * FROM Employe WHERE nom LIKE 'EL%';

-- Tâches du projet 234 par priorité croissante
SELECT * FROM Tache WHERE id_projet = 234 ORDER BY priorite ASC;

-- Projets se terminant avant Avril 2026
SELECT * FROM Projet WHERE dateFin < '2026-04-01';

-- Tous les employés développeurs
SELECT * FROM Employe WHERE poste = 'Développeur';

-- Tâches terminées du projet 98
SELECT * FROM Tache WHERE id_projet = 98 AND etat = 'Terminée';

-- Projets avec leurs responsables
SELECT p.titre, p.dateDeb, p.dateFin, e.nom AS nomChef, e.prenom AS prenomChef
FROM Projet p
JOIN Employe e ON p.chef_id = e.id_Employe;


-- Tâches du projet 'Site E-commerce Beauty'
SELECT t.*
FROM Tache t
JOIN Projet p ON t.id_projet = p.id_projet
WHERE p.titre = 'Site E-commerce Beauty';


-- Nombre de tâches terminées du projet 'Site E-commerce Beauty'
 SELECT COUNT(*) AS nb_taches_terminees
FROM Tache t
JOIN Projet p ON t.id_projet = p.id_projet
WHERE p.titre = 'Site E-commerce Beauty'
AND t.etat = 'Terminée';


-- Nombre de projets terminés en 2025
SELECT COUNT(*) AS projets_termines_2025
FROM Projet
WHERE YEAR(dateFin) = 2025;

-- =====================================
-- 4️⃣ UPDATE
-- =====================================

-- Modifier la date de fin du projet 234
UPDATE Projet
SET dateFin = '2026-05-16'
WHERE id = 234;

-- Modifier l'état de la tâche du projet 98
UPDATE Tache
SET etat = 'Terminée'
WHERE id = 5;

-- =====================================
-- 5️⃣ DELETE
-- =====================================

-- Supprimer les tâches non commencées du projet 123
DELETE FROM Tache
WHERE projet_id = 123 AND etat = 'Non commencée';

-- Supprimer l'employé ALAMI AHMED
DELETE FROM Employe
WHERE nom = 'ALAMI' AND prenom = 'AHMED';

-- =====================================
-- BASE DE DONNÉES : Gestion-projets
-- =====================================

DROP DATABASE IF EXISTS Gestion_projets;
CREATE DATABASE Gestion_projets;
USE Gestion_projets;

-- =====================================
-- 1️⃣ CRÉATION DES TABLES
-- =====================================

CREATE TABLE Employe (
    id_Employe INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    poste VARCHAR(50) NOT NULL
);

CREATE TABLE Projet (
    id_projet INT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    dateDeb DATE NOT NULL,
    dateFin DATE NOT NULL,
    chef_id INT,
    FOREIGN KEY (chef_id) REFERENCES Employe(id_Employe)
);

CREATE TABLE Tache (
    id_tache INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    priorite INT NOT NULL,
    etat VARCHAR(30) NOT NULL,
    id_projet INT NOT NULL,
    FOREIGN KEY (id_projet) REFERENCES Projet(id_projet)
);

-- =====================================
-- 2️⃣ ALIMENTATION DE LA BASE (INSERT)
-- =====================================

INSERT INTO Employe VALUES
(1, 'DHIMIN', 'AICHA', 'Développeur'),
(2, 'CHATTE', 'SOULAIMANE', 'Chef de projet'),
(3, 'EL FAQIHI', 'AYOUB', 'Développeur'),
(4, 'ALAMI', 'AHMED', 'Développeur');

INSERT INTO Projet VALUES
(234, 'Site E-commerce Beauty', '2024-01-01', '2025-12-31', 2),
(98, 'Application Mobile', '2023-06-01', '2025-03-15', 1),
(123, 'Projet Test', '2024-03-01', '2026-09-30', 2);

INSERT INTO Tache VALUES
(1, 'Conception BD', 1, 'Terminée', 234),
(2, 'Développement Front-end', 2, 'En cours', 234),
(3, 'Tests unitaires', 3, 'Non commencée', 234),
(4, 'Développement Backend', 1, 'Terminée', 98),
(5, 'Tests finaux', 2, 'Terminée', 98),
(6, 'Planification', 1, 'Non commencée', 123);

-- =====================================
-- 3️⃣ REQUÊTES SELECT
-- =====================================

-- Afficher tous les projets
SELECT titre, dateDeb, dateFin FROM Projet;

-- Employés dont le nom commence par 'EL'
SELECT * FROM Employe WHERE nom LIKE 'EL%';

-- Tâches du projet 234 par priorité croissante
SELECT * FROM Tache WHERE id_projet = 234 ORDER BY priorite ASC;

-- Projets se terminant avant Avril 2026
SELECT * FROM Projet WHERE dateFin < '2026-04-01';

-- Tous les employés développeurs
SELECT * FROM Employe WHERE poste = 'Développeur';

-- Tâches terminées du projet 98
SELECT * FROM Tache WHERE id_projet = 98 AND etat = 'Terminée';

-- Projets avec leurs responsables
SELECT p.titre, p.dateDeb, p.dateFin, e.nom AS nomChef, e.prenom AS prenomChef
FROM Projet p
JOIN Employe e ON p.chef_id = e.id_Employe;

-- Tâches du projet 'Site E-commerce Beauty'
SELECT t.*
FROM Tache t
JOIN Projet p ON t.id_projet = p.id_projet
WHERE p.titre = 'Site E-commerce Beauty';

-- Nombre de tâches terminées du projet 'Site E-commerce Beauty'
SELECT COUNT(*) AS nb_taches_terminees
FROM Tache t
JOIN Projet p ON t.id_projet = p.id_projet
WHERE p.titre = 'Site E-commerce Beauty'
AND t.etat = 'Terminée';

-- Nombre de projets terminés en 2025
SELECT COUNT(*) AS projets_termines_2025
FROM Projet
WHERE YEAR(dateFin) = 2025;

-- =====================================
-- 4️⃣ UPDATE
-- =====================================

-- Modifier la date de fin du projet 234
UPDATE Projet
SET dateFin = '2026-05-16'
WHERE id_projet = 234;

-- Modifier l'état de la tâche du projet 98
UPDATE Tache
SET etat = 'Termin?e'
WHERE id_tache = 5;

-- =====================================
-- 5️⃣ DELETE
-- =====================================

-- Supprimer les tâches non commencées du projet 123
DELETE FROM Tache
WHERE id_projet = 123 AND etat = 'Non commencée';

-- Supprimer l'employé ALAMI AHMED
DELETE FROM Employe
WHERE nom = 'ALAMI' AND prenom = 'AHMED';
