--drop table NH_USERS;

create table NH_USERS (
    USER_ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    USERNAME CHAR(200),
    FIRSTNAME CHAR(200),
    LASTNAME CHAR(200),
    ITEMS BLOB,
    EMAIL CHAR(200),
    PASSWORD CHAR(200),
    PRIMARY KEY (USER_ID)
)


--create table user (
--     UserID int not null auto_increment,
--  FirstName varchar(50),
--  LastName varchar(50),
--  EmailAddress varchar(50),
--  primary key (UserID) 

--)