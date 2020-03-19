#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: status
#------------------------------------------------------------

CREATE TABLE status(
        id      Int NOT NULL ,
        wording Varchar (20) NOT NULL
	,CONSTRAINT status_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id            Varchar (255) NOT NULL ,
        token         Varchar (255) NOT NULL ,
        firstname     Varchar (30) NOT NULL ,
        lastname      Varchar (30) NOT NULL ,
        email         Varchar (50) NOT NULL ,
        password      Varchar (255) NOT NULL ,
        phone         Varchar (10) ,
        street_number Int NOT NULL ,
        street        Varchar (50) NOT NULL ,
        city          Varchar (60) NOT NULL ,
        zip_code      Varchar (60) NOT NULL ,
        created_at    TimeStamp NOT NULL ,
        updated_at    TimeStamp NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: series
#------------------------------------------------------------

CREATE TABLE series(
        id          Varchar (255) NOT NULL ,
        city        Varchar (60) NOT NULL ,
        distance    Int NOT NULL ,
        latitude    Varchar (15) NOT NULL ,
        longitude   Varchar (15) NOT NULL ,
        zoom        Int NOT NULL ,
        nb_pictures Int NOT NULL ,
        created_at  TimeStamp NOT NULL ,
        updated_at  TimeStamp NOT NULL ,
        id_user     Varchar (255) NOT NULL
	,CONSTRAINT series_PK PRIMARY KEY (id)

	,CONSTRAINT series_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: picture
#------------------------------------------------------------

CREATE TABLE picture(
        id          Varchar (255) NOT NULL ,
        description Varchar (300) NOT NULL ,
        latitude    Varchar (15) NOT NULL ,
        longitude   Varchar (15) NOT NULL ,
        link        Varchar (255) NOT NULL ,
        created_at  TimeStamp NOT NULL ,
        updated_at  TimeStamp NOT NULL ,
        id_user     Varchar (255) NOT NULL
	,CONSTRAINT picture_PK PRIMARY KEY (id)

	,CONSTRAINT picture_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: game
#------------------------------------------------------------

CREATE TABLE game(
        id        Varchar (50) NOT NULL ,
        token     Varchar (255) NOT NULL ,
        score     Int ,
        pseudo    Varchar (20) ,
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

