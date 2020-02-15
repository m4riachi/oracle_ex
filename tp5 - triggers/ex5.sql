create or replace trigger update_salgrade
    before update on salgrade
    FOR EACH ROW
declare 
    v_count number;
    v_count_exception exception;
begin
    select count(*) into v_count from emp where job_id = :NEW.job and (salaire < :NEW.minsal or salaire > :NEW.maxsal);
    
    if v_count > 0 then
        raise v_count_exception;
    end if;

    exception
        when v_count_exception then
            DBMS_OUTPUT.PUT_LINE('il ya des salaire inferieur ou superieur au min et max');
end;