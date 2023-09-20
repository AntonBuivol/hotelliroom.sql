insert into guest(first_name, last_name, member_since)
values('Igor','Belik','2018-10-14');
insert into guest(first_name, last_name, member_since)
values('Andrei','Andreev','2020-12-31');
insert into guest(first_name, last_name, member_since)
values('Aleksandra','Aleksandrova','2019-7-25');
insert into guest(first_name, last_name, member_since)
values('Ivan','Ivanov','2011-8-29');
insert into guest(first_name, last_name, member_since)
values('Petr','','2022-5-5');
select * from guest;

insert into room_type (description,max_capacity)
values ('lux',1);
insert into room_type (description,max_capacity)
values ('budget',2);
insert into room_type (description,max_capacity)
values ('lux',3);
insert into room_type (description,max_capacity)
values ('lux',2);
insert into room_type (description,max_capacity)
values ('budget',1);
select * from room_type;

insert into reservation(date_in, date_out, made_by, guest_ID)
values('2018-10-14','2018-10-30','for estonian',1);
insert into reservation(date_in, date_out, made_by, guest_ID)
values('2020-12-31','2021-1-1','for russian',2);
insert into reservation(date_in, date_out, made_by, guest_ID)
values('2019-7-25','2019-7-26','for american',3);
insert into reservation(date_in, date_out, made_by, guest_ID)
values('2011-8-29','2011-9-29','for sweden',4);
insert into reservation(date_in, date_out, made_by, guest_ID)
values('2022-5-5','2022-5-15','for german',5);
select * from reservation;

insert into reserved_room(number_of_rooms, room_type_ID, reservation_id, status)
values(1,1,1,'booked');
insert into reserved_room(number_of_rooms, room_type_ID, reservation_id, status)
values(2,2,2,'free');
insert into reserved_room(number_of_rooms, room_type_ID, reservation_id, status)
values(3,3,3,'booked');
insert into reserved_room(number_of_rooms, room_type_ID, reservation_id, status)
values(2,4,4,'free');
insert into reserved_room(number_of_rooms, room_type_ID, reservation_id, status)
values(1,4,4,'free');
select * from reserved_room;

insert into room(number, name, status, smoke, room_type_ID)
values('15','budget','free',1,1);
insert into room(number, name, status, smoke, room_type_ID)
values('230','lux','booked',1,2);
insert into room(number, name, status, smoke, room_type_ID)
values('90','budget','booked',0,3);
insert into room(number, name, status, smoke, room_type_ID)
values('150','lux','free',1,4);
insert into room(number, name, status, smoke, room_type_ID)
values('54','budget','booked',0,5);
select * from room;

insert into occupied_room(check_in, check_out, room_ID, reservation_id)
values('2018-10-14 12:43:45','2018-10-30 12:13:17',1,1);
insert into occupied_room(check_in, check_out, room_ID, reservation_id)
values('2020-12-31 10:15:29','2021-1-1 12:00:00',2,2);
insert into occupied_room(check_in, check_out, room_ID, reservation_id)
values('2019-7-25 11:59:14','2019-7-26 11:50:00',3,3);
insert into occupied_room(check_in, check_out, room_ID, reservation_id)
values('2011-8-29 14:30:32','2011-9-29 11:45:46',4,4);
insert into occupied_room(check_in, check_out, room_ID, reservation_id)
values('2022-5-5 15:27:59','2022-5-15 12:59:30',5,5);
select * from occupied_room;

insert into hosted_at(guest_ID, reservation_id)
values(1,1);
insert into hosted_at(guest_ID, reservation_id)
values(2,2);
insert into hosted_at(guest_ID, reservation_id)
values(3,3);
insert into hosted_at(guest_ID, reservation_id)
values(4,4);
insert into hosted_at(guest_ID, reservation_id)
values(5,5);
select * from hosted_at;
