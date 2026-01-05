-- Insertion des employés
INSERT INTO Employe (id, nom, prenom, poste) VALUES
(1, 'ELMALEH', 'David', 'Développeur'),
(2, 'ALAMI', 'AHMED', 'Chef de projet'),
(3, 'ELKHADIR', 'Fatima', 'Développeur'),
(4, 'DUPONT', 'Jean', 'Analyste'),
(5, 'MARTIN', 'Sophie', 'Développeur');

-- Insertion des projets
INSERT INTO Projet (id, titre, dateDeb, dateFin, chef_id) VALUES
(234, 'Site E-commerce Beauty', '2024-01-01', '2025-12-31', 2),  -- Chef : ALAMI AHMED
(98, 'Application Mobile', '2023-06-01', '2025-03-15', 1),       -- Chef : ELMALEH David
(123, 'Refonte Intranet', '2024-03-01', '2026-06-30', 4);         -- Chef : DUPONT Jean

-- Insertion des tâches
INSERT INTO Tache (id, projet_id, description, priorite, etat) VALUES
(1, 234, 'Conception de la base de données', 1, 'Terminée'),
(2, 234, 'Développement du front-end', 2, 'En cours'),
(3, 234, 'Tests unitaires', 3, 'Non commencée'),
(4, 98, 'Analyse des exigences', 1, 'Terminée'),
(5, 98, 'Développement backend', 2, 'Terminée'),
(6, 123, 'Migration des données', 1, 'Non commencée'),
(7, 123, 'Formation utilisateurs', 2, 'En cours');

-- Afficher tous les projets (titre, dateDeb, dateFin)
SELECT titre, dateDeb, dateFin FROM Projet;

-- Afficher les employés dont le nom commence par 'EL'
SELECT * FROM Employe WHERE nom LIKE 'EL%';

-- Afficher les tâches du projet Num 234 ordonnées par priorité par ordre croissant
SELECT * FROM Tache WHERE projet_id = 234 ORDER BY priorite ASC;

-- Afficher les projets qui doivent se terminer avant Avril 2026
SELECT * FROM Projet WHERE dateFin < '2026-04-01';

-- Afficher tous les employés développeurs
SELECT * FROM Employe WHERE poste = 'Développeur';

-- Afficher les tâches terminées du projet de code 98
SELECT * FROM Tache WHERE projet_id = 98 AND etat = 'Terminée';

-- Afficher pour les projets avec leur responsables (titre, dateDeb, dateFin, nomChef, prénomChef)
SELECT p.titre, p.dateDeb, p.dateFin, e.nom AS nomChef, e.prenom AS prenomChef
FROM Projet p
JOIN Employe e ON p.chef_id = e.id;

-- Afficher les tâches du projet 'Site E-commerce Beauty'
SELECT t.* FROM Tache t
JOIN Projet p ON t.projet_id = p.id
WHERE p.titre = 'Site E-commerce Beauty';

-- Afficher le nombre de tâches 'terminées' du projet 'Site E-commerce Beauty'
SELECT COUNT(*) AS nombre_taches_terminees FROM Tache t
JOIN Projet p ON t.projet_id = p.id
WHERE p.titre = 'Site E-commerce Beauty' AND t.etat = 'Terminée';

-- Combien de projets ont été terminés dans l'année 2025
SELECT COUNT(*) AS projets_termines_2025 FROM Projet
WHERE YEAR(dateFin) = 2025;

     -- Modifier la date de fin du projet 234 par "16/05/2026"
UPDATE Projet SET dateFin = '2026-05-16' WHERE id = 234;

-- Modifier l'état de la tâche 98 par "Terminée"
UPDATE Tache SET etat = 'Terminée' WHERE id = 98;

-- Supprimer les tâches "non commencées" du projet 123
DELETE FROM Tache WHERE projet_id = 123 AND etat = 'Non commencée';

-- Supprimer l'employé "ALAMI AHMED"
DELETE FROM Employe WHERE nom = 'ALAMI' AND prenom = 'AHMED';