USE HotelReservation;

INSERT INTO RoomType (RoomType, StandardOccupancy, MaxOccupancy, BasePrice) VALUES
	('Double', 2, 4, 174.99),
    ('Single', 2, 2, 149.99),
    ('Suite', 3, 8, 399.99);

INSERT INTO Amenities (`Name`, ExtraCost) VALUES
	('Microwave', 0.00),
    ('Refrigerator', 0.00),
    ('Jacuzzi', 25.00),
    ('Oven', 0.00);

INSERT INTO Guest (FirstName, LastName, Address, City, State, ZIP, Phone) VALUES
	('Royce', 'Rabanal', '5800 Hawkins Circle', 'Los Angeles', 'CA', 90001, '6478881919'),
    ('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', 51501, '2915530508'),
    ('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', 99654, '4782779632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', 78552, '3084940198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', 08096, '2147300298'),
    ('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI' ,48601, '3775070974'),
    ('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', 80003, '8144852615'),
    ('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', 60099, '2794910960'),
    ('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland','RI', 02864, '4463966785'),
    ('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', 13126, '8347271001'),
    ('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', 22015, '4463516860'),
    ('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', 19026, '2318932755');

INSERT INTO Room (RoomNumber, ADAAccessible, RoomTypeID) VALUES
	(201, false, 1),
    (202, true, 1),
    (203, false, 1),
    (204, true, 1),
    (205, false, 2),
    (206, true, 2),
    (207, false, 2),
    (208, true, 2),
    (301, false, 1),
    (302, true, 1),
    (303, false, 1),
    (304, true, 1),
    (305, false, 2),
    (306, true, 2),
    (307, false, 2),
    (308, true, 2),
    (401, true, 3),
    (402, true, 3);

INSERT INTO RoomAmenities (RoomID, AmenityID) VALUES
	(1, 1),
    (1, 3),
    (2, 2),
    (3, 1),
    (3, 3),
    (4, 2),
    (5, 1),
    (5, 2),
    (5, 3),
    (6, 1),
    (6, 2),
    (7, 1),
    (7, 2),
    (7, 3),
    (8, 1),
    (8, 2),
    (9, 1),
    (9, 3),
    (10, 2),
    (11, 1),
    (11, 3),
    (12, 2),
    (13, 1),
    (13, 2),
    (13, 3),
    (14, 1),
    (14, 2),
    (15, 1),
    (15, 2),
    (15, 3),
    (16, 1),
    (16, 2),
    (17, 1),
    (17, 2),
    (17, 4),
    (18, 1),
    (18, 2),
    (18, 4);

INSERT INTO GuestReservation (GuestID, StartDate, EndDate, TotalRoomCost) VALUES
-- YYYY/MM/DD
	(2,	'2023-02-02', '2023-02-04', 299.98),
	(3,	'2023-02-05', '2023-02-10', 999.95),
	(4, '2023-02-22', '2023-02-24', 349.98),
	(5, '2023-03-06', '2023-03-07',	199.99),
	(1, '2023-03-17', '2023-03-20', 524.97),
	(6, '2023-03-18', '2023-03-23', 924.95),
	(7, '2023-03-29', '2023-03-31', 349.98),
	(8, '2023-03-31', '2023-04-05', 874.95),
	(9, '2023-04-09',	'2023-04-13', 799.96),
	(10, '2023-04-23', '2023-04-24', 174.99),
	(11, '2023-05-30', '2023-06-02', 1199.97),
	(12, '2023-06-10', '2023-06-14', 1199.92),
	(6, '2023-06-17', '2023-06-18', 184.99),
	(1, '2023-06-28', '2023-07-02', 699.96),
	(9, '2023-07-13', '2023-07-14', 184.99),
	(10, '2023-07-18', '2023-07-21', 1259.97),
	(3, '2023-07-28', '2023-07-29', 199.99),
	(3, '2023-08-30', '2023-09-01', 349.98),
	(2, '2023-09-16', '2023-09-17', 149.99),
	(5, '2023-09-13', '2023-09-15', 399.98),
	(4, '2023-11-22', '2023-11-25', 1199.97),
	(2, '2023-11-22', '2023-11-25',	1049.94),
	(11, '2023-12-24', '2023-12-28', 699.96);

INSERT INTO RoomReservation (ReservationID, RoomID, Adults, Children) VALUES
	(1, 16, 1, 0),
    (2, 3, 2, 1),
    (3, 13, 2, 0),
    (4, 1, 2, 2),
    (5, 15, 1, 1),
    (6, 10, 3, 0),
    (7, 2, 2, 2),
    (8, 12, 2, 0),
    (9, 9, 1, 0),
    (10, 7, 1, 1),
    (11, 17, 2, 4),
    (12, 6, 2, 0),
    (12, 8, 1, 0),
    (13, 12, 3, 0),
    (14, 5, 2, 0),
    (15, 4, 3, 1),
    (16, 17, 4, 2),
    (17, 11, 2, 1),
    (18, 13, 1, 0),
    (19, 8, 2, 0),
    (20, 3, 2, 2),
    (21, 17, 2, 2),
    (22, 6, 2, 0),
    (22, 9, 2, 2),
    (23, 10, 2, 0);

-- Create SQL statements that will delete Jeremiah Pendergrass and his reservations from the database.
-- Deleting data should start with records that reference Jeremiah Pendergrass using a foreign key and 
-- then delete the record from the guest table as the last step. The scripts should only delete records 
-- related to Jeremiah Pendergrass and his reservations. They should not delete any room data.

DELETE FROM RoomReservation
WHERE ReservationID = 8;

DELETE FROM GuestReservation
WHERE GuestID = 8;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Guest g
WHERE g.FirstName = 'Jeremiah' AND g.LastName = 'Pendergrass';

SET SQL_SAFE_UPDATES = 1;

-- Jeremiah Pendergrass with GuestID = 8 should not be in the list

-- SELECT *
-- FROM Guest;

-- SELECT GuestID
-- FROM Guest g
-- WHERE g.FirstName = 'Jeremiah' AND g.LastName = 'Pendergrass';

-- SELECT ReservationID
-- FROM GuestReservation gr
-- WHERE gr.GuestID = 8;
