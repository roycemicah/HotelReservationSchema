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
INNER JOIN RoomReservation rr ON gr.GuestID = rr.GuestID
INNER JOIN Room r ON rr.RoomID = r.RoomID
WHERE gr.EndDate BETWEEN '2023-07-1' AND '2023-07-31';

-- FirstName, LastName, RoomNumber, StartDate, EndDate
-- 'Royce','Rabanal','205','2023-06-28','2023-07-02'
-- 'Royce','Rabanal','307','2023-06-28','2023-07-02'
-- 'Walter','Holaway','204','2023-07-13','2023-07-14'
-- 'Walter','Holaway','301','2023-07-13','2023-07-14'
-- 'Wilfred','Vise','207','2023-07-18','2023-07-21'
-- 'Wilfred','Vise','401','2023-07-18','2023-07-21'
-- 'Bettyann','Seery','203','2023-07-28','2023-07-29'
-- 'Bettyann','Seery','303','2023-07-28','2023-07-29'
-- 'Bettyann','Seery','305','2023-07-28','2023-07-29'

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
INNER JOIN RoomReservation rr ON gr.GuestID = rr.GuestID
INNER JOIN Room r ON rr.RoomID = r.RoomID
INNER JOIN RoomAmenities ra ON r.RoomID = ra.RoomID 
INNER JOIN Amenities a ON ra.AmenityID = a.AmenityID
WHERE a.AmenityID = 3;

-- 27 rows returned

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
INNER JOIN RoomReservation rr ON gr.GuestID = rr.GuestID
INNER JOIN Room r ON rr.RoomID = r.RoomID
WHERE g.FirstName = 'Royce' AND g.LastName = 'Rabanal';

-- FirstName, LastName, RoomNumber, StartDate, Adults, Children
-- 'Royce','Rabanal','205','2023-03-17','2','0'
-- 'Royce','Rabanal','307','2023-03-17','1','1'
-- 'Royce','Rabanal','205','2023-06-28','2','0'
-- 'Royce','Rabanal','307','2023-06-28','1','1'


-------------------------------------------------------------------------------------------------------------------------------

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results 
-- should include all rooms, whether or not there is a reservation associated with the room.

SELECT
	r.RoomNumber,
    rr.RoomID,
    gr.TotalRoomCost
FROM Room r
RIGHT OUTER JOIN RoomReservation rr ON r.RoomID = rr.GuestID
INNER JOIN GuestReservation gr ON rr.GuestID = gr.GuestID;

-- 58 rows returned

-------------------------------------------------------------------------------------------------------------------------------

-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT
	r.RoomNumber,
    rr.Adults + rr.Children AS Guests,
    gr.StartDate,
    gr.EndDate
FROM Room r
INNER JOIN RoomReservation rr ON r.RoomID = rr.RoomID
INNER JOIN GuestReservation gr ON rr.GuestID = gr.GuestID
WHERE 
	gr.StartDate BETWEEN '2023-04-01' AND '2023-04-30' AND
    gr.EndDate BETWEEN '2023-04-01' AND '2023-04-30'
    AND (rr.Adults + rr.Children) >= 3;

-- RoomNumber, Guests, StartDate, EndDate
-- '204','4','2023-04-09','2023-04-13'
-- '401','6','2023-04-23','2023-04-24'

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
-- 'Mack','Simmer','4'
-- 'Bettyann','Seery','3'
-- 'Duane','Cullison','2'
-- 'Walter','Holaway','2'
-- 'Aurore','Lipton','2'
-- 'Royce','Rabanal','2'
-- 'Maritza','Tilton','2'
-- 'Joleen','Tison','2'
-- 'Wilfred','Vise','2'
-- 'Karie','Yang','2'
-- 'Zachery','Luechtefeld','1'

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

