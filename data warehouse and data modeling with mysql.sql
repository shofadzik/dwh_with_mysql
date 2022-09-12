#create database and table with relation

create database mahasiswa_adzik;

create table mahasiswa_adzik.dosen_adzik (
NIDN char(6) Primary Key, 
Nama varchar(20)
);

create table mahasiswa_adzik.mahasiswa_adzik ( 
NIM char(4) Primary key,
Nama varchar (15),
Email varchar (24),
IPK Decimal (3,2), #3 adalah jumlah digit, 2 adalah angka yang diambil dibelakang koma
NidnPA char (3),
check (IPK between 0.0 and 4.0),
unique (Email),
foreign key (NidnPA) references mahasiswa_adzik.dosen_adzik (NIDN) #tabel ini berhubungan dengan tabel diatas
);

create table mahasiswa_adzik.telepon (
NIM char(4),
NoTelepon varchar(14),
keterangan varchar (10),
primary key (NIM,NoTelepon), 
foreign key (NIM) references mahasiswa_adzik.mahasiswa_adzik (NIM)
);

#basic operation in relation database

create table mahasiswa_adzik.users (
user_id int auto_increment primary key, 
username varchar (20),
create_date DATE
) auto_increment = 1; #mulai dari 1

alter table mahasiswa_adzik.users
add email varchar(100)
after username;

insert into mahasiswa_adzik.users
values
(NULL,'test01','test01@gmail.com','2021-10-10'), 
(NULL,'test02','test02@gmail.com','2021-10-11'),
(NULL,'test03','test03@gmail.com','2021-10-12')
;

delete from mahasiswa_adzik.users
where user_id = 1;

drop table mahasiswa_adzik.users

select last_insert_id(); #untuk mengetahui id terakhir yang diinsert

insert into mahasiswa_adzik.users #perintah insert data tapi gak harus urut dan bisa lebih spesifik
set
create_date = NOW(),
username = 'ita',
email = 'ita@gmail.com'
;

select NOW(); 

update mahasiswa_adzik.users set
email = 'shofa@gmail.com',
username = 'shofa'
where username = 'test03'
;

truncate table mahasiswa_adzik.users;

# other operation with sample table

create database country_adzik;

create table country_adzik.states (
id INT AUTO_INCREMENT,
name varchar(20),
join_year INT,
population INT,
primary key (id),
UNIQUE (name),
key (join_year)
);

drop table country_adzik.states;

INSERT INTO country_adzik.states VALUES
(1, 'Alabama', 1819, 4661900),
(2, 'Alaska', 1959, 686293),
(3, 'Arizona', 1912, 6500180),
(4, 'Arkansas', 1836, 2855390),
(5, 'California', 1850, 36756666),
(6, 'Colorado', 1876, 4939456),
(7, 'Connecticut', 1788, 3501252),
(8, 'Delaware', 1787, 873092),
(9, 'Florida', 1845, 18328340),
(10, 'Georgia', 1788, 9685744),
(11, 'Hawaii', 1959, 1288198),
(12, 'Idaho', 1890, 1523816),
(13, 'Illinois', 1818, 12901563),
(14, 'Indiana', 1816, 6376792),
(15, 'Iowa', 1846, 3002555),
(16, 'Kansas', 1861, 2802134),
(17, 'Kentucky', 1792, 4269245),
(18, 'Louisiana', 1812, 4410796),
(19, 'Maine', 1820, 1316456),
(20, 'Maryland', 1788, 5633597),
(21, 'Massachusetts', 1788, 6497967),
(22, 'Michigan', 1837, 10003422),
(23, 'Minnesota', 1858, 5220393),
(24, 'Mississippi', 1817, 2938618),
(25, 'Missouri', 1821, 5911605),
(26, 'Montana', 1889, 967440),
(27, 'Nebraska', 1867, 1783432),
(28, 'Nevada', 1864, 2600167),
(29, 'New Hampshire', 1788, 1315809),
(30, 'New Jersey', 1787, 8682661),
(31, 'New Mexico', 1912, 1984356),
(32, 'New York', 1788, 19490297),
(33, 'North Carolina', 1789, 9222414),
(34, 'North Dakota', 1889, 641481),
(35, 'Ohio', 1803, 11485910),
(36, 'Oklahoma', 1907, 3642361),
(37, 'Oregon', 1859, 3790060),
(38, 'Pennsylvania', 1787, 12448279),
(39, 'Rhode Island', 1790, 1050788),
(40, 'South Carolina', 1788, 4479800),
(41, 'South Dakota', 1889, 804194),
(42, 'Tennessee', 1796, 6214888),
(43, 'Texas', 1845, 24326974),
(44, 'Utah', 1896, 2736424),
(45, 'Vermont', 1791, 621270),
(46, 'Virginia', 1788, 7769089),
(47, 'Washington', 1889, 6549224),
(48, 'West Virginia', 1863, 1814468),
(49, 'Wisconsin', 1848, 5627967),
(50, 'Wyoming', 1890, 532668);

select count(*) as count_states , join_year 
from country_adzik.states
group by join_year
order by count_states desc
;

alter table country_adzik.states
modify join_year char(10); 

select count(*) from country_adzik.states;

select min(population), max(population), avg(population) 
from country_adzik.states ;

select group_concat (name separator ','), join_year
from country_adzik.states
GROUP BY join_year;
#menampilakan value, misal tahun 1970 itu yang gabung albania,truesnia,buisola


select sum(population) as USA_population from country_adzik.states ;

select 
	sum(
		if(population > 5000000, 1, 0)
	) as big_states,
	sum(
		if(population <= 5000000, 1, 0)
	) as small_states
from country_adzik.states;

select count(*),
case 
	when population > 5000000 then 'big'
	when population > 1000000 then 'medium'
	else 'small' end as state_size
from country_adzik.states
group by state_size;

select * from country_adzik.states where join_year in (
	select join_year from country_adzik.states
	group by join_year
	having count(*) > 1
) order by join_year;

select * from country_adzik.states where name like 'n%'
UNION 
select * from country_adzik.states where population > 10000000;

#JOIN

create database sales_adzik;

create table sales_adzik.customers (
customer_id int auto_increment primary key,
customer_name varchar(100)
);

create table sales_adzik.orders (
order_id int auto_increment primary key,
customer_id int,
amount double,
foreign key (customer_id) references sales_adzik.customers(customer_id)
);

insert into sales_adzik.customers ('customer_id','customer_name')
values 
(1,'adam'),
(2,'amal'),
(3,'alya'),
(4,'asta');

insert into sales_adzik.orders ('order_id','customer_id','amount')
values 
(1,1,19.19),
(2,1,20.64),
(3,3,12.21),
(4,4,11.11);

drop table sales_adzik.orders

drop table sales_adzik.customers

select customers.customer_id,
customers.customer_name,
orders.order_id,
orders.amount
from sales_adzik.customers inner join sales_adzik.orders
where customers.customer_id = orders.customer_id; #ini primary and foreign key

select * from sales_adzik.customers
left outer join sales_adzik.orders
using (customer_id);

select * from sales_adzik.customers
left outer join sales_adzik.orders
using (customer_id)
where orders.order_id is not null;

select * from sales_adzik.customers
right outer join sales_adzik.orders
using (customer_id);
