create table login (
id varchar(20) primary key,
pass varchar(15),
passwordcheck varchar(10) not null,
name varchar(5) not null,
birth datetime ,-- 생년월일
gender varchar(1),  
email varchar(20),
phone varchar(20) not null,
age int check (age>=19)
);

select * from login;

insert into login(id, pass, passwordcheck, name, birth, gender, email, phone, age)
 values('kim', 'kimp', 'kimp', 'paa', '2000-12-20', 'm', 'aaa1234@naver.com', '010-1111-2222', 22);
 
 select * from login;

 insert into login(id, pass, passwordcheck, name, birth, gender, email, phone, age)
 values('you', 'youp', 'youp', 'paa', '2000-12-20', 'm', 'aaa1234@naver.com', '010-1111-2222', 22);
 

