--CREATE DATABASE  Metroland
--USE metroland
--DROP DATABASE Metroland
CREATE TABLE MsBuyer (
    BuyerID CHAR(5) PRIMARY KEY CHECK (BuyerID LIKE 'BU[0-9][0-9][0-9]'),
    BuyerName VARCHAR (225) NOT NULL,
    buyerPhone VARCHAR (225) NOT NULL,
    BuyerEmail VARCHAR (225) CHECK (BuyerEmail LIKE '%@%') NOT NULL,
    BuyerAddress VARCHAR (225) NOT NULL,
)
CREATE TABLE MsStaff (
    StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
    StaffName VARCHAR (225) NOT NULL,
    StaffDOB DATE NOT NULL,
    StaffEmail VARCHAR (225) CHECK (StaffEmail LIKE '%@%') NOT NULL,
    StaffAddress VARCHAR (225) NOT NULL,
)
CREATE TABLE MsSupplier (
    SupplierID CHAR(5) PRIMARY KEY CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]'),
    StaffName VARCHAR (225) NOT NULL,
    SupplierLocation VARCHAR (225) NOT NULL,
)
CREATE TABLE MsBranch (
    BranchID CHAR(5) PRIMARY KEY CHECK (BranchID LIKE 'BR[0-9][0-9][0-9]'),
    BranchLocation VARCHAR (225) NOT NULL,
)
CREATE TABLE MsToy (
    ToyID CHAR(5) PRIMARY KEY CHECK (ToyID LIKE 'TO[0-9][0-9][0-9]'),
    ToyName VARCHAR (225) NOT NULL,
    ToyStock INT NOT NULL,
    ToySalesPrice INT NOT NULL,
    ToyPurchasePrice INT NOT NULL,
)
CREATE TABLE SalesHeader (
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	BranchID CHAR(5) FOREIGN KEY REFERENCES MsBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BuyerID CHAR(5) FOREIGN KEY REFERENCES MsBuyer(BuyerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesTransactionDate DATE NOT NULL,
)
CREATE TABLE SalesDetail (
	ToyID CHAR(5) FOREIGN KEY REFERENCES MsToy(ToyID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesID CHAR(5) FOREIGN KEY REFERENCES SalesHeader(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    SalesQuantity INT NOT NULL,
)
CREATE TABLE PurchaseHeader (
	TransactionID CHAR(5) PRIMARY KEY CHECK (TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	BranchID CHAR(5) FOREIGN KEY REFERENCES MsBranch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SupplierID CHAR(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseTransactionDate DATE NOT NULL,
)
CREATE TABLE PurchaseDetail (
	TransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseHeader(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ToyID CHAR(5) FOREIGN KEY REFERENCES MsToy(ToyID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseQuantity INT NOT NULL,
)

INSERT INTO MsBuyer VALUES
('BU001', 'William', '081278395720', 'wilr@gmail.com','Semarang barat'),
('BU002', 'Elisa',  '087584901538', 'Elir@gmail.com', 'Semarang Timur'),
('BU003', 'Fernando', '085793860183', 'Ferr@gmail.com', 'Semarang Tengah'),
('BU004', 'Ken', '085948209581', 'Kenr@gmail.com', 'Semarang Utara'),
('BU005', 'Joko', '082957489230', 'Jokr@gmail.com', 'Semarang Selatan')

INSERT INTO MsStaff VALUES 
('ST001', 'Leonardo', '2002-09-16', 'Leor@gmail.com', 'Anggrek Street'),
('ST002', 'Ronaldo', '1999-12-24', 'Ronr@gmail.com', 'Melati Avenue'),
('ST003', 'Budi', '2000-03-14', 'Budr@gmail.com', 'Thamrin Boulevard'),
('ST004', 'Tono', '2000-06-17', 'Tonr@gmail.com', 'Bandung Street'),
('ST005', 'Kevin', '1999-09-11', 'Kevr@gmail.com', 'Bogor Boulevard')

INSERT INTO MsSupplier VALUES
('SU001', 'Darren', 'Semarang barat'),
('SU002', 'Lala', 'Semarang Timur'),
('SU003', 'Ferdian', 'Semarang Tengah'),
('SU004', 'Kalana', 'Semarang Utara'),
('SU005', 'Jordan', 'Semarang Selatan')

INSERT INTO MsBranch VALUES
('BR001',  'Jogja barat'),
('BR002','Jogja Timur'),
('BR003', 'Jogja Tengah'),
('BR004', 'Jogja Utara'),
('BR005', 'Jogja Selatan')

INSERT INTO MsToy VALUES 
('TO001', 'Tembakan', 11, 50000, 15000),
('TO002', 'Robot',15, 60000, 45000),
('TO003', 'Figurin',19, 150000, 95000),
('TO004', 'layangan', 20, 15000, 5000),
('TO005', 'Lego', 16, 250000,195000)

INSERT INTO SalesHeader VALUES
('SA001', 'BR001', 'BU001', 'ST001', '2022-01-16'),
('SA002', 'BR002', 'BU002', 'ST002', '2022-01-20'),
('SA003', 'BR003', 'BU003', 'ST003', '2022-02-25'),
('SA004', 'BR004', 'BU004', 'ST004', '2022-03-16'),
('SA005', 'BR005', 'BU005', 'ST005', '2022-10-16')

INSERT INTO SalesDetail VALUES 
('TO001', 'SA001', 0),
('TO002', 'SA002',7),
('TO003', 'SA003',10),
('TO004', 'SA004', 20),
('TO005', 'SA005', 14)

INSERT INTO PurchaseHeader VALUES
('TR001', 'BR001', 'SU001', 'ST001', '2022-03-20'),
('TR002', 'BR002', 'SU002', 'ST002', '2022-01-20'),
('TR003', 'BR003', 'SU003', 'ST003', '2022-02-25'),
('TR004', 'BR004', 'SU004', 'ST004', '2022-03-16'),
('TR005', 'BR005', 'SU005', 'ST005', '2022-10-18')

INSERT INTO PurchaseDetail VALUES 
('TR001', 'TO001', 20),
('TR002', 'TO002',5),
('TR003', 'TO003',11),
('TR004', 'TO004', 4),
('TR005', 'TO005', 8)

