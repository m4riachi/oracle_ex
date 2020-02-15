create or replace trigger log_operation_salaire
    after insert or update on emp
    FOR EACH ROW
    declare
        v_action varchar2(20);
        v_date date;
        v_ename emp.matricule%TYPE;
        v_salaire emp.salaire%TYPE; 
    begin
        if INSERTING then
            v_action := 'insertion';
        else
            v_action := 'modification';
        end if;

        if (:NEW.salaire != :OLD.salaire) then
            v_date := TO_DATE(sysdate, 'YYYY-MM-dd');
            insert into emp_log_sal values (:NEW.matricule, v_date, :NEW.salaire, v_action);
        end if;
    end;