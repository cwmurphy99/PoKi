--Q1
select * from grade;

--Q2
select * from emotion;

--Q3
select COUNT(*) from poem;

--Q4
select distinct top 76 Name from author 
ORDER BY name ASC;

--Q5
select distinct top 76 a.Name, b.Name
from author a
join grade b on a.GradeId = b.id
ORDER BY a.Name ASC

--Q6
