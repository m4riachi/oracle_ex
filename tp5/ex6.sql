create or replace trigger alert_operation
    before insert or update or delete on emp
declare
    v_weekend_exception exception;
    v_today varchar2(20);
begin
    v_today := TO_CHAR(sysdate, 'fmDAY');
    if (v_today = 'SATURDAY' or v_today = 'SUNDAY') then
        raise v_weekend_exception;
    end if;

exception
  when v_weekend_exception then
    DBMS_OUTPUT.PUT_LINE('Vous ne pourrez faire des modification le weekend');
    ;
end;