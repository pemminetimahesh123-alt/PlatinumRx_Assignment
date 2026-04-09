CREATE DATABASE IF NOT EXISTS clinic_db;
USE clinic_db;

DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS clinic_sales;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS clinics;

CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);


CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);


CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description TEXT,
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);


INSERT INTO clinics VALUES
('C1', 'Apollo Clinic', 'Chennai', 'Tamil Nadu', 'India'),
('C2', 'City Care', 'Bangalore', 'Karnataka', 'India'),
('C3', 'Health Plus', 'Chennai', 'Tamil Nadu', 'India');

INSERT INTO customer VALUES
('U1', 'John Doe', '9876543210'),
('U2', 'Jane Smith', '9123456780'),
('U3', 'Ravi Kumar', '9988776655');

INSERT INTO clinic_sales VALUES
('O1', 'U1', 'C1', 5000, '2021-01-10 10:00:00', 'Online'),
('O2', 'U2', 'C1', 7000, '2021-01-15 12:00:00', 'Offline'),
('O3', 'U3', 'C2', 8000, '2021-02-05 11:00:00', 'Online'),
('O4', 'U1', 'C3', 6000, '2021-02-20 14:00:00', 'Referral'),
('O5', 'U2', 'C2', 9000, '2021-03-10 09:30:00', 'Online'),
('O6', 'U3', 'C1', 4000, '2021-03-25 16:00:00', 'Offline');

INSERT INTO expenses VALUES
('E1', 'C1', 'Medicines', 2000, '2021-01-12 08:00:00'),
('E2', 'C1', 'Staff Salary', 3000, '2021-01-20 09:00:00'),
('E3', 'C2', 'Equipment', 4000, '2021-02-10 10:00:00'),
('E4', 'C3', 'Maintenance', 1500, '2021-02-25 11:00:00'),
('E5', 'C2', 'Utilities', 2500, '2021-03-15 12:00:00'),
('E6', 'C1', 'Supplies', 1000, '2021-03-28 13:00:00');