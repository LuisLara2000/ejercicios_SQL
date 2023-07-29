-- 1
-- Obtener una lista, ordenada alfabéticamente, de todos los productos que tienen existencia.
-- Mostrar la clave de producto, su nombre, la cantidad en existencia y el nombre del
-- proveedor

select ProductID,ProductName,UnitsInStock,CompanyName
from northwind.products 
inner join northwind.suppliers 
on products.ProductID=suppliers.SupplierID 
ORDER BY ProductName ASC;

-- 2
-- Obtener una lista, ordenada alfabéticamente por categoría, de todos los productos con un
-- precio unitario mayor a 15 dólares. Mostrar la clave de producto, su nombre, el precio
-- unitario, el nombre del proveedor y el nombre de la categoría a la que pertenece.

select ProductID,ProductName,UnitPrice,CompanyName,CategoryName
from northwind.products 
inner join northwind.suppliers  on products.ProductID = suppliers.SupplierID
inner join northwind.categories on products.CategoryID = categories.CategoryID
where UnitPrice>15;

-- 3
-- Obtener una lista de todos las órdenes que se entregaron en USA. Mostrar la clave de la
-- orden, el nombre completo del cliente, la ciudad de envío y la fecha de envío. Ordenar la
-- información, de forma ascendente, por fecha de envío.

select OrderID,ContactName,ShipCity,ShippedDate
from northwind.orders
inner join northwind.customers on orders.CustomerID = customers.CustomerID
ORDER BY ShippedDate ASC;

-- 4
-- Obtener una lista de los clientes y de las órdenes que han solicitado, incluyendo aquellos
-- clientes que no cuenten con ninguna orden. Mostrar la clave del cliente, nombre de la
-- compañía, la ciudad , el país y el número de orden. Ordenar la información por compañía y
-- número de orden.

select ContactName,CompanyName,ShipCountry,OrderID
from northwind.customers
inner join northwind.orders on customers.CustomerID = orders.CustomerID
order by CompanyName , OrderID asc;

-- 5
-- Obtener una lista de las órdenes cuyo flete sea mayor a 200 dólares, ordenada por el
-- nombre de la compañía transportista y por fecha de envío. Mostrar la clave de la orden, la
-- fecha de envío, el nombre de la compañía transportista y el monto del flete.

select OrderID,ShippedDate,CompanyName,Freight
from northwind.orders
inner join northwind.shippers on orders.ShipVia = shippers.ShipperID
where Freight > 200
order by CompanyName,ShippedDate asc;


