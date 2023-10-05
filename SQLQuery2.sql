--1.Cho biết ai đang quản lý phòng ban có tên: Phòng Nghiên cứu và phát triển. Thông tin yêu cầu: mã số,họ tên nhân viên, mã số phòng ban, tên phòng ban
Select empSSN , empName as 'Tên trưởng phòng' , d.depNum, depName
from tblEmployee e , tblDepartment d
where e.empSSN = d.mgrSSN
and depName = N'Phòng nghiên cứu và phát triển'
--2.Cho phòng ban có tên: Phòng Nghiên cứu và phát triển hiện đang quản lý dự án nào. Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý
--Cách 1: 
Select empSSN, empName , empBirthdate , d.depNum, depName 
From tblEmployee e , tblDepartment d 
where e.depNum = d.depNum
and depName = N'Phòng nghiên cứu và phát triển'
--Cách 2: Dùng inner join
select empSSN , empName , empBirthdate , d.depNum, depName
From tblEmployee e inner join tblDepartment d on e.depNum = d.depNum 
where depName = N'Phòng nghiên cứu và phát triển'
--3.Cho biết dự án có tên ProjectB hiện đang được quản lý bởi phòng ban nào. Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý
select proNum as 'Mã dự án' , proName as 'Tên dự án' , depName as 'Tên phòng ban quản lí' 
from tblProject p, tblDepartment d
where p.depNum = d.depNum
and p.proName = 'ProjectB'
--4.Cho biết những nhân viên nào đang bị giám sát bởi nhân viên có tên Mai Duy An. Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên
select e.empSSN, e.empName
from tblEmployee e
join tblEmployee s on e.suppervisorSSN = s.empSSN
where s.empName = 'Mai Duy An'
--5.Cho biết ai hiện đang giám sát những nhân viên có tên Mai Duy An. Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên giám sát.
SELECT e.empSSN, e.empName AS SupervisorName
FROM tblEmployee e
JOIN tblEmployee s ON e.empSSN = s.suppervisorSSN
WHERE s.empName = 'Mai Duy An';
--6.Cho biết dự án có tên ProjectA hiện đang làm việc ở đâu. Thông tin yêu cầu: mã số, tên vị trí làm việc.
SELECT p.proNum, l.locName AS ProjectLocation
FROM tblProject p
JOIN tblLocation l ON p.locNum = l.locNum
WHERE p.proName = 'ProjectA';
--7.Cho biết vị trí làm việc có tên Tp. HCM hiện đang là chỗ làm việc của những dự án nào. Thông tin yêu cầu: mã số, tên dự án
SELECT p.proNum, p.proName
FROM tblProject p
JOIN tblLocation l ON p.locNum = l.locNum
WHERE l.locName = N'TP Hồ Chí Minh';
--8.Cho biết những người phụ thuộc trên 18 tuổi .Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào.
SELECT d.depName, d.depBirthday, e.empName
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
WHERE DATEDIFF(YEAR, d.depBirthday, GETDATE()) > 18;
--9.Cho biết những người phụ thuộc  là nam giới. Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào 
SELECT d.depName, d.depBirthday, e.empName
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
WHERE d.depSex = 0;
--10.Cho biết những nơi làm việc của phòng ban có tên : Phòng Nghiên cứu và phát triển. Thông tin yêu cầu: mã phòng ban, tên phòng ban, tên nơi làm việc.
SELECT dl.depNum, d.depName, l.locName
FROM tblDepLocation dl
JOIN tblDepartment d ON dl.depNum = d.depNum
JOIN tblLocation l ON dl.locNum = l.locNum
WHERE d.depName = N'Phòng nghiên cứu và phát triển';
--11.Cho biết các dự án làm việc tại Tp. HCM. Thông tin yêu cầu: mã dự án, tên dự án, tên phòng ban chịu trách nhiệm dự án.
SELECT p.proNum, p.proName, d.depName
FROM tblProject p
JOIN tblDepartment d ON p.depNum = d.depNum
JOIN tblLocation l ON p.locNum = l.locNum
WHERE l.locName = N'TP Hồ Chí Minh';
--12.Cho biết những người phụ thuộc là nữ giới, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển . Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên
SELECT e.empName, d.depName, d.depRelationship
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
JOIN tblDepartment dep ON e.depNum = dep.depNum
WHERE d.depSex = 0 AND dep.depName = N'Phòng nghiên cứu và phát triển';
--13.Cho biết những người phụ thuộc trên 18 tuổi, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển. Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên
SELECT e.empName, d.depName, d.depRelationship
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
JOIN tblDepartment dep ON e.depNum = dep.depNum
WHERE DATEDIFF(YEAR, d.depBirthday, GETDATE()) > 18 AND dep.depName = N'Phòng nghiên cứu và phát triển';
--14.Cho biết số lượng người phụ thuộc theo giới tính. Thông tin yêu cầu: giới tính, số lượng người phụ thuộc
SELECT CASE WHEN d.depSex = 1 THEN 'Female' ELSE 'Male' END AS Gender, COUNT(*) AS DependentCount
FROM tblDependent d
GROUP BY d.depSex;
--15.Cho biết số lượng người phụ thuộc theo mối liên hệ với nhân viên. Thông tin yêu cầu: mối liên hệ, số lượng người phụ thuộc
SELECT depRelationship, COUNT(*) AS DependentCount
FROM tblDependent
GROUP BY depRelationship;
--16.Cho biết số lượng người phụ thuộc theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
SELECT d.depNum, d.depName, COUNT(*) AS DependentCount
FROM tblDepartment d
JOIN tblEmployee e ON d.depNum = e.depNum
JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum, d.depName;
--17.Cho biết phòng ban nào có số lượng người phụ thuộc là ít nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
SELECT d.depNum, d.depName, COUNT(dep.empSSN) AS DependentCount
FROM tblDepartment d
LEFT JOIN tblEmployee e ON d.depNum = e.depNum
LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum, d.depName
HAVING COUNT(dep.empSSN) = (
    SELECT MIN(DependentCount)
    FROM (
        SELECT COUNT(dep.empSSN) AS DependentCount
        FROM tblEmployee e
        LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
        GROUP BY e.depNum
    ) subquery
);
--18.Cho biết phòng ban nào có số lượng người phụ thuộc là nhiều nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
SELECT d.depNum, d.depName, COUNT(dep.empSSN) AS DependentCount
FROM tblDepartment d
LEFT JOIN tblEmployee e ON d.depNum = e.depNum
LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum, d.depName
HAVING COUNT(dep.empSSN) = (
    SELECT MAX(DependentCount)
    FROM (
        SELECT COUNT(dep.empSSN) AS DependentCount
        FROM tblEmployee e
        LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
        GROUP BY e.depNum
    ) subquery
);
--19.Cho biết tổng số giờ tham gia dự án của mỗi nhân viên. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName, SUM(wo.workHours) AS TotalWorkHours
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblWorksOn wo ON e.empSSN = wo.empSSN
GROUP BY e.empSSN, e.empName, d.depName;
--20.Cho biết tổng số giờ làm dự án của mỗi phòng ban. Thông tin yêu cầu: mã phòng ban,  tên phòng ban, tổng số giờ
SELECT d.depNum, d.depName, SUM(wo.workHours) AS TotalWorkHours
FROM tblDepartment d
JOIN tblEmployee e ON d.depNum = e.depNum
JOIN tblWorksOn wo ON e.empSSN = wo.empSSN
GROUP BY d.depNum, d.depName;