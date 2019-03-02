------------------------------------------------------------
--        Script MySQL.
------------------------------------------------------------


------------------------------------------------------------
-- Table: Niveau
------------------------------------------------------------

CREATE TABLE Niveau (
        id_niveau  Number(4) ,
        complexite VARCHAR2(10) NOT NULL ,
        duree      VARCHAR2(5) NOT NULL ,
        nb_points  NUMBER(4) ,
CONSTRAINT Niveau_PK PRIMARY KEY (id_niveau));



------------------------------------------------------------
-- Table: Utilisateur
-----------------------------------------------------------

CREATE TABLE Utilisateur(
        pseudo    VARCHAR2 (20) ,
        nom       Varchar2 (20) ,
        mot_pass  VARCHAR2 (20) ,
        dateN     Date ,
        id_niveau Number(4) ,
CONSTRAINT Utilisateur_PK PRIMARY KEY (pseudo),
CONSTRAINT Utilisateur_Niveau_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
);


------------------------------------------------------------
-- Table: Partie
------------------------------------------------------------

CREATE TABLE Partie(
        id_partie Number(4) ,
        heure_deb Varchar2(5) ,
        heure_fin Varchar2(5) ,
        score     Number(4) not null,
        gagner    Number(1) check (gagner=1 or gagner=0)  ,
        pseudo    Varchar2(20) NOT NULL ,
        id_niveau Number(4) NOT NULL ,
CONSTRAINT Partie_PK PRIMARY KEY (id_partie),
CONSTRAINT Partie_Utilisateur_FK FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
CONSTRAINT Partie_Niveau0_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
);


------------------------------------------------------------
-- Table: Labyrinthe
------------------------------------------------------------

CREATE TABLE Labyrinthe(
        id_laby      Number(4) Primary KEY,
        entree_abs   Number(2),
        entree_ord   Number(2) ,
        sortie_abs   Number(2) ,
        sortie_ord   Number(2) ,
        ligne_grille Number(2) ,
        col_grille   Number(2) ,
        id_niveau    Number(4) NOT NULL,
CONSTRAINT Labyrinthe_Niveau_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau),
CONSTRAINT entree_abs_ck CHECK (entree_abs<=col_grille),
CONSTRAINT entree_ord_ck CHECK (entree_ord<=ligne_grille),
CONSTRAINT sortie_abs_ck CHECK (sortie_abs<=col_grille),
CONSTRAINT sortie_ord_ck CHECK (sortie_ord<=ligne_grille));


------------------------------------------------------------
-- Table: Collection
------------------------------------------------------------

CREATE TABLE Collection(
        id_col   Number(4) PRIMARY KEY,
        type_col VARCHAR2(20) ,
        nom_col  Varchar2(20));


------------------------------------------------------------
-- Table: Image
------------------------------------------------------------

CREATE TABLE Image(
        id_img  Number(4) PRIMARY KEY,
        Si_mur  Number(1) CHECK (Si_mur=1 or Si_mur=0) ,
        symbole Char (1) ,
        id_col  Number(4) ,
CONSTRAINT Image_Collection_FK FOREIGN KEY (id_col) REFERENCES Collection(id_col)
);


------------------------------------------------------------
-- Table: Case
------------------------------------------------------------

CREATE TABLE Cases (
        id_case  Number(4) PRIMARY KEY ,
        abs_case Number(2) ,
        ord_case Number(2) ,
        id_img   Number(4) NOT NULL ,
	id_laby Number(4) NOT NULL ,
CONSTRAINT Case_Image_FK FOREIGN KEY (id_img) REFERENCES Image(id_img),
CONSTRAINT Case_Labyrinthe_FK FOREIGN KEY (id_laby) REFERENCES Labyrinthe(id_laby));



------------------------------------------------------------
--Table: Construire
------------------------------------------------------------

CREATE TABLE Construire(
        id_case Number(4) NOT NULL ,
        id_laby Number(4) NOT NULL ,
CONSTRAINT Construire_PK PRIMARY KEY (id_case,id_laby),
CONSTRAINT Construire_Case_FK FOREIGN KEY (id_case) REFERENCES Cases(id_case),
CONSTRAINT Construire_Labyrinthe0_FK FOREIGN KEY (id_laby) REFERENCES Labyrinthe(id_laby)
);


------------------------------------------------------------
-- Table: Intervenir
------------------------------------------------------------

CREATE TABLE Intervenir(
        id_col    Number(4) NOT NULL ,
        id_niveau Number(4) NOT NULL ,
CONSTRAINT Intervenir_PK PRIMARY KEY (id_col,id_niveau),
CONSTRAINT Intervenir_Collection_FK FOREIGN KEY (id_col) REFERENCES Collection(id_col),
CONSTRAINT Intervenir_Niveau0_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
);


------------------------------------------------------------
-- Table: Reperer
------------------------------------------------------------

CREATE TABLE Reperer(
        id_partie Number(4) NOT NULL ,
        id_case   Number(4) NOT NULL ,
        instant_t TimeStamp NOT NULL ,
        abs_user  Number(2) ,
        col_user Number(2) ,
        CONSTRAINT Reperer_pk PRIMARY KEY (id_partie, id_case, instant_t),
        CONSTRAINT Reperer_Partie_fk FOREIGN KEY (id_partie) REFERENCES Partie(id_partie),
        CONSTRAINT Reperer_Case_fk FOREIGN KEY (id_case) REFERENCES Cases(id_Case));


