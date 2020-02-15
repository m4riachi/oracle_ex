declare
    v_value number;
begin
  if &v_value mod 2 = 0 then
    DBMS('Paire');
  else
    DBMS('Impaire');
  end if;
end;