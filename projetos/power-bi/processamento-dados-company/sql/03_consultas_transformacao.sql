USE azure_company;

-- Colaboradores com departamento e respectivo gerente.
SELECT
    e.Ssn,
    CONCAT(e.Fname, ' ', e.Minit, ' ', e.Lname) AS Employee_name,
    e.Bdate,
    SUBSTRING_INDEX(e.Address, '-', 1) AS House_number,
    REGEXP_REPLACE(e.Address, '^[^-]+-|-[^-]+-[^-]+$', '') AS Street,
    SUBSTRING_INDEX(SUBSTRING_INDEX(e.Address, '-', -2), '-', 1) AS City,
    SUBSTRING_INDEX(e.Address, '-', -1) AS State,
    e.Sex,
    CAST(e.Salary AS DECIMAL(10,2)) AS Salary,
    d.Dnumber,
    d.Dname AS Department,
    CONCAT(m.Fname, ' ', m.Minit, ' ', m.Lname) AS Manager_name
FROM employee e
LEFT JOIN departament d ON e.Dno = d.Dnumber
LEFT JOIN employee m ON e.Super_ssn = m.Ssn
ORDER BY e.Ssn;

-- Combinações departamento-localização. Mesclar preserva atributos relacionados.
SELECT
    d.Dnumber,
    d.Dname,
    dl.Dlocation,
    CONCAT(d.Dname, ' - ', dl.Dlocation) AS Department_location
FROM departament d
INNER JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
ORDER BY d.Dnumber, dl.Dlocation;

-- Quantidade de colaboradores por gerente, incluindo quem não possui gerente.
SELECT
    COALESCE(CONCAT(m.Fname, ' ', m.Minit, ' ', m.Lname), 'Sem gerente') AS Manager_name,
    COUNT(*) AS Employee_count
FROM employee e
LEFT JOIN employee m ON e.Super_ssn = m.Ssn
GROUP BY COALESCE(CONCAT(m.Fname, ' ', m.Minit, ' ', m.Lname), 'Sem gerente')
ORDER BY Employee_count DESC, Manager_name;

-- Horas por projeto.
SELECT
    p.Pnumber,
    p.Pname,
    p.Plocation,
    SUM(w.Hours) AS Total_hours
FROM project p
LEFT JOIN works_on w ON p.Pnumber = w.Pno
GROUP BY p.Pnumber, p.Pname, p.Plocation
ORDER BY p.Pnumber;

-- Checagens de qualidade pedidas no desafio.
SELECT 'employee_without_manager' AS Check_name, COUNT(*) AS Result
FROM employee WHERE Super_ssn IS NULL
UNION ALL
SELECT 'department_without_manager', COUNT(*)
FROM departament WHERE Mgr_ssn IS NULL
UNION ALL
SELECT 'works_on_negative_hours', COUNT(*)
FROM works_on WHERE Hours < 0;
