Create DATABASE SQL;
 use SQL;

Create TABLE ARTICLE
  (
    id_ARTICLE INT PRIMARY KEY,
    NOM Varchar(150) ,
    Date pub Date    ,
    contenu Text Not NULL,
);

     INSERT INTO ARTICLE (Titre,contenue ,Date pub)
     VALUES
     ("ALICE IN THE WONDERLAND,story,4 -7- 1865")
       ("HARRY POTER,Story,26 -7- 1997")
       
       SELECT *
        FROM Article;
SELECT titre,datepub
 FROM Article;
 WHERE datePub >= '4 -7- 1865'
ORDER BY datePub ASC
   LIMIT 2;


    

     