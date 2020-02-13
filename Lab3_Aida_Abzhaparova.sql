create DATABASE lab3;

create TABLE clients(
    id SERIAL,
    iin int,
    client_name varchar(50),
    phone_number varchar(15),
    balance int,
    primary key (id)
);

INSERT INTO clients(id, iin, client_name, phone_number, balance)
VALUES (18BD110266, 990822400991, 'Aida', '87089363675', 500);

INSERT INTO clients(iin, client_name)
VALUES (990822401157, 'Aigerim');

INSERT INTO clients(balance) VALUES (NULL);

INSERT INTO clients(iin)
VALUES (990822), (980288), (95671), (123456), (1457896);

ALTER TABLE clients ALTER COLUMN client_name SET DEFAULT 'Peter';

INSERT INTO clients(client_name) values(default);

INSERT INTO clients values(default);

CREATE TABLE clients_new(like clients);

INSERT INTO clients_new SELECT * FROM clients;

UPDATE clients SET iin = 0 where iin = null;

SELECT client_name, phone_number, balance as "new balance" FROM clients where balance = balance+(balance/2);
UPDATE clients SET balance = balance+(balance/2) returning client_name, phone_number, balance as "new balance";

DELETE FROM clients WHERE balance<100 or balance is null;

DELETE FROM clients_new WHERE id is not null returning *;

DELETE FROM clients returning *;