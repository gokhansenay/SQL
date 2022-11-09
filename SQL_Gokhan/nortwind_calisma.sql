/*
1	categories
2	customercustomerdemo
3	customerdemographics
4	customers
5	employees
6	employeeterritories
7	order_details
8	orders
9	products
10	region
11	shippers
12	shippers_tmp
13	suppliers
14	territories
15	usstates
*/

select * from categories				--1 ("CategoryID"[PK smallint]	"CategoryName"	"Description"	"Picture") 8 adet row
select * from customercustomerdemo		--2	("CustomerID"[PK character]	"CustomerTypeID"[PK sharacter]) 0 adet row
select * from customerdemographics		--3	("CustomerTypeID"[PK character]	"CustomerDesc")	0 adet row
select * from customers					--4	("CustomerID"[PK character]	"CompanyName"	"ContactName"	"ContactTitle"	"Address"	"City"	"Region"	"PostalCode"	"Country"	"Phone"	"Fax") 91 adet row	
select * from employees					--5	("EmployeeID"[PK smallint]	"LastName"	"FirstName"	"Title"	"TitleOfCourtesy"	"BirthDate"	"HireDate"	"Address"	"City"	"Region"	"PostalCode"	"Country"	"HomePhone"	"Extension"	"Photo"	"Notes"	"ReportsTo"	"PhotoPath" 9 adet row	
select * from employeeterritories		--6	("EmployeeID"[PK smallint]	"TerritoryID"[PK character]) 49 adet row
select * from order_details				--7	("OrderID"[PK smallint]	"ProductID"[PK smallint]	"UnitPrice"	"Quantity"	"Discount") 2155 adet row
select * from orders					--8	("OrderID" [PK smallint]	"CustomerID"	"EmployeeID"	"OrderDate"	"RequiredDate"	"ShippedDate"	"ShipVia"	"Freight"	"ShipName"	"ShipAddress"	"ShipCity"	"ShipRegion"	"ShipPostalCode"	"ShipCountry") 830 adet row
select * from products					--9	("ProductID"[PK smallint]	"ProductName"	"SupplierID"	"CategoryID"	"QuantityPerUnit"	"UnitPrice"	"UnitsInStock"	"UnitsOnOrder"	"ReorderLevel"	"Discontinued") 77 adet row
select * from region					--10	("RegionID"[PK smallint]	"RegionDescription") 4 adet row
select * from shippers					--11	("ShipperID"[PK smallint]	"CompanyName"	"Phone") 6 adet row
select * from shippers_tmp				--12	("ShipperID"[PK smallint]	"CompanyName"	"Phone") 6 adet row
select * from suppliers					--13	("SupplierID"[PK smallint]	"CompanyName"	"ContactName"	"ContactTitle"	"Address"	"City"	"Region"	"PostalCode"	"Country"	"Phone"	"Fax"	"HomePage") 29 adet row
select * from territories				--14	("TerritoryID"[PK character]	"TerritoryDescription"	"RegionID") 53 adet row
select * from usstates					--15	("StateID"	"StateName"	"StateAbbr"	"StateRegion") 51 adet row

insert into products values (78,'aaaa',2,1,'12 boxes',11.5,100,5,1,1)

update products
set "ProductName"='ccbb',"SupplierID"=45 where "ProductID"=78

delete from products where "ProductID"=78


select "CategoryID",count(*) from products
group by "CategoryID"
order by "CategoryID"

select "ProductID","ProductName","UnitPrice" from products
where "ProductID" in (select max(count())"ProductID" from order_details)


select "ProductID" from 

select "ProductID",count("OrderID") as sipsayisi, sum("Quantity") as tmiktar from order_details
group by "ProductID"
order by tmiktar desc



select count("ProductID") from products

select * from customers
select * from orders

select * from orders inner join customers
on orders."CustomerID"=customers."CustomerID"

select orders."OrderID",orders."CustomerID",customers."ContactName" from orders 
inner join customers
on orders."CustomerID"=customers."CustomerID"

select orders."OrderID",orders."CustomerID",customers."ContactName" from customers 
left join orders
on orders."CustomerID"=customers."CustomerID"

