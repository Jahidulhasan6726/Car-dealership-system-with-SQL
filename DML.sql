/*
					SQL Project Name : CAR DELARSHIP IN BANGLADESH(CDB)
							    Trainee Name : JAHIDUL HASAN  
						    	  Trainee ID : 1279033      
							    Batch ID : WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view	
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO				
				SUB SECTION => 7.04 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.05 : OUTER JOIN
				SUB SECTION => 7.06 : CROSS JOIN				
				SUB SECTION => 7.11 : OFFSET FETCH
				SUB SECTION => 7.12 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT				
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/
            
			
			------------------- SECTION 01 ---------------
			----------INSERT DATA USING INSERT INTO KEYWORD---------
           ---------------------------------------------------------------------


USE JAHID_1279033
GO

INSERT INTO categories VALUES ('compact','sedan-type with 5 door'),
					 ('convertile','the roof of the car is retractable'),
					 ('jeep','tall vehical,usually suitable for off-road conditions'),
					 ('suv','A mix between a sedan and a jeep'),
					 ('hatchback','small car with a flash-backside.'),
					 ('nisan','good looking with well air conditionig ')
GO

select *from categories
GO

		-----------Insert data by specifying column name ------------
	
	INSERT INTO cars(VIN,car_descpton,color,brand,model,cat_id,purch_date) VALUES 
		('RT454','convertible with hard top,leather seats and CD player','silver','mercedes -benz','slk200',1,'2002-09-07'),
		('AE231','Professional and good looking ,full-extra','blue','BMW','160i',2,'2008-09-03'),
		('QW678','stylish and eye catching','red','sujuki','ERW200',3,'2012-05-11'),
		('JU000','Convenience and pff-road capabilites','black','mercedes -benz','SFSD34',4,'2016-09-12'),
		('MN999','Luxurious and buisness-ready','opel black','red','FDF545',5,'2013-09-13')
		GO

	SELECT *FROM cars
	GO

--------------------Insert data by column sequence--------------
INSERT INTO locations VALUES('green road','23','dhaka','firmgate','bangladesh'),
							('figo road','27','dhaka','kathalbagan','bangladesh'),
							('bijoy soroni','07','dhaka','khamarbari','bangladesh'),
							('mouchak koloni','25','dhaka','hishai','bangladesh'),
							('abdul hadilane','23','dhaka','bokshibazer','bangladesh'),
							('shia goli','21','dhaka','mohammodpur','bangladesh'),
							('husnidalan','13','dhaka','lalbag','bangladesh')
GO

SELECT*FROM locations
GO
--------------Insert data by specifying column name----------------
INSERT INTO phones(ContactNumber) VALUES ('01876589768')
INSERT INTO phones(ContactNumber) VALUES ('01675434232')
INSERT INTO phones(ContactNumber) VALUES ('01976574563')
INSERT INTO phones(ContactNumber) VALUES ('01764554343')
INSERT INTO phones(ContactNumber) VALUES ('01964564523')
INSERT INTO phones(ContactNumber) VALUES ('01876589768')
INSERT INTO phones(ContactNumber) VALUES ('01586576555')
INSERT INTO phones(ContactNumber) VALUES ('01656435434')
INSERT INTO phones(ContactNumber) VALUES ('01365654545')
INSERT INTO phones(ContactNumber) VALUES ('01876589768')
GO

SELECT*FROM phones
GO


INSERT INTO customers([first_name],[last_name],father,mother,email,mobile,[state_name],country) VALUES 
('Jahid','hasan','sahalam','ferdoushi begum','hridoy1058@gmail','01734343342','firmgate','bangladesh' ),
('mehedi','hasan','rofiq','layla begum','hasib3423@gmail','01934343398','nilkhet','bangladesh' ),
('masum','hasan','bariq','jamila begum','jamila32@gmail','017043433432','mikunjo','bangladesh' ),
('tanvir','hasan','niajul','rotna begum','ratbna@gmail','018343433498','green riad','bangladesh' ),
('nayeem','hasan','imran','shila begum','trina23@gmail','01634343342','lalbag','bangladesh' ),
('rofiq','hasan','hasmi','jakia begum','rofiq342@gmail','019834343098','kahamarbari','bangladesh' ),
('jabbar','hasan','titu','shilpa begum','shila232@gmail','01634343323','bijoy sorhoni','bangladesh' ),
('riyad','hasan','jahid','sabiha begum','rabeya43@gmail','018343433345','dhanmondi','bangladesh' ),
('hasib','hasan','soleman','sweety begum','mithun3423@gmail','01834332456','leck','bangladesh' )
GO
SELECT *FROM customers
GO

INSERT INTO gender VALUES ('male')
INSERT INTO gender VALUES ('female')
INSERT INTO gender VALUES ('3rdgender')
GO


INSERT INTO courseSales(discount) VALUES
(.03),
(.05),
(.10),
(.10),
(.05)
GO
SELECT * FROM courseSales
GO

INSERT INTO Stock(productId, qty) VALUES
(1, 56),
(2, 17),
(3, 11),
(4, 14),
(5, 17),
(6, 12),
(7, 17),
(13, 17),
(14, 28)
GO
SELECT * FROM Stock
GO
INSERT INTO department VALUES('Administrative'),('HR'),('Technical'),('Financial'),('Sales')
GO
SELECT * FROM department
GO
INSERT INTO designation VALUES
('Director', 1),
('HR Manager', 2),
('Technical Manger', 3),
('Accounts Manager', 4),
('Sales Manager', 5),
('Network Engineer', 3),
('Security Engineer', 3),
('Database Engineer', 3),
('Infrastructure Engineer ', 3),
('Sales Executive', 5)
GO
SELECT * FROM designation
GO

INSERT INTO maritalStatus VALUES ('Single'), ('Married'), ('Divorced')
GO
SELECT * FROM maritalStatus
GO
INSERT INTO employee VALUES
('Anisul Islam', '1972-06-20', 1, 2, 8, '8406987193', 'anisul@gmail.com', '01983390248','193 First Winston Rd',1,1,'3922'),
('Mustafa Kamal', '1981-03-26', 1, 2, 7, '7487651354', 'mkamal@gmail.com', '01995060328','110 Bogie Ln',2,1,'3920'),
('Tipu Munsi', '1982-06-17', 1, 2, 2, '9025496297', 'tipu@gmail.com', '01990136812','2613 Twilight Dr',12,1,'3811'),
('Tajul Islam', '1985-11-08', 1, 2, 1, '8214889354', 'tajul@gmail.com', '01987089288','36 2nd St',11,1,'1212'),
('Sahab Uddin', '1985-11-22', 1, 2, 2, '5212409201', 'sahabuddin@gmail.com', '01990975035','818 Pony Express Trl',10,1,'1213'),
('Hasan Mahmud', '1986-07-03', 1, 2, 4, '5686086321', 'hasan@gmail.com', '01985840193','322 Cheaneys Bridge Rd',1,1,'2500'),
('Nafisa Akter', '1986-09-29', 2, 2, 5, '5777740276', 'nafisa@gmail.com', '01996498399','730 Keys Ferry Rd',9,1,'3820'),
('Tareque Abdullah', '1986-10-03', 1, 2, 6, '5826967994', 'tareque@gmail.com', '01993992703','3364 Cherrystone Rd',8,1,'1600'),
('Abdul Kader', '1986-11-07', 1, 2, 3, '5449542846', 'abdulkader@gmail.com', '01982679817','3643 Connor Ave',6,1,'1317'),
('Mostafa Jabbar', '1987-08-14', 1, 1, 8, '4656309698', 'mostafa@gmail.com', '01998112953','3314 Bridges St',4,1,'1300'),
('Saifuzzaman', '1988-03-02', 1, 2, 7, '7223577745', 'saifuzzaman@gmail.com', '01986127307','1910 Sassafras St',3,1,'1112'),
('Imran Ahmed', '1989-09-21', 1, 2, 3, '3911074898', 'imran@gmail.com', '01983184272','1682 Southbend Dr',5,1,'1400')
Go
INSERT INTO EmployeeInfo VALUES
(1, 1, 75000.00, DEFAULT),
(2, 2, 48000.00, DEFAULT),
(3, 3, 55000.00, DEFAULT),
(4, 4, 68000.00, DEFAULT),
(5, 5, 50000.00, DEFAULT),
(6, 6, 42000.00, DEFAULT),
(7, 7, 42000.00, DEFAULT),
(8, 8, 42000.00, DEFAULT),
(9, 9, 48000.00, DEFAULT),
(10, 10, 35000.00, DEFAULT),
(11, 10, 35000.00, DEFAULT),
(12, 10, 35000.00, DEFAULT)
GO
SELECT * FROM EmployeeInfo
GO


          --------------  SECTION 02 -------------- 
-----------------	INSERT DATA THROUGH STORED PROCEDURE WITH INPUT PARAM---------------

EXEC Insertlocations 'Firmgate','12HY','DHAKA','green road','bangladesh'
GO
-----------------	INSERT DATA THROUGH STORED PROCEDURE WITH OUTPUT PARAM---------------

DECLARE @LocationId INT
EXEC spInsertlocations 'nikunjo',25,'dhaka','gulshan','bangladesh', @LocationId OUTPUT
PRINT 'The new instructor ID is : '+ str(@LocationId)
GO


------------- INSERT DATA USING SEQUENCE VALUE ------------
INSERT INTO tblCommentsInfo VALUES
(2, 'Great', 25),
(4, 'Bad', 27),
(5, 'Good', 16),
(9, 'Try Again', 21)
GO


INSERT INTO tblComments VALUES((NEXT VALUE FOR seqNumber), NULL)
GO
SELECT * FROM tblComments
GO

        -------------- SECTION 03 ----------------
--------------UPDATE DELETE DATA THROUGH STORED PROCEDURE------------

-----------------UPDATE DATA THROUGH STORED PROCEDURE ----------------
EXEC spUpdate 4,'NULL'  
EXEC spUpdate 5,'NULL'  

GO
-------------DELETE DATA THROUGH STORED PROCEDURE ---------------

-- STORED PROCEDURE for Delete CourseSales-------------
EXEC spDeleteCourseSales 7005
EXEC spDeleteCourseSales 7006
EXEC spDeleteCourseSales 7007
EXEC spDeleteCourseSales 7008
GO
SELECT * FROM courseSales
GO

----------- STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR --------

EXEC spRaisError
GO

             -------------  SECTION 04  --------------------
	---------------INSERT UPDATE DELETE DATA THROUGH VIEW--------------


------------- INSERT DATA through view ------------------

INSERT INTO VW_OrderSalesInf(courseFee, discount) VALUES( 875, .05)
INSERT INTO VW_OrderSalesInf(courseFee, discount) VALUES(1090, .02)
INSERT INTO VW_OrderSalesInf(courseFee, discount) VALUES( 883, .10)
GO
SELECT * FROM VW_OrderSalesInf
GO
-----------UPDATE DATA through view ----------------
UPDATE VW_OrderSalesInf
SET discount = 0.5
WHERE courseFee = 10
GO
SELECT * FROM VW_OrderSalesInf
GO
---------- DELETE DATA through view --------------------
DELETE FROM VW_OrderSalesInf
WHERE courseFee = 16
GO
SELECT * FROM VW_OrderSalesInf
GO

             -------------  SECTION 06 -----------------
				  ------- TEST TRIGGER---------

        ------------ FOR/AFTER TRIGGER ON TABLE--------------

-- EX - 01
-- INSERT DATA IN CARS TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

INSERT INTO Stock(productId, qty) VALUES (4, 12)
GO

SELECT * FROM Product
SELECT * FROM Stock
GO
-- EX - 02
-- INSERT DATA ON tblProductForInfrastructure TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM Product
SELECT * FROM tblProductForInfrastructure

INSERT INTO tblProductForInfrastructure(productId, quantity) VALUES(4, 5)

SELECT * FROM Product
SELECT * FROM tblProductForInfrastructure
GO

--INSTEAD OF INSERT TRIGGER ON courseSales TO get price from course table and manipulate data in current table

SELECT * FROM courseSales
GO
INSERT INTO courseSales( discount) VALUES
( .10)
GO
SELECT * FROM courseSales
GO
-------------- AN INSTEAD OF TRIGGER ON VIEW ---------------

SELECT * FROM VW_OrderSalesInf

INSERT INTO VW_OrderSalesInf( discount) VALUES( .10)

SELECT * FROM VW_OrderSalesInf
GO
-----------------------------SECTION 07  ---------------------------
								  --QUERY--

-------- 7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE ------------------

SELECT * FROM Product
GO

--------------- 7.02 A SELECT STATEMENT TO GET today course sales information FROM A VIEW ----------

SELECT * FROM VW_TodayCourseSales
GO

---------------- 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE -------------

SELECT * INTO #tmpProduct
FROM Product
GO

SELECT * FROM #tmpProduct
GO
------------7.04 OUTER JOIN --------------

SELECT * FROM Stock ST
LEFT JOIN Product tr ON St.stockId = tr.productId
RIGHT JOIN courseSales  ON tr.productId = ST.stockId
FULL JOIN tblComments tbl ON tbl.commentId = ST.productId
GO

--============== 7.05 CROSS JOIN ============--

SELECT * FROM VW_OrderSalesInf tcInfo
CROSS JOIN Product
GO
--============== 7.06 OFFSET FETCH ============--

-- OFFSET 5 ROWS
SELECT * FROM Product
ORDER BY productId
OFFSET 5 ROWS
GO
-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM Product
ORDER BY productId
OFFSET 10 ROWS
GO
--============== 7.07 UNION ============--

SELECT * FROM courseSales
WHERE salesId IN ('1', '2', '3')

UNION

SELECT * FROM courseSales
WHERE salesId IN ('4', '5', '6')
GO
-----------= 7.08 EXCEPT INTERSECT --------------

-- EXCEPT
SELECT * FROM categories

EXCEPT

SELECT * FROM customers
WHERE genderId = 2
GO

--INTERSECT

SELECT * FROM customers
WHERE Cust_id > 10

INTERSECT

SELECT * FROM courseSales
WHERE salesId > 15
GO
-- 7.09 AGGREGATE FUNCTION ----------

SELECT	COUNT(*) 'Total Sales Count',
		SUM(netSale) 'Total Net Sale',
		AVG(netSale) 'Average Sale',
		MIN(courseFee) 'MIN COURSE FEE',
		(MAX(discount))*100 'MAX Discount %'
FROM courseSales
GO
---------------- 7.10 ROLLUP & CUBE OPERATOR----------------

--ROLLUP
SELECT dp.departmentTitle, dg.designationTitle, SUM(employeeInfo.salary) Salary FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO
-----------7.12 GROPING FUNCTION -----------------
SELECT 
	CASE 
		WHEN GROUPING(dp.departmentTitle) = 1 THEN 'All Department'
		ELSE dp.departmentTitle
		END AS Department,
	CASE 
		WHEN GROUPING(dg.designationTitle) = 1 THEN 'All'
		ELSE dg.designationTitle
		END AS Designation,
	SUM(employeeInfo.salary) Salary

FROM employeeInfo
INNER JOIN designation dg ON dg.designationId = employeeInfo.designationId
INNER JOIN department dp ON dp.departmentId = dg.departmentId
GROUP BY  ROLLUP (dp.departmentTitle, dg.designationTitle)
ORDER BY dp.departmentTitle DESC, dg.designationTitle DESC
GO

------- 7.13 RANKING FUNCTION --------------

SELECT 
RANK() OVER(ORDER BY traineeId) AS 'Rank',
DENSE_RANK() OVER(ORDER BY courseId) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY netSale) AS 'NTILE',
traineeId,
courseId, 
netSale
FROM courseSales
GO

--============== 7.14 IF ELSE & PRINT ============--

DECLARE @totalSales MONEY
SELECT @totalSales = SUM((netSale))
FROM courseSales
WHERE YEAR(courseSales.salesDate) = YEAR(GETDATE())
IF @totalSales > 1000000
	BEGIN
		PRINT 'Great ! The sales is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Reached the goal !'
	END
GO

--============== 7.15 TRY CATCH ============--

BEGIN TRY
	DELETE FROM course
	PRINT 'SUCCESSFULLY DELETED'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--============== 7.16 GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 10
	BEGIN
	   IF @value = 2
		  GOTO printMsg
	   SET @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   SET @value = @value + 1
	END
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
GO

--============== 7.17 WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--============== 7.18 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spUpdateTrainee
GO

--============== 7.19 TRANSACTION WITH SAVE POINT  ============--

SELECT * INTO #Product
FROM Product
GO
SELECT * FROM #Product
GO

BEGIN TRANSACTION
	DELETE FROM #Product WHERE productId = 5
	SAVE TRANSACTION tran1
		DELETE FROM #Product WHERE productId = 6
		SAVE TRANSACTION tran2
			DELETE FROM #Product WHERE productId = 7
			SAVE TRANSACTION tran3

			SELECT * FROM #Product

		ROLLBACK TRANSACTION tran2
		SELECT * FROM #Product
	ROLLBACK TRANSACTION tran1
	SELECT * FROM #Product
COMMIT TRANSACTION
GO



