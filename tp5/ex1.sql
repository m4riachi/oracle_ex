create or replace trigger alert_operation
    after insert or update or delete on emp
    for each row
    begin
      DBMS_OUTPUT.PUT_LINE('Opération terminée');
    end;