--Çalışanların sadece FirstName, LastName ve Salary bilgilerini getiren bir SQL sorgusu yazınız.

SELECT FirstName, LastName, Salary FROM employees;

/*
select; kolonları görüntülemek için kullanıyoruz
from; tablo isimi veya tablo isimleri için kullanıyoruz (birden fazla tablo olabilir)
Çalışanlar tablosundan ilk ad, son ad ve maaş bilgilerinin getirilmesi için yazılan sorgudur.
*/

--Çalışanların çalıştıkları departmanları benzersiz olarak listeleyen bir SQL sorgusu yazınız.

SELECT DISTINCT DepartmentName FROM departments;

/*
DISTINCT; Tekrarlayan verileri kaldıran komuttur.
*/

--Sadece IT departmanında çalışanların bilgilerini getiren bir SQL sorgusu yazınız.

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Age, e.Salary, e.JoinDate, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = e.DepartmentID
WHERE d.DepartmentName = 'IT';

/*
SELECT: Çıktıya hangi sütunları almak istediğimizi belirtiriz. Burada, EmployeeID, FirstName, LastName, Age, Salary, ve JoinDate sütunları seçilir
FROM Employees e: Employees tablosundan veri çekiyoruz ve tabloya e takma adı verilir.
JOIN Departments d ON e.Department = d.DepartmentName: Employees tablosundaki Department sütunu ile Departments tablosundaki DepartmentName sütununu birleştirilir. Bu sayede her çalışanın hangi departmanda olduğunu eşleştirilir.
WHERE d.DepartmentName = 'IT': Son olarak, sadece IT departmanındaki çalışanları getirmek için WHERE koşulu eklenir.
*/


--Çalışanların çalıştıkları departmanları benzersiz olarak listeleyen bir SQL sorgusu yazınız.

--Çalışanları maaşlarına göre büyükten küçüğe sıralayan bir SQL sorgusu yazınız.
 
 SELECT * FROM employees 
 ORDER BY salary DESC;

/* 
ORDER BY; verileri  büyükten küçüğe veya küçükten büyüğe doğru sıralayabiliriz.
DESC; Büyükten küçüğe doğru sıralama yapar.
*/

--Çalışanların FirstName ve LastName alanlarını birleştirerek, tam adlarını içeren yeni bir kolon oluşturan bir SQL sorgusu yazınız.

SELECT FirstName || ' ' || LastName AS FullName FROM employees;

/* 
Concatenation operatörü(||); sütunları birleştirmeye ve tek çıktı olmasına yarar.
Birleştirme operatörü sayesinde FirstName tablosundaki isim ve LastName tablosundaki soy isimler yeni bir kolonda gösterilir.
AS; Tablolara ve sütunlara takma ad vermek için kullanılır. İsim ve soy isim birleştirmeden dolayı oluşan tabloya FullName ismini vererek tabloya isim verilir.
*/