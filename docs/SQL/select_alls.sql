+ 조건1 : 비 진성고객 리스트 필요

SELECT Customers.CustomerID, Customers.CustomerName, SUB_TABLE.CNT
FROM Customers
LEFT JOIN (SELECT Orders.CustomerID,CustomerName,COUNT(OrderID) AS CNT
          FROM Orders
          LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
          GROUP BY CustomerName) AS SUB_TABLE
		ON Customers.CustomerID = SUB_TABLE.CustomerID
WHERE CNT IS NULL OR CNT <=1
;

-- Number of Records: 3
-- CustomerID	CustomerName	CNT
-- 13	Centro comercial Moctezuma	1
-- 22	FISSA Fabrica Inter. Salchichas S.A.	
-- 57	Paris spécialités	

+ 조건2 : 판매자 중 수익 낮은 순위자 3명 정보, 총 판매액

SELECT Employees.EmployeeID, LastName, FirstName, SUM_SUM
FROM Employees
LEFT JOIN
        (SELECT EmployeeID, SUM(SUM_PRICE) AS SUM_SUM
        FROM Orders
            LEFT JOIN 
            (SELECT OrderID, SUM(PRICE) AS SUM_PRICE
              FROM OrderDetails
              LEFT JOIN 
              (SELECT ProductID,Price FROM Products) AS INFO_PRODUCT
              ON OrderDetails.ProductID = INFO_PRODUCT.ProductID
              GROUP BY OrderID) AS PRICE
              ON Orders.OrderID = PRICE.OrderID
          	GROUP BY EmployeeID) AS FINAL_QUERY
			ON Employees.EmployeeID = FINAL_QUERY.EmployeeID
ORDER BY SUM_SUM ASC
LIMIT 3
;

-- EmployeeID	LastName	FirstName	SUM_SUM
-- 5	Buchanan	Steven	2952.63
-- 9	Dodsworth	Anne	3474.99
-- 6	Suyama	Michael	4099.01

-- 문제는 quantity와 가격을 곱해서 구하지 않고 가격 그대로를 더함.

+ 조건3 : 배송 회사별 총 배송 건수와 총 제품 금액 정보

SELECT Shippers.ShipperID , ShipperName, Phone, COUNT(OrderID), SUM(Sub_Final.Real_Price)
FROM Shippers
LEFT JOIN
          (SELECT Orders.OrderID, ShipperID, 	Real_Price
          FROM Orders
          LEFT JOIN (SELECT OrderID,  SUM(Quantity*Price) AS Real_Price
                    FROM OrderDetails
                    INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
                    GROUP BY OrderID) AS Sub_Talbe
                  ON Orders.OrderID = Sub_Talbe.OrderID) AS Sub_Final
                 ON Shippers.ShipperID = Sub_Final.ShipperID
GROUP BY ShipperID
;

-- ShipperID	ShipperName	Phone	COUNT(OrderID)	SUM(Sub_Final.Real_Price)
-- 1	Speedy Express	(503) 555-9831	249	395931.17
-- 2	United Package	(503) 555-3199	326	610889.89
-- 3	Federal Shipping	(503) 555-9931	255	442546.25

+ 조건4 : 제품 회사별 총 판매액과 정보

SELECT * 
FROM Suppliers
LEFT JOIN (SELECT SupplierID,  SUM(Quantity*Price) AS Real_Price
          FROM OrderDetails
          INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
          GROUP BY SupplierID) AS SUB_TABLE
          ON Suppliers.SupplierID = SUB_TABLE.SupplierID
;

