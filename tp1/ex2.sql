declare
    v_i number := 1;
    v_j number;
    v_total number;
begin
  while v_i < 1000 loop
    v_j := 1;
    v_total := 0;

    while v_j < v_i loop
      if v_i mod v_j = 0 then
        v_total :=  v_total + v_j;
      end if;

      v_j := v_j + 1;
    end loop;

    if v_i = v_total then
      dbms_output.put_line(v_i || ' est parfait');
    end if;

    v_i := v_i + 1;
  end loop;
end;
/