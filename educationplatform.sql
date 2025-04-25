
-- Veritabanı oluşturma (isteğe bağlı)
-- CREATE DATABASE education_platform;
-- \c education_platform

-- Üyeler (Members) Tablosu
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Eğitimler (Courses) Tablosu
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100)
);

-- Kategoriler (Categories) Tablosu
CREATE TABLE categories (
    category_id SMALLINT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Eğitimler - Kategoriler İlişkisi (Çoktan-Bire)
ALTER TABLE courses
ADD COLUMN category_id SMALLINT,
ADD CONSTRAINT fk_course_category FOREIGN KEY (category_id) REFERENCES categories(category_id);

-- Katılımlar (Enrollments) Tablosu
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_enrollment_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT uc_member_course UNIQUE (member_id, course_id)
);

-- Sertifikalar (Certificates) Tablosu
CREATE TABLE certificates (
    certificate_id SERIAL PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE
);

-- Sertifika Atamaları (CertificateAssignments) Tablosu
CREATE TABLE certificate_assignments (
    assignment_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    certificate_id INTEGER NOT NULL,
    received_date DATE,
    CONSTRAINT fk_assignment_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_assignment_certificate FOREIGN KEY (certificate_id) REFERENCES certificates(certificate_id),
    CONSTRAINT uc_member_certificate UNIQUE (member_id, certificate_id)
);

-- Blog Gönderileri (BlogPosts) Tablosu
CREATE TABLE blog_posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INTEGER NOT NULL,
    CONSTRAINT fk_blog_author FOREIGN KEY (author_id) REFERENCES members(member_id)
);