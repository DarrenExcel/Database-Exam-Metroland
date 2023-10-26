--6
SELECT [Toy Type] = mt.ToyName , [Toy Sold] = SUM(sd.SalesQuantity),[Purchase Price] = mt.ToyPurchasePrice, [Sales Price] = mt.ToySalesPrice, [Profit] = ToySalesPrice - ToyPurchasePrice, [Profitable Percentage] = CAST(floor((ToySalesPrice - ToyPurchasePrice) / CONVERT(NUMERIC(18,2),ToyPurchasePrice) * 100) AS VARCHAR) + '%'
FROM MsToy mt
JOIN SalesDetail sd ON sd.ToyID = mt.ToyID
JOIN SalesHeader sh ON sh.SalesID = sd.SalesID
WHERE MONTH(SalesTransactionDate) BETWEEN 1 AND 3 AND YEAR (SalesTransactionDate) = 2022
GROUP BY ToyName, ToyPurchasePrice, ToySalesPrice
--7
SELECT [Toy Type] = mt.ToyName
FROM MsToy mt 
JOIN SalesDetail sd ON sd.ToyID = mt.ToyID
JOIN SalesHeader sh ON sh.SalesID = sd.SalesID
WHERE mt.ToyID IN (
	SELECT sd.ToyID
	FROM SalesDetail sd
	WHERE mt.ToyStock - sd.SalesQuantity = mt.ToyStock
) AND MONTH(SalesTransactionDate) BETWEEN 1 AND 3 AND YEAR (SalesTransactionDate) = 2022
--8
CREATE VIEW ViewCustomer
AS
SELECT [Customer's Name] = mb.BuyerName, [Customer's Phone Number] = mb.buyerPhone
FROM MsBuyer mb