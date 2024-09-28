CREATE TABLE Books (
    book_id BIGSERIAL,
    downloads INT,   
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    publish_year INT,
    category_id INT,
    PRIMARY KEY (book_id, downloads),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
)  PARTITION BY RANGE (downloads);

CREATE TABLE Books_p1 PARTITION OF Books
    FOR VALUES FROM (0) TO (1000);

CREATE TABLE Books_p2 PARTITION OF Books
    FOR VALUES FROM (1000) TO (10000);

CREATE TABLE Books_p3 PARTITION OF Books
    FOR VALUES FROM (10000) TO (MAXVALUE);