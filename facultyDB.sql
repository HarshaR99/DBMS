use hr;
create table student(
snum int,
sname varchar(20),
major varchar(20),
lvl varchar(20),
age int,
constraint student_pk primary key(snum)
);

create table faculty(
fid int,
fname varchar(20),
deptid int,
constraint faculty_pk primary key(fid)
);

create table class (
cname varchar(20),
meets_at time,
room varchar(20),
fid int,
constraint class_pk primary key(cname),
constraint fid_fk foreign key(fid) references faculty(fid) on delete cascade
);

create table enrolled(
snum int,
cname varchar(20),
constraint enrolled_pk primary key(snum,cname),
constraint snum_fk foreign key(snum) references student(snum) on delete cascade,
constraint cname_fk foreign key(cname) references class(cname) on delete cascade
);

insert into faculty values(11,'Dr NV',02);
insert into faculty values(12,'Dr GS',01);
insert into faculty values(13,'Dr UV',02);
insert into faculty values(14,'Dr BJ',02);
insert into faculty values(15,'NM',01);
 
 
insert into student VALUES(101,'Yaseen','CS','JR',19);
insert into student VALUES(102,'Arbaz','CS','SR',20);
insert into student VALUES(103,'Abhishek','IS','SR',21);
insert into student VALUES(104,'Chirag','CS','JR',20);
insert into student VALUES(105,'Chiru','IS','SR',21);
select * from student;


insert into class values('OO_Java','09:15:00',407,11);
insert into class values('TFCS','09:15:00',402,12);
insert into class values('ADA','10:10:00',404,13);
insert into class values('DBMS','01:00:00',128,14);
insert into class values('OS','02:00:00',206,15);


insert into enrolled values(101,'OO_Java');
insert into enrolled values(102,'TFCS');
insert into enrolled values(103,'ADA');
insert into enrolled values(104,'DBMS');
insert into enrolled values(105,'OS');

select s.sname,f.fname
from student s,class c,faculty f,enrolled e
where  s.lvl = 'JR' and s.snum = e.snum and
c.cname = e.cname and f.fid = c.fid;





