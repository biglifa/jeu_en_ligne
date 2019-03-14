--

CREATE OR REPLACE PROCEDURE insert_Partie(vpseudo Partie.pseudo%type, vid_niveau Partie.id_niveau%type) IS
vid_partie1 Partie.id_partie%type;
vid_partie2 Partie.id_partie%type;

vheure_deb Partie.heure_deb%type;
n number;
max_Partie number;
begin
    select max(id_partie) into max_Partie from Partie;
    select id_partie into vid_partie1 from Partie where id_partie=max_Partie;
    
    select to_char(sysdate, 'HH24:MI:SS') into vheure_deb from dual;
    
    vid_partie2:=vid_partie1+1;
    insert into Partie value (vid_partie2,vheure_deb,0,0,vpseudo,vid_niveau);
    commit;
    
    exception
        when no_data_found then dbms_output.put_line('Erreur sur le pseudo et/ou le niveau'); --A revoir
        --Erreur a ajouter sur le type id niveau
end;
                                

CREATE TABLE Partie(
        id_partie Number(4) ,
        heure_deb Varchar2(5) ,
        heure_fin Varchar2(5) ,
        score     Number(4),
        gagner    Number(1) check (gagner=1 or gagner=0)  ,
        pseudo    Varchar2(20) NOT NULL ,
        id_niveau Number(4) NOT NULL ,
CONSTRAINT Partie_PK PRIMARY KEY (id_partie),
CONSTRAINT Partie_Utilisateur_FK FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
CONSTRAINT Partie_Niveau0_FK FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau)
);
--Prcodédure calcul hight score
CREATE OR REPLACE PROCEDURE hight_score(vid_partie Partie.id_partie%type) IS
vscore Partie.score%type;
duree number;
vhd number;
vhf number;
vheureD Partie.heure_deb%type;
vheureF Partie.heure_fin%type;
begin
    select heure_deb, heure_fin into vheureD, vheureF from Partie where id_partie=vid_partie;
    
    vhf:=to_number(substr(vheureF,1,2))*3600 + to_number(substr(vheureF,4,2))*60 + to_number(substr(vheureF,7,2));
    vhd:=to_number(substr(vheureD,1,2))*3600 + to_number(substr(vheureD,4,2))*60 + to_number(substr(vheureD,7,2));
    duree:= vhf-vhd;
                
    vscore:=180-duree;
    
    if (vscore>=0) then 
    update Partie set score=vscore, gagner=1 where id_partie=vid_partie;
    else 
    update Partie set score=0, gagner=0 where id_partie=vid_partie;end if;
    commit;
    
    Exception 
            when NO_DATA_FOUND then dbms_output.put_line('Id_Partie n existe pas');
            when others then dbms_output.put_line(sqlcode||'  '||sqlerrm);
end;


--trigger blocage niveau
CREATE OR REPLACE TRIGGER tbi_blocage_niveau 
before insert on Partie 
begin
    if :old.id_niveau=NULL then
        if :new.id_niveau>=2 then
            raise_application_error ('Tempo tempo, niveau 1 d abord');end if;
    else 
        if :new.id_niveau>:old.id_niveau then
        raise_application_error ('Tempo tempo, valide ton niveau d abord '||:old.id_niveau); end if;
    end if;
end;


