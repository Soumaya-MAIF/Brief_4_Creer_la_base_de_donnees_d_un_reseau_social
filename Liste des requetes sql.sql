 /*Les requetes SELECT*/


/*Requete pour afficher les informations d'un profil*/

SELECT name, lastname,mail FROM users  WHERE id=2;
SELECT name, lastname,mail FROM users  WHERE id=:users_id;

/*Requête pour afficher tous les posts*/

SELECT * FROM post 

/*Filtre des post par auteur*/

SELECT *
FROM post
WHERE users_id=3;

/* Requête pour créer un compte utilisateur*/

INSERT INTO users(name,lastname,mail,password) VALUES(:name,:lastname,:mail,:password)


/*Requete pour créer un post*/

INSERT INTO post(title, content,users_id) VALUES (:title,:content,:users_id)

/*Requête pour commenter un post*/

INSERT INTO post (title, content, users_id, parent_post) 

/* Requête pour répondre à un commentaire*/

INSERT INTO post (title, content, users_id, parent_post) VALUES (:title,:content,:users_id, :parent_post)

/*Requête pour creer un post avec une piece jointe (lien, image) */

WITH new_post_id AS (
  INSERT INTO post (users_id)
   VALUES (:users_id)
   RETURNING id
 ),
inserted_attachment AS (
INSERT INTO attachment(picture, post_id) 
SELECT :picture, id
  FROM new_post_id
) 
SELECT * FROM new_post_id;


/*requete pour modifier les données relatives à un profil utilisateur*/

UPDATE users
SET mail='newmail@email.com'
WHERE id = 2

/*Requete pour supprimer un post*/

DELETE FROM post
WHERE id=:post_id CASCADE;

/*Requête pour ajouter des likes aux post*/
INSERT INTO post_like (users_id, post_id) VALUES (:users_id, :post_id)

/*Requete pour suivre un utilisateur*/

INSERT INTO follow (users_id, follower_id_id) VALUES (:users_id, :follower_id)

/*Requête pour trier les posts par popularité*/

SELECT post_id, COUNT (users_id) 
FROM post_like
GROUP BY post_id
ORDER BY COUNT DESC;


/*Requête pour faire un join entre la table user et la table post*/

SELECT u.name, u.lastname, p.content AS comments
FROM users u
JOIN post p 
ON p.users_id=u.id;

/*Requete pour récupérer les like des commentaires*/
SELECT l.post_id, p.content, COUNT (l.users_id) AS post_count
FROM post_like l
RIGHT JOIN post p 
ON p.id=l.post_id
WHERE p.parent_post=1
GROUP BY l.post_id, p.content;

/*Requete pour faire une recherche sur les utilisateurs*/

SELECT *
FROM users
WHERE name LIKE '%a%' OR lastname LIKE '%a%'

/*Requete pour faire une recherche sur les post par mots clés*/

SELECT *
FROM post
WHERE content LIKE '%SQL%'  

/*Requete pour partager un post*/

WITH post_share_id AS (
  INSERT INTO post (users_id)
  VALUES (6)
  RETURNING id
)
INSERT INTO attachment(post_id) 
SELECT id
FROM post_share_id;



/*Filtre des posts par date*/

SELECT *
FROM post
WHERE CAST (created_date AS date)= '13-03-2024' 


/*Requete pour mettre en place une pagination*/

SELECT *
FROM post
WHERE CAST (created_date AS date)= '13-03-2024' ORDER BY created_date ASC LIMIT 5 OFFSET 0;


/* Requête pour afficher les posts par nombre de like*/

SELECT l.post_id, p.content, COUNT (l.users_id) AS post_count
FROM post_like l
RIGHT JOIN post p 
ON p.id=l.post_id
GROUP BY l.post_id, p.content ORDER BY COUNT (l.users_id) DESC;


/*Requete pour afficher les post par ordre chonologique*/

SELECT * FROM post WHERE parent_post IS NULL ORDER BY created_date DESC;