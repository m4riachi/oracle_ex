create or replace trigger check_salaire
    before insert or update on emp
    FOR EACH ROW
declare 
    v_job number;
begin
    select job into v_job from salgrade where job = :NEW.job_id and minsal >= :NEW.salaire and maxsal <= :NEW.ename;
exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('salaire nest pas correct');
end;


-----------------------------------------------------------------------

create or replace trigger update_job_salaire
    after insert or update on emp
    FOR EACH ROW
begin
    update job set minsal = :NEW.salaire where job = :NEW.job_id and salaire < :NEW.salaire;
    update job set maxsal = :NEW.salaire where job = :NEW.job_id and salaire > :NEW.salaire;
end;