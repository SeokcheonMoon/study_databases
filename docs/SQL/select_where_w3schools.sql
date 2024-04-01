SELECT * 
FROM Customers
WHERE City IN ('London','Berlin') AND CustomerID <= 11; 
WHERE CustomerID = 80
WHERE CustomerID <> 80
WHERE CustomerID BETWEEN 20 AND 30
WHERE CustomerID >= 20 AND CustomerID <= 30
WHERE CustomerID in (1,5,10,15)
WHERE City IN ('London','Berlin');

-- ORDER By 추가
-- ASC는 오름차순 DESC는 내림차순
SELECT ProductName,CategoryID,Price
FROM Products
ORDER By CategoryID ASC, Price ASC   -- 어느 카테고리 먼저 적느냐에 따라 우선순위가 다름
;

-- GROUP BY
-- 이건 COUNT를 기준으로 value_counts()라고 생각하면 됨 (집계함수)
SELECT COUNT(Country),Country
FROM Customers
GROUP BY Country
;

-- GROUP BY
-- AS 는 컬럼명을 재지정할때 사용
SELECT COUNT(CustomerID) AS CNT, MAX(PostalCode) AS MAX_POST, Country
FROM Customers
GROUP BY Country;

-- GROUP BY와 HAVING BY
-- HAVING BY는 GROUP BY 내에서의 또다른 조건이라 생각하면 된다.
SELECT COUNT(CustomerID) AS CNT, Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) >= 5;

-- SUB쿼리 쓰는법 
-- SUB쿼리는 SELECT,FROM 어디든 다 적용할 수 있다!
-- SUB쿼리 내에 있는 데이터를 가져오려면 SUB_QUERY.(Data) 이런식으로 가져올 수 있음.
SELECT SUB_ORDERS.CNT,SUB_ORDERS.CustomerID
FROM (SELECT COUNT(CustomerID) AS CNT, CustomerID
      FROM Orders
      GROUP BY CustomerID
      HAVING COUNT(CustomerID) >= 5
      ORDER BY CustomerID ASC
)AS SUB_ORDERS
;

-- IS NULL
-- 결측치 처리방법
-- IS NULL 사용시 결측값이 존재하는 데이터 표시.
-- IS NOT NULL 사용시 결측값이 존재하지 않는 데이터 표시.
-- LIMIT 사용시 a번째 중 b만큼 사용
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT null
ORDER BY CustomerName ASC
LIMIT 5, 2
;
