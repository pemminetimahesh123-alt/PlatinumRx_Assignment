CREATE DATABASE IF NOT EXISTS hotel_db;
USE hotel_db;


CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address TEXT
);


CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);


CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);


INSERT INTO users VALUES
('U1', 'John Doe', '9876543210', 'john@example.com', 'Chennai'),
('U2', 'Jane Smith', '9123456780', 'jane@example.com', 'Bangalore');

INSERT INTO bookings VALUES
('B1', '2021-11-10 10:00:00', 'R101', 'U1'),
('B2', '2021-11-15 12:00:00', 'R102', 'U1'),
('B3', '2021-10-05 09:30:00', 'R201', 'U2');

INSERT INTO items VALUES
('I1', 'Tawa Paratha', 20),
('I2', 'Mix Veg', 100),
('I3', 'Dal Fry', 80);

INSERT INTO booking_commercials VALUES
('C1', 'B1', 'BL1', '2021-11-10 11:00:00', 'I1', 2),
('C2', 'B1', 'BL1', '2021-11-10 11:00:00', 'I2', 1),
('C3', 'B2', 'BL2', '2021-11-15 13:00:00', 'I3', 3),
('C4', 'B3', 'BL3', '2021-10-05 10:00:00', 'I2', 5);


