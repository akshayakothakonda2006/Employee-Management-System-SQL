
SELECT
    c.CustomerName,
    p.ProductName,
    o.Quantity,
    o.OrderDate
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID
ORDER BY o.Quantity DESC;
SELECT
    p.ProductName,
    SUM(o.Quantity) AS TotalQuantity
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductName;
SELECT
    p.Category,
    COUNT(*) AS TotalProducts
FROM Products p
GROUP BY p.Category;
SELECT
    Category,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;
SELECT
    MAX(Price) AS HighestPrice,
    MIN(Price) AS LowestPrice
FROM Products;
SELECT *
FROM Products
WHERE Price > 10000;

SELECT *
FROM Products 
WHERE Category = 'Electronics';

SELECT *
FROM Customers
WHERE CustomerName LIKE 'R%';

SELECT *
FROM Products
WHERE ProductName LIKE '%e';

SELECT *
FROM Products
WHERE Price BETWEEN 5000 AND 50000;

SELECT DISTINCT Category
FROM Products;

SELECT
    p.ProductName,
    SUM(o.Quantity) AS TotalQuantity
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(o.Quantity) > 1;

SELECT
    Category,
    COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category
HAVING COUNT(*) > 1;

SELECT
    p.ProductName,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(o.Quantity * p.Price) > 30000;

SELECT
    c.CustomerName,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
HAVING SUM(o.Quantity * p.Price) > 40000;

SELECT ProductName, Price
FROM Products
WHERE Price = (
    SELECT MAX(Price)
    FROM Products
);

SELECT ProductName, Price
FROM Products
WHERE Price = (
    SELECT MIN(Price)
    FROM Products
);

SELECT TOP 1
    c.CustomerName,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC;

SELECT
    Category,
    MAX(Price) AS HighestPrice
FROM Products
GROUP BY Category;

SELECT
    p.Category,
    SUM(o.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY p.Category;

SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
FULL OUTER JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT
    ProductName,
    Price,
    CASE
        WHEN Price >= 10000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS ProductCategory
FROM Products;

SELECT CustomerName AS Name
FROM Customers

UNION

SELECT ProductName
FROM Products;