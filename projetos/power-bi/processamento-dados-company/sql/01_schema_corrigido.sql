CREATE SCHEMA IF NOT EXISTS azure_company;
USE azure_company;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS dependent;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS dept_locations;
DROP TABLE IF EXISTS departament;
DROP TABLE IF EXISTS employee;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE employee (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(1),
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(60),
    Sex CHAR(1),
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL DEFAULT 1,
    CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn),
    CONSTRAINT fk_employee_supervisor
        FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE departament (
    Dname VARCHAR(30) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    Dept_create_date DATE,
    CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_dept UNIQUE (Dname),
    CONSTRAINT fk_dept_manager
        FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
        ON UPDATE CASCADE
);

CREATE TABLE dept_locations (
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(30) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations
        FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE project (
    Pname VARCHAR(30) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(30),
    Dnum INT NOT NULL,
    CONSTRAINT pk_project PRIMARY KEY (Pnumber),
    CONSTRAINT unique_project UNIQUE (Pname),
    CONSTRAINT fk_project
        FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE works_on (
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(4,1) NOT NULL,
    CONSTRAINT pk_works_on PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_employee_works_on
        FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    CONSTRAINT fk_project_works_on
        FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE dependent (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(30) NOT NULL,
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(15),
    CONSTRAINT pk_dependent PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent
        FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);
