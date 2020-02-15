declare
    cursor cur_dep is select * from dep;
    cursor cur_etudiant (v_code_dep etudiant.code_dep%TYPE) is select * from etudiant where code_dep = v_code_dep;
begin
    for v_dep in cur_dep loop
        DBMS_OUTPUT.PUT_LINE('Département : ' || v_dep.nom_dep);
        for v_etudiant in cur_etudiant(v_dep.code_dep) loop
            DBMS_OUTPUT.PUT_LINE(v_etudiant.cne || ' ' || v_etudiant.nom);
        end loop;
    end loop;
end;
/