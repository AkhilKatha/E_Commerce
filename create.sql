create table users
	(
		user_id int,
		user_name varchar(40) NOT NULL UNIQUE,
		user_password varchar(60) NOT NULL UNIQUE,
		address varchar(80),
		email varchar(40),
		phone int,
	 	primary key (user_id)
	);
	

create table category
	(
		category_id int,
		category_name varchar(30),
	 	primary key (category_id)
	);

create table product
	(
		product_id int,
		category_id int,
		product_name varchar(20),
		description varchar(40),
	 	primary key (product_id),
	 	foreign key (category_id) references category (category_id) on delete cascade
		on update cascade
	);

create table product_specifications
	(
		option_id int,
		product_id int,
		quantity int,
		price numeric(10,4),
		on_sale int,
		specs varchar(40),
	 	primary key (option_id),
	 	foreign key (product_id) references product (product_id) on delete cascade
		on update cascade
	);
	
create table vendor
	(
		vendor_id int,
		vendor_name varchar(20),
		phone int,
		email varchar(40),
	 	primary key (vendor_id)
	);

create table vendor_product
	(
		item int,
		vendor_id int,
		prodcut_id int,
		primary key (item),
		foreign key (vendor_id) references vendor(vendor_id) on delete cascade
		on update cascade,
		foreign key (product_id) references product (product_id) on delete cascade
		on update cascade
	);
	
create table cart
	(
		item int,
		cart_id int NOT null,
		product_id int,
		option_id int,
		quantity int,
		price numeric(10,4),
		primary key (cart_id),
		foreign key (option_id) references product_specifications(option_id)
		on delete cascade on update cascade,
		foreign key (product_id) references product (product_id) on delete cascade
		on update cascade
	);
	
create table orders
	(
		order_id int,
		cart_id int,
		status bool not null,
		shipping_fee numeric(10,4),
		tax numeric(10,4),
		total_cost numeric(10,4),
		order_date date,
		delivery_date date,
		ship_name varchar(20),
		ship_address varchar(40),
		tracking_number varchar(10),
		delivery_status bool,
		primary key (order_id),
		foreign key (cart_id) references cart (cart_id) on delete cascade
		on update cascade
	);
	
	
create table order_placed
	(
		item int,
		user_id int,
		order_id int,
		primary key (item),
		foreign key (user_id) references users (user_id) on delete cascade
		on update cascade,
		foreign key (order_id) references orders (order_id) on delete cascade
		on update cascade
	);
