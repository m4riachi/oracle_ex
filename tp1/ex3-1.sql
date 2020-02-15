create table departement (
    id number primary key,
    nom varchar2(50)
);

insert into departement (id, nom) values (1, 'informatique');

create table employe (
    matricule number primary key,
    id_departement number references departement(id),
    nom varchar2(50),
    prenom varchar2(50),
    salaire number(10, 2)
);

insert into employe (matricule, id_departement, nom, prenom, salaire) values (20, 1, 'benayadi', 'moad', 2000);

declare
    v_matricule employe.matricule%TYPE;
    v_id_departement employe.id_departement%TYPE;
    v_nom employe.nom%TYPE;
    v_prenom employe.prenom%TYPE;
    v_salaire employe.salaire%TYPE;
begin
  SELECT matricule, id_departement , nom , prenom , salaire INTO v_matricule, v_id_departement, v_nom, v_prenom, v_salaire
            FROM employe WHERE matricule=20;

    DBMS_OUTPUT.PUT_LINE(v_matricule);
    DBMS_OUTPUT.PUT_LINE(v_id_departement);
    DBMS_OUTPUT.PUT_LINE(v_nom);
    DBMS_OUTPUT.PUT_LINE(v_matricule);
    DBMS_OUTPUT.PUT_LINE(v_matricule);
end;
/