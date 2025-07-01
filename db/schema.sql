-- Core Database Schema for Musician Rehearsal Automation

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  role VARCHAR(40),
  password_hash VARCHAR(255)
);

CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  leader_id INTEGER REFERENCES users(id)
);

CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  contact VARCHAR(255)
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  group_id INTEGER REFERENCES groups(id),
  title VARCHAR(255),
  date DATE,
  time TIME,
  studio_id INTEGER REFERENCES studios(id)
);

CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20)
);

CREATE TABLE equipment (
  id SERIAL PRIMARY KEY,
  studio_id INTEGER REFERENCES studios(id),
  name VARCHAR(255),
  type VARCHAR(50)
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  amount DECIMAL(8,2),
  date DATE,
  rehearsal_id INTEGER REFERENCES rehearsals(id)
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  message TEXT,
  delivery_time TIMESTAMP,
  status VARCHAR(20)
);