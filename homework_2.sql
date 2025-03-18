--  1)Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısı isteniyor.

SELECT COUNT(*) AS null_kayit_sayisi
FROM Invoice

-- SELECT; Veri çekmek için kullanılır.
-- COUNT; Bir tablodaki toplam satır (kayıt) sayısını döndürür.
-- AS null_kayit_sayisi ifadesi; Sonuçta dönen sütuna bir takma ad (alias) verir.
-- FROM; Verinin hangi tablodan alınacağını belirtir.
-- Sorgu sonunda çıkan sayı 412'dir.

-- 2) Koordinasyondaki kişiler, Total değerlerinde bir hata olduğunu belirtiyorlar. 
--Bu değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırmak için bir sorgu yazmanız isteniyor. 
--Ayrıca, verilerin daha rahat takip edilebilmesi için, tablonun yeni versiyonuna ait kolona göre büyükten küçüğe sıralama yapılması isteniyor.

SELECT 
    total AS eski_total,
    total * 2 AS yeni_total
FROM 
    Invoice
ORDER BY 
    yeni_total DESC; 


-- SELECT; Veri çekmek için kullanılır.
-- total AS eski_total; Mevcut (orijinal) total değerini eski_total adında bir sütun olarak gösterir.
-- total * 2 AS yeni_total; Total değerinin iki katını hesaplar ve sonucu yeni_total adıyla yeni bir sütunda gösterir.
-- FROM; Verinin hangi tablodan alınacağını belirtir.
-- ORDER BY yeni_total; Sonuçları yeni_total sütununa göre sıralar.
-- DESC;  büyükten küçüğe sıralama yapar.

-- 3) Adres kolonundaki verileri, soldan 3 karakter ve sağdan 4 karakter alarak birleştirmeniz ve "Açık Adres" olarak yazmanız isteniyor. 
-- Ayrıca, bu yeni açık adresi 2013 yılı ve 8. ay’a göre filtrelemeniz gerekiyor.

SELECT 
    LEFT(billing_address, 3) || RIGHT(billing_address, 4) AS "Açık Adres",
    invoice_date,
    billing_address
FROM 
    Invoice
WHERE 
    EXTRACT(YEAR FROM invoice_date) = 2013 
    AND EXTRACT(MONTH FROM invoice_date) = 8;

-- SELECT; Veri çekmek için kullanılır.
-- LEFT() fonksiyonu; belirtilen sütundan soldan itibaren belirttiğimiz karakter sayısını alır, billing_address (adres) sütunundan ilk 3 karakteri alıyoruz.
-- RIGHT() fonksiyonu, sütundan sağdan itibaren belirtilen karakter sayısını alır, billing_address sütunundan son 4 karakteri alıyoruz.
-- || (Bağlama Operatörü); İki metin (string) ifadeyi birleştirmek için kullanılır. Soldan 3 karakter ve sağdan 4 karakteri birleştirip yeni bir "Açık Adres" oluşturuyoruz.
-- EXTRACT(YEAR FROM invoice_date); Yıl bilgisini çekmek için kullanılır. invoice_date sütunundan ayı alırız.
-- WHERE; Belirli koşullara göre filtreleme yapar. Burada sadece 2013 yılı ve 8. ay (Ağustos) olan kayıtları getiririz.