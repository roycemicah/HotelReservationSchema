DROP DATABASE IF EXISTS HotelReservation;

CREATE DATABASE HotelReservation;

USE HotelReservation;

CREATE TABLE RoomType (
    RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    RoomType CHAR(10) NOT NULL,
    StandardOccupancy TINYINT NOT NULL,
    MaxOccupancy TINYINT NOT NULL,
    BasePrice DECIMAL(5 , 2 ) NOT NULL
);

CREATE TABLE Amenities (
    AmenityID INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL,
    ExtraCost DECIMAL(5 , 2 )
);

CREATE TABLE Guest (
    GuestID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State CHAR(2) NOT NULL,
    ZIP CHAR(5) NOT NULL,
    Phone CHAR(10) NOT NULL
);

CREATE TABLE Room (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber INT NOT NULL,
    ADAAccessible BOOL NOT NULL,
    RoomTypeID INT NOT NULL,
    FOREIGN KEY (RoomTypeID)
        REFERENCES RoomType (RoomTypeID)
);

CREATE TABLE RoomAmenities (
    RoomID INT NOT NULL,
    AmenityID INT NOT NULL,
    PRIMARY KEY pk_Room_Amenities (RoomID , AmenityID),
    CONSTRAINT fk_RoomAmenities_Room FOREIGN KEY (RoomID)
        REFERENCES Room (RoomID),
    CONSTRAINT fk_RoomAmenities_Amenities FOREIGN KEY (AmenityID)
        REFERENCES Amenities (AmenityID)
);

CREATE TABLE GuestReservation (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalRoomCost DECIMAL(7 , 2 ) NOT NULL,
    GuestID INT NOT NULL,
    FOREIGN KEY (GuestID)
        REFERENCES Guest (GuestID)
);

CREATE TABLE RoomReservation (
    GuestID INT NOT NULL,
    RoomID INT NOT NULL,
    PRIMARY KEY pk_Room_Reservation (GuestID , RoomID),
    FOREIGN KEY (GuestID)
        REFERENCES GuestReservation (GuestID),
    FOREIGN KEY (RoomID)
        REFERENCES Room (RoomID),
    Adults TINYINT NOT NULL,
    Children TINYINT NOT NULL
);