CREATE TABLE IF NOT EXISTS Employee (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	id_manager INTEGER REFERENCES Employee(id)
	);

CREATE TABLE IF NOT EXISTS Department (
	id_dep SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	id_empl INTEGER NOT NULL REFERENCES Employee(id)
	);

	

