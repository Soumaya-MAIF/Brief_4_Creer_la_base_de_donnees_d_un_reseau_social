/*Données pour la table users*/


INSERT INTO users (name, lastname, mail, password) 
VALUES (
'Billings','Iola','IolaTBillings@fleckens.hu','te1Hie8E'),
('Mongillo','Nora','NoraJMongillo@gustr.com','Adunoe9ae'),
('Alfaro','Michelle','MichelleJAlfaro@teleworm.us','vu5phooHah'),
('Jones','Amanda','AmandaGJones@armyspy.com','Quaigh5eo3ah'),
('Martin','Blanche','BlancheVMartin@rhyta.com','eeHeeng3g'),
('Morse','Harold','HaroldGMorse@einrot.com','Kiel2yee9iu'),
('Johansson','Sanjuana','SanjuanaBJohansson@rhyta.com','Goo5yiev'),
('Church','Nathan','NathanTChurch@rhyta.com','Witoh9aighei'),
('McNally','Paul','PaulHMcNally@superrito.com','hee2rae8Oh'),
('Barrett','Robert','RobertFBarrett@superrito.com','Webiuhei1');

/*Données pour la table post*/

INSERT INTO post (title, content, users_id) VALUES ('Premier post', 'Ceci est le contenu du premier post.', 10);
INSERT INTO post (title, content, users_id) VALUES ('Un autre post intéressant', 'Voici le contenu d''un autre post.', 9);
INSERT INTO post (title, content, users_id) VALUES ('Découvrir SQL', 'Un post sur SQL et ses fonctionnalités.', 8);
INSERT INTO post (title, content, users_id) VALUES ('Nouvelles fonctionnalités de PostgreSQL', 'Découvrez les dernières fonctionnalités de PostgreSQL.', 7);
INSERT INTO post (title, content, users_id) VALUES ('Guide pour les débutants', 'Un guide détaillé pour ceux qui commencent avec SQL.', 6);
INSERT INTO post (title, content, users_id) VALUES ('Utiliser des jointures efficacement', 'Comment utiliser les jointures pour améliorer les performances des requêtes.', 5);
INSERT INTO post (title, content, users_id) VALUES ('Optimisation des requêtes', 'Des conseils pour optimiser vos requêtes SQL.', 4);
INSERT INTO post (title, content, users_id) VALUES ('Manipulation des données en SQL', 'Comment insérer, mettre à jour et supprimer des données en utilisant SQL.', 3);
INSERT INTO post (title, content, users_id) VALUES ('Les meilleures pratiques en SQL', 'Les pratiques recommandées pour écrire un code SQL propre et efficace.', 2);
INSERT INTO post (title, content, users_id) VALUES ('Trucs et astuces pour SQL', 'Des astuces pour améliorer votre efficacité dans l''écriture de SQL.', 11);


-- Commentaires pour les posts

INSERT INTO post (content, users_id, parent_post) VALUES ('C''est un excellent début, j''ai hâte de lire la suite !', 2, 1);

INSERT INTO post (content, users_id, parent_post) VALUES ('Très intéressant, merci pour le partage.',3,1);
 INSERT INTO post (content, users_id, parent_post) VALUES('Je suis intrigué par ce sujet, pouvez-vous en dire plus ?',4,2);
INSERT INTO post (content, users_id, parent_post) VALUES('Je suis d''accord, c''est un sujet vraiment captivant.', 2, 2);
INSERT INTO post (content, users_id, parent_post) VALUES ('J''adore SQL ! Merci pour ce post.', 2, 3);
INSERT INTO post (content, users_id, parent_post) VALUES('Je suis un débutant en SQL, c''est très instructif.', 6, 3);
INSERT INTO post (content, users_id, parent_post) VALUES('PostgreSQL est mon SGBDR préféré !', 10, 4 );
INSERT INTO post (content, users_id, parent_post) VALUES('Les nouvelles fonctionnalités semblent prometteuses.', 9, 4);
INSERT INTO post (content, users_id, parent_post) VALUES('Ce guide est très utile pour les débutants comme moi.', 8, 5);
INSERT INTO post (content, users_id, parent_post) VALUES('J''ai vraiment besoin de conseils pour optimiser mes requêtes, merci !', 6, 7);
INSERT INTO post (content, users_id, parent_post) VALUES('Ces pratiques recommandées sont essentielles pour éviter les erreurs.', 8, 8);
INSERT INTO post (content, users_id, parent_post) VALUES('Merci pour ces conseils, je vais les garder à l''esprit lors de la rédaction de mes requêtes.', 3, 24);
INSERT INTO post (content, users_id, parent_post) VALUES('Les astuces mentionnées ici sont très pratiques, merci !', 5, 15);
INSERT INTO post (content, users_id, parent_post) VALUES('Je ne savais pas que je pouvais faire ça en SQL, merci pour l''astuce !', 7, 15);

-- Création d'un post avec une pièce jointe

WITH new_post_id AS (
  INSERT INTO post (users_id)
   VALUES (4)
   RETURNING id
 ),
inserted_attachment AS (
INSERT INTO attachment(picture, post_id) 
SELECT 'C:/Workspaces/Brief 4_Créer la base de donnée d''un réseau social/Brief_4_Creer_la_base_de_donnees_d_un_reseau_social/img', id
  FROM new_post_id
) 
SELECT * FROM new_post_id;


-- Jeu de données pour la table post_like

INSERT INTO post_like (users_id, post_id) VALUES (
    11, 2
),
(
    9, 3
),
(
    7, 5
),
(
    2, 3
),
(
    11, 5
),
(
    7, 8
),
(
    3, 1
),
(
    9, 8
),
(
    10, 6
),
(
    4, 8
);


-- Données pour créer un follow

INSERT INTO follow (users_id, follower_id) VALUES (3, 2);

