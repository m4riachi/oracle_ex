declare
    v_age number;
begin
  if &v_age < 12 then
    DBMS('enfant');
  end if;
end;