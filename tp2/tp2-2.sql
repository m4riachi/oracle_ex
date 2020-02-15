declare
    cursor cur_resultat (v_note resultat.note%TYPE, v_mat resultat.code_mat%TYPE) is select * from resultat where note > v_note and code_mat = v_mat;
    cursor cur_etudiant (v_cne etudiant.cne%TYPE) is select * from etudiant where cne = v_cne; 
    v_etudiant cur_etudiant%ROWTYPE;
    v_note resultat.note%TYPE;
    v_mat resultat.code_mat%TYPE;
begin
    v_note := &note;
    v_mat := &mat;
    for v_resultat in cur_resultat(v_note, v_mat) loop
        open cur_etudiant(v_resultat.cne);

        fetch cur_etudiant into v_etudiant;
        DBMS_OUTPUT.PUT_LINE(v_etudiant.nom || ' ' || v_etudiant.prenom);
        
        close cur_etudiant;
    end loop;
end;
/
