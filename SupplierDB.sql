create database test;
use test;

create table Supplier(
sid int ,
sname varchar(20),
city varchar(20),
constraint sup_pk primary key(sid)
);

create table Part(
pid int,
pname varchar(20),
color varchar(10),
constraint part_pk primary key(pid)
);

create table Catalog(
sid int,
pid int,
cost int,
constraint sid_fk foreign key(sid) references Supplier(sid),
constraint pid_fk foreign key(pid) references Part(pid)
);
alter table Catalog drop constraint sid_fk;
alter table Catalog drop constraint pid_fk;

alter table Catalog add constraint sid_fk foreign key(sid) references Supplier(sid) on delete cascade;
alter table catalog add constraint pid_fk foreign key(pid) references Part(pid) on delete cascade;

insert into Supplier values
(10001,'Acme Widget','Bangalore'),(10002,'Johns','Kolkata'),(10003,'Vimal','Mumbai'),
(10004,'Relaince','Mumbai');

insert into Part values 
(20001,'Book','Red'),(20002,'Pen','Red'),(20003,'Pencil','Green'),
(20004,'Mobile','Green'),(20005,'Charger','Black');

insert into Catalog values 
(10001,20001,10),(10001,20002,10),(10001,20003,30),(10001,20004,10),
(10001,20005,10),(10002,20001,10),(10002,20002,20),(10003,20003,30),
(10004,20003,40);

update Supplier
set sname = 'Reliance'
where sid = 10004;
 
select distinct Supplier.sid from Supplier,Part,Catalog
where Catalog.sid = Supplier.sid and Catalog.pid = Part.pid 
and (Supplier.city = 'Bangalore' or Part.color = 'Red');

select s1.sid, s2.sid from Supplier s1,Supplier s2,Catalog c1,Catalog c2,Part
where s1.sid = c1.sid and s2.sid = c2.sid  and 
Part.pid=c1.pid and Part.pid=c2.pid and c1.cost > c2.cost;

select distinct Supplier.sid from Supplier,Catalog,Part
where Catalog.sid = Supplier.sid and Catalog.pid = Part.pid 
and Part.color in ('Red','Green');

-- query to find sname of supplier who charges most for that part
select s.sname,p.pname,c.cost
from supplier s , part p,catalog c
where s.sid = c.sid and p.pid = c.pid and
c.cost = ( select max(cost)
			         from catalog
            where c.pid = pid
	         );

