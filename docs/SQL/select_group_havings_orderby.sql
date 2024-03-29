-- - Table : Products
-- + 조건 : CategoryID 가 10개 이상
SELECT COUNT(CategoryID) AS Count_ID,CategoryID
FROM Products
GROUP BY CategoryID
HAVING COUNT(CategoryID) >= 10
;

