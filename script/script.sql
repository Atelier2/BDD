#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: series
#------------------------------------------------------------

CREATE TABLE series(
        id       Varchar (255) NOT NULL ,
        city     Varchar (60) NOT NULL ,
        map_refs Varchar (60) NOT NULL ,
        range    Int NOT NULL
	,CONSTRAINT series_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: picture
#------------------------------------------------------------

CREATE TABLE picture(
        id          Varchar (255) NOT NULL ,
        description Varchar (300) NOT NULL ,
        location    Varchar (255) NOT NULL ,
        link        Varchar (255) NOT NULL
	,CONSTRAINT picture_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: status
#------------------------------------------------------------

CREATE TABLE status(
        id      Int NOT NULL ,
        wording Varchar (20) NOT NULL
	,CONSTRAINT status_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: game
#------------------------------------------------------------

CREATE TABLE game(
        id        Int  Auto_increment  NOT NULL ,
        token     Varchar (255) NOT NULL ,
        score     Int NOT NULL ,
        pseudo    Varchar (20) NOT NULL ,
        id_status Int NOT NULL ,
        id_series Varchar (255) NOT NULL
	,CONSTRAINT game_PK PRIMARY KEY (id)

	,CONSTRAINT game_status_FK FOREIGN KEY (id_status) REFERENCES status(id)
	,CONSTRAINT game_series0_FK FOREIGN KEY (id_series) REFERENCES series(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: series_pictures
#------------------------------------------------------------

CREATE TABLE series_pictures(
        id         Varchar (255) NOT NULL ,
        id_picture Varchar (255) NOT NULL
	,CONSTRAINT series_pictures_PK PRIMARY KEY (id,id_picture)

	,CONSTRAINT series_pictures_series_FK FOREIGN KEY (id) REFERENCES series(id)
	,CONSTRAINT series_pictures_picture0_FK FOREIGN KEY (id_picture) REFERENCES picture(id)
)ENGINE=InnoDB;

