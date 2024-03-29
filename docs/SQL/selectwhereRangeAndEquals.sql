-- 조건1 : Country 가 Germany 와 USA가 아닌 것들

-- Number of Records: 67

SELECT * 
FROM Customers
WHERE Country <> 'Germany'
and Country <> "USA"
;
------------------------------------------------------------------------
-- 조건1 : Country 가 Germany 와 USA가 아닌 것들

-- Number of Records: 67

SELECT * 
FROM Customers
WHERE Country NOT IN  ('Germany','USA')
;
------------------------------------------------------------------------
-- 조건2 : CustomerID가 50에서 89이고, City가 Berlin인 고객

-- Number of Records: 0

SELECT * 
FROM Customers
WHERE CustomerID BETWEEN 50 and 89
AND CITY = "Berlin"
;
------------------------------------------------------------------------
--조건 : CustomerID가 50에서 89이고, City가 London인 고객
-- Number of Records: 2
SELECT * 
FROM Customers
WHERE CustomerID BETWEEN 50 and 89
AND CITY = "London"
;