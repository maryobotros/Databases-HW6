CREATE TABLE Drinks (
    name  varchar(50) not null,
    price  int,
    primary key (name));

CREATE TABLE Ingredients (
    name  varchar(50) not null,
    unit_cost decimal(10, 2),
    abv   int,
    primary key(name));

CREATE TABLE Recipes (
    dname  varchar(50) not null,
    iname  varchar(50) not null,
    units   int,
    primary key (dname, iname),
    foreign key (dname) references Drinks(name),
    foreign key (iname) references Ingredients(name));

insert into Drinks (name, price) values ('Aprerol spritz', 10);
insert into Drinks (name, price) values ('Gimlet', 14);
insert into Drinks (name, price) values ('Manhattan', 10);
insert into Drinks (name, price) values ('Whiskey sour', 12);
insert into Drinks (name, price) values ('Gin fizz', 11);

insert into Ingredients (name, unit_cost, abv) values ('gin', 1, 40);
insert into Ingredients (name, unit_cost, abv) values ('whiskey', 2, 43);
insert into Ingredients (name, unit_cost, abv) values ('vodka', 1, 40);
insert into Ingredients (name, unit_cost, abv) values ('vermouth', 0.5, 18);
insert into Ingredients (name, unit_cost, abv) values ('lemon juice', 0.1, 0);
insert into Ingredients (name, unit_cost, abv) values ('soda water', 0.1, 0);

insert into Recipes (dname, iname, units) values ('Gimlet', 'gin', 4);
insert into Recipes (dname, iname, units) values ('Gimlet', 'lemon juice', 1);
insert into Recipes (dname, iname, units) values ('Gin fizz', 'gin', 3);
insert into Recipes (dname, iname, units) values ('Gin fizz', 'soda water', 2);
insert into Recipes (dname, iname, units) values ('Gin fizz', 'lemon juice', 2);
insert into Recipes (dname, iname, units) values ('Manhattan', 'whiskey', 3);
insert into Recipes (dname, iname, units) values ('Manhattan', 'vermouth', 1);
insert into Recipes (dname, iname, units) values ('Whiskey sour', 'whiskey', 2);
insert into Recipes (dname, iname, units) values ('Whiskey sour', 'lemon juice', 1);