Create or Replace function convertir_usd_eur (montant number)
    return number
    as
begin
  return montant * 1.1;
  exception
    when value_error then
        DBMS_OUTPUT.PUT_LINE("Voud devez nous donner un chiffre");
    when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end;

begin
    DBMS_OUTPUT.PUT_LINE(convertir_usd_eur (10));
end;
/