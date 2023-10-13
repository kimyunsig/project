create table login (
id varchar(20) primary key,
pass varchar(10),
passwordcheck varchar(10) not null,
name varchar(5) not null,
birth datetime ,-- 생년월일
gender varchar(1),  
email varchar(20),
phone varchar(20) not null,
age int check (age>=19)
);

select * from log
in;


insert into login(id, pw, passwordcheck, name, birth, gender, email, phone, age)
 values('kim', sha1('kimpw'), 'kimpw', 'paa', '1220', 'm', 'khd60588@naver.com', '010-1111-2222', 20);
 
