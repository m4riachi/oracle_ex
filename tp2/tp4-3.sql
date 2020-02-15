declare
    cursor cur_etudiant is select * from etudiant;
    cursor cur_resultat (v_cne resultat.cne%TYPE) is select * from resultat inner join matiere on resultat.code_mat = matiere.code_mat where cne = v_cne;
    v_note number(10, 2);
    v_coeff number;
    v_moyenne number(10, 2);
begin
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    for v_etudiant in cur_etudiant loop
        DBMS_OUTPUT.PUT_LINE('Résultats de l’étudiant :' || v_etudiant.nom);
        DBMS_OUTPUT.PUT_LINE('------------------------------');
        DBMS_OUTPUT.PUT_LINE('Libelle Matiere' || CHR(9) || 'Date' || CHR(9) || 'coefficient');

        v_note := 0;
        v_coeff := 0;
        for v_resultat in cur_resultat (v_etudiant.cne) loop
            DBMS_OUTPUT.PUT_LINE(v_resultat.libelle || CHR(9) || v_resultat.date_res || CHR(9) || v_resultat.coeiff);

            v_note := v_note + v_resultat.note;
            v_coeff := v_coeff + v_resultat.coeiff;
        end loop;

        if v_coeff > 0 then
            v_moyenne := v_note / v_coeff;
            DBMS_OUTPUT.PUT_LINE('Moyenne :' || v_moyenne);
        else 
            DBMS_OUTPUT.PUT_LINE('Moyenne : 0');  
        end if;
        
        DBMS_OUTPUT.PUT_LINE(CHR(10));
        DBMS_OUTPUT.PUT_LINE(CHR(10));
    end loop;
end;
/