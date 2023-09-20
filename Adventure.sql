create function fn_MSTV_GetEmployees()
returns @Table Table(EmployeeKey int, FirstName nvarchar(20), DOB Date)
as
begin
insert into @Table
select EmployeeKey, FirstName, cast(BirthDate as Date)
from DimEmployee
return
end
select * from fn_MSTV_GetEmployees()

Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()

create function fn_ILTVF_GetEmployees()
returns table
as
return (select EmployeeKey, FirstName, cast(BirthDate as Date) as DOB
from DimEmployee)

select * from fn_ILTVF_GetEmployees()
update fn_ILTVF_GetEmployees() set FirstName='Guy1' where EmployeeKey=1



  
create function fn_GetEmployeeNameByld(@id int)
returns nvarchar(20)
as
begin
return (select FirstName from DimEmployee where EmployeeKey = @id)
end
sp_helptext fn_GetEmployeeNameByld
select dbo.fn_GetEmployeeNameByld(1);

alter function fn_GetEmployeeNameByld(@id int)
returns nvarchar(20)
with encryption
as
begin
return (select FirstName from DimEmployee where EmployeeKey = @id)
end
sp_helptext fn_GetEmployeeNameByld

alter function fn_GetEmployeeNameByld(@id int)
returns nvarchar(20)
with schemabinding
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey = @id)
end
sp_helptext fn_GetEmployeeNameByld
select dbo.fn_GetEmployeeNameByld(1);


create table #PersonDetails (id int, FirstName nvarchar(20))
insert into #PersonDetails Values(1, 'Mike')
insert into #PersonDetails Values(2, 'Jhon')
insert into #PersonDetails Values(3, 'Todd')
select * from #PersonDetails

select FirstName from tempdb..sysobjects
where FirstName like '#PersonDetails%'

create procedure spCreateLocalTeamTable
as
begin
create table #PersonDetails(id int, FirstName nvarchar(20))
insert into #PersonDetails Values(1, 'Mike')
insert into #PersonDetails Values(2, 'Jhon')
insert into #PersonDetails Values(3, 'Todd')
select * from #PersonDetails
end

select * from DimEmployee 
where VacationHours > 30 and VacationHours < 40

select * from DimEmployee 
where VacationHours > 30 and VacationHours < 40

create index IX_tblEmployee_Salary
on DimEmployee(VacationHours ASC)
exec sys.sp_helpindex @objname='DimEmployee'

select * from DimEmployee 
where VacationHours > 30 and VacationHours < 40

create index IX_tblEmployee_Salary
on DimEmployee(VacationHours ASC)
exec sys.sp_helpindex @objname='DimEmployee'
