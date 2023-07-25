SELECT * FROM mydb.emp;
SELECT * FROM emp where Salary > 200000 AND Salary < 300000;
select e1.empid, e1.empname, e1.City from emp e1, emp e2 WHERE e1.City=e2.City AND e1.empid!=e2.empid;
select distinct * from emp;
SELECT * FROM emp WHERE empid IS NULL;
SELECT empname,Gender FROM emp WHERE empname IS NULL AND Gender IS NULL;
SELECT SUM(salary) as s from emp;
SELECT empid,Salary, sum(salary) as Cum_Sal from emp order by Salary desc;
SELECT empid,Salary, sum(salary) OVER(ORDER BY empid) as Cum_Sal from emp;
SELECT empid,Salary,City, avg(salary) OVER(PARTITION BY City) as Cum_avg from emp;
-- SELECT (COUNT(*) FILTER (WHERE Gender='M' * 100.0 / COUNT(*)) As MPerc, 
      --  (COUNT(*) FILTER (WHERE Gender='F' * 100.0 / COUNT(*)) As FPerc) from emp; --

SELECT * FROM emp where empid<=(SELECT COUNT(empid)/2 from emp);
SELECT COUNT(*)/2 from emp;
SELECT * FROM emp WHERE empname LIKE 'A%';
SELECT * FROM emp WHERE empname LIKE '_a%';
SELECT * FROM emp WHERE empname LIKE '%y_';
SELECT * FROM emp WHERE empname LIKE '____l';
SELECT * FROM emp WHERE empname LIKE '_a%';
SELECT DISTINCT empname FROM emp WHERE 	LOWER(empname) LIKE 'aeiou%';
SELECT DISTINCT empname FROM emp WHERE 	LOWER(empname) REGEXP '^[aeiou%]';
SELECT DISTINCT empname FROM emp WHERE 	LOWER(empname) REGEXP '[aeiou%]$';
SELECT DISTINCT empname FROM emp WHERE 	LOWER(empname) REGEXP '^[aeiou%].*[aeiou%]$';
