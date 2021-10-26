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
CREATE TABLE Orders(
  rname char(20),
  pname char(20),
  date CHAR(20),
  state CHAR(20),
  primary key(rname, pname),
  foreign key(rname, pname) references Food_serve(rname, fname) on delete cascade
);
create table sends(
  rname char(20),
  pname char(20),
  paikname char(20),
  primary key(rname, pname, paikname),
  foreign key(paikname) references paik(paikname),
  foreign key(rname, pname) references Orders(rname, fname)
);
CREATE TABLE Normal_order(
  rname char(20),
  pname char(20),
  primary key(rname, pname),
  foreign key(rname, pname) references Orders(rname, pname) on delete cascade
);
create table Discount(
  dcode integer,
  exp_date char(20),
  primary key(dcode)
);
create table Special_order(
  rname char(20),
  pname char(20),
  dcode integer,
  primary key(rname, pname, dcode),
  foreign key(rname, pname) references Orders(rname, pname) on delete cascade,
  foreign key(dcode) references Discount(dcode) on delete no action
);