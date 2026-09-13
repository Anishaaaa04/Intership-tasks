CREATE TABLE orders (
    OrderID VARCHAR2(20),
    OrderDate DATE,
    CustomerID VARCHAR2(20),
    Product VARCHAR2(100),
    Quantity NUMBER,
    UnitPrice NUMBER(10,2),
    ShippingAddress VARCHAR2(200),
    PaymentMethod VARCHAR2(50),
    OrderStatus VARCHAR2(50),
    TrackingNumber VARCHAR2(50),
    ItemsInCart NUMBER,
    CouponCode VARCHAR2(50),
    ReferralSource VARCHAR2(50),
    TotalPrice NUMBER(10,2)
);

-- Total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total revenue
SELECT SUM(TotalPrice) AS total_revenue
FROM orders;

-- Average order value
SELECT AVG(TotalPrice) AS average_order_value
FROM orders;

-- Orders by payment method
SELECT PaymentMethod, COUNT(*) AS total_orders
FROM orders
GROUP BY PaymentMethod;


-- Revenue by product
SELECT Product, SUM(TotalPrice) AS total_revenue
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;

-- Orders above ₹2000
SELECT *
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;

-- Orders by status
SELECT OrderStatus, COUNT(*) AS total_orders
FROM orders
GROUP BY OrderStatus
ORDER BY total_orders DESC;

-- Average quantity by product
SELECT Product, AVG(Quantity) AS average_quantity
FROM orders
GROUP BY Product
ORDER BY average_quantity DESC;