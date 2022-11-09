create table personel
(
id char(12),
isim varchar(30),
soyisim varchar(30),
email varchar(30),
ise_bsl_tar date,
is_unvan varchar(30),
maas int
)

insert into personel values ('123-456789','Ali','Can','alican@gmail.com','10-APR-10','İSCİ',5000)
insert into personel values ('123-456788','Veli','Cem','velican@gmail.com','10-JAN-12','muhasebeci',5500)
insert into personel values ('123-456787','Ayse','Gul','aysegul@gmail.com','03-MAY-14','İSCİ',4500)
insert into personel values ('123-456786','Fatma','Yasa','fatmayasa@gmail.com','10-APR-09','muhendis',7500)

select * from personel
--Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerinilisteleyin

select id,isim,soyisim,is_unvan,maas from personel 
where maas<5000 or is_unvan='İSCİ'

select * from personel 
where maas<5000 or is_unvan='İSCİ'

--Iscilerin tum bilgilerinilisteleyin

select * from personel 
where is_unvan='İSCİ'

--Soyadi Can veya Gul olanlarin unvanlarini ve maaslarinilisteleyin
select is_unvan,maas from personel 
where soyisim in ('Can','Gul')

--Maasi 5000’den cok olanlarin emailve is baslama tarihlerinilisteleyin

select email,ise_bsl_tar from personel 
where maas>5000

--Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerinilisteleyin

select * from personel 
where maas between 5000 and 7000 
