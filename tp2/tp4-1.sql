declare
    cursor cur_matiere is select * from matiere;
begin
    for v_matiere in cur_matiere loop
        DBMS_OUTPUT.PUT_LINE('Matiere : ' || v_matiere.code_mat || ' ' || v_matiere.libelle || ' ' || v_etudiant.coeiff);
    end loop;
end;
/