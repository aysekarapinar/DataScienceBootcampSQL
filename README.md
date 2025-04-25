# SQL Sorguları ve Açıklamaları

Bu belge, çeşitli SQL sorgularını ve her bir sorgunun işlevini açıklamaktadır. SQL dilini öğrenenler ve kullananlar için kapsamlı bir kaynak sunar.

## 1. Çalışanların FirstName, LastName ve Salary Bilgilerini Getirme

```sql
SELECT FirstName, LastName, Salary FROM employees;
```

- **SELECT**: Veritabanından belirli sütunları seçmek için kullanılır.
- **FROM**: Verilerin çekileceği tabloyu belirtir.

Bu sorgu, "employees" (çalışanlar) tablosundan çalışanların ad, soyad ve maaş bilgilerini getirir.

## 2. Çalışanların Çalıştıkları Departmanları Benzersiz Olarak Listeleme

```sql
SELECT DISTINCT DepartmentName FROM departments;
```

- **DISTINCT**: Yinelenen (tekrarlayan) kayıtları kaldırır ve sadece benzersiz (farklı) değerleri döndürür.

Bu sorgu, "departments" tablosunda tekrarlanmayan tüm departman adlarını listeler.

## 3. Sadece IT Departmanında Çalışanların Bilgilerini Getirme

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Age, e.Salary, e.JoinDate, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';
```

- **JOIN**: İki tabloyu birleştirir.
- **ON**: Hangi alanlar üzerinden birleştirme yapılacağını belirtir.
- **WHERE**: Belirli bir koşula göre filtreleme yapar.

Bu sorgu, "Employees" ve "Departments" tablolarını birleştirerek sadece "IT" departmanında çalışan kişilerin bilgilerini getirir.

## 4. Çalışanları Maaşlarına Göre Büyükten Küçüğe Sıralama

```sql
SELECT * FROM employees 
ORDER BY salary DESC;
```

- **ORDER BY**: Kayıtları belirli bir sütuna göre sıralar.
- **DESC**: Azalan (büyükten küçüğe) sıralama yapar.

Bu sorgu, "employees" tablosundaki tüm çalışanları maaşlarına göre azalan sırada listeler.

## 5. Çalışanların Ad ve Soyadlarını Birleştirerek Yeni Bir Kolon Oluşturma

```sql
SELECT FirstName || ' ' || LastName AS FullName FROM employees;
```

- **||**: String (metin) ifadeleri birleştirmek için kullanılır.
- **AS**: Yeni oluşturulan kolona takma ad (alias) verir.

Bu sorgu, çalışanların ad ve soyadlarını birleştirerek "FullName" adında yeni bir sütun oluşturur.

## 6. NULL Olan Kayıtların Sayısını Bulma (Invoice Tablosu)

```sql
SELECT COUNT(*) AS null_kayit_sayisi
FROM Invoice;
```

- **COUNT**: Belirtilen koşula uyan satırların sayısını döndürür.

Bu sorgu, "Invoice" tablosunda bulunan tüm kayıtların sayısını getirir. Sonuçta dönen değer 412'dir.

## 7. Total Değerlerinin İki Katını Gösterme ve Karşılaştırma

```sql
SELECT 
    total AS eski_total,
    total * 2 AS yeni_total
FROM 
    Invoice
ORDER BY 
    yeni_total DESC; 
```

- **total AS eski_total**: Mevcut total değerini "eski_total" adıyla gösterir.
- **total * 2 AS yeni_total**: Total değerinin iki katını hesaplayıp "yeni_total" sütunu oluşturur.
- **ORDER BY yeni_total DESC**: Sonuçları "yeni_total" sütununa göre azalan sırayla listeler.

Bu sorgu, faturaların toplam değerlerinin iki katını hesaplar ve eski değerle birlikte gösterir. Sonuçlar yeni toplam değere göre büyükten küçüğe sıralanır.

## 8. Adres Kolonundaki Verileri Parçalayarak Yeni Kolon Oluşturma

```sql
SELECT 
    LEFT(billing_address, 3) || RIGHT(billing_address, 4) AS "Açık Adres",
    invoice_date,
    billing_address
FROM 
    Invoice
WHERE 
    EXTRACT(YEAR FROM invoice_date) = 2013 
    AND EXTRACT(MONTH FROM invoice_date) = 8;
```

- **LEFT()**: Metnin başından belirtilen kadar karakter alır.
- **RIGHT()**: Metnin sonundan belirtilen kadar karakter alır.
- **EXTRACT()**: Tarih sütunlarından belirli bir bileşeni (yıl, ay vb.) çıkarır.


Bu sorgu, fatura adreslerinin ilk 3 ve son 4 karakterini birleştirerek yeni bir "Açık Adres" sütunu oluşturur ve yalnızca 2013 yılı Ağustos ayındaki kayıtları getirir.

---


# 🎓 Çevrimiçi Eğitim Platformu Veritabanı Tasarımı (PostgreSQL)

Bu proje, bir çevrimiçi eğitim platformu için PostgreSQL kullanılarak geliştirilen veritabanı şemasıdır. Proje kapsamında kullanıcılar sisteme kayıt olabilir, eğitimlere katılabilir, eğitim sonunda sertifika kazanabilir ve blog gönderileri paylaşarak platformda seviye atlayabilirler.

## 📌 Proje Amacı

- Veritabanı tasarımı prensiplerini uygulamak
- PostgreSQL sorgularıyla pratik yapmak
- Gerçek bir senaryo üzerinden ilişkilendirilmiş veritabanı yapıları kurmak

## 🛠 Kullanılan Teknolojiler

- PostgreSQL
- SQL
- pgAdmin / DBeaver (isteğe bağlı görselleştirme için)

## 📋 İçerik

### 📁 Tablolar

| Tablo Adı              | Açıklama |
|------------------------|----------|
| `members`              | Üye bilgilerini içerir |
| `courses`              | Eğitim bilgilerini içerir |
| `categories`           | Eğitim kategorilerini içerir |
| `enrollments`          | Üyelerin eğitimlere katılımını içerir |
| `certificates`         | Sertifika bilgilerini içerir |
| `certificate_assignments` | Üyelere atanan sertifikaları içerir |
| `blog_posts`           | Üyelerin blog gönderilerini içerir |

### 🔗 Tablolar Arası İlişkiler

![Image Alt](https://github.com/aysekarapinar/DataScienceBootcampSQL/blob/1b4bf568bfd0d52f6c3862f655ef843edd136695/Untitled.png)

- Bir üye birden fazla eğitime katılabilir (`members` ↔ `courses` → `enrollments`)
- Her kurs bir kategoriye aittir (`courses.category_id` → `categories.id`)
- Bir kullanıcı birden fazla sertifika alabilir (`certificate_assignments`)
- Blog gönderileri üyeler tarafından yazılır (`blog_posts.member_id` → `members.id`)

## 💾 Kurulum

1. PostgreSQL yüklü değilse [PostgreSQL](https://www.postgresql.org/download/) yükleyin.
2. `egitim_platformu.sql` dosyasını bir metin editöründe açın ya da doğrudan `psql` komut satırına yükleyin:
   ```bash
   psql -U kullanıcı_adı -d veritabani_adi -f egitim_platformu.sql
