/*SELECT MIN(SALARY) FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID, SALARY
		FROM EMPLOYEES
		WHERE SALARY = (SELECT MIN(SALARY)
				FROM EMPLOYEES);
        
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
	FROM EMPLOYEES
	WHERE (SALARY,DEPARTMENT_ID) 
               IN 
               (SELECT MIN(SALARY),DEPARTMENT_ID
		FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID);
    
SELECT FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
		FROM EMPLOYEES
		WHERE SALARY > /*ANY--*/SOME
				(SELECT DISTINCT SALARY
					 FROM EMPLOYEES
					 WHERE DEPARTMENT_ID = 30)
		ORDER BY SALARY DESC; 
  
   
SELECT LAST_NAME,hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE UPPER(LAST_NAME) ='ZLOTKEY')
AND LAST_NAME !='ZLOTKEY';


/*2.	Scrieti un query care sa afiseje employee_id si last_name pentru 
toti angajatii ce lucreaza in acelasi departament cu angajatii 
al caror nume contine litera u.*/
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES
where  last_name like '%u%');*/


3.	Afisati last_name, job_title si salary pentru angajatii cu joburi 
ce incep cu P si au salariul diferit de valorile 2500, 3500 si 7000. 
Ordonati lista dupa job ascendent si nume descendent.

SELECT LAST_NAME,JOB_TITLE POZITIE ,SALARY
FROM EMPLOYEES E
JOIN JOBS J ON E.JOB_ID = J.JOB_ID 
WHERE E.JOB_ID LIKE 'P%'
AND SALARY NOT IN(2500, 3500, 7000)
ORDER BY E.JOB_ID ASC, LAST_NAME DESC;


/*1.	Introduceti in tabela employees o inregistrare ce 
contine un nou employee_id unic (fomat din 1000 + nr lista 
prezenta) , numele si prenumele vostru, data de anagajare 
data sistemului, email TNI ,jobul Programmer, salariul 
10000 si comisionul 0.2.*/

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, EMAIL, JOB_ID, SALARY, COMMISSION_PCT)
VALUES((SELECT  MAX(EMPLOYEE_ID)+1000 FROM EMPLOYEES), 'ELIZA', 'IOANAS', SYSDATE, 'ELIZA.IOANAS@GMAIL.COM', 'AD_PRES', 1000, 0.2);

COMMIT;


/*1.	Creati un view cu numele V_SALARIATI, care sa aiba urmatoarele 
informatii: Employee_id, first_name, last_name, job_id,job_title, department_id,
department_name, salary, commission_pct. Viewul trebuie sa contina toti 
salariatii, chiar daca printere ei exista unii care nu apartin nici 
unui department.*/

CREATE OR REPLACE VIEW V_SALARIATI AS SELECT E.Employee_id, E.first_name, E.last_name, E.job_id,J.job_title, E.department_id,
D.department_name, E.salary, E.commission_pct
FROM EMPLOYEES E, 
DEPARTMENTS D,
JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND  J.JOB_ID = E.JOB_ID;

CREATE OR REPLACE VIEW V_SALARIATI_FINANCE  AS 
SELECT *
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 100

WITH CHECK OPTION 

SELECT *
FROM EMPLOYEES
INSERT INTO VIEW V_SALARIATI AS SELECT E.Employee_id, E.first_name, E.last_name, E.job_id,J.job_title, E.department_id,
D.department_name, E.salary, E.commission_pct
WHERE e.department_id = d.department and e.job_id = j.job_id


CREATE OR REPLACE VIEW emp_sequence 
start with 10;
increment with 10;
value(max employees)+1000
cache 100



numele SELECT *
FROM EMPLOYEES
WHERE (SELECT  MAX(EMPLOYEE_ID)+10 FROM EMPLOYEES





