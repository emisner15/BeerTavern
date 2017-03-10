-- Eric Misner
-- 325 fall 2016
-- 11/13/2016



-- this table recordes the different types of styles and serving siszes of the beers.


drop table customers CASCADE CONSTRAINTS;

create table customers(
 CUST_ID     varchar2(10) NOT NULL,
 cust_fname  varchar2(15),
 cust_lname  varchar2(15),
 cust_age    int,
 cust_birth  date,
 primary key (cust_id)
);

drop table cust_numbers CASCADE CONSTRAINTS;

create table cust_numbers(
 CUST_ID          varchar2(10)NOT NULL,
 cust_home_phone  varchar2(15),
 cust_cell_phone  varchar2(15),
 foreign key (cust_id) references customers
);

drop table beer_style CASCADE CONSTRAINTS; 

create table beer_style(
 BEER_STYLE_ID    varchar2(10)NOT NULL,
 beer_style_name  varchar2(25),
 alcohol_percent  int,
 primary key      (beer_style_id)
);

drop table beer  CASCADE CONSTRAINTS;

create table beer(
 BEER_ID        varchar2(10)not null,
 beer_name      varchar2(25),
 bottle_ammount int,
 keg_ammount    int,
 year           date,
 beer_style_id  varchar2(10),
 primary key (beer_id),
 foreign key (beer_style_id) references beer_style 
);


drop table serving_style CASCADE CONSTRAINTS;

create table serving_style(
 SERVING_STYLE_ID     varchar2(10)NOT NULL,
 serving_style        varchar2(25),
 serving_quantity     varchar2(5),
 price          decimal(6,2),
 primary key (serving_style_id)
);

drop table beer_serving_style CASCADE CONSTRAINTS;

create table beer_serving_style(
 BEER_ID          varchar2(10)NOT NULL,
 SERVING_STYLE_ID varchar2(10), 
 primary key (beer_id,serving_style_id),
 foreign key (beer_id)references beer,
 foreign key (serving_style_id)references serving_style
);


drop table sales CASCADE CONSTRAINTS;

create table sales(
 PURCHASE_ID     varchar2(10)NOT NULL,
 quantity        int,
 cust_id         varchar2(10),
 sale_date       date,
 sale_total      decimal(6,2),
 primary key (purchase_id),
 foreign key (cust_id) references customers
);


-- this table holds the customers information


-- This table is for clients that have a tab.

drop table menu_items  CASCADE CONSTRAINTS;

create table menu_items(
 MENU_ITEM_ID 	   varchar2(10)NOT NULL,
 beer_id           varchar2(10),
 purchase_id       varchar2(10),
 serving_style_id  varchar2(10),
 primary key (menu_item_id),
 foreign key (beer_id) references beer,
 foreign key (purchase_id) references sales,
 foreign key (serving_style_id)references serving_style
);

