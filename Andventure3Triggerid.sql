--92. DDL Trigger SQL serveris

--создание тригера на отображение когда создаются новые таблицы
create trigger [trMyFirstTrigger]
on Database
for Create_Table
as
begin
print 'New table created'
end
-- создание таблици для проверки
create table Test (id int)

-- изменения триггера, отображение когда создаются, меняются и удаляются таблицы
alter trigger trMyFirstTrigger
on database
for Create_Table, Alter_Table, Drop_Table
as
begin
print 'A table has just been created, modified or deleted'
end
-- удаление таблици для проверки
drop table Test
  
-- изменения триггера, не дает создавать, менять и удалять таблицы
alter trigger trMyFirstTrigger
on database
for Create_Table, Alter_Table, Drop_Table
as
begin
rollback
  --
print'You cannot create, alter or drop a table'
end

--отключение триггера
disable trigger trMyFirstTrigger on database
--удаление триггера
drop trigger trMyFirstTrigger on database

--тригер на отображение когда делают rename
create trigger trRenameTable
on database
for rename
as
begin
print 'You just renamed something'
end

create table TestTable (id int)

--переименнование таблицы для проверки
sp_rename'TestTable','NewTestTable'

--93. Server-Scoped DDL triggerid

--
create trigger tr_DatabaseScopeTrigger
on database
for Create_Table, Alter_Table, Drop_Table
as
begin
rollback
print'You cannot create, alter drop, a table in current database'
end


drop table TestTable


create trigger tr_ServerScopeTrigger
on all server
for Create_Table, Alter_Table, Drop_Table
as
begin
rollback
-- отменяет все изменения
print'You cannot create, alter drop a table in any database in the server'
end

create table TestTable (id int)
drop table TestTable

disable trigger tr_ServerScopeTrigger on all server
--включение триггера
enable trigger tr_ServerScopeTrigger on all server

drop trigger tr_ServerScopeTrigger on all server


--94. SQL serveri trigeri täitmise järjekord

create trigger tr_DatabaseScopeTrigger
on database
for Create_Table
as
begin
print'Database Scope Trigger'
end
go

create trigger tr_ServerScopeTrigger
on all server
for Create_Table
as
begin
print'Server Scope Trigger'
end
go

create table TestTable (id int)

exec sp_settriggerorder
@triggername='tr_DatabaseScopeTrigger',
@order='none',
@stmttype='Create_Table',
@namespace='Database'
go

--96. Logon trigger SQL serveris

create trigger tr_LogonAuditTiggers
on all server
for LOGON
as
begin
declare @LoginName nvarchar(100)
set @LoginName=ORIGINAL_LOGIN()
if (select count(*) from sys.dm_exec_sessions
where is_user_process=1
and original_login_name=@LoginName)>3
begin
print'Fourth connection of'+@LoginName+'blocked'
rollback
end
end

--читает логи
Execute sp_readerrorlog
