-- 1. Mostrar el nombre de cada categoría de los productos y el número de productos
--    para cada una de ellas.

select CategoryID,SUM(UnitsInStock) as CategoryID from northwind.products
group by CategoryID;

-- 2. Obtener el nombre completo del empleado y el número de ordenes que ha colocado
select EmployeeID,count(EmployeeID) from northwind.orders
group by EmployeeID;

-- 4. Obtener el monto total pagado por cada orden de compra hecha solo en julio de 1996

select OrderDate,UnitPrice*Quantity from northwind.orders
inner join northwind.orderdetails on orders.OrderID = orderdetails.OrderID
where OrderDate like '%1996-07%';


-- 5. Mostrar el nombre de todos los proveedores, así como el precio máximo y mínimo de
-- los productos que suministra

select CompanyName,MAX(UnitPrice),Min(UnitPrice) from northwind.suppliers
inner join northwind.products on suppliers.SupplierID = products.SupplierID
group by CompanyName;

-- 6. Obtener el stock total de los productos por cada categoría. Mostrar el nombre de la
--    categoría y el stock por categoría. Solamente las categorías 2, 5 y 8

select CategoryName,sum(UnitsInStock) from northwind.categories
inner join northwind.products on categories.CategoryID = products.CategoryID
where CategoryName = "Condiments" or CategoryName = "Grains/Cereals" or CategoryName = "Seafood"
group by CategoryName;


