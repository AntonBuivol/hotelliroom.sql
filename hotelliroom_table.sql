create table guest(
guest_ID int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) null,
member_since date
);

create table guest(
guest_ID int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) null,
member_since date
);

create table reservation(
reservation_id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_ID int,
foreign key (guest_ID) references guest (guest_ID)
);

create table reserved_room(
reserved_room int primary key identity(1,1),
number_of_rooms int,
room_type_ID int,
foreign key (room_type_ID) references room_type (room_type_ID),
reservation_id int,
foreign key (reservation_id) references reservation (reservation_id),
status varchar(20)
);

create table room(
room_ID int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_ID int,
foreign key (room_type_ID) references room_type (room_type_ID)
);

create table occupied_room(
occupied_room_ID int primary key identity(1,1),
check_in datetime,
check_out datetime,
room_ID int,
foreign key (room_ID) references room (room_ID),
reservation_id int,
foreign key (reservation_id) references reservation (reservation_id)
);

create table hosted_at(
hosted_at_ID int primary key identity(1,1),
guest_ID int,
foreign key (guest_ID) references guest (guest_ID),
reservation_id int,
foreign key (reservation_id) references reservation (reservation_id)
);
