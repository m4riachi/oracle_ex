Create or Replace procedure insert_employe (p_matricule employe.matricule%type, p_salaire employe.salaire%type, p_dep dep.nom%type)
    as
    v_dep_id dep.id%type;
    v_count number;
    v_employe_exist_exception exception;
begin
    Select id into v_dep_id from dep where nom = p_dep;
    
    Select count(*) into v_count from employe where matricule = p_matricule; 

    if v_count > 0 then
        raise v_employe_exist_exception;
    end if;  

    insert into employe values (p_matricule, p_salaire, 0, v_dep_id);

  exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('Departement nexiste pas');
    when v_employe_exist_exception then
        DBMS_OUTPUT.PUT_LINE('Employe est  deja inserer');
    when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end;



-------------------------------------------------------------


begin
    insert_employe ('code20', 4500, 'informatique');
end;
/