CREATE DATABASE  IF NOT EXISTS ferme;
USE ferme;

CREATE TABLE type_plante (
  id_type_plante int(10) NOT NULL,
  nom char(45) NOT NULL,
  CONSTRAINT pk_id_type_plante PRIMARY KEY (id_type_plante));

CREATE TABLE animal (
  id_animal int(10) NOT NULL,
  nom char(45) NOT NULL,
  CONSTRAINT pk_id_animal PRIMARY KEY (id_animal));

CREATE TABLE poste (
  id_poste smallint(5) NOT NULL,
  nom varchar(45) NOT NULL,
  CONSTRAINT pk_id_poste PRIMARY KEY (id_poste));

CREATE TABLE produit (
  id_produit int(10) NOT NULL,
  nom varchar(45) NOT NULL,
  CONSTRAINT pk_id_produit PRIMARY KEY (id_produit));

CREATE TABLE terre (
  id_terre int(10) NOT NULL,
  nom varchar(45) NOT NULL,
  CONSTRAINT pk_id_terre PRIMARY KEY (id_terre));

CREATE TABLE employe (
  id_employe int(10) NOT NULL,
  nom varchar(45) NOT NULL,
  id_poste smallint(5) NOT NULL,
  CONSTRAINT pk_id_employe PRIMARY KEY (id_employe),
  CONSTRAINT fk_poste_employe FOREIGN KEY (id_poste) REFERENCES poste (id_poste));

CREATE TABLE plante (
  id_plante int(10) NOT NULL,
  nom varchar(45) NOT NULL,
  id_type_plante int(10) NOT NULL,
  CONSTRAINT pk_id_plante PRIMARY KEY (id_plante),
  CONSTRAINT fk_type_plante_plante FOREIGN KEY (id_type_plante) REFERENCES type_plante (id_type_plante));

CREATE TABLE alimentation (
  id_plante int(10) NOT NULL,
  id_animal int(10) NOT NULL,
  annee tinyint(4) NOT NULL,
  qtx smallint(6) NOT NULL,
  CONSTRAINT fk_plante_alimantation FOREIGN KEY (id_plante) REFERENCES plante (id_plante),
  CONSTRAINT fk_animal_alimentation FOREIGN KEY (id_animal) REFERENCES animal (id_animal));

CREATE TABLE terrain (
  id_terrain int(10) NOT NULL,
  surface float NOT NULL,
  longitude float NOT NULL,
  latitude float NOT NULL,
  id_terre int(10) NOT NULL,
  CONSTRAINT pk_id_terrain PRIMARY KEY (id_terrain),
  CONSTRAINT fk_terre_terrain FOREIGN KEY (id_terre) REFERENCES terre (id_terre));

CREATE TABLE elevage (
  id_elevage int(10) NOT NULL,
  capacite int(10)NOT NULL,
  id_animal int(10) NOT NULL,
  id_terrain int(10) NOT NULL,
  CONSTRAINT pk_id_elevage PRIMARY KEY (id_elevage),
  CONSTRAINT fk_animal_elevage FOREIGN KEY (id_animal) REFERENCES animal (id_animal),
  CONSTRAINT fk_terrain_elevage FOREIGN KEY (id_terrain) REFERENCES terrain (id_terrain));

CREATE TABLE production (
  annee tinyint(4) NOT NULL,
  quantite int(10) NOT NULL,
  elevage int(10) NOT NULL,
  CONSTRAINT pk_annee PRIMARY KEY (annee),
  CONSTRAINT fk_elevage_production FOREIGN KEY (elevage) REFERENCES elevage (id_elevage));

CREATE TABLE culture (
  id_culture int(10) NOT NULL,
  id_plante int(10) NOT NULL,
  annee tinyint(3) NOT NULL,
  rendement int(10) NOT NULL,
  id_terrain int(10) NOT NULL,
  id_employe int(10) NOT NULL,
  CONSTRAINT pk_id_culture PRIMARY KEY (id_culture),
  CONSTRAINT fk_plante_culture FOREIGN KEY (id_plante) REFERENCES plante (id_plante),
  CONSTRAINT fk_terrain_culture FOREIGN KEY (id_terrain) REFERENCES terrain (id_terrain),
  CONSTRAINT fk_employe_culture FOREIGN KEY (id_employe) REFERENCES employe (id_employe));

CREATE TABLE traitement (
  id_produit int(10) NOT NULL,
  qtx smallint(6) NOT NULL,
  id_culture int(10) NOT NULL,
  CONSTRAINT fk_culture_traitement FOREIGN KEY (id_culture) REFERENCES culture (id_culture),
  CONSTRAINT fk_produit_traitement FOREIGN KEY (id_produit) REFERENCES produit (id_produit));
