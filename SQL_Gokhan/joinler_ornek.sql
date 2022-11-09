create table urunler
(
urunid int,
urunismi varchar(50)
)

create table satis
(
musteriid int,
musteriismi varchar(50),
urunid int
)

insert into urunler values (1,'Domates');
insert into urunler values (2,'Mısır');
insert into urunler values (3,'Patates');
insert into urunler values (4,'Marul');
insert into urunler values (5,'Havuç');

insert into satis values (1,'Ahmet');
insert into satis values (2,'Mehmet',2);
insert into satis values (3,'Murat',3);
insert into satis values (4,'Ayse');
insert into satis values (5,'Oya',4);
insert into satis values (6,'Huseyin',1);

/*insert into satis values (7,'Saban',3);
delete from satis where musteriid=7
*/


select * from urunler
select * from satis

--inner join
select musteriid,musteriismi,satis.urunid,urunismi from satis -- aynı
inner join urunler
on 
satis.urunid=urunler.urunid
order by musteriid

select musteriid,musteriismi,satis.urunid,urunismi from urunler --  aynı
inner join satis
on 
satis.urunid=urunler.urunid
order by musteriid

--left join

select * from satis
left join urunler
on 
satis.urunid=urunler.urunid
order by musteriid


select musteriid,musteriismi,satis.urunid,urunismi from satis --alttaki left join ile aynı değil
left join urunler
on 
satis.urunid=urunler.urunid
order by musteriid


select musteriid,musteriismi,satis.urunid,urunismi from urunler --ustteki left join ile aynı değil
left join satis
on 
satis.urunid=urunler.urunid
order by musteriid

--Right join

select musteriid,musteriismi,urunler.urunid,urunismi from satis --alttaki right join ile aynı değil
right join urunler
on 
satis.urunid=urunler.urunid
order by urunid

select musteriid,musteriismi,urunler.urunid,urunismi from urunler --ustteki right join ile aynı değil
right join satis
on 
satis.urunid=urunler.urunid
order by urunid

--Full join
select musteriid,musteriismi,urunler.urunid,urunismi from satis --alttaki full join ile aynı
full join urunler
on 
satis.urunid=urunler.urunid
order by musteriid

select musteriid,musteriismi,urunler.urunid,urunismi from urunler --ustteki full join ile aynı
full join satis
on 
satis.urunid=urunler.urunid
order by musteriid

