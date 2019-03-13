------------------------------------------------------
--          Insertion des donn�es de la table NIVEAU
------------------------------------------------------

INSERT INTO niveau values(1,'facile','00:03:00','100');
INSERT INTO niveau values(2,'moyen','00:03:00','200');
INSERT INTO niveau values(3,'difficile','00:03:00','300');

------------------------------------------------------
--           Insertion des donn�es de la table LABYRINTHE
------------------------------------------------------

--Insertion labyrinthe niveau  facile
INSERT INTO labyrinthe VALUES(101,1,1,4,4,4,4,1);
INSERT INTO labyrinthe VALUES(102,3,1,3,4,4,4,1);
INSERT INTO labyrinthe VALUES(103,4,2,1,1,4,4,1);
INSERT INTO labyrinthe VALUES(104,4,4,4,1,4,4,1);
INSERT INTO labyrinthe VALUES(105,4,1,1,4,4,4,1);

--Insertion labytinthe niveau moyen
INSERT INTO labyrinthe VALUES (201,5,1,4,5,5,5,2);
INSERT INTO labyrinthe VALUES (202,1,4,3,1,5,5,2);
INSERT INTO labyrinthe VALUES (203,5,5,2,1,5,5,2);
INSERT INTO labyrinthe VALUES (204,1,4,1,2,5,5,2);
INSERT INTO labyrinthe VALUES (205,1,4,2,5,5,5,2);

--Insertion labytinthe niveau difficile
INSERT INTO labyrinthe VALUES (301,6,6,4,1,6,6,3);
INSERT INTO labyrinthe VALUES (302,2,6,5,6,6,6,3);
INSERT INTO labyrinthe VALUES (303,1,6,6,1,6,6,3);
INSERT INTO labyrinthe VALUES (304,3,1,3,6,6,6,3);
INSERT INTO labyrinthe VALUES (305,1,4,1,2,6,6,3);

------------------------------------------------------------
-- Insertion des données de la table COLLECTION
------------------------------------------------------------

INSERT INTO collection VALUES (1,'image','f');
INSERT INTO collection VALUES (2,'image','m');
INSERT INTO collection VALUES (3,'image','d');

------------------------------------------------------------
--Insertion des données de la table IMAGE
------------------------------------------------------------

--Insertion niveau facile
INSERT INTO image VALUES (1,1,'murf.png',1);

INSERT INTO image VALUES (2,0,'entreef_bas.png',1);
INSERT INTO image VALUES (3,0,'entreef_gauche.png',1);
INSERT INTO image VALUES (4,0,'entreef_droite.png',1);
INSERT INTO image VALUES (5,0,'entreef_haut.png',1);

INSERT INTO image VALUES (6,0,'sortief_bas.png',1);
INSERT INTO image VALUES (7,0,'sortief_gauche.png',1);
INSERT INTO image VALUES (8,0,'sortief_droite.png',1);
INSERT INTO image VALUES (9,0,'sortief_haut.png',1);

INSERT INTO image VALUES (10,0,'videf.png',1);

--Insertion niveau moyen
INSERT INTO image VALUES (11,1,'murm.png',2);

INSERT INTO image VALUES (12,0,'entreem_bas.png',2);
INSERT INTO image VALUES (13,0,'entreem_gauche.png',2);
INSERT INTO image VALUES (14,0,'entreem_droite.png',2);
INSERT INTO image VALUES (15,0,'entreem_haut.png',2);

INSERT INTO image VALUES (16,0,'sortiem_bas.png',2);
INSERT INTO image VALUES (17,0,'sortiem_gauche.png',2);
INSERT INTO image VALUES (18,0,'sortiem_droite.png',2);
INSERT INTO image VALUES (19,0,'sortiem_haut.png',2);

INSERT INTO image VALUES (20,0,'videm.png',2);

--Insertion niveau difficile
INSERT INTO image VALUES (21,1,'murd.png',3);

INSERT INTO image VALUES (22,0,'entreed_bas.png',3);
INSERT INTO image VALUES (23,0,'entreed_gauche.png',3);
INSERT INTO image VALUES (24,0,'entreed_droite.png',3);
INSERT INTO image VALUES (25,0,'entreed_haut.png',3);

INSERT INTO image VALUES (26,0,'sortied_bas.png',3);
INSERT INTO image VALUES (27,0,'sortied_gauche.png',3);
INSERT INTO image VALUES (28,0,'sortied_droite.png',3);
INSERT INTO image VALUES (29,0,'sortied_haut.png',3);

INSERT INTO image VALUES (30,0,'vided.png',3);

------------------------------------------------------
--    Insertion des donn�es de la table INTERVENIR
------------------------------------------------------

INSERT INTO intervenir VALUES (1,1);
INSERT INTO intervenir VALUES (2,2);
INSERT INTO intervenir VALUES (3,3);

