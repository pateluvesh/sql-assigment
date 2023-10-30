create database cran_log_tbl;
use cran_log_tbl;

create table cran_log_tbl(
  date_value date,
  time_value time,
  size int,
  r_version varchar(12),
  r_arch varchar(12),
  r_os varchar(12),
  package varchar(30),
  version varchar(20),
  country char(2),
  ip_id int );
  select * from cran_log_tbl;
  
  
-- 9.1 give the total number of recordings in this table
select count(*) from cran_log_tbl;


-- 9.2 the number of packages listed in this table?
select count(package) from cran_log_tbl;


-- 9.3 How many times the package "Rcpp" was downloaded?
select count(*) from cran_log_tbl 
where package = 'Rcpp';


-- 9.4 How many recordings are from China ("CN")?
select count(*) from cran_log_tbl 
where country = 'CN';


-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package,count(*) from cran_log_tbl group by package order by 2 desc;


-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package , 
         case 
         when count(package) between 1 and 200 then 'A'
         when count(package) between 201 and 400 then 'B'
         when count(package) between 401 and 600 then 'C'
         when count(package) between 601 and 800 then 'D'
         else 'E'
         end as ranking 
	from cran_log_tbl where time_value between 09 and 11
    group by package;
         
-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(*) from cran_log_tbl 
where country = "CN" or country ='JP' or country = 'SG';


-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")

-- 9.9 Print the average length of the package name of all the UNIQUE packages
select avg(length(package))  from cran_log_tbl;


-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select package,count(package) as cp from cran_log_tbl group by package order by cp desc limit 1,1;
-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package from cran_log_tbl group by package 
having count(*) > 1000;


-- 9.12 The field "r_os" is the operating system of the users.

 -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).


  