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


select * from orders inner join customers
on orders."CustomerID"=customers."CustomerID"

-- orders tablosunda m??steri ismi yoktu, inner join yapt??k
select orders."CustomerID",customers."ContactName",orders."OrderDate" from orders inner join customers
on orders."CustomerID"=customers."CustomerID"

-- orders o diye customers c diye k??saltma yapt??k

select o."OrderID",o."CustomerID",c."ContactName",o."OrderDate" from orders o inner join customers c
on o."CustomerID"=c."CustomerID"

-- London daki m????terilerin yapt??g?? sipari??ler
select o."OrderID",o."CustomerID",c."ContactName",o."OrderDate",c."City" from orders o inner join customers c
on o."CustomerID"=c."CustomerID"
where c."City"='London'
order by "ContactName"

-- ??imdi de hangi ??r??nleri ald??????n?? listelemek i??in order_details tablosuna gitmemiz gerekiyor

select o."OrderID",o."CustomerID",c."ContactName",od."ProductID",o."OrderDate",c."City" from orders o inner join customers c
on o."CustomerID"=c."CustomerID"
inner join order_details od on od."OrderID"=o."OrderID"
order by "ContactName"

-- ??imdi de products tablosuna gidip, ??r??nlerin ismini alal??m.

select o."OrderID",o."CustomerID",c."ContactName",od."ProductID",p."ProductName",o."OrderDate",c."City" from orders o
inner join customers c on o."CustomerID"=c."CustomerID"
inner join order_details od on od."OrderID"=o."OrderID"
inner join products p on od."ProductID"=p."ProductID"
order by "ContactName"

-- ??imdi de sipari??i yapt??g?? zaman bu ??r??n??n fiyat?? nedir.burada bir daha join yapm??yoruz

select o."OrderID",o."CustomerID",c."ContactName",od."ProductID",p."ProductName",(od."UnitPrice"*od."Quantity") total,o."OrderDate",c."City" from orders o 
inner join customers c on o."CustomerID"=c."CustomerID"
inner join order_details od on od."OrderID"=o."OrderID"
inner join products p on od."ProductID"=p."ProductID"
order by "ContactName"

-- ??imdi de sipari?? nosuna g??re gruplay??p her sipari??te toplam ??demeleri bulal??m

select o."OrderID",o."CustomerID",sum(od."UnitPrice"*od."Quantity") total,o."OrderDate" from orders o 
inner join customers c on o."CustomerID"=c."CustomerID"
inner join order_details od on od."OrderID"=o."OrderID"
inner join products p on od."ProductID"=p."ProductID"
group by o."OrderID"

-- en ??ok sat??lan ??r??nleri ??oktan aza do??ru s??ralayal??m.
-- order_details ile products tablosu ??zerinde ??al????aca????z. products tablosundan product name ve product category'i alal??m.

select distinct "ProductID" from order_details -- sonu?? 77
select * from products -- sonu?? 77 dolay??s?? ile hi?? sat??lmayan yok

select od."OrderID",p."CategoryID",od."ProductID",p."ProductName",od."UnitPrice",od."Quantity" from order_details od
inner join products p
on od."ProductID"=p."ProductID"

--category baz??nda s??ralama
select p."CategoryID",sum(od."Quantity") from order_details od
inner join products p
on od."ProductID"=p."ProductID"
group by p."CategoryID"
order by sum(od."Quantity") desc

-- urun ID baz??nda s??ralama
select od."ProductID",sum(od."Quantity") as toplam from order_details od
inner join products p
on od."ProductID"=p."ProductID"
group by od."ProductID"
order by toplam desc

-- ProductName baz??nda s??ralama
select p."ProductName",sum(od."Quantity") from order_details od
inner join products p
on od."ProductID"=p."ProductID"
group by p."ProductName"
order by sum(od."Quantity") desc




