-- 1. Seleccionar todos los campos de la tabla cliente, ordenado por nombre del contacto de la
-- compañía, alfabéticamente A-Z.
SELECT * FROM customers ORDER BY ContactName;

-- 2.Seleccionar todos los campos de la tabla órdenes, ordenados por fecha de la orden,
-- descendentemente.
SELECT * FROM orders ORDER BY OrderDate DESC;

-- 3.Seleccionar todos los campos de la tabla detalle de la orden, ordenada por cantidad pedida
-- de manera ascendente.
SELECT * FROM orderdetails ORDER BY Quantity DESC;

-- 4. Seleccionar el ID, nombre y apellido de todos los empleados que cuentan con una región
-- asignada.
SELECT EmployeeID,LastName,FirstName FROM employees WHERE Region = "WA";

-- 5.Seleccionar el ID, nombre de la compañía y número de fax de los clientes que cuentan con
-- Fax.
SELECT CustomerID,CompanyName,Fax FROM customers WHERE Fax != " ";

-- 6.Seleccionar el ID, nombre y precio de los 8 productos más caros, que cuenten con stock en
-- almacén. Ordenarlos por precio de manera descendente.
SELECT ProductID,ProductName,UnitPrice FROM products WHERE UnitsInStock > 0 ORDER BY UnitPrice DESC LIMIT 0,8;

-- 7.Seleccionar el ID, nombre y precio de los 10 productos, con menos stock en almacén.
SELECT ProductID,ProductName,UnitPrice,UnitsInStock FROM products ORDER BY UnitsInStock ASC LIMIT 0,10;

-- 8. Seleccionar todos los clientes de los países de: Germany, France y Mexico.
SELECT * FROM customers WHERE City="Germany" OR City="France" OR City="M?xico D.F.";
