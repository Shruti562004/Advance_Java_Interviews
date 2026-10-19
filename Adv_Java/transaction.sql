use advjava;

create table accounts(
id int primary key,
name varchar(24),
balance int

);

INSERT INTO accounts VALUES
(1, 'Rahul', 5000),
(2, 'Amit', 3000);

SELECT * FROM accounts;