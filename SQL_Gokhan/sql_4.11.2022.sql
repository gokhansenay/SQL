-- create-- Tablo olusturma
create table ogrenciler
(
id char(4),
isim_soyisim varchar(30),
not_ort real,
kayit_tarih date
);

-- Var olan bir tablodan yeni bir tablo olusturma
create table ogrenci_ortalamalar
as
select isim_soyisim,not_ort
from ogrenciler;

-- select- DQL-
select * from ogrenciler;
select * from ogrenci_ortalamalar;
select isim_soyisim from ogrenciler;

--DML - DATA MANUPULATION LANGUAGE
-- INSERT
select * from ogrenciler;

-- BİR TABLODA TÜM FIELD LARA VERİ EKLEME
insert into ogrenciler values
('1234','Erol Evren',80.50,'2020-01-05');
-- BİR TABLOYA PARÇALI VERİ EKLEME
insert into ogrenciler(id,isim_soyisim) values ('2345','Yusuf Un')

/*
Practice1:
“tedarikciler” isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi”	field’lari olsun.
*/

create table tedarikciler
(
tedarikci_id int UNIQUE,
tedarikci_ismi varchar(20) NOT NULL,
tedarikci_adres varchar(30),
ulasim_tarihi date
);

create table tedarikci_ziyaret
as
select tedarikci_ismi,ulasim_tarihi
from tedarikciler;

select * from tedarikciler
select * from tedarikci_ziyaret
