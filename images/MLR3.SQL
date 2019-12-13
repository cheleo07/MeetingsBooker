-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (22/11/2019 15:22:17)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR3
--      Projet : 
--      Auteur : sio2d19
--      Date de dernière modification : 22/11/2019 15:22:07
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--       TABLE : CATEGORIE_LIEU
-- -----------------------------------------------------------------------------

CREATE SEQUENCE public.contacter_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.contacter_id_seq
    OWNER TO postgres;

CREATE SEQUENCE public.entreprise_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.entreprise_id_seq
    OWNER TO postgres;
	
CREATE SEQUENCE public.reservation_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.reservation_id_seq
    OWNER TO postgres;
	
CREATE SEQUENCE public.utilisateur_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.utilisateur_id_seq
    OWNER TO postgres;

CREATE SEQUENCE public.lieu_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.lieu_id_seq
    OWNER TO postgres;

CREATE SEQUENCE public.ville_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.ville_id_seq
    OWNER TO postgres;


CREATE TABLE CATEGORIE_LIEU
   (
    IDCATEG varchar(3) NOT NULL  ,
    LIBELLECATEG varchar(30) NULL  
,   CONSTRAINT PK_CATEGORIE_LIEU PRIMARY KEY (IDCATEG)
   );

-- -----------------------------------------------------------------------------
--       TABLE : UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE TABLE UTILISATEUR
   (
    LOGIN varchar(28) NOT NULL  ,
    IDENT_HERITAGE_65 integer NOT NULL DEFAULT nextval('utilisateur_id_seq'::regclass),
    PASSWORD varchar(28) NULL  ,
    IDENT varchar(3) NULL  
,   CONSTRAINT PK_UTILISATEUR PRIMARY KEY (LOGIN)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_ENT_292_ENTREPRISE_2
     ON UTILISATEUR (IDENT_HERITAGE_65)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : FACILITE
-- -----------------------------------------------------------------------------

CREATE TABLE FACILITE
   (
    IDFACILITE varchar(3) NOT NULL  ,
    LIBELLEFACITLITE varchar(30) NULL  
,   CONSTRAINT PK_FACILITE PRIMARY KEY (IDFACILITE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : LIEU
-- -----------------------------------------------------------------------------

CREATE TABLE LIEU
   (
    IDLIEU varchar(3) NOT NULL  ,
    IDCATEG varchar(3) NOT NULL  ,
    IDPHOTO varchar(3) NULL  ,
    IDVILLE varchar(3) NOT NULL  ,
    IDENT integer NOT NULL DEFAULT nextval('lieu_id_seq'::regclass),
    LIBELLELIEU varchar(30) NULL  ,
    COORDX varchar(30) NULL  ,
    COORDY varchar(30) NULL  ,
    ANNULATIONGRATUITE bool NULL  ,
    NBETOILES varchar(1) NULL  ,
    DESCRIPTIF varchar(30) NULL  
,   CONSTRAINT PK_LIEU PRIMARY KEY (IDLIEU)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE LIEU
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_LIEU_CATEGORIE_LIEU
     ON LIEU (IDCATEG)
    ;

CREATE UNIQUE INDEX I_FK_LIEU_PHOTO
     ON LIEU (IDPHOTO)
    ;

CREATE  INDEX I_FK_LIEU_VILLE
     ON LIEU (IDVILLE)
    ;

CREATE  INDEX I_FK_LIEU_ENTREPRISE
     ON LIEU (IDENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PAYS
-- -----------------------------------------------------------------------------

CREATE TABLE PAYS
   (
    IDPAYS varchar(3) NOT NULL  ,
    NOMPAYS varchar(30) NULL  
,   CONSTRAINT PK_PAYS PRIMARY KEY (IDPAYS)
   );

-- -----------------------------------------------------------------------------
--       TABLE : DUREE
-- -----------------------------------------------------------------------------

CREATE TABLE DUREE
   (
    CODEDUREE varchar(1) NOT NULL  ,
    LIBELLEDUREE varchar(30) NULL  
,   CONSTRAINT PK_DUREE PRIMARY KEY (CODEDUREE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : PHOTO
-- -----------------------------------------------------------------------------

CREATE TABLE PHOTO
   (
    IDPHOTO varchar(3) NOT NULL  ,
    IDSALLE varchar(3) NOT NULL  ,
    IDLIEU varchar(3) NULL  ,
    CHEMINPHOTO varchar(30) NULL  ,
    PRINCIPALEO_N bool NULL  
,   CONSTRAINT PK_PHOTO PRIMARY KEY (IDPHOTO)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PHOTO
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PHOTO_SALLE
     ON PHOTO (IDSALLE)
    ;

CREATE UNIQUE INDEX I_FK_PHOTO_LIEU
     ON PHOTO (IDLIEU)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : VILLE
-- -----------------------------------------------------------------------------

CREATE TABLE VILLE
   (
    IDVILLE varchar(3) NOT NULL  ,
    IDPAYS varchar(3) NOT NULL  ,
    IDENT integer NOT NULL DEFAULT nextval('ville_id_seq'::regclass),
    NOMVILLE varchar(30) NULL  ,
    CODEPOSTAL varchar(5) NULL  
,   CONSTRAINT PK_VILLE PRIMARY KEY (IDVILLE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VILLE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VILLE_PAYS
     ON VILLE (IDPAYS)
    ;

CREATE  INDEX I_FK_VILLE_ENTREPRISE
     ON VILLE (IDENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ROOM_LAYOUT
-- -----------------------------------------------------------------------------

CREATE TABLE ROOM_LAYOUT
   (
    IDLAYOUT varchar(3) NOT NULL  ,
    LIBELLELAYOUT varchar(30) NULL  ,
    PICTOLAYOUT varchar(30) NULL  
,   CONSTRAINT PK_ROOM_LAYOUT PRIMARY KEY (IDLAYOUT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ENTREPRISE
-- -----------------------------------------------------------------------------

CREATE TABLE ENTREPRISE
   (
    IDENT integer NOT NULL DEFAULT nextval('entreprise_id_seq'::regclass),
    NOMENT varchar(30) NULL  ,
    ADRESSEENT varchar(30) NULL  ,
    TELENT varchar(10) NULL  ,
    EMAIL varchar(30) NULL  ,
    NOM varchar(30) NULL  ,
    PRENOM varchar(30) NULL  ,
    CONTACTEO_N bool NULL  ,
    ACONTACTEO_N bool NULL  ,
    TYPEINSCIRPTION varchar(30) NULL  
,   CONSTRAINT PK_ENTREPRISE PRIMARY KEY (IDENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : RESERVATION
-- -----------------------------------------------------------------------------

CREATE TABLE RESERVATION
   (
    NUMRESA varchar(5) NOT NULL  ,
    IDSALLE varchar(3) NOT NULL  ,
    CODEDUREE varchar(1) NOT NULL  ,
    IDLAYOUT varchar(3) NOT NULL  ,
    IDENT integer NOT NULL DEFAULT nextval('reservation_id_seq'::regclass),
    NBCONVIVES char(32) NULL  ,
    DATEDEBUT date NULL  ,
    DATEFIN date NULL  ,
    HEUREDEBUT time NULL  ,
    HEUREFIN time NULL  
,   CONSTRAINT PK_RESERVATION PRIMARY KEY (NUMRESA)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RESERVATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RESERVATION_SALLE
     ON RESERVATION (IDSALLE)
    ;

CREATE  INDEX I_FK_RESERVATION_DUREE
     ON RESERVATION (CODEDUREE)
    ;

CREATE  INDEX I_FK_RESERVATION_ROOM_LAYOUT
     ON RESERVATION (IDLAYOUT)
    ;

CREATE  INDEX I_FK_RESERVATION_ENTREPRISE
     ON RESERVATION (IDENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SALLE
-- -----------------------------------------------------------------------------

CREATE TABLE SALLE
   (
    IDSALLE varchar(3) NOT NULL  ,
    IDLIEU varchar(3) NOT NULL  ,
    NOMSALLE varchar(30) NULL  ,
    TARFI_DEMI_JOURNEE int4 NULL  ,
    LARGEUR int4 NULL  ,
    LONGUEUR int4 NULL  ,
    SURFACE int4 NULL  ,
    HAUTEUR int4 NULL  
,   CONSTRAINT PK_SALLE PRIMARY KEY (IDSALLE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SALLE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SALLE_LIEU
     ON SALLE (IDLIEU)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPEMENT
   (
    IDEQUIPEMENT varchar(3) NOT NULL  ,
    LIEBELLEEQUIPEMENT varchar(30) NULL  
,   CONSTRAINT PK_EQUIPEMENT PRIMARY KEY (IDEQUIPEMENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : VIDEO
-- -----------------------------------------------------------------------------

CREATE TABLE VIDEO
   (
    IDVIDEO varchar(3) NOT NULL  ,
    IDSALLE varchar(3) NOT NULL  ,
    CHEMINVIDEO varchar(30) NULL  
,   CONSTRAINT PK_VIDEO PRIMARY KEY (IDVIDEO)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VIDEO
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VIDEO_SALLE
     ON VIDEO (IDSALLE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PROPOSER
-- -----------------------------------------------------------------------------

CREATE TABLE PROPOSER
   (
    IDLIEU varchar(3) NOT NULL  ,
    IDFACILITE varchar(3) NOT NULL  
,   CONSTRAINT PK_PROPOSER PRIMARY KEY (IDLIEU, IDFACILITE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PROPOSER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PROPOSER_LIEU
     ON PROPOSER (IDLIEU)
    ;

CREATE  INDEX I_FK_PROPOSER_FACILITE
     ON PROPOSER (IDFACILITE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CONTACTER
-- -----------------------------------------------------------------------------

CREATE TABLE CONTACTER
   (
    DATE date NOT NULL  ,
    LOGIN varchar(28) NOT NULL  ,
    IDENT integer NOT NULL DEFAULT nextval('contacter_id_seq'::regclass),
   CONSTRAINT PK_CONTACTER PRIMARY KEY (DATE, LOGIN, IDENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CONTACTER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONTACTER_UTILISATEUR
     ON CONTACTER (LOGIN)
    ;

CREATE  INDEX I_FK_CONTACTER_ENTREPRISE
     ON CONTACTER (IDENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPER
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPER
   (
    IDSALLE varchar(3) NOT NULL  ,
    IDEQUIPEMENT varchar(3) NOT NULL  
,   CONSTRAINT PK_EQUIPER PRIMARY KEY (IDSALLE, IDEQUIPEMENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EQUIPER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EQUIPER_SALLE
     ON EQUIPER (IDSALLE)
    ;

CREATE  INDEX I_FK_EQUIPER_EQUIPEMENT
     ON EQUIPER (IDEQUIPEMENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CHOISIR
-- -----------------------------------------------------------------------------

CREATE TABLE CHOISIR
   (
    NUMRESA varchar(5) NOT NULL  ,
    IDFACILITE varchar(3) NOT NULL  
,   CONSTRAINT PK_CHOISIR PRIMARY KEY (NUMRESA, IDFACILITE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CHOISIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CHOISIR_RESERVATION
     ON CHOISIR (NUMRESA)
    ;

CREATE  INDEX I_FK_CHOISIR_FACILITE
     ON CHOISIR (IDFACILITE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : AVOIR
-- -----------------------------------------------------------------------------

CREATE TABLE AVOIR
   (
    IDSALLE varchar(3) NOT NULL  ,
    IDLAYOUT varchar(3) NOT NULL  ,
    CAPACITE int4 NULL  
,   CONSTRAINT PK_AVOIR PRIMARY KEY (IDSALLE, IDLAYOUT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE AVOIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_AVOIR_SALLE
     ON AVOIR (IDSALLE)
    ;

CREATE  INDEX I_FK_AVOIR_ROOM_LAYOUT
     ON AVOIR (IDLAYOUT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SELECTIONNER
-- -----------------------------------------------------------------------------

CREATE TABLE SELECTIONNER
   (
    NUMRESA varchar(5) NOT NULL  ,
    IDEQUIPEMENT varchar(3) NOT NULL  
,   CONSTRAINT PK_SELECTIONNER PRIMARY KEY (NUMRESA, IDEQUIPEMENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SELECTIONNER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SELECTIONNER_RESERVATION
     ON SELECTIONNER (NUMRESA)
    ;

CREATE  INDEX I_FK_SELECTIONNER_EQUIPEMENT
     ON SELECTIONNER (IDEQUIPEMENT)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE UTILISATEUR ADD 
     CONSTRAINT FK_ENT_292_ENTREPRISE_2
          FOREIGN KEY (IDENT_HERITAGE_65)
               REFERENCES ENTREPRISE (IDENT);

ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_CATEGORIE_LIEU
          FOREIGN KEY (IDCATEG)
               REFERENCES CATEGORIE_LIEU (IDCATEG);

ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_PHOTO
          FOREIGN KEY (IDPHOTO)
               REFERENCES PHOTO (IDPHOTO);

ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_VILLE
          FOREIGN KEY (IDVILLE)
               REFERENCES VILLE (IDVILLE);

ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_ENTREPRISE
          FOREIGN KEY (IDENT)
               REFERENCES ENTREPRISE (IDENT);

ALTER TABLE PHOTO ADD 
     CONSTRAINT FK_PHOTO_SALLE
          FOREIGN KEY (IDSALLE)
               REFERENCES SALLE (IDSALLE);

ALTER TABLE PHOTO ADD 
     CONSTRAINT FK_PHOTO_LIEU
          FOREIGN KEY (IDLIEU)
               REFERENCES LIEU (IDLIEU);

ALTER TABLE VILLE ADD 
     CONSTRAINT FK_VILLE_PAYS
          FOREIGN KEY (IDPAYS)
               REFERENCES PAYS (IDPAYS);

ALTER TABLE VILLE ADD 
     CONSTRAINT FK_VILLE_ENTREPRISE
          FOREIGN KEY (IDENT)
               REFERENCES ENTREPRISE (IDENT);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_SALLE
          FOREIGN KEY (IDSALLE)
               REFERENCES SALLE (IDSALLE);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_DUREE
          FOREIGN KEY (CODEDUREE)
               REFERENCES DUREE (CODEDUREE);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_ROOM_LAYOUT
          FOREIGN KEY (IDLAYOUT)
               REFERENCES ROOM_LAYOUT (IDLAYOUT);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_ENTREPRISE
          FOREIGN KEY (IDENT)
               REFERENCES ENTREPRISE (IDENT);

ALTER TABLE SALLE ADD 
     CONSTRAINT FK_SALLE_LIEU
          FOREIGN KEY (IDLIEU)
               REFERENCES LIEU (IDLIEU);

ALTER TABLE VIDEO ADD 
     CONSTRAINT FK_VIDEO_SALLE
          FOREIGN KEY (IDSALLE)
               REFERENCES SALLE (IDSALLE);

ALTER TABLE PROPOSER ADD 
     CONSTRAINT FK_PROPOSER_LIEU
          FOREIGN KEY (IDLIEU)
               REFERENCES LIEU (IDLIEU);

ALTER TABLE PROPOSER ADD 
     CONSTRAINT FK_PROPOSER_FACILITE
          FOREIGN KEY (IDFACILITE)
               REFERENCES FACILITE (IDFACILITE);

ALTER TABLE CONTACTER ADD 
     CONSTRAINT FK_CONTACTER_UTILISATEUR
          FOREIGN KEY (LOGIN)
               REFERENCES UTILISATEUR (LOGIN);

ALTER TABLE CONTACTER ADD 
     CONSTRAINT FK_CONTACTER_ENTREPRISE
          FOREIGN KEY (IDENT)
               REFERENCES ENTREPRISE (IDENT);

ALTER TABLE EQUIPER ADD 
     CONSTRAINT FK_EQUIPER_SALLE
          FOREIGN KEY (IDSALLE)
               REFERENCES SALLE (IDSALLE);

ALTER TABLE EQUIPER ADD 
     CONSTRAINT FK_EQUIPER_EQUIPEMENT
          FOREIGN KEY (IDEQUIPEMENT)
               REFERENCES EQUIPEMENT (IDEQUIPEMENT);

ALTER TABLE CHOISIR ADD 
     CONSTRAINT FK_CHOISIR_RESERVATION
          FOREIGN KEY (NUMRESA)
               REFERENCES RESERVATION (NUMRESA);

ALTER TABLE CHOISIR ADD 
     CONSTRAINT FK_CHOISIR_FACILITE
          FOREIGN KEY (IDFACILITE)
               REFERENCES FACILITE (IDFACILITE);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_SALLE
          FOREIGN KEY (IDSALLE)
               REFERENCES SALLE (IDSALLE);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_ROOM_LAYOUT
          FOREIGN KEY (IDLAYOUT)
               REFERENCES ROOM_LAYOUT (IDLAYOUT);

ALTER TABLE SELECTIONNER ADD 
     CONSTRAINT FK_SELECTIONNER_RESERVATION
          FOREIGN KEY (NUMRESA)
               REFERENCES RESERVATION (NUMRESA);

ALTER TABLE SELECTIONNER ADD 
     CONSTRAINT FK_SELECTIONNER_EQUIPEMENT
          FOREIGN KEY (IDEQUIPEMENT)
               REFERENCES EQUIPEMENT (IDEQUIPEMENT);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------