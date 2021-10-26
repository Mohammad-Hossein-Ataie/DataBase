create database Sellfood;
use Sellfood;
create table Resturant(
  rname char(20),
  address char(20),
  r_phone_number char(20),
  primary key(rname)
);
create table Food_serve(
  rname char(20),
  fname char(20),
  ingredients char(20),
  type_ char(20),
  primary key(rname, fname),
  foreign key(rname) references Resturant(rname) on delete cascade
);
create table Paik(
  paikname char(20),
  p_phone_nymber char(20),
  pelak char(20),
  PRIMARY KEY(pname)
);
create table activates_on(
  paikname char(20),
  day char(20),
  time char(20),
  PRIMARY KEY(paikname),
  FOREIGN KEY(paikname) REFERENCES Paik(paikname) ON DELETE CASCADE
);