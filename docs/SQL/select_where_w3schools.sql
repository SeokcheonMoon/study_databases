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
