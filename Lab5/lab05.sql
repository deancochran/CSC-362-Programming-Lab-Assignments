/*
  Lab 05
  CSC 362 Database Systems
  Dean Cochran

In this lab, we will implement our database desgin that we developed in lab04. 


This lab creates a database called rugs_r_us and generates tables utilizing 
the 'linking' concept to related movies consumers and genres together.
*/

DROP DATABASE IF EXISTS carpets;
--creating new instance of db
CREATE DATABASE carpets;
--use created instance
USE carpets;


--TABLE CREATION STATION

--creating a rugs table
CREATE TABLE rugs (
        PRIMARY KEY (InventoryID), --Inventory ID is primary key
        InventoryID            INT,
        OriginCountry          VARCHAR, 
        OriginCity             VARCHAR, 
        YearMake               INT,
        Dimensions             VARCHAR, 
        Material               VARCHAR,
        PurchasePrice          FLOAT,
        DateAquired            VARCHAR,
        MarkUp                 FLOAT,
        ListPrice              FLOAT
);


--creating a customers table
CREATE TABLE customers (
        PRIMARY KEY (CustomerID), --customer ID is primary key
        CustomerID             INT, 
        FirstName              VARCHAR, 
        LastName               VARCHAR, 
        Address                VARCHAR,
        City                   VARCHAR,
        State                  VARCHAR,
        Zip                    INT,
        Phone                  VARCHAR
);

--creating a linking CustomerOrders table
CREATE TABLE customer_orders (
        FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID), --customer id is a foreign key
        FOREIGN KEY (InventoryID) REFERENCES rugs(InventoryID), --inventory id is a foreign key 
        CustomerID             INT,
        InventoryID            INT, 
        SaleDate               VARCHAR,
        SalePrice              INT,
        NetOnSale              INT,
        DateReturned           VARCHAR
);


INSERT INTO rugs (InventoryID, OriginCountry, OriginCity, YearMake, Dimensions, Material, PurchasePrice, DateAquired, MarkUp, ListPrice)
VALUES ('1214', 'Turkey', 'Ushak', '1925', '5x7', 'Wool', '625.00', '4/6/17', '1.00', '1,250.00'),
       ('1219', 'Iran', 'Tabriz', '1910', '10x14', 'Silk', '28,000.00', '4/6/17', '0.75', '49,000.00'),
       ('1277', 'India', 'Agra', '2017', '8x10','Wool','1,200.00', '6/15/17', '1.00', '2,400.00'),
       ('1278', 'India', 'Agra', '2017', '4x6',  'Wool','450.00',  '6/15/17', '1.20', '990.00');

INSERT INTO customers (CustomerID, FirstName, LastName, Address, City, State, Zip, Phone)
VALUES ('1','Akira', 'Ingram', '68 Country Drive', 'Roseville', 'MI', '48066', '(926) 252-6716'),
       ('2','Meredith', 'Spencer', '9044 Piper Lane', 'North Royalton', 'OH', '44133', '(817) 530-5994'),
       ('3','Marco', 'Page', '747 East Harrison Lane', 'Atlanta', 'GA', '30303', '(588) 799-6535'),
       ('4','Sandra', 'Page', '747 East Harrison Lane', 'Atlanta', 'GA', '30303', '(997) 697-2666'),
       ('5', 'Bria', 'Le', '386 Silver Spear Court', 'Coraopolis', 'PA', '15108', '(999) 494-3316'),
       ('6','Gloria', 'Gomez', '78 Corona Rd.', 'Fullerton', 'CA', '92831', '(867) 926-2585');
       
INSERT INTO customer_orders (CustomerID, InventoryID, SaleDate, SalePrice, NetOnSale, DateReturned)
VALUES ('6','1214', '12/14/17', '990.00', '625.00', '365.00', 'nan'),
       ('5','1277', '12/24/17', '2,400', '1,200.00', '1,200.00', 'nan'),
       ('2','1219', '12/24/17 ', '40,000', '28,000.00', '12,000.00', '12/26/17');

