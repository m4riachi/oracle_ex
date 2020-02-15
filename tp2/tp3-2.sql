begin
    update dep set nbetud = (select count(*) from etudiant where etudiant.code_dep = dep.code_dep);
end;
/

