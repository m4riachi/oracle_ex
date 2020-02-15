Create or Replace procedure augmenter_salaire (p_matricule employe.matricule%type, p_pourcentage number)
    as
    v_salaire employe.salaire%type;
begin
    Select salaire into v_salaire from employe where matricule = p_matricule and nbr_augmentation < 4;   

    if (v_salaire is not null) then
        update employe set salaire = salaire + (salaire * (p_pourcentage / 100)), NBR_AUGMENTATION = NBR_AUGMENTATION + 1 where matricule = p_matricule;
    else
        update employe set salaire = (select min(salaire) from employe where salaire > 0) where matricule = p_matricule;
    end if;

  exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('matricule invalide ou Limit augmentation');
    when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end;



-----------------------------------------

Create or Replace procedure augmenter_salaire (p_matricule employe.matricule%type, p_pourcentage number)
    as
    v_salaire employe.salaire%type;
    v_nbr_augmentation  employe.nbr_augmentation%type;
    v_nbr_augmentation_exception exception;
begin
    Select salaire, nbr_augmentation into v_salaire, v_nbr_augmentation from employe where matricule = p_matricule;   

    if (v_salaire is not null) then
        if (v_nbr_augmentation >= 4) then
            raise v_nbr_augmentation_exception;
        end if;

        update employe set salaire = salaire + (salaire * (p_pourcentage / 100)), NBR_AUGMENTATION = NBR_AUGMENTATION + 1 where matricule = p_matricule;
    else
        update employe set salaire = (select min(salaire) from employe where salaire > 0) where matricule = p_matricule;
    end if;

  exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('matricule invalide');
    when v_nbr_augmentation_exception then
        DBMS_OUTPUT.PUT_LINE('Limit augmentation');
    when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end;


------------------------------------------

begin
    augmenter_salaire ('code20', 10);
end;
/