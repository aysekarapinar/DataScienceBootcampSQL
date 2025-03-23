-- 1)“USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş tüm faturaların (Invoice) toplamını listeleyen bir sorgu yazınız.
-- Kullanılacak Tablo:
-- ● invoice


SELECT SUM(total) AS toplam_fatura
FROM invoice
WHERE billing_country = 'USA'
  AND EXTRACT(YEAR FROM invoice_date) = 2009;

-- SELECT; Veritabanından belirli sütunları seçmemizi sağlar.
-- SUM(total); total sütunundaki değerlerin toplamını hesaplar.
-- AS toplam_fatura; Sonuçta hesaplanan toplam değere bir takma ad (alias) verir. Bu, çıktıda sütunun adı toplam_fatura olarak görünür.
-- FROM invoice; Hangi tablodan veri çekeceğimizi belirtir.
-- WHERE; Belirli koşullara uyan satırları filtrelemek için kullanılır.
-- billing_country='USA'; billing_country (faturanın kesildiği ülke) sütununda değeri 'USA' olan kayıtları seçer.
-- AND: Birden fazla koşulu bir araya getirir (her iki koşul da sağlanmalı).
-- EXTRACT(YEAR FROM invoice_date); invoice_date sütunundan yılı alır.
-- = 2009: Yılı 2009 olan kayıtları filtreler.

-- 2)Tüm parça (track) bilgilerini, bu parçaların ait olduğu playlisttrack ve playlist tablolarıyla birleştirerek (JOIN) listeleyen bir sorgu yazınız.
-- Kullanılacak Tablolar:
-- ● track
-- ● playlisttrack
-- ● playlist

SELECT t.*, pt.*, p.*
FROM track t
JOIN playlisttrack pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

-- SELECT t.*, pt.*, p.*;
-- t.*, pt.*, p.*: tablolarındaki sütunları getirir.
-- FROM track t;
-- track tablosunu temel alarak işlemi başlatır.
-- t; track tablosuna kısayol (alias) verir.
-- JOIN playlisttrack pt ON t.track_id = pt.track_id;
-- track ve playlisttrack tablolarını, iki tablodaki track_id alanları üzerinden birleştirir.
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;
-- playlisttrack ve playlist tablolarını, playlist_id alanı üzerinden birleştirir.

-- 3)"Let There Be Rock" adlı albüme ait tüm parçaları (Track) listeleyen, sanatçı (Artist) bilgisinide içeren bir sorgu yazınız. 
--Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe sıralayınız.
-- Kullanılacak Tablolar:
-- ● track
-- ● album
-- ● artist

SELECT t.name AS track_name, t.milliseconds, ar.name AS artist_name, a.title AS album_name
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
WHERE a.title = 'Let There Be Rock'
ORDER BY t.milliseconds DESC;


-- SELECT t.name AS track_name, t.milliseconds, ar.name AS artist_name, a.title AS album_name;
-- t.name AS track_name: Parça adını getirir ve track_name olarak yeniden adlandırır.
-- t.milliseconds: Parçanın süresini getirir (milisaniye cinsinden).
-- ar.name AS artist_name: Sanatçının adını getirir.
-- a.title AS album_name: Albümün adını getirir.
-- FROM track t: track tablosunu temel alır ve t takma adını kullanır.
-- JOIN album a ON t.album_id = a.album_id;
-- track tablosunu album tablosuyla album_id üzerinden birleştirir.
-- JOIN artist ar ON a.artist_id = ar.artist_id;
-- album tablosunu artist tablosuyla artist_id üzerinden birleştirir.
-- WHERE a.title = 'Let There Be Rock';
-- Sadece "Let There Be Rock" albümüne ait parçaları filtreler.
-- ORDER BY t.milliseconds DESC;
-- Sonuçları parça süresine göre büyükten küçüğe sıralar.