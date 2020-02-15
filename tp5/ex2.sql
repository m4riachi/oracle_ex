create or replace trigger log_operation
    after insert or update or delete on emp
    declare
        v_action varchar2(20);
        v_date date;
    begin
        if INSERTING then
            v_action := 'insertion';
        elsif UPDATING then
            v_action := 'modification';
        else
            v_action := 'suppression';
        end if;
        v_date := TO_DATE(sysdate, 'YYYY-MM-dd');
        insert into emp_log values (v_date, v_action);
    end;