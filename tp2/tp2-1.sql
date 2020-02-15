declare
    cursor cur_resultat is select * from resultat where note > 15 and code_mat = 102;
    cursor cur_etudiant (v_cne etudiant.cne%TYPE) is select * from etudiant where cne = v_cne; 
    v_etudiant cur_etudiant%ROWTYPE;
begin
    for v_resultat in cur_resultat loop
        open cur_etudiant;

        fetch cur_etudiant(v_resultat.cne) into v_etudiant;
        DBMS_OUTPUT.PUT_LINE(v_etudiant.nom || ' ' || v_etudiant.prenom);
        
        close cur_etudiant;
    end loop;
end;
/