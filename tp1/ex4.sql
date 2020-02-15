declare
    v_rec employe%ROWTYPE;
    v_new_salaire number(10,2);
begin
  SELECT * INTO v_rec FROM employe WHERE prenom='moad';

    if v_rec.salaire < 8000 then
      v_new_salaire := v_rec.salaire * 2;
    elsif v_rec.salaire < 11000 then
        v_new_salaire := v_rec.salaire + 2000;
    else
        v_new_salaire := v_rec.salaire * 1.5;
    end if;

    update employe set salaire = v_new_salaire where  prenom='moad';
end;