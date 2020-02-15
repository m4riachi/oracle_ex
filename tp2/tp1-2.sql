begin
  for v_etudiant in (select * from etudiant where code_dep = (select code_dep from dep where nom_dep = 'info')) loop
    DBMS_OUTPUT.PUT_LINE(v_etudiant.nom || ' ' || v_etudiant.prenom);
  end loop;
end;
/