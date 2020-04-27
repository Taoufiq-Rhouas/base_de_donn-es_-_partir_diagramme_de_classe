create database database_meris_brif_4
use database_meris_brif_4

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT (
   ID_CLIENT            int identity                 not null,
   NOM_CLIENT           char(40)             null,
   PRENOM_CLIENT        char(40)             null,
   AGE_CLIENT           int                  null,
   ADRESS_CLIENT        char(100)            null,
   TEL_CLIENT           int                  null,
   constraint PK_CLIENT primary key  nonclustered  (ID_CLIENT)
)
go

/*==============================================================*/
/* Table : COMMANDE                                             */
/*==============================================================*/
create table COMMANDE (
   ID_COMMANDE          int identity                 not null,
   ID_CLIENT            int                  not null,
   DATE_COMANDE         datetime             null,
   CONTITE_COMANDE      int                  null,
   constraint PK_COMMANDE primary key nonclustered (ID_COMMANDE)
)
go

/*==============================================================*/
/* Index : COMMANDER_FK                                         */
/*==============================================================*/
create index COMMANDER_FK on COMMANDE (
ID_CLIENT ASC
)
go

/*==============================================================*/
/* Table : CONCERNER                                            */
/*==============================================================*/
create table CONCERNER (
   ID_COMMANDE          int  identity                not null,
   ID_PRODUIT           int                  not null,
   constraint PK_CONCERNER primary key (ID_COMMANDE, ID_PRODUIT)
)
go

/*==============================================================*/
/* Index : CONCERNER_FK                                         */
/*==============================================================*/
create index CONCERNER_FK on CONCERNER (
ID_COMMANDE ASC
)
go

/*==============================================================*/
/* Index : CONCERNER2_FK                                        */
/*==============================================================*/
create index CONCERNER2_FK on CONCERNER (
ID_PRODUIT ASC
)
go

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT (
   ID_PRODUIT           int   identity               not null,
   NAME_PRODUIT         char(40)             null,
   LIBELE_PRODUIT       char(40)             null,
   PRIX_PRODUIT         int                  null,
   constraint PK_PRODUIT primary key nonclustered (ID_PRODUIT)
)
go

/*==============================================================*/
/* Table : VOULOIR                                              */
/*==============================================================*/
create table VOULOIR (
   ID_CLIENT            int  identity                not null,
   ID_PRODUIT           int                  not null,
   constraint PK_VOULOIR primary key (ID_CLIENT, ID_PRODUIT)
)
go

/*==============================================================*/
/* Index : VOULOIR_FK                                           */
/*==============================================================*/
create index VOULOIR_FK on VOULOIR (
ID_CLIENT ASC
)
go

/*==============================================================*/
/* Index : VOULOIR2_FK                                          */
/*==============================================================*/
create index VOULOIR2_FK on VOULOIR (
ID_PRODUIT ASC
)
go






/* ============================================================================================================================ */

select TABLE_NAME from INFORMATION_SCHEMA.TABLES

/* ************************************************************** */

select * from client

/* 1/_INSERTION FROM TABLE client */

insert into client values ('Taoufiq','RHOUAS',21,'Maroc SAFI','0611111111');
insert into client values ('Ahmed','karim',22,'Maroc EL JADIDA','0622222222');
insert into client values ('Yassine','reda',23,'Maroc FES','0633333333');
insert into client values ('Mehdi','yasser',24,'Maroc NADOR','0633333333');

/* 2/_UPDATE FROM TABLE client */

update client set NOM_CLIENT = 'reda' where ID_CLIENT = 4;

/* 3/_DELETE FROM TABLE client */

delete from client where ID_CLIENT = 4;

/* ************************************************************** */
/* ************************************************************** */

SELECT * from COMMANDE

/* 1/_INSERTION FROM TABLE COMMANDE */

insert into COMMANDE values (1,'2020-01-15',24);
insert into COMMANDE values (1,'2018-04-18',24);
insert into COMMANDE values (2,'2016-11-12',24);
insert into COMMANDE values (2,'2018-08-25',24);

/* 2/_UPDATE FROM TABLE COMMANDE */

update COMMANDE set CONTITE_COMANDE = 30 where ID_COMMANDE = 2;

/* 3/_DELETE FROM TABLE COMMANDE */

delete from COMMANDE where ID_COMMANDE = 4;

/* ************************************************************** */
/* ************************************************************** */

select * from PRODUIT

/* 1/_INSERTION FROM TABLE PRODUIT */

insert into PRODUIT values ('Name Produit 1','Libele Produit 1',1000);
insert into PRODUIT values ('Name Produit 2','Libele Produit 2',2000);
insert into PRODUIT values ('Name Produit 3','Libele Produit 3',3000);
insert into PRODUIT values ('Name Produit 4','Libele Produit 4',4000);

/* 2/_UPDATE FROM TABLE PRODUIT */

update PRODUIT set PRIX_PRODUIT = 30 where ID_PRODUIT = 2;

/* 3/_DELETE FROM TABLE PRODUIT */

delete from PRODUIT where ID_PRODUIT = 4;


/* ************************************************************** */
/* ----------------------------------------------------------------------------- */
/* ----------------------------------------------------------------------------- */
/*creates login: Taoufiq with password:Admin123*/
create login Taoufiq 
	with password = 'Admin123'
go

/*create a database user */
create user Taoufiq for login Taoufiq
go

grant all to Taoufiq
go

/*creates login: utilisateur with password:utilisateur123*/
create login utilisateur 
	with password = 'utilisateur123'
go

/*create a database user */
create user utilisateur for login utilisateur
go

grant select,insert to utilisateur
go
/*primary key identity,*/
/* ----------------------------------------------------------------------------- */
/* ============================================================================================================================ */
