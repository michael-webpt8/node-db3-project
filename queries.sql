-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName as 'Product Name',
       c.CategoryName as 'Category Name'
FROM `Product` as p
join `Category` as c
on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id as 'order id',
	   s.CompanyName as 'Shipper Company Name'
	   FROM `Order` as o
	   join `Shipper` as s
	   on o.ShipVia = s.Id
	   WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName as 'Product name',
	   od.Quantity as 'product quantity'
	   FROM `OrderDetail` as od
	   join `Product` as p
	   on od.ProductId = p.Id
	   join `Order` as o
	   on od.OrderId = o.Id
	   WHERE o.Id = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
