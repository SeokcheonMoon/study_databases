
-- - Table : Customers, Orders
-- + 조건 : CustomerName별로 주문 건수 표시

SELECT COUNT(CustomerName) AS ORDER_COUNT,CustomerName
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY CustomerName
;

-- ORDER_COUNT	CustomerName
-- 6	Alfreds Futterkiste
-- 4	Ana Trujillo Emparedados y helados
-- 7	Antonio Moreno Taquería
-- 13	Around the Horn
-- 10	B's Beverages
-- 18	Berglunds snabbköp
-- 7	Blauer See Delikatessen
-- 11	Blondel père et fils
-- 3	Bólido Comidas preparadas
-- 17	Bon app'
-- 14	Bottom-Dollar Marketse
-- 6	Cactus Comidas para llevar
-- 1	Centro comercial Moctezuma
-- 8	Chop-suey Chinese
-- 5	Comércio Mineiro
-- 3	Consolidated Holdings
-- 10	Die Wandernde Kuh
-- 6	Drachenblut Delikatessend
-- 4	Du monde entier
-- 8	Eastern Connection
-- 30	Ernst Handel
-- 7	Familia Arquibaldo
-- 5	Folies gourmandes
-- 19	Folk och fä HB
-- 3	France restauration
-- 6	Franchi S.p.A.
-- 15	Frankenversand
-- 8	Furia Bacalhau e Frutos do Mar
-- 5	Galería del gastrónomo
-- 10	Godos Cocina Típica
-- 9	Gourmet Lanchonetes
-- 11	Great Lakes Food Market
-- 2	GROSELLA-Restaurante
-- 14	Hanari Carnes
-- 18	HILARIÓN-Abastos
-- 5	Hungry Coyote Import Store
-- 19	Hungry Owl All-Night Grocers
-- 10	Island Trading
-- 14	Königlich Essen
-- 4	La corne d'abondance
-- 14	La maison d'Asie
-- 3	Laughing Bacchus Wine Cellars
-- 2	Lazy K Kountry Store
-- 15	Lehmanns Marktstand
-- 4	Let's Stop N Shop
-- 14	LILA-Supermercado
-- 12	LINO-Delicateses
-- 8	Lonesome Pine Restaurant
-- 10	Magazzini Alimentari Riuniti
-- 7	Maison Dewey
-- 13	Mère Paillarde
-- 5	Morgenstern Gesundkost
-- 3	North/South
-- 5	Océano Atlántico Ltda.
-- 10	Old World Delicatessen
-- 9	Ottilies Käseladen
-- 6	Pericles Comidas clásicas
-- 10	Piccolo und mehr
-- 6	Princesa Isabel Vinhoss
-- 9	Que Delícia
-- 13	Queen Cozinha
-- 28	QUICK-Stop
-- 5	Rancho grande
-- 18	Rattlesnake Canyon Grocery
-- 12	Reggiani Caseifici
-- 11	Ricardo Adocicados
-- 10	Richter Supermarkt
-- 5	Romero y tomillo
-- 6	Santé Gourmet
-- 31	Save-a-lot Markets
-- 9	Seven Seas Imports
-- 7	Simons bistro
-- 4	Spécialités du monde
-- 9	Split Rail Beer & Ale
-- 12	Suprêmes délices
-- 4	The Big Cheese
-- 3	The Cracker Box
-- 5	Toms Spezialitäten
-- 10	Tortuga Restaurante
-- 7	Tradição Hipermercados
-- 3	Trail's Head Gourmet Provisioners
-- 11	Vaffeljernet
-- 10	Victuailles en stock
-- 4	Vins et alcools Chevalier
-- 15	Wartian Herkku
-- 9	Wellington Importadora
-- 14	White Clover Markets
-- 8	Wilman Kala
-- 7	Wolski

- Table : OrderDetails 
+ 조건 : 제품명,가격, 주문 제품 갯수, 고객명 표시


- Table : Orders
+ 조건 : 가장 많이 주문 받은 회사 직원명과 갯수