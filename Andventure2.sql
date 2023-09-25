select * from DimEmployee;

create clustered index IX_tblEmployee_Name
on DimEmployee(FirstName)


create clustered index IX_tblEmployee_Gender_Salary
on DimEmployee(Gender desc, BaseRate asc)

create nonclustered index IX_tblEmployee_Name
on DimEmployee(FirstName)

Execute sp_helpindex DimEmployee

drop index DimEmployee.PK_DimEmployee_EmployeeKey

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On DimEmployee (FirstName, LastName)


ALTER TABLE DimEmployee
ADD CONSTRAINT UQ_tblEmployee_City
UNIQUE NONCLUSTERED (LastName)


CREATE UNIQUE INDEX IX_tblEmployee_City
ON DimEmployee(LastName)
WITH IGNORE_DUP_KEY


Create nonclustered index IX_tblEmployee_Salary
on DimEmployee(BaseRate Asc)


select * from DimEmployee where BaseRate>15 and BaseRate<20


Delete from DimEmployee where BaseRate=15.00
Update DimEmployee Set BaseRate=50.00 where BaseRate=14.00
select * from DimEmployee order by BaseRate Desc


select BaseRate, count (BaseRate) as Total
from DimEmployee
Group by BaseRate


Select EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.DepartmentName=DimDepartmentGroup.DepartmentGroupName

create view vWEmployeesByDepartment
as
select EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.DepartmentName=DimDepartmentGroup.DepartmentGroupName

Select * from vWEmployeesByDepartment;


create view vWITDepartment_Employees
as
select EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.DepartmentName=DimDepartmentGroup.DepartmentGroupName
where DimDepartmentGroup.DepartmentGroupName='Marketing'

select * from vWITDepartment_Employees;


create view vWEmployeesNonConfidentialData
as
select EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.DepartmentName=DimDepartmentGroup.DepartmentGroupName

select * from vWEmployeesNonConfidentialData;

create view vWEmployeesCountByDepartment
as
select DepartmentName, Count(EmployeeKey) as TotalEmployees
from DimEmployee
join DimDepartmentGroup
on DimEmployee.DepartmentName=DimDepartmentGroup.DepartmentGroupName
group by DepartmentName

select * from vWEmployeesCountByDepartment;


create view vWEmployeesDataExceptSalary
as
select EmployeeKey, FirstName,Gender, DepartmentName
from DimEmployee

select * from vWEmployeesDataExceptSalary


update vWEmployeesDataExceptSalary
set FirstName = 'Mikey' where EmployeeKey=2

Delete from vWEmployeesDataExceptSalary Where EmployeeKey=2
insert into vWEmployeesDataExceptSalary values (2,'Mikey','M','Marketing')



create view vWEmployeesDetailsByDepartment
as
select EmployeeKey, FirstName,Gender, DepartmentName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.DepartmentName=DimDepartmentGroup.DepartmentGroupName

select * from vWEmployeesDetailsByDepartment


Update vWemployeesDetailsByDepartment
Set DepartmentName='IT' where FirstName='Kevin'

select * from vWEmployeesDetailsByDepartment

select EmployeeKey, FirstName,Gender, DepartmentName
from DimEmployee



create view vWEmployeeDeatails
@Gender nvarchar(20)
as
select EmployeeKey, FirstName, Gender, DepartmentName
from DimEmployee
Where Gender=@Gender


Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select EmployeeKey, FirstName, Gender, DepartmentName
from DimEmployee where Gender = @Gender)


Select * from dbo.fnEmployeeDetails('M')



Create View vWEmployeeDetailsSorted
as
Select EmployeeKey, FirstName, Gender, DepartmentName
from DimEmployee
order by EmployeeKey



Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')


Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
