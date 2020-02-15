create or replace trigger check_modification_salaire
    before insert or update on emp
    FOR EACH ROW
    v_salaire_bas exception;
    v_salaire_haut exception;
begin
    if (:NEW.ename != 'president') then
        if :NEW.salaire < 10000 then
            raise v_salaire_bas;
        elsif :NEW.salaire > 50000 then
            raise v_salaire_haut;
        end if;
    end if;
exception
    when v_salaire_bas then
        DBMS_OUTPUT.PUT_LINE('salaire trop bas');
    when v_salaire_haut then
        DBMS_OUTPUT.PUT_LINE('salaire trop haut');
end;