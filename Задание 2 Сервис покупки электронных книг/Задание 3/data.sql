INSERT INTO Categories (category_name) VALUES 
('Fantasy'),
('Science Fiction'),
('Mystery');

INSERT INTO Authors (author_id, author_name) VALUES 
(1, 'J.K. Rowling'),
(2, 'Isaac Asimov'),
(3, 'Agatha Christie'),
(4, 'George Orwell'),
(5, 'Yuval Noah Harari');

INSERT INTO Books (book_id, title, price, publish_year, category_id, downloads) VALUES 
(1, 'Harry Potter and the Philosopher', 20.00, 1997, 1, 800),
(2, 'Foundation', 15.00, 1951, 2, 5000),
(3, 'Murder on the Orient Express', 10.00, 1934, 3, 15000),
(4, '1984', 12.00, 1949, 4, 7000),
(5, 'Sapiens: A Brief History of Humankind', 18.00, 2011, 4, 25000);


INSERT INTO Book_Authors (book_id, author_id) VALUES 
(1, 1),  -- 'Harry Potter and the Philosopher\'s Stone' - автор J.K. Rowling
(2, 2),  -- 'Foundation' - автор Isaac Asimov
(3, 3),  -- 'Murder on the Orient Express' - автор Agatha Christie
(4, 4),  -- '1984' - автор George Orwell
(5, 5);  -- 'Sapiens: A Brief History of Humankind' - автор Yuval Noah Harari

INSERT INTO Book_Authors (book_id, author_id) VALUES 
(5, 4);  -- 'Sapiens: A Brief History of Humankind' - добавим еще одного автора, George Orwell

INSERT INTO Users (username, email, password_hash) VALUES
('alice_j', 'alice.johnson@example.com', 'hash1_example'),
('bob_smith', 'bob.smith@example.com', 'hash2_example'),
('charlie_b', 'charlie.brown@example.com', 'hash3_example');

INSERT INTO Orders (order_id, user_id, order_date, total_price) VALUES 
(1, 2, '2024-09-20', 30,00),
(2, 3, '2024-09-21', 50,00),
(3, 1, '2024-09-22', 45,00);


INSERT INTO Order_Details (order_detail_id, order_id, book_id, quantity, price, downloads ) VALUES 
(1, 1, 1, 1, 20.00, 0),  -- Alice купила одну копию "Harry Potter and the Philosopher's Stone"
(2, 1, 3, 2, 10.00, 0),  -- Alice также купила две копии "Murder on the Orient Express"
(3, 2, 2, 1, 15.00, 0),  -- Bob купил одну копию "Foundation"
(4, 3, 4, 3, 12.00, 0),  -- Charlie купил три копии "1984"
(5, 3, 5, 1, 18.00, 0);  -- Charlie купил одну копию "Sapiens: A Brief History of Humankind"


-- Получение ctid для таблицы Books
SELECT ctid, * FROM Books;

-- Получение ctid для таблицы Authors
SELECT ctid, * FROM Authors;

-- Получение ctid для таблицы Categories
SELECT ctid, * FROM Categories;

-- проверка того, какие записи находятся в какой партиции
SELECT b.*, c.relname AS partition_name
FROM Books b
JOIN pg_class c ON b.tableoid = c.oid;

