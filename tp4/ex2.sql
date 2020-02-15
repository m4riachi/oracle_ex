Create or Replace function get_salaire_par_matricule (p_matricule employe.matricule%type)
    return employe.salaire%type
    as
    v_salaire employe.salaire%type;
begin
    Select salaire into v_salaire from employe where matricule = p_matricule;
    return v_salaire;
  exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('matricule invalide');
        return -1;
    when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        return -2;
end;



-------------------------------------------------------------


begin
    DBMS_OUTPUT.PUT_LINE(get_salaire_par_matricule ('code20'));
end;
/