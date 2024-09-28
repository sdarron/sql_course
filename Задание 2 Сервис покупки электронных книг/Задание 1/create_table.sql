CREATE TABLE Users (
    user_id BIGSERIA PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    book_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    publish_year INT,
    category_id INT,     
    downloads INT DEFAULT 0,   
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Authors (
    author_id BIGSERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE Categories (
    category_id BIGSERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE Orders (
    order_id BIGSERIAL PRIMARY KEY,
    user_id INT,
    order_date timestamp NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Order_Details (
    order_detail_id BIGSERIAL PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    downloads INT NOT NULL,  
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
