create table customer (
	customer_id serial primary key,
	username VARCHAR(25) not null unique, -- not null means that it cannot be empty
	password_hash VARCHAR(100) not null,
	email VARCHAR(50),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birthday DATE,
	has_ticket boolean
);

create table tickets (
	ticket_id serial primary key, 
	ticket_quanity INTEGER,
	CONSTRAINT tickets_ticket_quantity CHECK (ticket_quanity <= 1),
	movie_ticket VARCHAR(50),
	user_id INTEGER
);

create table movie (
	movie_id serial primary key,
	theater_num INTEGER,
	movie_title VARCHAR(100),
	ticket_id INTEGER,
	actor_in VARCHAR(50),
	foreign key (ticket_id) references tickets(ticket_id)
);

create table theater (
	theater_id serial primary key,
	movie_id INTEGER,
	ticket_id INTEGER,
	foreign key (movie_id) references movie(movie_id),
	foreign key (ticket_id) references tickets(ticket_id)
);

alter table tickets 
add constraint ticket_to_customers
foreign key (user_id) references customer(customer_id)





