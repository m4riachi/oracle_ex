declare
    v_etudiant etudiant%ROWTYPE;
begin
    select * into v_etudiant from etudiant where cne = '362017';

    DBMS_OUTPUT.PUT_LINE(v_etudiant.nom || ' ' || v_etudiant.prenom);
end;
/