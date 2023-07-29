-- -------------------------------------------------------
-- 1. El monto total de una orden de compra determinada --
-- -------------------------------------------------------
delimiter //
create function montoTotal (orden int) returns float
DETERMINISTIC
begin 
	declare total float;
	set total = (select sum(UnitPrice*Quantity) from northwind.orderdetails where orderdetails.OrderID = orden);
    return total;
end;	//

-- EJEMPLO #1 --
select northwind.montoTotal(10248);

-- -------------------------------------------------------------------------------------------------------------
-- 2. La clave de la orden y el monto total, de todas las órdenes pertenecientes a un empleado en particular. --
-- -------------------------------------------------------------------------------------------------------------
delimiter //
	create PROCEDURE MontoPorEmpleado(emple int) 
	begin
		select orders.OrderID,sum(UnitPrice*Quantity) as Monto
        from northwind.orders 
		inner join northwind.orderdetails on orders.OrderID = orderdetails.OrderID 
		where orders.EmployeeID = emple
        group by orders.OrderID;
	end 	//
    
-- EJEMPLO #2 --
call northwind.MontoPorEmpleado(1);

-- -----------------------------------------------------------------
-- 3. La lista de todos los clientes que pertenecen a una región. --
-- -----------------------------------------------------------------

delimiter //
	create PROCEDURE clientesPorRegion (reg varchar(30)) 
	begin 
        select CustomerID,ContactName from northwind.customers
        where Region = reg;
	end;	//
    
-- EJEMPLO #3 --
call northwind.clientesPorRegion('WA');

-- -------------------------------------------------------------------------------------------------------------------
-- 4. El número de días que transcurren entre la fecha de orden y de embarque para una orden de compra determinada. --
-- -------------------------------------------------------------------------------------------------------------------
delimiter //
	create function numeroDias (orden int) returns int
	DETERMINISTIC
	begin 
		declare dias int;
        declare fechaInicial datetime;
        declare fechaFinal datetime;
		set fechaInicial = (select OrderDate from northwind.orders where OrderID=orden);
        set fechaFinal = (select ShippedDate from northwind.orders where OrderID=orden);
        set dias = (select DATEDIFF(fechaFinal,fechaInicial));
		return dias;
	end;	//
    
-- EJEMPLO #4 --
select northwind.numeroDias(10248);

-- -------------------------------------------------------------------
-- 5. Un listado de los 5 productos que más solicitan los clientes. --
-- -------------------------------------------------------------------
delimiter //
	create PROCEDURE CincoProductosMasPedidos(cliente varchar(15)) 
	begin
		select orders.OrderID,CustomerID,orderdetails.ProductID,count(orderdetails.ProductID) as VecesSolicitado 
        from northwind.orders 
		inner join northwind.orderdetails on orders.OrderID = orderdetails.OrderID 
		inner join northwind.products on orderdetails.ProductID = products.ProductID
		where orders.CustomerID = cliente 
		GROUP BY orderdetails.ProductID
		ORDER BY VecesSolicitado DESC limit 5;
	end 	//

-- EJEMPLO #5 --
call northwind.CincoProductosMasPedidos('ALFKI');




