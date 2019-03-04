CREATE TABLE Employees ( employee_id INT,
						 first_name VARCHAR(20), 
						 last_name VARCHAR(20),
						 birth_date DATE,
						 gender VARCHAR(6),
						 role VARCHAR(20),
						 decription VARCHAR(40),
						 income DECIMAL,
						 building_id INT, 
						 owner_id INT,
						 supervisor_id INT,
						 PRIMARY KEY(employee_id),
						 UNIQUE(supervisor_id),
						 FOREIGN KEY(building_id) REFERENCES Buildings(building_id),
						 FOREIGN KEY(owner_id) REFERENCES Owner(owner_id)
);
ALTER TABLE Employees ADD CONSTRAINT UNIQUE(supervisor_id); --This worked to add a unique constraint, however, it didn't override the primary key designation. I must manually do that.  

CREATE TABLE Buildings ( building_id INT,
						 building_name VARCHAR(40),
						 floors INT,
						 employees INT,
						 supervisor_id INT,
						 rat_id INT,
						 street_address VARCHAR(30),
						 state_initials VARCHAR(2),
						 supplier_id INT,
						 expenses DECIMAL,
						 PRIMARY KEY(building_id, building_name),
						 FOREIGN KEY(supervisor_id) REFERENCES Employees(supervisor_id),
						 FOREIGN KEY(rat_id) REFERENCES Rat(rat_id),
						 FOREIGN KEY(supplier_id) REFERENCES Supplies(supplier_id)
);

CREATE TABLE Owner ( owner_id INT,
					 first_name VARCHAR(20),
					 last_name VARCHAR(20),
					 building_name VARCHAR(40),
					 PRIMARY KEY(owner_id),
					 FOREIGN KEY(building_name) REFERENCES Buildings(building_name)
);

CREATE TABLE Rats ( rat_id INT,
					rat_name VARCHAR(20),
					building_id INT,
					PRIMARY KEY(rat_id),
					FOREIGN KEY(building_id) REFERENCES Buildings(building_id)
);

CREATE TABLE Supplies ( supplier_id INT,
						supplier_name VARCHAR(40),
						brewing_supplies VARCHAR(40),
						utility_supplies VARCHAR(40),
						date_purchased DATE,
						brewing_supplies_expense DECIMAL,
						utility_supplies_expense DECIMAL,
						building_id INT,
						PRIMARY KEY(supplier_id),
						FOREIGN KEY(building_id) REFERENCES Buildings(building_id)
);

CREATE TABLE Services ( service_id INT,
						service_name VARCHAR(40),
						service_price DECIMAL,
						PRIMARY KEY(service_id)
);

CREATE TABLE Sales ( sale_id INT,
					 service_name VARCHAR(60),
					 service_status VARCHAR(10),
					 building_name VARCHAR(60),
					 amount_recieved DECIMAL,
					 customer_occupancy INT, 
					 date_recieved DATE,
					 PRIMARY KEY(sale_id),
					 FOREIGN KEY(service_name) REFERENCES Services(service_name),
					 FOREIGN KEY(building_name) REFERENCES Buildings(building_name)
);

/*No parts of a primary key can be null. For this reason supervisor_id shall be a UNIQUE key and unique keys can reference foreign keys. */

/*ALTER TABLE Employees ADD CONSTRAINT FOREIGN KEY(building_id) REFERENCES Buildings(building_id)*/
/*Really important when altering tables to add foreign key constraints, the table must already exist, tables in PHPMyAdmin automatically get assigned all lower case characters, which is important since the table you're referencing may not exist because
 you didn't spell it exactly.*/

--employees
ALTER TABLE employees ADD FOREIGN KEY(building_id) REFERENCES buildings(building_id);
 
--buildings
--ALTER TABLE buildings ADD FOREIGN KEY(supervisor_id) REFERENCES employees(supervisor_id); problem here 
ALTER TABLE buildings ADD FOREIGN KEY(rat_id) REFERENCES rats(rat_id);
ALTER TABLE buildings ADD FOREIGN KEY(supplier_id) REFERENCES supplies(supplier_id);

--rats
ALTER TABLE rats ADD FOREIGN KEY(building_id) REFERENCES buildings(building_id);

--owner
--ALTER TABLE owner ADD FOREIGN KEY(building_name) REFERENCES buildings(building_name); problem here 

--supplies
ALTER TABLE supplies ADD FOREIGN KEY(building_id) REFERENCES buildings(building_id);

--services 

--sales
ALTER TABLE sales ADD FOREIGN KEY(service_name) REFERENCES services(service_name);
ALTER TABLE sales ADD FOREIGN KEY(building_name) REFERENCES buildings(building_name);

DROP TABLE IF EXISTS Employees, Building, Owner, Rats, Supplies, Services, Sales;     /*Useful for dropping multiple tables if needed*/
-- SQL accepts dates of a format: yyyy-mm-dd.  

