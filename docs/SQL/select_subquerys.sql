문제 1 주문 갯수가 5개 이상인 CustomerName 찾기
Table : Customers, Orders

SELECT * 
FROM (SELECT COUNT(CustomerID) AS CNT,CustomerID 
      FROM Orders
      GROUP BY CustomerID
      ORDER BY CNT DESC
      ) AS SUB_ORDERS
WHERE CNT >=5
;
-- [정답]

-- CustomerName
-- Alfreds Futterkiste
-- Antonio Moreno Taquería
-- Around the Horn
-- Berglunds snabbköp
-- Blauer See Delikatessen
-- Blondel père et fils
-- Bon app'
-- Bottom-Dollar Marketse
-- B's Beverages
-- Cactus Comidas para llevar
-- Chop-suey Chinese
-- Comércio Mineiro
-- Drachenblut Delikatessend
-- Eastern Connection
-- Ernst Handel
-- Familia Arquibaldo
-- Folies gourmandes
-- Folk och fä HB
-- Frankenversand
-- Franchi S.p.A.
-- Furia Bacalhau e Frutos do Mar
-- Galería del gastrónomo
-- Godos Cocina Típica
-- Gourmet Lanchonetes
-- Great Lakes Food Market
-- Hanari Carnes
-- HILARIÓN-Abastos
-- Hungry Coyote Import Store
-- Hungry Owl All-Night Grocers
-- Island Trading
-- Königlich Essen
-- La maison d'Asie
-- Lehmanns Marktstand
-- LILA-Supermercado
-- LINO-Delicateses
-- Lonesome Pine Restaurant
-- Magazzini Alimentari Riuniti
-- Maison Dewey
-- Mère Paillarde
-- Morgenstern Gesundkost
-- Océano Atlántico Ltda.
-- Old World Delicatessen
-- Ottilies Käseladen
-- Pericles Comidas clásicas
-- Piccolo und mehr
-- Princesa Isabel Vinhoss
-- Que Delícia
-- Queen Cozinha
-- QUICK-Stop
-- Rancho grande
-- Rattlesnake Canyon Grocery
-- Reggiani Caseifici
-- Ricardo Adocicados
-- Richter Supermarkt
-- Romero y tomillo
-- Santé Gourmet
-- Save-a-lot Markets
-- Seven Seas Imports
-- Simons bistro
-- Split Rail Beer & Ale
-- Suprêmes délices
-- Toms Spezialitäten
-- Tortuga Restaurante
-- Tradição Hipermercados
-- Vaffeljernet
-- Victuailles en stock
-- Die Wandernde Kuh
-- Wartian Herkku
-- Wellington Importadora
-- White Clover Markets
-- Wilman Kala
-- Wolski

문제 2 : 주문 건수 20개 이상을 받은 판매자 정보
Table : Orders

SELECT *
FROM Employees
WHERE EmployeeID in (
      SELECT EmployeeID
      FROM Orders
      GROUP BY EmployeeID
      HAVING COUNT(EmployeeID) >= 20   
)
;

-- EmployeeID	LastName	FirstName	BirthDate	Photo	Notes
-- 1	Davolio	Nancy	1968-12-08	EmpID1.pic	Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
-- 2	Fuller	Andrew	1952-02-19	EmpID2.pic	Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
-- 3	Leverling	Janet	1963-08-30	EmpID3.pic	Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
-- 4	Peacock	Margaret	1958-09-19	EmpID4.pic	Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.
-- 5	Buchanan	Steven	1955-03-04	EmpID5.pic	Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses 'Successful Telemarketing' and 'International Sales Management'. He is fluent in French.
-- 6	Suyama	Michael	1963-07-02	EmpID6.pic	Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses 'Multi-Cultural Selling' and 'Time Management for the Sales Professional'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.
-- 7	King	Robert	1960-05-29	EmpID7.pic	Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled 'Selling in Europe', he was transferred to the London office.
-- 8	Callahan	Laura	1958-01-09	EmpID8.pic	Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.
-- 9	Dodsworth	Anne	1969-07-02	EmpID9.pic	Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.

문제 3 CategoryID를 가장 많이 제공 상위 2개 회사 정보
Table : Suppliers, Products

SELECT COUNT(CategoryID),SupplierID
      FROM Products
      GROUP BY SupplierID
      ORDER BY COUNT(CategoryID) DESC
      HAVING COUNT(CategoryID)
;                                       ----------> 여기서 COUNT(CategoryID)가 5가 가장 많음을 확인

SELECT * 
FROM Suppliers
WHERE SupplierID in (
      SELECT SupplierID
      FROM Products
      GROUP BY SupplierID
      HAVING COUNT(CategoryID) = 5      
      )
;

-- SupplierID	SupplierName	ContactName	Address	City	PostalCode	Country	Phone
-- 7	Pavlova, Ltd.	Ian Devling	74 Rose St. Moonie Ponds	Melbourne	3058	Australia	(03) 444-2343
-- 12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	Bogenallee 51	Frankfurt	60439	Germany	(069) 992755