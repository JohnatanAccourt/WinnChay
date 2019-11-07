CREATE DATABASE WINNCHAY;
	USE WINNCHAY;

CREATE TABLE CATEGORIES(
	IDCATEGORY INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CATEGORY VARCHAR(25) NOT NULL,

	CONSTRAINT UQ_CATEGORY UNIQUE (CATEGORY)
);

CREATE TABLE ESPORTS(
	ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	IDCATEGORY INT(11) NOT NULL,
	GAME VARCHAR(25) NOT NULL,

	CONSTRAINT UQ_GAME UNIQUE (GAME),
	CONSTRAINT FK_IDCATEGORY_ESPORTS FOREIGN KEY (IDCATEGORY) REFERENCES CATEGORIES (IDCATEGORY)
);

CREATE TABLE SPORTS(
	ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	IDCATEGORY INT(11) NOT NULL,
	SPORTS VARCHAR(25) NOT NULL,

	CONSTRAINT UQ_SPORTS UNIQUE (SPORTS),
	CONSTRAINT FK_IDCATEGORY_SPORTS FOREIGN KEY (IDCATEGORY) REFERENCES CATEGORIES (IDCATEGORY)
);

CREATE TABLE PLATFORMS(
	IDPLATFORM INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PLATFORM VARCHAR(20) NOT NULL,

	CONSTRAINT UQ_PLATFORM UNIQUE (PLATFORM)
);

CREATE TABLE PICTURES(
	IDPICTURE INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PICTURE VARCHAR(10)
);

CREATE TABLE PROFILE_PICTURES(
	IDPROFILE INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PICTURE VARCHAR(10) NOT NULL
);

CREATE TABLE PLAYERS(
	IDPLAYER INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	IDPROFILE INT(11),
	FIRST_NAME VARCHAR(20) NOT NULL,
	LAST_NAME VARCHAR(20) NOT NULL,
	USERNAME VARCHAR(16) NOT NULL,
	EMAIL VARCHAR(30) NOT NULL,
	PASSWORD VARCHAR(16) NOT NULL,
	TEAM VARCHAR(16),
	CPF INT(11) NOT NULL,
	PHONE CHAR(14) NOT NULL,
	AVALIACAO DECIMAL(2,1),
	
	CONSTRAINT UQ_EMAIL_PLAYERS UNIQUE (EMAIL),
	CONSTRAINT UQ_CPF_PLAYERS UNIQUE (CPF),
	CONSTRAINT UQ_USERNAME_PLAYERS UNIQUE (USERNAME),
	CONSTRAINT FK_PICPROFILE_PLAYERS FOREIGN KEY (IDPROFILE) REFERENCES PROFILE_PICTURES (IDPROFILE)
);

CREATE TABLE RANKING_FIFA(
	IDRKG_FIFA INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	IDPLAYER INT(11) NOT NULL,
	IDPLATFORM INT(11) NOT NULL, 
	USERNAME VARCHAR(16) NOT NULL,

	CONSTRAINT FK_IDPLATFORM_RKGFIFA FOREIGN KEY (IDPLATFORM) REFERENCES PLATFORMS (IDPLATFORM)
);

CREATE TABLE NUMPLAYERS(
	IDNUMPLAYERS INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NAME_CHAMP VARCHAR(30) NOT NULL,
	IDADM INT(11) NOT NULL,
	NUMPLAYERS INT(11) NOT NULL,

	CONSTRAINT UQ_NAMECHAMP_NPLAYERS UNIQUE (NAME_CHAMP),
	CONSTRAINT FK_IDADM_NPLAYERS FOREIGN KEY (IDADM) REFERENCES PLAYERS (IDPLAYER)
);

CREATE TABLE CHAMPIONSHIPS (
	IDCHAMP INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	IDADM INT(11) NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	IDCATEGORY INT(11) NOT NULL,
	IDPICTURE INT(11),
	THOPHY VARCHAR(16),
	START_DATE VARCHAR(10) NOT NULL,
	FINAL_DATE VARCHAR(10) NOT NULL,
	IDPLATFORM INT(11) NOT NULL,
	AWARDS VARCHAR(50),
	DESCRIPTION VARCHAR(160) NOT NULL,
	IDNUMPLAYERS INT(11) NOT NULL,

	CONSTRAINT UQ_NAMECHAMP_CHAMP UNIQUE (NAME),
	CONSTRAINT FK_IDADM_CHAMP FOREIGN KEY (IDADM) REFERENCES PLAYERS (IDPLAYER),
	CONSTRAINT FK_NUMPLAYERS_CHAMP  FOREIGN KEY (IDNUMPLAYERS) REFERENCES NUMPLAYERS (IDNUMPLAYERS),
	CONSTRAINT FK_IDPLATFORM_CHAMP FOREIGN KEY (IDPLATFORM) REFERENCES PLATFORMS (IDPLATFORM),
	CONSTRAINT FK_PICTURES_CHAMP FOREIGN KEY (IDPICTURE) REFERENCES PICTURES (IDPICTURE),
	CONSTRAINT FK_IDCATEGORY_CHAMP FOREIGN KEY (IDCATEGORY) REFERENCES CATEGORIES (IDCATEGORY)
);
 
INSERT INTO PLATFORMS (PLATFORM) VALUES ('PC');
INSERT INTO PLATFORMS (PLATFORM) VALUES ('PS4');
INSERT INTO PLATFORMS (PLATFORM) VALUES ('XBOX');

INSERT INTO CATEGORIES (CATEGORY) VALUES ('E-SPORTS');
INSERT INTO CATEGORIES (CATEGORY) VALUES ('ESPORTES');

INSERT INTO ESPORTS (IDCATEGORY, GAME) VALUES (1, 'FIFA');
INSERT INTO ESPORTS (IDCATEGORY, GAME) VALUES (1, 'PES');

INSERT INTO PLAYERS (FIRST_NAME, LAST_NAME, USERNAME, EMAIL, PASSWORD, CPF, PHONE) VALUES ('DANILO', 'ALMEIDA', 'DAN', 'DANILO8ALMEIDA@HOTMAIL.COM', '12345', '42409149812', '11963273155');