/* Deneme  */

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY(id)
);

CREATE TABLE personel_bilgi 
(
id int,
tel char(10) UNIQUE ,
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);


INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500,'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500,'Honda');


INSERT INTO personel_bilgi VALUES(123456789, '5302345678',5);
INSERT INTO personel_bilgi VALUES(234567890, '5422345678',4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245',3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659',3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698',2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574',2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585',1);

select * from personel
select * from personel_bilgi

--1)Personel tablosundan Istanbul veya Ankara’da calisanlarin id’leriniyazdir
--2)Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id leriniyazdirin
--3)Iki sorguyu INTERSECT ilebirlestirin

select id from personel
where sehir in ('Istanbul','Ankara')
intersect
select id from personel_bilgi
where cocuk_sayisi in (2,3)

----INTERVIEW QUESTION---

CREATE TABLE personel1 (
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel1 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500,'IBM');
INSERT INTO personel1 VALUES(234567891, 'Brian Pitt', 'Florida', 1500,'LINUX');
INSERT INTO personel1 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLSFARGO');
INSERT INTO personel1 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000,'GOOGLE');
INSERT INTO personel1 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel1 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TDBANK');
INSERT INTO personel1 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500,'IBM');

CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789,'JohnWalker','Florida',2500,'IBM');
INSERT INTO isciler VALUES(234567890,'BradPitt','Florida',1500,'APPLE');
INSERT INTO isciler VALUES(345678901,'EddieMurphy','Texas',3000,'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500,'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500,'IBM');

select * from personel1
select * from isciler

--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri
--listeleyen query yaziniz

select isim,id from personel1     -- ikisi de aynı sekilde sonuc veriyor
where id in (select id from isciler)

select isim,id from personel1       -- ikisi de aynı sekilde sonuc veriyor
where id in (select id from isciler where isciler.id=personel1.id)

--2)Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz

select * from personel1
where id in (select id from isciler)
intersect
select * from personel1
where isim in (select isim from isciler)

select * from personel1
where exists (select id from isciler where ((personel1.id=isciler.id) and (personel1.isim=isciler.isim)))

select * from personel1
where id in (select id from isciler where ((personel1.id=isciler.id) and (personel1.isim=isciler.isim)))

--3)Personel tablosunda kac farkli sehirden personel var?

select count(distinct sehir) as sehirsayisi from personel1

--4)Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Queryyaziniz

select * from personel1
where mod(id,2)=0

--5)Personel tablosunda kac tane kayit oldugunu gosteren queryyazin

select count(*) from personel1

select count(id) as kayitsayisi from personel1



