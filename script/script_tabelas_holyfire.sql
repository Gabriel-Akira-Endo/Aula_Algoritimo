drop database HolyFire;
create database HolyFire;
use HolyFire;


CREATE TABLE igreja (
    idIgreja INT PRIMARY KEY AUTO_INCREMENT not null,
    nomeIgreja VARCHAR(45) not null,
    cnpj CHAR(14) not null unique,
    email VARCHAR(65) not null unique,
    senha varchar(45),
    cep CHAR(8) not null unique
);
 
	CREATE TABLE evento (
		idEvento INT AUTO_INCREMENT not null,
		igrejaEvento INT not null,
		PRIMARY KEY (idEvento, igrejaEvento),
		CONSTRAINT checkIgreja FOREIGN KEY (igrejaEvento) REFERENCES igreja(idIgreja),
		nome varchar(45) not null,
        cep char(8) not null,
        numero varchar(6) not null,
		data_hora DATETIME not null,
		categoria VARCHAR(45) not null,
        descricao text not null,
		imagem_evento text not null
		);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) not null,
    email VARCHAR(45) not null unique,
    senha VARCHAR(45)not null
);

CREATE TABLE curtida (
    evento_idevento_like INT,
    fk_id_usuario INT,
    dataCurtida DATETIME,
    PRIMARY KEY(evento_idevento_like , fk_id_usuario),
    FOREIGN KEY (evento_idevento_like) REFERENCES evento(idEvento),
    FOREIGN KEY (fk_id_usuario) REFERENCES Usuario(idUsuario)
);


CREATE TABLE missionario (
    idMissionario INT PRIMARY KEY AUTO_INCREMENT,
    fk_igreja_miss INT not null,
    nome VARCHAR(45) not null,
    email VARCHAR(45) not null,
    dt_nasc date not null,
    tel char(13) not null,
    instagram VARCHAR(45) not null,
    pedidos text not null,
	descricao text not null,
    imagem text not null,
    FOREIGN KEY (fk_igreja_miss) REFERENCES igreja(idIgreja)
);
