-- ORDER BY KOMUTU

CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmazel', 'Istanbul');

select * from insanlar2

-- Insanlar tablosundaki dataları adrese göre sıralayınız
SELECT * FROM insanlar2
ORDER BY adres;

-- Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar2
WHERE isim='Mine'
ORDER BY ssn;

-- Insanlar tablosundaki soyismi Bulut olanlari adres sirali olarak listeleyin  
SELECT * FROM insanlar2
WHERE soyisim='Bulut'
ORDER BY 4; -- Sıralamada field numarası da kullanabiliriz

/*
NOT:Ascending (ASC) doğal sıralam(NATURAL) küçükten büyüğe, yazılmasada defauld olarak natural sıralama yapar
    Descending (DESC) Büyükten küçüğe
*/

-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

SELECT * FROM insanlar2
ORDER BY ssn DESC;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar2
ORDER BY isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini isim kelime uzunluklarına göre sıralayınız
SELECT isim,soyisim FROM insanlar2
ORDER BY LENGTH(isim)

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT CONCAT (isim,' ',soyisim) AS isim_soyisim FROM insanlar2
ORDER BY LENGTH(isim)+LENGTH(soyisim)
-- ikinci Yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar2
ORDER BY LENGTH(isim||soyisim)

CREATE TABLE manav
(
isim varchar(50),  Urun_adi varchar(50),  Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav
--1) Isme gore alinan toplam urunleri sorgulayınız
SELECT isim, sum(urun_miktar) as urun_miktari FROM manav
GROUP BY isim
ORDER BY urun_miktari DESC

--2) Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi,COUNT(isim) FROM manav
GROUP BY urun_adi

-- 3) Alinan kilo miktarina gore musteri sayisi
SELECT urun_miktar,COUNT(isim) AS alinan_urunler_kisi_sayisi FROM manav
GROUP BY urun_miktar

CREATE TABLE personel5  (
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20)
);

INSERT INTO personel5 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel5 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel5 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel5 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel5 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel5 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel5 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel5

-- Isme gore toplam maaslari bulun
SELECT isim, sum(maas) FROM personel5
GROUP BY isim

-- sehre gore toplam personel sayisini bulun
SELECT sehir, COUNT(isim) as calisan_sayisi FROM personel5
GROUP BY sehir

-- Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT(*) as calisan_sayisi FROM personel5
WHERE maas>5000
GROUP BY sirket;

-- Her sirket icin Min ve Max maasi bulun
SELECT sirket, min(maas) as en_dusuk_maas, max(maas) as en_yuksek_maas FROM personel5
GROUP BY sirket;

-- HAVING KOMUTU

-- Her sirketin MIN	maaslarini eger 3500’den buyukse goster
SELECT sirket,min(maas) as en_dusuk_maas FROM personel5
GROUP BY sirket
HAVING min(maas)>3500

-- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi  ve toplam maasi gosteren sorgu yaziniz
SELECT isim, sum(maas) as toplam_maas FROM personel5
GROUP BY isim
HAVING sum(maas)>10000;