-- SupplierID	SupplierName	ContactName	Address	City	PostalCode	Country	Phone	SupplierID	Real_Price
-- 1	Exotic Liquid	Charlotte Cooper	49 Gilbert St.	Londona	EC1 4SD	UK	(171) 555-2222	1	38267.00
-- 2	New Orleans Cajun Delights	Shelley Burke	P.O. Box 78934	New Orleans	70117	USA	(100) 555-4822	2	36073.55
-- 3	Grandma Kelly's Homestead	Regina Murphy	707 Oxford Rd.	Ann Arbor	48104	USA	(313) 555-5735	3	45295.00
-- 4	Tokyo Traders	Yoshi Nagase	9-8 Sekimai Musashino-shi	Tokyo	100	Japan	(03) 3555-5011	4	35187.00
-- 5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra	Calle del Rosal 4	Oviedo	33007	Spain	(98) 598 76 54	5	27898.00
-- 6	Mayumi's	Mayumi Ohno	92 Setsuko Chuo-ku	Osaka	545	Japan	(06) 431-7877	6	16630.00
-- 7	Pavlova, Ltd.	Ian Devling	74 Rose St. Moonie Ponds	Melbourne	3058	Australia	(03) 444-2343	7	123827.10
-- 8	Specialty Biscuits, Ltd.	Peter Wilson	29 King's Way	Manchester	M14 GSD	UK	(161) 555-4448	8	52152.10
-- 9	PB Knäckebröd AB	Lars Peterson	Kaloadagatan 13	Göteborg	S-345 67	Sweden	031-987 65 43	9	12528.00
-- 10	Refrescos Americanas LTDA	Carlos Diaz	Av. das Americanas 12.890	São Paulo	5442	Brazil	(11) 555 4640	10	5062.50
-- 11	Heli Süßwaren GmbH & Co. KG	Petra Winkler	Tiergartenstraße 5	Berlin	10785	Germany	(010) 9984510	11	43991.69
-- 12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	Bogenallee 51	Frankfurt	60439	Germany	(069) 992755	12	165370.59
-- 13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Frahmredder 112a	Cuxhaven	27478	Germany	(04721) 8713	13	15844.68
-- 14	Formaggi Fortini s.r.l.	Elio Rossi	Viale Dante, 75	Ravenna	48100	Italy	(0544) 60323	14	55015.30
-- 15	Norske Meierier	Beate Vileid	Hatlevegen 5	Sandvika	1320	Norway	(0)2-953010	15	50317.00
-- 16	Bigfoot Breweries	Cheryl Saylor	3400 - 8th Avenue Suite 210	Bend	97101	USA	(503) 555-9931	16	25554.00
-- 17	Svensk Sjöföda AB	Michael Björn	Brovallavägen 231	Stockholm	S-123 45	Sweden	08-123 45 67	17	22940.00
-- 18	Aux joyeux ecclésiastiques	Guylène Nodier	203, Rue des Francs-Bourgeois	Paris	75004	France	(1) 03.83.00.68	18	178434.50
-- 19	New England Seafood Cannery	Robb Merchant	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	02134	USA	(617) 555-3267	19	29761.85
-- 20	Leka Trading	Chandra Leka	471 Serangoon Loop, Suite #402	Singapore	0512	Singapore	555-8787	20	48127.45
-- 21	Lyngbysild	Niels Petersen	Lyngbysild Fiskebakken 10	Lyngby	2800	Denmark	43844108	21	11402.00
-- 22	Zaanse Snoepfabriek	Dirk Luchte	Verkoop Rijnweg 22	Zaandam	9999 ZZ	Netherlands	(12345) 1212	22	6367.00
-- 23	Karkki Oy	Anne Heikkonen	Valtakatu 12	Lappeenranta	53120	Finland	(953) 10956	23	31876.75
-- 24	G'day, Mate	Wendy Mackenzie	170 Prince Edward Parade Hunter's Hill	Sydney	2042	Australia	(02) 555-5914	24	74139.60
-- 25	Ma Maison	Jean-Guy Lauzon	2960 Rue St. Laurent	Montréal	H1J 1C3	Canada	(514) 555-9022	25	27296.75
-- 26	Pasta Buttini s.r.l.	Giovanni Giudici	Via dei Gelsomini, 153	Salerno	84100	Italy	(089) 6547665	26	56457.00
-- 27	Escargots Nouveaux	Marie Delamare	22, rue H. Voiron	Montceau	71300	France	85.57.00.07	27	7075.50
-- 28	Gai pâturage	Eliane Noz	Bat. B 3, rue des Alpes	Annecy	74000	France	38.76.98.06	28	135898.00
-- 29	Forêts d'érables	Chantal Goulet	148 rue Chasseur	Ste-Hyacinthe	J2S 7S8	Canada	(514) 555-2955	29	70577.40

+ 조건5 : 카테고리별 판매 합계 정보

SELECT CategoryID,  SUM(Quantity*Price) AS Real_Price
FROM OrderDetails
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY CategoryID


-- CategoryID	Real_Price
-- 1	309582.25
-- 2	122343.00
-- 3	190328.54
-- 4	269128.30
-- 5	106848.00
-- 6	190682.69
-- 7	111395.00
-- 8	149059.53