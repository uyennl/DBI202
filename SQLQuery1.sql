create DATABASE FUH_Company

use FUH_Company;
create table tblDepartment
(depNum char(10) primary key,
 depName nvarchar(60),
 mgrAssDate Date,
 mgrSSN char (20),
 )
 Create table tblEmployee
 (
   empSSN char(12) primary key,
   empName nvarchar (40),
   empAddress nvarchar(80),
   empSalary decimal(10,0),
   empSex bit,
   empBirthDate date,
   depNum char(10),
   suppervisorSSN char(12),
   empStarday date
   constraint fk_emp foreign key(depNum) references tblDepartment (depNum),
)

   Create table tblDependent
   (
     depName nvarchar(40),
     empSSN char (12),
     depSex bit,
     depBirthday date,
     depRelationship nvarchar(15),
     constraint pk_dep primary key(depName, empSSN),
     constraint fk_dep foreign key(empSSN) references tblEmployee(empSSN)
     )
	
   
   CREATE TABLE tblLocation
   (
     locNum char(10) PRIMARY key,
     locName nvarchar(40),
     )
   CREATE TABLE tblProject
   (
     proNum char(10) PRIMARY KEY,
     proName nvarchar(40),
     locNum char(10),
     depNum char(10),
     CONSTRAINT pk_pro FOREIGN key (depNum) REFERENCES tblDepartment(depNum) ,
     CONSTRAINT pk_pro2 FOREIGN key (locNum) REFERENCES tblLocation(locNum)
    )
    create table tblWorksOn(
empSSN char(12),
proNum char(10),
workHours int,
constraint pk primary key (empSSN,proNum),
constraint fkey_2 foreign key (proNum) references tblProject (proNum)
) 
     create table tblDepLocation(
depNum char(10),
locNum char(10),
constraint fk primary key (depNum,locNum),
constraint fk_1 foreign key (locNum) references tblLocation(locNum),
constraint fk_2 foreign key (depNum) references tblDepartment(depNum)
)