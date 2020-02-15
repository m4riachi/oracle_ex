declare
    v_rec employe%ROWTYPE;
begin
    for v_rec in (select * from employe where id_departement = 1) loop
        DBMS_OUTPUT.PUT_LINE(v_rec.matricule || ' ' || v_rec.id_departement || ' ' || v_rec.nom || ' ' || v_rec.prenom || ' ' || v_rec.salaire);
    end loop;
end;