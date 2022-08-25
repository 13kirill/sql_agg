create table customers
(
    id           serial primary key not null,
    name         varchar(250)       not null,
    surname      varchar(250)       not null,
    age          int check ( age > -1 ),
    phone_number long               not null
);

create table orders
(
    id           serial primary key      not null,
    date         timestamp default now() not null,
    customer_id  int                     not null,
    product_name varchar(250)            not null,
    amount       int                     not null
);

INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Василий', 'Васильев', 10, 89991231212);
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Алексей', 'Алексеев', 27, 89991231313);
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Петр', 'Петров', 45, 89991231414);
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Тест', 'Тест', 99, 81234567890);

INSERT INTO orders (customer_id, product_name, amount)
VALUES (1, 'Молоко', 10);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (2, 'Хлеб', 27);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (3, 'Мясо', 45);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (4, 'Тест', 99);

select name, product_name
from customers
         join orders on (customer_id = customers.id)
where name like ('АЛЕКСЕЙ') collate utf8mb4_general_ci