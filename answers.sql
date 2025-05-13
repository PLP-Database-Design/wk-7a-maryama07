Question 1:

1NF.
 Original Table: ProductDetail

| OrderID | CustomerName | Products                |
| ------- | ------------ | ----------------------- |
| 101     | John Doe     | Laptop, Mouse           |
| 102     | Jane Smith   | Tablet, Keyboard, Mouse |
| 103     | Emily Clark  | Phone                   |


Transformed Table in 1NF: ProductDetail_1NF
Each product now has its own row.

| OrderID | CustomerName | Product  |
| ------- | ------------ | -------- |
| 101     | John Doe     | Laptop   |
| 101     | John Doe     | Mouse    |
| 102     | Jane Smith   | Tablet   |
| 102     | Jane Smith   | Keyboard |
| 102     | Jane Smith   | Mouse    |
| 103     | Emily Clark  | Phone    |

-- 1NF: Decomposing multi-valued column into atomic rows
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


Question 2
  
Original Table: OrderDetails in 1NF)

| OrderID | CustomerName | Product  | Quantity |
| ------- | ------------ | -------- | -------- |
| 101     | John Doe     | Laptop   | 2        |
| 101     | John Doe     | Mouse    | 1        |
| 102     | Jane Smith   | Tablet   | 3        |
| 102     | Jane Smith   | Keyboard | 1        |
| 102     | Jane Smith   | Mouse    | 2        |
| 103     | Emily Clark  | Phone    | 1        |

  
1.Transformed Tables in 2NF
Orders Table (OrderID → CustomerName)

  | OrderID | CustomerName |
| ------- | ------------ |
| 101     | John Doe     |
| 102     | Jane Smith   |
| 103     | Emily Clark  |

2.OrderProducts Table (OrderID + Product → Quantity

  | OrderID | Product  | Quantity |
| ------- | -------- | -------- |
| 101     | Laptop   | 2        |
| 101     | Mouse    | 1        |
| 102     | Tablet   | 3        |
| 102     | Keyboard | 1        |
| 102     | Mouse    | 2        |
| 103     | Phone    | 1        |

-- 2NF: Remove partial dependencies
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderProducts
INSERT INTO OrderProducts (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

  



