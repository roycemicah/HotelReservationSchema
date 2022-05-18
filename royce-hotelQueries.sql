USE HotelReservation;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, 
-- the room number(s), and the reservation dates.

SELECT
	g.FirstName,
    g.LastName,
    r.RoomNumber,
    gr.StartDate,
    gr.EndDate
FROM  GuestReservation gr
INNER JOIN Guest g ON gr.GuestID = g.GuestID
INNER JOIN RoomReservation rr ON gr.ReservationID = rr.ReservationID
INNER JOIN Room r ON rr.RoomID = r.RoomID
WHERE gr.EndDate BETWEEN '2023-07-1' AND '2023-07-31';

-- FirstName, LastName, RoomNumber, StartDate, EndDate
-- 'Royce','Rabanal','205','2023-06-28','2023-07-02'
-- 'Walter','Holaway','204','2023-07-13','2023-07-14'
-- 'Wilfred','Vise','401','2023-07-18','2023-07-21'
-- 'Bettyann','Seery','303','2023-07-28','2023-07-29'

-------------------------------------------------------------------------------------------------------------------------------

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, 
-- the room number, and the dates of the reservation.

SELECT
	g.FirstName,
    g.LastName,
    r.RoomNumber,
    gr.StartDate,
    gr.EndDate
FROM  GuestReservation gr
INNER JOIN Guest g ON gr.GuestID = g.GuestID
INNER JOIN RoomReservation rr ON gr.ReservationID = rr.ReservationID
INNER JOIN Room r ON rr.RoomID = r.RoomID
INNER JOIN RoomAmenities ra ON r.RoomID = ra.RoomID 
INNER JOIN Amenities a ON ra.AmenityID = a.AmenityID
WHERE a.AmenityID = 3;

-- FirstName, LastName, RoomNumber, StartDate, EndDate
-- 'Karie','Yang','201','2023-03-06','2023-03-07'
-- 'Bettyann','Seery','203','2023-02-05','2023-02-10'
-- 'Karie','Yang','203','2023-09-13','2023-09-15'
-- 'Royce','Rabanal','205','2023-06-28','2023-07-02'
-- 'Wilfred','Vise','207','2023-04-23','2023-04-24'
-- 'Walter','Holaway','301','2023-04-09','2023-04-13'
-- 'Mack','Simmer','301','2023-11-22','2023-11-25'
-- 'Bettyann','Seery','303','2023-07-28','2023-07-29'
-- 'Duane','Cullison','305','2023-02-22','2023-02-24'
-- 'Bettyann','Seery','305','2023-08-30','2023-09-01'
-- 'Royce','Rabanal','307','2023-03-17','2023-03-20'


-------------------------------------------------------------------------------------------------------------------------------

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s)
-- reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose 
-- a guest's name from the existing data.)

SELECT
	g.FirstName,
    g.LastName,
    r.RoomNumber,
    gr.StartDate,
    rr.Adults,
    rr.Children
FROM GuestReservation gr
INNER JOIN Guest g ON gr.GuestID = g.GuestID
INNER JOIN RoomReservation rr ON gr.ReservationID = rr.ReservationID
INNER JOIN Room r ON rr.RoomID = r.RoomID
WHERE g.FirstName = 'Royce' AND g.LastName = 'Rabanal';

-- FirstName, LastName, RoomNumber, StartDate, Adults, Children
-- 'Royce','Rabanal','307','2023-03-17','1','1'
-- 'Royce','Rabanal','205','2023-06-28','2','0'

-------------------------------------------------------------------------------------------------------------------------------

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results 
-- should include all rooms, whether or not there is a reservation associated with the room.

SELECT
	r.RoomNumber,
    rr.RoomID,
    gr.TotalRoomCost
FROM Room r
RIGHT OUTER JOIN RoomReservation rr ON r.RoomID = rr.RoomID
INNER JOIN GuestReservation gr ON rr.ReservationID = gr.ReservationID;

-- RoomNumber, RoomID, TotalRoomCost
-- '308','16','299.98'
-- '203','3','999.95'
-- '305','13','349.98'
-- '201','1','199.99'
-- '307','15','524.97'
-- '302','10','924.95'
-- '202','2','349.98'
-- '301','9','799.96'
-- '207','7','174.99'
-- '401','17','1199.97'
-- '206','6','1199.92'
-- '208','8','1199.92'
-- '304','12','184.99'
-- '205','5','699.96'
-- '204','4','184.99'
-- '401','17','1259.97'
-- '303','11','199.99'
-- '305','13','349.98'
-- '208','8','149.99'
-- '203','3','399.98'
-- '401','17','1199.97'
-- '206','6','1049.94'
-- '301','9','1049.94'
-- '302','10','699.96'

-------------------------------------------------------------------------------------------------------------------------------

-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT
	r.RoomNumber,
    (rr.Adults + rr.Children) AS Guests,
    gr.StartDate,
    gr.EndDate
FROM Room r
INNER JOIN RoomReservation rr ON r.RoomID = rr.RoomID
INNER JOIN GuestReservation gr ON rr.ReservationID = gr.ReservationID
WHERE 
	gr.StartDate BETWEEN '2023-04-01' AND '2023-04-30' AND
    gr.EndDate BETWEEN '2023-04-01' AND '2023-04-30'
    AND (rr.Adults + rr.Children) >= 3;

-- 0 row(s) returned

-------------------------------------------------------------------------------------------------------------------------------

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the 
-- guest with the most reservations and then by the guest's last name.

SELECT
	g.FirstName,
	g.LastName,
	COUNT(gr.ReservationID) AS Reservations
FROM Guest g
INNER JOIN GuestReservation gr ON g.GuestID = gr.GuestID
GROUP BY gr.GuestID
ORDER BY Reservations DESC, g.LastName;

-- FirstName, LastName, Reservations
-- 'Bettyann','Seery','3'
-- 'Mack','Simmer','3'
-- 'Duane','Cullison','2'
-- 'Walter','Holaway','2'
-- 'Aurore','Lipton','2'
-- 'Royce','Rabanal','2'
-- 'Maritza','Tilton','2'
-- 'Wilfred','Vise','2'
-- 'Karie','Yang','2'
-- 'Zachery','Luechtefeld','1'
-- 'Joleen','Tison','1'

-------------------------------------------------------------------------------------------------------------------------------

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone 
-- number from the existing data.)

SELECT
	g.FirstName,
    g.LastName,
    g.Address,
    g.Phone
FROM Guest g
WHERE Phone = '2915530508';

-- FirstName, LastName, Address, Phone
-- 'Mack','Simmer','379 Old Shore Street','2915530508'
