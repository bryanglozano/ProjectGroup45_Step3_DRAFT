-- =============================================
-- Group 45 - Elite Luxury Rental Management System
-- Project Step 3 DRAFT DML Queries
-- Members: Alejandro Leon, Bryan Lozano Gutierrez, Jeremy Lammon
-- =============================================


-- =============================================
-- LOCATIONS
-- =============================================

-- Browse all locations
SELECT Locations.locationID, Locations.locationName, Locations.address, Locations.city, Locations.phone
FROM Locations;

-- Add a new location
INSERT INTO Locations (locationName, address, city, phone)
VALUES (@locationNameInput, @addressInput, @cityInput, @phoneInput);

-- Update a location
UPDATE Locations
SET locationName = @locationNameInput,
    address = @addressInput,
    city = @cityInput,
    phone = @phoneInput
WHERE locationID = @locationIDInput;

-- Delete a location
DELETE FROM Locations
WHERE locationID = @locationIDInput;


-- =============================================
-- CLIENTS
-- =============================================

-- Browse all clients
SELECT Clients.clientID, Clients.firstName, Clients.lastName, Clients.email, Clients.phone, Clients.membershipTier, Clients.joinDate
FROM Clients;

-- Add a new client
INSERT INTO Clients (firstName, lastName, email, phone, membershipTier, joinDate)
VALUES (@firstNameInput, @lastNameInput, @emailInput, @phoneInput, @membershipTierInput, @joinDateInput);

-- Update a client
UPDATE Clients
SET firstName = @firstNameInput,
    lastName = @lastNameInput,
    email = @emailInput,
    phone = @phoneInput,
    membershipTier = @membershipTierInput,
    joinDate = @joinDateInput
WHERE clientID = @clientIDInput;

-- Delete a client
DELETE FROM Clients
WHERE clientID = @clientIDInput;


-- =============================================
-- VEHICLES
-- =============================================

-- Browse all vehicles with location information
SELECT Vehicles.vehicleID, Vehicles.make, Vehicles.model, Vehicles.year, Vehicles.licensePlate,
       Vehicles.dailyRate, Vehicles.status, Vehicles.mileage, Locations.locationName
FROM Vehicles
INNER JOIN Locations ON Vehicles.locationID = Locations.locationID;

-- Add a new vehicle
INSERT INTO Vehicles (locationID, make, model, year, licensePlate, dailyRate, status, mileage)
VALUES (@locationIDInput, @makeInput, @modelInput, @yearInput, @licensePlateInput, @dailyRateInput, @statusInput, @mileageInput);

-- Update a vehicle
UPDATE Vehicles
SET locationID = @locationIDInput,
    make = @makeInput,
    model = @modelInput,
    year = @yearInput,
    licensePlate = @licensePlateInput,
    dailyRate = @dailyRateInput,
    status = @statusInput,
    mileage = @mileageInput
WHERE vehicleID = @vehicleIDInput;

-- Delete a vehicle
DELETE FROM Vehicles
WHERE vehicleID = @vehicleIDInput;


-- =============================================
-- EMPLOYEES
-- =============================================

-- Browse all employees with location information
SELECT Employees.employeeID, Employees.firstName, Employees.lastName, Employees.email,
       Employees.phone, Employees.hireDate, Employees.role, Locations.locationName
FROM Employees
INNER JOIN Locations ON Employees.locationID = Locations.locationID;

-- Add a new employee
INSERT INTO Employees (firstName, lastName, email, phone, hireDate, role, locationID)
VALUES (@firstNameInput, @lastNameInput, @emailInput, @phoneInput, @hireDateInput, @roleInput, @locationIDInput);

-- Update an employee
UPDATE Employees
SET firstName = @firstNameInput,
    lastName = @lastNameInput,
    email = @emailInput,
    phone = @phoneInput,
    hireDate = @hireDateInput,
    role = @roleInput,
    locationID = @locationIDInput
WHERE employeeID = @employeeIDInput;

-- Delete an employee
DELETE FROM Employees
WHERE employeeID = @employeeIDInput;


-- =============================================
-- RENTALS
-- =============================================

-- Browse all rentals with client, vehicle, and location information
SELECT Rentals.rentalID,
       Clients.firstName AS clientFirstName,
       Clients.lastName AS clientLastName,
       Vehicles.make,
       Vehicles.model,
       Locations.locationName,
       Rentals.pickupDate,
       Rentals.returnDate,
       Rentals.actualReturnDate,
       Rentals.totalCost,
       Rentals.status
FROM Rentals
INNER JOIN Clients ON Rentals.clientID = Clients.clientID
INNER JOIN Vehicles ON Rentals.vehicleID = Vehicles.vehicleID
INNER JOIN Locations ON Rentals.locationID = Locations.locationID;

-- Add a new rental
INSERT INTO Rentals (clientID, vehicleID, locationID, pickupDate, returnDate, actualReturnDate, totalCost, status)
VALUES (@clientIDInput, @vehicleIDInput, @locationIDInput, @pickupDateInput, @returnDateInput, @actualReturnDateInput, @totalCostInput, @statusInput);

-- Update a rental
UPDATE Rentals
SET clientID = @clientIDInput,
    vehicleID = @vehicleIDInput,
    locationID = @locationIDInput,
    pickupDate = @pickupDateInput,
    returnDate = @returnDateInput,
    actualReturnDate = @actualReturnDateInput,
    totalCost = @totalCostInput,
    status = @statusInput
WHERE rentalID = @rentalIDInput;

-- Delete a rental
DELETE FROM Rentals
WHERE rentalID = @rentalIDInput;


-- =============================================
-- EMPLOYEECLIENTS
-- =============================================

-- Browse all employee-client relationships
SELECT EmployeeClients.employeeClientID,
       Employees.firstName AS employeeFirstName,
       Employees.lastName AS employeeLastName,
       Clients.firstName AS clientFirstName,
       Clients.lastName AS clientLastName
FROM EmployeeClients
INNER JOIN Employees ON EmployeeClients.employeeID = Employees.employeeID
INNER JOIN Clients ON EmployeeClients.clientID = Clients.clientID;

-- Add a new employee-client relationship
INSERT INTO EmployeeClients (employeeID, clientID)
VALUES (@employeeIDInput, @clientIDInput);

-- Update an employee-client relationship
UPDATE EmployeeClients
SET employeeID = @employeeIDInput,
    clientID = @clientIDInput
WHERE employeeClientID = @employeeClientIDInput;

-- Delete an employee-client relationship
DELETE FROM EmployeeClients
WHERE employeeClientID = @employeeClientIDInput;

