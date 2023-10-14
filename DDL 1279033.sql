
/*
					SQL Project Name : CAR DELARSHIP IN BANGLADESH(CDB)
							    Trainee Name : JAHIDUL HASAN  
						    	  Trainee ID : 1279033      
							    Batch ID : WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
	 SECTION 01: Created a Database [CDB]
	 SECTION 02: Created Appropriate Tables with column definition related to the project
	 SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
	 SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
	 SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
	 SECTION 06: CREATE A VIEW & ALTER VIEW
	 SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
	 SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
	 SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
	 SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/
             ---------------------SECTION 01  --------------------
--------------CREATE DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES----
*/
CREATE DATABASE JAHID_1279033
ON
(
	name = 'CDB_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CDB_data.mdf',
	size = 5MB,
	maxsize = 50MB,
	filegrowth = 5%
)
LOG ON
(
	name = 'CDB_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CDB_log.ldf',
	size = 8MB,
	maxsize = 40MB,
	filegrowth = 5MB
)
GO
USE JAHID_1279033
GO
---=============================  SECTION 02  ==============================---
-- Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT
CREATE TABLE categories (
		cat_id  INT IDENTITY PRIMARY KEY, 
		cat_label VARCHAR(50) NOT NULL,
		cat_desc VARCHAR(2000),
		)
		GO

CREATE TABLE cars (
		VIN NVARCHAR(10)PRIMARY KEY , 
		car_descpton VARCHAR(100),
		color VARCHAR(50) NOT NULL,
		brand VARCHAR(50) NOT NULL,
		model VARCHAR(50) NOT NULL,	
		purch_date DATE,	
		cat_id INT REFERENCES categories(cat_id)
		)
		GO

CREATE TABLE locations (
	loc_id INT IDENTITY PRIMARY KEY,
	street VARCHAR(45),
	streetno VARCHAR(10) NULL, 
	city VARCHAR(45),
	c_state VARCHAR(45), 
	country VARCHAR(45) NOT NULL,
	)
	GO
	  -----------Table with CHECK CONSTRAINT ---------------
