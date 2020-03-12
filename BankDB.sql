create database test;
use test;

create table branch(
branch_name varchar(20) primary key,
branch_city varchar(10),
assets int);

create table BankAccount(
accno int primary key,
branchname varchar(10),
balance int,
foreign key(branchname) references branch(branch_name)
);	

create table depositer(
customername varchar(20),
accno int,
primary key(customername,accno)
);

create table BankCustomer(
customername varchar(20) ,
customerstreet varchar(20),
city varchar(10),
primary key(customername,customerstreet,city),
foreign key(customername) references Depositer(customername)
);

create table loan(
loannumber varchar(10) primary key,
branchname varchar(20),
amount int,
foreign key(branchname) references branch(branch_name)
);



insert into branch values 
("SBI_chamarjpet","Bangalore",50000),
("SBI_ResidencyRoad","Bangalore","10000"),
("SBI_ShivajiRoad","Bombay",20000),
("SBI_ParliamentRoad","Delhi",10000),
("SBI_JantarMantar","Delhi",20000);

insert into BankAccount values 
(1,"SBI_chamarjpet",2000),
(2,"SBI_ResidencyRoad",5000),
(3,"SBI_ShivajiRoad",6000),
(4,"SBI_ParliamentRoad",9000),
(5,"SBI_JantarMantar",8000),
(6,"SBI_ShivajiRoad",4000),
(8,"SBI_ResidencyRoad",4000),
(9,"SBI_ParliamentRoad",3000),
(10,"SBI_ResidencyRoad",5000),
(11,"SBI_JantarMantar",2000);


insert into  BankCustomer values
("Avinash","Bull_Temple_Road","Bangalore"),
("Dinesh","Bannergatta_Road","Bangalore"),
("Mohan","NationalCOllege_Road_Road","Bangalore"),
("Nikil","Akbar_Road","Delhi"),
("Ravi","Prthiviraj","Delhi");
