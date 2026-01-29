SELECT * FROM Orders	

SELECT
Employees.FirstName,
Employees.LastName,
Employees.Title,
Employees.City,
COUNT (Orders.OrderID) AS TOTAL

FROM Employees
	INNER JOIN Orders ON (Employees.EmployeeID = Orders.EmployeeID)
WHERE Employees.City = 'London'
GROUP BY
	Employees.FirstName,
	Employees.LastName,
	Employees.Title,
	Employees.City
	HAVING COUNT (Orders.OrderID) > 60
ORDER BY COUNT (Orders.OrderID) ASC

SELECT 
	OrderDetails.OrderID,
	SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS Total,
	AVG(OrderDetails.Quantity * OrderDetails.UnitPrice) AS Media,
	MIN(OrderDetails.Quantity * OrderDetails.UnitPrice) AS Minimo,
	MAX(OrderDetails.Quantity * OrderDetails.UnitPrice) AS Maximo
FROM OrderDetails
WHERE OrderDetails.OrderID > 10500
GROUP BY OrderDetails.OrderID
HAVING SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) > 1000
AND AVG(OrderDetails.Quantity * OrderDetails.UnitPrice) < 500

SELECT 
	Customers.CustomerID,
	Customers.CompanyName,
	Customers.ContactName,
	Customers.ContactTitle,
	Customers.Address,
	Customers.City,
	Customers.Region,
	Customers.PostalCode,
	Customers.Country,
	Customers.Phone,
	Customers.Fax,
	''  AS HomePage
	
FROM Customers
UNION
SELECT 
	CAST(Suppliers.SupplierID AS NCHAR(5)) AS Code,
	Suppliers.CompanyName,
	Suppliers.ContactName,
	Suppliers.ContactTitle,
	Suppliers.Address,
	Suppliers.City,
	Suppliers.Region,
	Suppliers.PostalCode,
	Suppliers.Country,
	Suppliers.Phone,
	Suppliers.Fax,
	CAST (Suppliers.HomePage AS nchar (5))
	


FROM Suppliers