--Employees values
INSERT INTO Employees VALUES(1, 'John', 'Hughes', '1992-10-03', 'Male', 'bartender', 'serves drinks & takes orders', 35000.00, 1, NULL, NULL),
							(2, 'Bob', 'Johnson', '1983-10-29', 'Male', 'supervisor', 'manages the employees on site', 48000.00, 1, NULL, 2),
							(3, 'Liz', 'Barry', '1993-27-05', 'Female', 'bartender', 'serves drinks & takes orders', 35001.00, 1, NULL, NULL),
							(4, 'Anna', 'Krevansky', '1990-27-08', 'Female', 'bartender', 'serves drinks & takes orders', 37000.00, 1, NULL, NULL),
							(5, 'Jon', 'Taffer', '1973-30-09', 'Male', 'owner', 'manages all properties', 300000.00, 3, 1, NULL),
							(6, 'Phillip', 'DeFranco', '1989-28-02', 'Male', 'line cook', 'prepares and cooks food', 45000.00, 1, NULL, NULL),
							(7, 'Frank', 'Horrigan', '1990-15-04', 'Male', 'line cook', 'prepares and cooks food', 42000.00, 1, NULL, NULL),
							(8, 'Jess', 'DelVecchi', '1993-18-03', 'Female', 'bartender', 'serves drinks & takes order', 35000.00, 2, NULL, NULL),
							(9, 'Nicole', 'OHara', '1991-13-12', 'Female', 'bartender', 'servers drinks & takes orders', 33090.00, 2, NULL, NULL),
							(10, 'Samantha', 'Maxwell', '1991-29-10', 'Female', 'line cook', 'prepares and cooks food', 36000.00, 2, NULL, NULL),
							(11, 'Vick', 'Dandy', '1988-12-11', 'Male', 'supervisor', 'manages the employees on site', 48000.00,  2, NULL, 3);
							
INSERT INTO Buildings VALUES(1, 'Crafty Time Eatery', 2, 6, 2, 1, '1210 Chestnut St. 19019', 'PA', 1, 600000.00),
							(2, 'NightOwl Brewpub', 3, 4, 3, 2, '671 Crestmont Ave. 19019', 'PA', 2, 610000.00),
							(3, 'Naughty Jester Bar & Grill', 3, 1, NULL, 3, '123 Sansom St. 19019', 'PA', 3, 611320.00),
							(4, 'Intoxicant Emporium', 4, 0, NULL, 4, '2500 Chaddwick St. 19019', 'PA', 4, 500000.00),
							(5, 'Velvet Lantern', 3, 0, NULL, 5, '200 Church St. 19019', 'PA', 5, 450000.00),
							(6, 'Wandering Anchor Drinkery', 2, 0, NULL, 6, '26 13th St. 19019', 'PA' 6, 480000.00);
							
INSERT INTO Owner VALUES(1, 'Jon', 'Taffer', 3);

INSERT INTO Supplies VALUES(1, 'HBC 342', 'hops', NULL, '2019-03-03', 100000.00, 0.00, 4),
						   (2, 'Northern Brewery', 'tank fermenter', 'Industrial cleaners', '2019-03-03', 8000.00, 300.00, 4),
						   (3, 'Master Brewer', 'distilling coils', 'paper products', '2019-02-17', 5000.00, 1000.00, 4),
						   (4, 'Kegerator', 'stainless steel doors', 'paint & rust remover', '2019-01-12', 3000.00, 1500.00, 4),
						   (5, 'Rapids Inc.', 'faucet rack with handles', NULL, '2019-01-03', 5800.00, 0.00, 4),
						   (6, 'Brewtech LLC.', 'distilling circutry boards', 'condensed air cans', '2019-02-23', 17000.00, 60.00, 4);

INSERT INTO Rats VALUES(1, 'Pinky', 6),
					   (2, 'The Brain', 5),
					   (3, 'Franklin', 4),
					   (4, 'Gargantulous', 3),
					   (5, 'GigaBites', 2),
					   (6, 'Jubille', 1);
					   
INSERT INTO Services VALUES(1, 'yeast cultivation & culturing', 75.00),
						   (2, 'beverage industry consultation', 50.00),
						   (3, 'room rentals', 40.00),
						   (4, 'catering', 70.00),
						   (5, 'Rockbottom life advice', 0.00),
						   (6, 'Beverage sale', NULL);

INSERT INTO Sales VALUES(1, 'beverage industry consultation', 'active', 'Naughty Jester Bar & Grill', 300.00, 33, '2019-07-11'),
						(2, 'yeast cultivation & culturing', 'active', 'Intoxicant Emporium', 150.00, 0, '2019-01-04'),
						(3, 'rockbottom life advice', 'active', 'Crafty Time Eatery', 0, 40, '2019-08-10'),
						(4, 'catering', 'active', 'NightOwl Brewpub', 210.00, 82, '2019-12-24'),
						(5, 'room rentals', 'active', 'NightOwl Brewpub', 120.00, 82, '2019-12-24'),
						(6, 'Beverage sale: double stack honey mead', 'active', 'Crafty Time Eatery', 14.00, 40, '2019-08-10');
					   
INSERT 