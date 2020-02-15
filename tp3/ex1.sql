create table client(
    numClt number primary key, 
    nomClt varchar2(50), 
    prenomClt varchar2(50), 
    adresse varchar2(255), 
    tel varchar2(20)
);

create table compte(
    numCpt number primary key, 
    numClt number references client(numClt), 
    dateCpt date
);

create table type_operation(
    numTypeOp number primary key,
    nomTypeOp varchar2(50)
);


create table operation(
    numOp number primary key, 
    numCpt number references compte(numCpt), 
    numTypeOp number references type_operation(numTypeOp), 
    dateOp date, 
    MontantOp number(10, 2), 
    LibelleOp varchar2(50)
);

declare
    cursor cur_client is select * from client;
    cursor cur_compte (v_numClt compte.numClt%TYPE) is select * from compte where numClt = v_numClt;
    cursor cur_operation (v_numCpt operation.numCpt%TYPE) is select * from operation inner join type_operation on operation.numTypeOp = type_operation.numTypeOp where numCpt = v_numCpt;
begin
    for v_client in cur_client loop
        DBMS_OUTPUT.PUT_LINE('Client : ' || v_client.nomClt);
        DBMS_OUTPUT.PUT_LINE('------------------------------');

        for v_compte in cur_compte (v_client.numClt) loop
            DBMS_OUTPUT.PUT_LINE('Compte : ' || v_compte.numCpt);

            for v_operation in cur_operation (v_compte.numCpt) loop
                DBMS_OUTPUT.PUT_LINE('Op : ' || v_operation.nomTypeOp || ' - ' || v_operation.numOp || ' - ' || v_operation.numOp || ' - ' || v_operation.nomTypeOp);
            end loop;
        end loop;
        DBMS_OUTPUT.PUT_LINE(CHR(10));
    end loop;
end;
/