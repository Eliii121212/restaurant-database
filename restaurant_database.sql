-- Restaurant Database
-- Mandatory Individual DB Assignment #1

CREATE DATABASE RestaurantDB;
USE RestaurantDB;

CREATE TABLE RESTAURANT (
    restaurantID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone VARCHAR(30) NOT NULL
);

CREATE TABLE CUSTOMER (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(30) NOT NULL
);

CREATE TABLE RESTAURANT_TABLE (
    tableID INT AUTO_INCREMENT PRIMARY KEY,
    restaurantID INT NOT NULL,
    tableNumber INT NOT NULL,
    capacity INT NOT NULL,
    FOREIGN KEY (restaurantID) REFERENCES RESTAURANT(restaurantID),
    UNIQUE (restaurantID, tableNumber)
);

CREATE TABLE BOOKING (
    bookingID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT NOT NULL,
    tableID INT NOT NULL,
    bookingDate DATE NOT NULL,
    bookingTime TIME NOT NULL,
    numberOfGuests INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerID),
    FOREIGN KEY (tableID) REFERENCES RESTAURANT_TABLE(tableID),
    UNIQUE (tableID, bookingDate, bookingTime)
);

INSERT INTO RESTAURANT (name, address, phone)
VALUES (
    'Nordic Table',
    'Main Street 10, Varde',
    '+45 12 34 56 78'
);

INSERT INTO CUSTOMER (firstName, lastName, email, phone)
VALUES
('Emma', 'Jensen', 'emma.jensen@example.com', '+45 20 11 22 33'),
('Oliver', 'Nielsen', 'oliver.nielsen@example.com', '+45 21 22 33 44'),
('Sofie', 'Hansen', 'sofie.hansen@example.com', '+45 22 33 44 55'),
('William', 'Andersen', 'william.andersen@example.com', '+45 23 44 55 66'),
('Freja', 'Larsen', 'freja.larsen@example.com', '+45 24 55 66 77');

INSERT INTO RESTAURANT_TABLE (restaurantID, tableNumber, capacity)
VALUES
(1, 1, 2),
(1, 2, 2),
(1, 3, 4),
(1, 4, 4),
(1, 5, 6);

INSERT INTO BOOKING
(customerID, tableID, bookingDate, bookingTime, numberOfGuests)
VALUES
(1, 1, '2026-10-07', '18:00:00', 2),
(1, 3, '2026-10-10', '19:00:00', 4),
(2, 2, '2026-10-07', '19:00:00', 2),
(3, 4, '2026-10-08', '18:30:00', 3),
(4, 5, '2026-10-09', '20:00:00', 5),
(5, 3, '2026-10-10', '18:00:00', 4),
(2, 1, '2026-10-11', '17:30:00', 2);

-- Query 1: List all tables
SELECT
    tableID,
    tableNumber,
    capacity
FROM RESTAURANT_TABLE
ORDER BY tableNumber;


-- Query 2: All bookings for a given customer
SELECT
    c.firstName,
    c.lastName,
    b.bookingDate,
    b.bookingTime,
    b.numberOfGuests,
    b.tableID
FROM CUSTOMER c
JOIN BOOKING b
    ON c.customerID = b.customerID
WHERE c.customerID = 1
ORDER BY b.bookingDate, b.bookingTime;


-- Query 3: Bookings for a given table on a specific date
SELECT
    b.bookingDate,
    b.bookingTime,
    c.firstName,
    c.lastName,
    b.numberOfGuests,
    b.tableID
FROM BOOKING b
JOIN CUSTOMER c
    ON b.customerID = c.customerID
WHERE b.tableID = 1
  AND b.bookingDate = '2026-10-07'
ORDER BY b.bookingTime;