CREATE TABLE phones (
		phone_ID INT IDENTITY PRIMARY KEY,
		ContactNumber CHAR(20) UNIQUE CHECK(ContactNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		loc_id INT REFERENCES locations (loc_id),
		
		)
		GO
------ Table with PRIMARY KEY  & DEFAULT CONSTRAINT
----------------set CONSTRAINT name -----------------
CREATE TABLE customers (
		Cust_id INT IDENTITY PRIMARY KEY ,
		[first_name] NVARCHAR(50),
		[last_name] NVARCHAR(50), 
		nid CHAR(10) ,
		father VARCHAR(50) NOT NULL,
		mother VARCHAR(50) NOT NULL,
		genderId INT REFERENCES gender(genderId),
		email VARCHAR(40)  CONSTRAINT ck_emailCheck CHECK (email LIKE '%@%' ),			
		mobile NVARCHAR (15),	
		[state_name] NVARCHAR(50),
		country NVARCHAR(50)
		)
		GO

CREATE TABLE gender
(
	genderId INT IDENTITY PRIMARY KEY,
	genderTitle CHAR(10) NOT NULL
)
GO

CREATE TABLE reservations (
		reservation_id INT IDENTITY PRIMARY KEY,
		VIN NVARCHAR(10)REFERENCES cars (VIN), 		
		amount DECIMAL (6, 2), 
		p_loc INT REFERENCES locations(loc_id),
		p_date DATE,
		r_loc INT  REFERENCES locations(loc_id),
		r_date DATE,
		)
	GO


	-- CREATE A SCHEMA ---

CREATE SCHEMA CDB
GO
-- USE SCHEMA IN A TABLE --

CREATE TABLE CDB.tblCommentsInfo
(
	commentId INT,
	comment NVARCHAR(100) NULL,
	commenterAge INT NULL
)
GO

           ------SECTION 03 ------
	---- ALTER, DROP AND MODIFY TABLES & COLUMNS
--ALTER TABLE SCHEMA AND TRANSFER TO [DBO] --

ALTER SCHEMA dbo TRANSFER CDB.tblCommentsInfo
GO

-- Update column definition --

ALTER TABLE gender
ALTER COLUMN genderTitle CHAR(15) NOT NULL
GO
-- ADD column with DEFAULT CONSTRAINT --

ALTER TABLE phones
ADD Phonetime datetime DEFAULT GETDATE()
GO

-- DROP COLUMN --

	ALTER TABLE phones
	DROP COLUMN Callduration
	GO
--DROP SCHEMA --

	DROP SCHEMA CDB
	GO
						  ---------  SECTION 04 ---------
		-------------CREATE CLUSTERED AND NONCLUSTERED INDEX----------
					    
CREATE TABLE tblComments						
(
	commentId INT,
	comment NVARCHAR(100) NULL
)
GO
					--------- Clustered Index----------
CREATE CLUSTERED INDEX tblComments
ON tblComments
(
	commentId
)
GO
-- Nonclustered Index
CREATE UNIQUE NONCLUSTERED INDEX IX_SalesDate
ON courseSales
(
	courseFee,
	discount
)
GO
               -------------  SECTION 05 ----------------- 
						--- CREATE SEQUENCE----

CREATE SEQUENCE seqNumber
	AS INT
	START WITH 01
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 400
	CYCLE
	CACHE 15
GO
------- ALTER SEQUENCE --------

ALTER SEQUENCE seqNumber
	MAXVALUE 200
	CYCLE
	CACHE 10
GO
               --------------  SECTION 06 -------------------	
CREATE TABLE city
(
	cityid INT IDENTITY PRIMARY KEY,
	cityname CHAR(15) NOT NULL,
)
GO
CREATE TABLE maritalStatus
(
	maritalStatusId INT IDENTITY PRIMARY KEY,
	[status] VARCHAR(10) NOT NULL
)
GO
CREATE TABLE [shift]
(
	shiftId INT IDENTITY PRIMARY KEY,
	shiftTitle CHAR(9) NOT NULL
)
GO
CREATE TABLE season
(
	seasonId INT IDENTITY PRIMARY KEY,
	seasonName VARCHAR(15) NOT NULL
)
GO
CREATE TABLE course
(
	courseId INT IDENTITY PRIMARY KEY,
	courseTitle VARCHAR(40) NOT NULL,
	courseDuration CHAR(5) NOT NULL,
)
GO
CREATE TABLE traineeCategory
(
	categoryId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	categoryName VARCHAR(40) NOT NULL,
)
GO
CREATE TABLE department
(
	departmentId INT IDENTITY PRIMARY KEY,
	departmentTitle VARCHAR(50) NOT NULL
)
GO
CREATE TABLE designation
(
	designationId INT IDENTITY PRIMARY KEY,
	designationTitle VARCHAR(50) NOT NULL,
	departmentId INT REFERENCES department(departmentId)
)
GO
CREATE TABLE traineeCourseInfo
(
	traineeId INT REFERENCES trainees(traineeId),
	courseId INT REFERENCES course(courseId),
	seasonId INT REFERENCES season(seasonId),
	shiftId INT REFERENCES [shift](shiftId),
	instructorId INT REFERENCES instructor(instructorId),
	PRIMARY KEY(traineeId,courseId,seasonId,shiftId,instructorId)
)
GO
CREATE TABLE employee
(
	employeeId INT IDENTITY PRIMARY KEY,
	[name] VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	maritalStatusId INT REFERENCES maritalStatus(maritalStatusId),
	bloodGroupId INT REFERENCES bloodGroup(bloodGroupId),
	nid CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40) UNIQUE CONSTRAINT ck_email CHECK (email LIKE '%@%' ),
	phone CHAR(20) UNIQUE CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode CHAR(12) DEFAULT NULL,
)
GO
CREATE TABLE employeeInfo
(
	employeeId INT REFERENCES employee(employeeId),
	designationId INT REFERENCES designation(designationId),
	salary MONEY DEFAULT 0.00,
	vat FLOAT DEFAULT .03,
	netSalary AS (salary * (1 - vat))
	PRIMARY KEY (employeeId, designationId)
)
GO
CREATE TABLE maritalStatus
(
	maritalStatusId INT IDENTITY PRIMARY KEY,
	[status] VARCHAR(10) NOT NULL
)
GO
CREATE TABLE employeeInfo
(
	employeeId INT REFERENCES employee(employeeId),
	designationId INT REFERENCES designation(designationId),
	salary MONEY DEFAULT 0.00,
	vat FLOAT DEFAULT .03,
	netSalary AS (salary * (1 - vat))
	PRIMARY KEY (employeeId, designationId)
)
GO
 CREATE TABLE courseSales
