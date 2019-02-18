#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Niveau
#------------------------------------------------------------

CREATE TABLE Niveau(
        id_niveau  Int  Auto_increment  NOT NULL ,
        complexite Varchar (50) NOT NULL ,
        duree      Time NOT NULL ,
        nb_points  Int ,
CONSTRAINT Niveau_PK PRIMARY KEY (id_niveau)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        pseudo    Varchar (50) NOT NULL ,
        nom       Varchar (50) ,
        mot_pass  Varchar (50) ,
        dateN     Date ,
        id_niveau Int NOT NULL ,
CONSTRAINT Utilisateur_PK PRIMARY KEY (pseudo),
CONSTRAINT Utilisateur_Niveau_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Partie
#------------------------------------------------------------

CREATE TABLE Partie(
        id_partie Int  Auto_increment  NOT NULL ,
        heure_deb Time ,
        heure_fin Time ,
        score     Int NOT NULL ,
        gagner    Bool ,
        pseudo    Varchar (50) NOT NULL ,
        id_niveau Int NOT NULL ,
CONSTRAINT Partie_PK PRIMARY KEY (id_partie),
CONSTRAINT Partie_Utilisateur_FK FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
CONSTRAINT Partie_Niveau0_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Labyrinthe
#------------------------------------------------------------

CREATE TABLE Labyrinthe(
        id_laby      Int  Auto_increment  NOT NULL ,
        entree_abs   Int ,
        entree_ord   Int ,
        sortie_abs   Int ,
        sortie_ord   Int ,
        ligne_grille Int ,
        col_grille   Int ,
        id_niveau    Int NOT NULL,
CONSTRAINT Labyrinthe_PK PRIMARY KEY (id_laby),
CONSTRAINT Labyrinthe_Niveau_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau),
CONSTRAINT entree_abs_ck CHECK (entree_abs<=col_grille),
CONSTRAINT entree_ord_ck CHECK (entree_ord<=ligne_grille),
CONSTRAINT sortie_abs_ck CHECK (sortie_abs<=col_grille),
CONSTRAINT sortie_ord_ck CHECK (sortie_ord<=ligne_grille),
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Collection
#------------------------------------------------------------

CREATE TABLE Collection(
        id_col   Int  Auto_increment  NOT NULL ,
        type_col Varchar (50) ,
        nom_col  Varchar (50),
CONSTRAINT Collection_PK PRIMARY KEY (id_col)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Image
#------------------------------------------------------------

CREATE TABLE Image(
        id_img  Int  Auto_increment  NOT NULL ,
        Si_mur  Bool ,
        symbole Char (5) ,
        id_col  Int NOT NULL ,
CONSTRAINT Image_PK PRIMARY KEY (id_img),
CONSTRAINT Image_Collection_FK FOREIGN KEY (id_col) REFERENCES Collection(id_col)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Case
#------------------------------------------------------------

CREATE TABLE Case(
        id_case  Int  Auto_increment  NOT NULL ,
        abs_case Int ,
        ord_case Int ,
        id_img   Int NOT NULL ,
CONSTRAINT Case_PK PRIMARY KEY (id_case),
CONSTRAINT Case_Image_FK FOREIGN KEY (id_img) REFERENCES Image(id_img)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: Construire
#------------------------------------------------------------

CREATE TABLE Construire(
        id_case Int NOT NULL ,
        id_laby Int NOT NULL ,
CONSTRAINT Construire_PK PRIMARY KEY (id_case,id_laby),
CONSTRAINT Construire_Case_FK FOREIGN KEY (id_case) REFERENCES Case(id_case),
CONSTRAINT Construire_Labyrinthe0_FK FOREIGN KEY (id_laby) REFERENCES Labyrinthe(id_laby)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Intervenir
#------------------------------------------------------------

CREATE TABLE Intervenir(
        id_col    Int NOT NULL ,
        id_niveau Int NOT NULL ,
CONSTRAINT Intervenir_PK PRIMARY KEY (id_col,id_niveau),
CONSTRAINT Intervenir_Collection_FK FOREIGN KEY (id_col) REFERENCES Collection(id_col),
CONSTRAINT Intervenir_Niveau0_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Reperer
#------------------------------------------------------------

CREATE TABLE Reperer(
        id_partie Int NOT NULL ,
        id_case   Int NOT NULL ,
        instant_t TimeStamp NOT NULL ,
        abs_user  Int NOT NULL ,


