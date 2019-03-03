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
-- Table: Collection
------------------------------------------------------------

INSERT INTO collection VALUES (1,'image','etoile');
INSERT INTO collection VALUES (2,'image','rond');
INSERT INTO collection VALUES (3,'image','plus');
INSERT INTO collection VALUES (4,'image','entrée');
INSERT INTO collection VALUES (5,'image','sortie');


------------------------------------------------------------
-- Table: Image
------------------------------------------------------------

INSERT INTO image VALUES (1,0,'*',1);
INSERT INTO image VALUES (2,0,'o',2);
INSERT INTO image VALUES (3,0,'+',3);
INSERT INTO image VALUES (4,0,'E',4);
INSERT INTO image VALUES (5,0,'S',5);
INSERT INTO image VALUES (6,1);


 
 
------------------------------------------------------------
-- Table: Cases 
------------------------------------------------------------
--niveau difficile

--laby 301
INSERT INTO cases VALUES (206,1,1,6,301);
INSERT INTO cases VALUES (207,2,1,6,301);
INSERT INTO cases VALUES (208,3,1,3,301);
INSERT INTO cases VALUES (209,4,1,5,301);
INSERT INTO cases VALUES (210,5,1,6,301);
INSERT INTO cases VALUES (211,6,1,6,301);
INSERT INTO cases VALUES (212,1,2,6,301);
INSERT INTO cases VALUES (213,2,2,3,301);
INSERT INTO cases VALUES (214,3,2,6,301);
INSERT INTO cases VALUES (215,4,2,3,301);
INSERT INTO cases VALUES (216,5,2,3,301);
INSERT INTO cases VALUES (217,6,2,6,301);
INSERT INTO cases VALUES (218,1,3,6,301);
INSERT INTO cases VALUES (219,2,3,3,301);
INSERT INTO cases VALUES (220,3,3,6,301);
INSERT INTO cases VALUES (221,4,3,6,301);
INSERT INTO cases VALUES (222,5,3,6,301);
INSERT INTO cases VALUES (223,6,3,6,301);
INSERT INTO cases VALUES (224,1,4,6,301);
INSERT INTO cases VALUES (225,2,4,6,301);
INSERT INTO cases VALUES (226,3,4,6,301);
INSERT INTO cases VALUES (227,4,4,3,301);
INSERT INTO cases VALUES (228,5,4,3,301);
INSERT INTO cases VALUES (229,6,4,6,301);
INSERT INTO cases VALUES (230,1,5,6,301);
INSERT INTO cases VALUES (231,2,5,6,301);
INSERT INTO cases VALUES (232,3,5,6,301);
INSERT INTO cases VALUES (233,4,5,6,301);
INSERT INTO cases VALUES (234,5,5,6,301);
INSERT INTO cases VALUES (235,6,5,3,301);
INSERT INTO cases VALUES (236,1,6,3,301);
INSERT INTO cases VALUES (237,2,6,6,301);
INSERT INTO cases VALUES (238,3,6,6,301);
INSERT INTO cases VALUES (239,4,6,3,301);
INSERT INTO cases VALUES (240,5,6,6,301);
INSERT INTO cases VALUES (241,6,6,6,301);

















