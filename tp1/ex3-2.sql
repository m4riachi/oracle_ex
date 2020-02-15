declare
    v_rec employe%ROWTYPE
begin
  SELECT * INTO v_rec FROM employe WHERE matricule=20;

    DBMS_OUTPUT.PUT_LINE(v_rec.matricule);
    DBMS_OUTPUT.PUT_LINE(v_rec.id_departement);
    DBMS_OUTPUT.PUT_LINE(v_rec.nom);
    DBMS_OUTPUT.PUT_LINE(v_rec.prenom);
    DBMS_OUTPUT.PUT_LINE(v_rec.salaire);
end;