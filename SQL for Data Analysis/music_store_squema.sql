-- Crear la base de datos
DROP DATABASE music_store;
CREATE DATABASE music_store;

-- Seleccionar la base de datos
USE music_store;

-- Crear la tabla Artist
CREATE TABLE Artist (
  ArtistId INT PRIMARY KEY,
  Name VARCHAR(255)
);

-- Crear la tabla Album
CREATE TABLE Album (
  AlbumId INT PRIMARY KEY,
  Title VARCHAR(255),
  ArtistId INT,
  FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId)
);

-- Crear la tabla MediaType
CREATE TABLE MediaType (
  MediaTypeId INT PRIMARY KEY,
  Name VARCHAR(255)
);

-- Crear la tabla Genre
CREATE TABLE Genre (
  GenreId INT PRIMARY KEY,
  Name VARCHAR(255)
);

-- Crear la tabla Track
CREATE TABLE Track (
  TrackId INT PRIMARY KEY,
  Name VARCHAR(255),
  AlbumId INT,
  MediaTypeId INT,
  GenreId INT,
  Composer VARCHAR(255),
  Miliseconds INT,
  Bytes INT,
  UnitPrice DECIMAL(10,2),
  FOREIGN KEY (AlbumId) REFERENCES Album(AlbumId),
  FOREIGN KEY (MediaTypeId) REFERENCES MediaType(MediaTypeId),
  FOREIGN KEY (GenreId) REFERENCES Genre(GenreId)
);

-- Crear la tabla Playlist
CREATE TABLE Playlist (
  PlaylistId INT PRIMARY KEY,
  Name VARCHAR(255)
);

-- Crear la tabla PlaylistTrack
CREATE TABLE PlaylistTrack (
  PlaylistId INT,
  TrackId INT,
  PRIMARY KEY (PlaylistId, TrackId),
  FOREIGN KEY (PlaylistId) REFERENCES Playlist(PlaylistId),
  FOREIGN KEY (TrackId) REFERENCES Track(TrackId)
);

drop table employee;

-- Crear la tabla Employee
CREATE TABLE Employee (
  EmployeeId INT PRIMARY KEY,
  LastName VARCHAR(255),
  FirstName VARCHAR(255),
  Title VARCHAR(255),
  ReportsTo INT,
  Levels VARCHAR(20),
  BirthDate DATE,
  HireDate DATE,
  Address VARCHAR(255),
  City VARCHAR(255),
  State VARCHAR(255),
  Country VARCHAR(255),
  PostalCode VARCHAR(10),
  Phone VARCHAR(20),
  Fax VARCHAR(20),
  Email VARCHAR(255)
);

-- Crear la tabla Customer
CREATE TABLE Customer (
  CustomerId INT PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Company VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  State VARCHAR(255),
  Country VARCHAR(255),
  PostalCode VARCHAR(10),
  Phone VARCHAR(20),
  Fax VARCHAR(20),
  Email VARCHAR(255),
  SupportRepId INT,
  FOREIGN KEY (SupportRepId) REFERENCES Employee(EmployeeId)
);

-- Crear la tabla Invoice
CREATE TABLE Invoice (
  InvoiceId INT PRIMARY KEY,
  CustomerId INT,
  InvoiceDate DATE,
  BillingAddress VARCHAR(255),
  BillingCity VARCHAR(255),
  BillingState VARCHAR(255),
  BillingCountry VARCHAR(255),
  BillingPostalCode VARCHAR(10),
  Total DECIMAL(10,2),
  FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

-- Crear la tabla InvoiceLine
CREATE TABLE InvoiceLine (
  InvoiceLineId INT PRIMARY KEY,
  InvoiceId INT,
  TrackId INT,
  UnitPrice DECIMAL(10,2),
  Quantity INT,
  FOREIGN KEY (InvoiceId) REFERENCES Invoice(InvoiceId),
  FOREIGN KEY (TrackId) REFERENCES Track(TrackId)
);
