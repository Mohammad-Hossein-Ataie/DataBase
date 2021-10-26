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
create table Customer(
  cname char(20),
  email char(20),
  username char(20),
  c_phone char(20),
  c_address char(20),
  primary key(username, c_phone)
);
create table submits(
  username char(20),
  c_phone char(20),
  rname char(20),
  pname char(20),
  primary key(rname, pname, username, c_phone),
  foreign key(rname, pname) references Orders(rname, pname),
  foreign key(username, c_phone) references Customer(username, c_phone)
);
create table Comments(
  rname char(20),
  fname char(20),
  text char(20),
  score char(20),
  primary key(rname, fname),
  foreign key(rname, fname) references Food_serve(rname, fname) on delete cascade
);
create table Adds(
  rname char(20),
  fname char(20),
  username char(20),
  c_phone char(20),
  primary key(rname, fname, cname),
  foreign key(rname, fname) references Comments(rname, fname) on delete no action,
  foreign key(username, c_phone) references Customer(username, c_phone) on delete no action
);