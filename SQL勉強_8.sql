CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    price INT,
    discount INT
);

INSERT INTO product(name, price, discount)
VALUES
('노트북', 1500000, 10),
('마우스', 30000, NULL),
('키보드', NULL, 15),
('모니터', 250000, NULL),
('스피커', NULL, NULL);


select * from product;

	SELECT
		name,
		IFNULL(price, 0) AS price,
        NULLIF(discount, 15) AS discount
	FROM product;
    
    SELECT
    name,
    COALESCE(price, discount, 0) AS value
FROM product;
    
    
SELECT *
FROM product
WHERE price IS NULL;    