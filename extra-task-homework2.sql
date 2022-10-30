CREATE TABLE employee (
id SERIAL PRIMARY KEY,
name VARCHAR(60),
boss_id INTEGER REFERENCES employee(id),
department VARCHAR(60)
);