(
	salesId INT IDENTITY(7001, 1) PRIMARY KEY,
	salesDate DATETIME DEFAULT GETDATE(),
		courseFee MONEY DEFAULT 0.00,
	discount MONEY DEFAULT 0.00,
	netSale AS (courseFee * (1-discount)),
	CONSTRAINT discountCheck CHECK(discount >= 0.00)
)
GO
	       -------------------  CREATE A VIEW---------------

CREATE VIEW VW_OrderSalesInf
AS
SELECT  courseFee, discount FROM courseSales
GO

-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
-- A VIEW to get today course sales information

CREATE VIEW VW_TodayCourseSales
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT salesId, courseFee, discount, netSale FROM dbo.courseSales
WHERE CONVERT(DATE, salesDate) = CONVERT(DATE, GETDATE())
WITH CHECK OPTION
GO
------------- ALTER VIEW --------------

ALTER VIEW VW_OrderSalesInfo
AS
SELECT courseFee, discount, netSale FROM courseSales

GO
CREATE TABLE Product
(
	productId INT IDENTITY PRIMARY KEY,
	productName VARCHAR(40) NOT NULL,
	unitPrice MONEY NOT NULL,
	stock INT DEFAULT 0
)
GO
CREATE TABLE Stock
(
	stockId INT IDENTITY PRIMARY KEY,
	stockDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES Product(productId),
	qty INT NOT NULL
)
GO
------------ STORED PROCEDURE for insert data with INPUT parameter -----------------

CREATE PROCEDURE Insertlocations	@street varchar,
									@streetno varchar,
									@city varchar,
									@c_state varchar,
									@country VARCHAR								
									
AS
BEGIN
	INSERT INTO  locations VALUES(@street,@streetno,@city,@c_state,@country)	
	
END

GO
SELECT *FROM locations
GO
------------ STORED PROCEDURE for insert data with OUTPUT parameter -----------------
CREATE PROCEDURE spInsertlocations	@street varchar,
									@streetno varchar,
									@city varchar,
									@c_state varchar,
									@country VARCHAR,									
									@Id INT OUTPUT
AS
BEGIN
	INSERT INTO  locations VALUES(@street,@streetno,@city,@c_state,@country)	
	SELECT @Id = IDENT_CURRENT('locations')
END
GO
-----------STORED PROCEDURE for UPDATE data ---------

CREATE PROC spUpdate @genderId int,
					@genderTitle char
AS
BEGIN 
	UPDATE gender
	SET genderTitle=@genderTitle
	WHERE genderId=@genderId
END
GO
-- STORED PROCEDURE for DELETE Table data ------------

CREATE PROCEDURE spDeleteCourseSales	@salesId INT
AS
BEGIN
	DELETE FROM courseSales
	WHERE salesId = @salesId
END
GO
-------------TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE--------

CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM gender
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(300) = 'Error' + CONVERT(nvarchar, ERROR_NUMBER(), 5) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 5, 8)
	END CATCH
END
GO
             ---  SECTION 09  -----
--------------FOR/AFTER TRIGGER---------------
-- Create trigger on Stockin table and update stock in product table

CREATE TRIGGER trcarsIn
ON cars
FOR INSERT
AS
BEGIN
	DECLARE @vin INT
	DECLARE @brand INT

	SELECT
	@vin = vin,
	@brand = brand 
	FROM inserted

	UPDATE cars
	SET @brand = brand + @brand
	WHERE vin = @vin
	PRINT 'Stock updated via Stock Entry'
END
GO
------------------- SECTION 10 ------------------- 
	-------------INSTEAD OF TRIGGER-----------
	CREATE TABLE Sales
(
	salesId INT IDENTITY(7001, 1) PRIMARY KEY,
	salesDate DATETIME DEFAULT GETDATE(),
	discount MONEY DEFAULT 0.00,
	CONSTRAINT discountCheck CHECK(discount >= 0.00)
)
GO


	CREATE TRIGGER trSales
ON Sales
INSTEAD OF INSERT
AS
BEGIN
	IF ((SELECT COUNT(*) FROM inserted) > 0)
		BEGIN
			INSERT INTO Sales(salesDate , discount)
			SELECT salesId,I.discount
			from inserted i
			INNER JOIN Sales ON Sales.salesId = i.salesId
		END
	ELSE
	BEGIN
		PRINT 'Error Occured for Sales Table !'
	END
END
GO

