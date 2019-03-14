-------------------------------------------------------
--procedure insertion utilisateur
-------------------------------------------------------
SET serveroutput ON;

CREATE OR REPLACE PROCEDURE insert_util(vpseudo    utilisateur.pseudo%TYPE,
                                        vnom       utilisateur.nom%TYPE,
                                        vprenom    utilisateur.prenom%TYPE,
                                        vmot_pass  utilisateur.mot_pass%TYPE)
                                        
IS
BEGIN
      INSERT INTO utilisateur VALUES(vpseudo,vnom,vprenom,vmot_pass,NULL);
      DBMS_OUTPUT.PUT_LINE('Felicitations!,vous avez bien et� enregistr�');
      
EXCEPTION 

        WHEN DUP_VAL_ON_INDEX 
        THEN DBMS_OUTPUT.PUT_LINE('Ce pseudo existe deja ,essayez un autre');

END;
/

SELECT * from niveau;
SELECT * from cases;
SELECT * from labyrinthe;
SELECT * from intervenir;
SELECT * from utilisateur;

EXECUTE insert_util('nine1','messaoudi','nina','par');
delete from utilisateur where pseudo='nine1';

CREATE TRIGGER tbu_niveau_util
after update of gagner on partie
for each row
begin
if (:new.gagner=1 and :old.id_niveau<3)  then 
update utilisateur
set id_niveau = id_niveau++
where pseudo



