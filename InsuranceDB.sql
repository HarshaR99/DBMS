
USE hr;
CREATE TABLE PERSON(
driver_id varchar(20) PRIMARY KEY,names varchar(20), address varchar(20)
);
CREATE TABLE CAR ( reg_num varchar(20) primary KEY,
model varchar(20),
year varchar(20)

);
CREATE TABLE OWNS(
driver_id varchar(20) ,
reg_num varchar(20),
foreign key (driver_id) references person(driver_id),
foreign key (reg_num) references car(reg_num),
constraint own_psn primary key (driver_id,reg_num)
);




create table accident (
report_num varchar(20) primary key,
accident_date varchar(20),
location varchar(20)
);

create table participated (
driver_id varchar(20),
reg_num varchar(20),
report_num varchar(20),
damage_amount int ,
foreign key(driver_id) references person (driver_id),
foreign key(reg_num) references car(reg_num),
foreign key (report_num) references accident (report_num),
constraint part_psn primary key (driver_id,reg_num,report_num)
);

insert into person values
("A01","Richard","Srinivas nagar"),("A02","Pradeep","rajajinagar"),
("A03","smith","Ashok nagar") , ("A04","John","N R colony"),("A05","Venu","Hanumanth nagar") ;


insert into car values
("KA052250","Lancer","1990"),("KA031181","Indica","1957"),
("KA095477","Toyota","1998"), ("KA053408","Honda","2008"),
("KA041702","Audi","2005");

insert into owns values
("A01","KA052250"),("A02","KA053408"),
("A03","KA031181"),("A04","KA095477") , ("A05","KA041702") ;

insert into accident values
("11","01-JAN-03","Mysore road"),("12","02-FEB-04","South end circle"),("13","21-JAN-03","Bull temple road"),
("14","17-FEB-08","Mysore road"),("15","04-MAR-05","kanakpura Raod");

insert  into participated values
("A01","KA052250","11",10000),("A02","KA053408","12",50000),("A03","KA095477","13",25000),
("A04","KA031181","14",3000),("A05","KA041702","15",5000);

-- query to find names of drivers whose damge is greater han average amount
select distinct names 
from person p,participated pt 
where p.driver_id = pt.driver_id and 
pt.damage_amount > ( select avg(damage_amount)
							from participated
                             );
                             
