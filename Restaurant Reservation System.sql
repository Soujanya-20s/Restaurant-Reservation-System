create database Projects;
use Projects;
CREATE TABLE Tables(TableID varchar(10) PRIMARY KEY,Capacity int CHECK (Capacity>0),Location Varchar(20) NOT NULL);
INSERT INTO Tables VALUES('T1',4,'Indoor Dining Area'),('T2',2,'Window seating'),('T3',6,'Banquette(Booth)'), 
('T4',6,'Garden Area'),('T5',12,'Rooftop Seating'),('T6',10,'Outdoor Seating');

CREATE TABLE Customers(CustomerID int PRIMARY KEY,CustomerName Varchar(100) NOT NULL,Contactinfo varchar(100) NOT NULL);
INSERT INTO customers VALUES(101,'Sai Kiran','9573348659'), (102,'Soujanya','9502174042'), (103,'Pranathi','9949023773'),
(104,'Anusha','anushapusala2@gmail.com'),(105,'Rishi','8764927458'),(106,'Prakash','prakeshab@gmail.com');

CREATE TABLE Reservations(ReservationID int PRIMARY KEY,TableID varchar(10) NOT NULL,CustomerID int NOT NULL,
ReservationDate Date NOT NULL,NumberofGuests int NOT NULL CHECK (NumberOfGuests > 0),
FOREIGN KEY(TableID) REFERENCES Tables(TableID),FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID));
INSERT INTO Reservations VALUES(1,'T1',101,'2024-09-10',4),(2,'T2',102,'2024-09-6',6),(3,'T3',103,'2024-09-22',4),
(4,'T4',104,'2024-9-25',10),(5,'T5',105,'2024-10-2',12),(6,'T6',106,'2024-10-5',8);


CREATE TABLE MenuItem(MenuItemID int PRIMARY KEY,CUstomerName varchar(50) NOT NULL UNIQUE,Price Decimal(10,2)NOT NULL,Category varchar(50));
INSERT INTO MenuItem VALUES(01,'Soujanya',497.17,'ChikenBiryani'),(02,'Pranathi',414.17,'Salad') ,
(03,'Anusha',248.17,'Side Dish'),(04,'Rishi',331.17,'Dessert'),(05,'Sai Kiran',289.67,'Soup'),
(06,'Prakash',600,'main Course');

UPDATE reservations SET ReservationDate='2024-09-6',NumberofGuests=6 WHERE  ReservationId=1;

SELECT  a.ReservationID,a.TableId,a.customerId,a.ReservationDate,a.NumberofGuests,
b.CustomerName,b.contactinfo,c.location,c.capacity FROM
Reservations AS a left join Customers AS b on a.customerID=b.CustomerID 
LEFT JOIN Tables AS c on a.TableId=c.TableId;

SELECT reservationDate, SUM(numberofguests) FROM Reservations GROUP BY reservationDate;

SELECT customername  FROM customers WHERE customerId
 IN ( select customerId from Reservations GROUP BY customerId HAVING COUNT(ReservationId)>1);
 
 ALTER TABLE Reservations ADD constraint  UNIQUE(TableId,ReservationDate);
 












