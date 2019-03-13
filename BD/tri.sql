--Prcodédure calcul hight score
CREATE OR REPLACE PROCEDURE hight_score(vid_partie Partie.id_partie%type) IS

begin
    select score into vscore from partie where id_partie=vid_partie







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
