-- 1.Aumentar un 15% a los productos de categoria 1
SELECT * FROM northwind.products;
UPDATE `northwind`.`products` SET `UnitPrice` = `UnitPrice`+`UnitPrice`*0.15 WHERE (`CategoryID` = '1');

-- 2. Cambiar a Centro si eran de Mexico D.F o Madrid
SELECT * FROM northwind.customers;
UPDATE `northwind`.`customers` SET `City` = 'Centro' WHERE (`City` = 'M?xico D.F.');
UPDATE `northwind`.`customers` SET `City` = 'Centro' WHERE (`City` = 'Madrid');

-- 3. Cambiarelnombredelacategoría5por‘Cereales’.
SELECT * FROM northwind.categories;
UPDATE `northwind`.`categories` SET `CategoryName` = 'Cereals' WHERE (`CategoryID` = '5');

-- 4.Cambiarelnombrea‘Donald’yapellidoa‘Anderson’delEmpleadoconcódigo6.
SELECT * FROM northwind.employees;
UPDATE northwind.employees SET LastName = "Anderson" WHERE (EmployeeID = '6');
UPDATE northwind.employees SET FirstName = "Donald" WHERE (EmployeeID = '6');

-- 5 Cambiarycolocarelnúmerodefaxa0alosclientescuyovalorseanulo.
SELECT * FROM northwind.customers;
UPDATE `northwind`.`customers` SET `Fax` = '0' WHERE `Fax` = ' ';

-- 6.Actualizarelpreciounitarioa100delosproductosdelosproveedores2y8.
SELECT * FROM northwind.products;
UPDATE `northwind`.`products` SET `UnitPrice` = 100 WHERE (`SupplierID` = '2');
UPDATE `northwind`.`products` SET `UnitPrice` = 100 WHERE (`SupplierID` = '8');

-- 8. Eliminartodoslosproductosdescontinuados.
SELECT * FROM northwind.products;
DELETE FROM `northwind`.`products` WHERE Discontinued = "1";
-- tomo como verdadero en 1 y falso el 0, no se elimino ningun producto 

-- 9.Agregarunproveedorconlosdatosdelalumno,dejandolaregiónsinvalor.
SELECT * FROM northwind.suppliers;
INSERT INTO `northwind`.`suppliers` (`SupplierID`,`CompanyName`,`ContactName`,`ContactTitle`,`Address`,`City`,`PostalCode`,`Country`,`Phone`,`Fax`,`HomePage`) VALUES ('30','CAPCOM','OlivaresLara','Proveedor','San Martin','Monterrey','1803042','Mexico','32659874','(156) 0215','#LUJA#');

-- 10. Agregarcincoproductosasociadosalproveedorcreadoenelpunto9.
INSERT INTO `northwind`.`products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`) VALUES ('78','QuesoAzul','30','4','10/250g','30','200','51','10','0');
INSERT INTO `northwind`.`products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`) VALUES ('79', 'MegaCereal', '30', '5', '30/800g', '60', '500', '400', '200', '0');
INSERT INTO `northwind`.`products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`) VALUES ('80', 'ArrozVerde', '30', '5', '20/1000g', '20', '100', '50', '10', '0');
INSERT INTO `northwind`.`products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`) VALUES ('81', 'ArrozNegro', '30', '5', '30/900g', '21', '50', '10', '5', '0');
INSERT INTO `northwind`.`products` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`) VALUES ('82', 'CerealDeAjo', '30', '5', '50/500g', '60', '200', '100', '30', '0');