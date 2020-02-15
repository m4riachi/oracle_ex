create table dep(
code_dep number primary key,
nom_dep varchar2(20));

create table etudiant(
cne number primary key,
nom varchar2(20),
prenom varchar2(20),
date_naiss date,
code_dep number references dep(code_dep));

create table matiere(
code_mat number primary key,
libelle varchar2(20),
coeiff number);

create table resultat(
code_mat number references matiere(code_mat),
cne number references etudiant(cne),
date_res date,
note number,
constraint pk_res primary key (code_mat,cne, date_res));

insert into resultat values (1, 362017, to_date('20/11/2020','dd/mm/yyyy'), 36);
insert into resultat values (2, 362017, to_date('20/11/2020','dd/mm/yyyy'), 48);
insert into resultat values (3, 362017, to_date('20/11/2020','dd/mm/yyyy'), 36);

insert into dep values(1,'math');
insert into dep values(2,'physique');
insert into dep values(3,'info');

insert into matiere values(1,'algebre',2);
insert into matiere values(2,'BD',4);
insert into matiere values(3,'Reseaux',3);

insert into etudiant values(362017,'Yazidi','yassine',to_date('20/11/2000','dd/mm/yyyy'),1);
insert into etudiant values(362698,'Bouzidi','amine',to_date('15/12/1999','dd/mm/yyyy'),1);
insert into etudiant values(36586,'Salhi','brahim',to_date('04/08/1999','dd/mm/yyyy'),2);
insert into etudiant values(23689,'Zahi','Amal',to_date('10/10/1999','dd/mm/yyyy'),3);
insert into etudiant values(36254,'Jasmi','Sara',to_date('15/09/1999','dd/mm/yyyy'),3);
insert into etudiant values(25643,'Salmi','Mehdi',to_date('15/12/2000','dd/mm/yyyy'),3);

insert into resultat values (1, 362698, to_date('20/11/2020','dd/mm/yyyy'), 36);
insert into resultat values (2, 362698, to_date('20/11/2020','dd/mm/yyyy'), 40);
insert into resultat values (3, 362698, to_date('20/11/2020','dd/mm/yyyy'), 52);

insert into resultat values (1, 36586, to_date('20/11/2020','dd/mm/yyyy'), 30);
insert into resultat values (2, 36586, to_date('20/11/2020','dd/mm/yyyy'), 40);
insert into resultat values (3, 36586, to_date('20/11/2020','dd/mm/yyyy'), 36);

insert into resultat values (1, 23689, to_date('20/11/2020','dd/mm/yyyy'), 38);
insert into resultat values (2, 23689, to_date('20/11/2020','dd/mm/yyyy'), 46);
insert into resultat values (3, 23689, to_date('20/11/2020','dd/mm/yyyy'), 30);

insert into resultat values (1, 36254, to_date('20/11/2020','dd/mm/yyyy'), 34);
insert into resultat values (2, 36254, to_date('20/11/2020','dd/mm/yyyy'), 20);
insert into resultat values (3, 36254, to_date('20/11/2020','dd/mm/yyyy'), 23);

insert into resultat values (1, 25643, to_date('20/11/2020','dd/mm/yyyy'), 14);
insert into resultat values (2, 25643, to_date('20/11/2020','dd/mm/yyyy'), 50);
insert into resultat values (3, 25643, to_date('20/11/2020','dd/mm/yyyy'), 41);