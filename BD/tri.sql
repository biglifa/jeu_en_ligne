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

