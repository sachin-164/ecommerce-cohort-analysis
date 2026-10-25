USE retail_project;

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10, 4),
    CustomerID INT,
    Country VARCHAR(100),
    InvoiceMonth VARCHAR(10)
);


-- Load the data into Mysql 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/cleaned_retail_data.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- View the data
SELECT * FROM transactions
limit 10;




-- finding a first month a customer ever shopped
WITH FirstPurchase AS (
	SELECT CustomerID, MIN(InvoiceMonth) AS CohortMonth
    FROM transactions
    GROUP BY CustomerID
)
SELECT * FROM FirstPurchase
ORDER BY CustomerID
LIMIT 5;





-- How many months have passed between the customer's very first purchase and this current transaction?
WITH FirstPurchase AS (
	SELECT CustomerID, MIN(InvoiceMonth) AS CohortMonth
    FROM transactions
    GROUP BY CustomerID
),
CohortData AS (
	SELECT t.CustomerID,f.CohortMonth,
    TIMESTAMPDIFF(MONTH,
			STR_TO_DATE(CONCAT(f.CohortMonth, '-01'),'%Y-%m-%d'),
            STR_TO_DATE(CONCAT(t.InvoiceMonth,'-01'),'%Y-%m-%d')
	) AS MonthIndex
    FROM transactions t
    JOIN FirstPurchase f
		ON t.CustomerID = f.CustomerID
)
SELECT * FROM CohortData
# ORDER BY CustomerID DESC
LIMIT 100;





-- Out of all the customers who started in a specific month, how many unique individuals actually came back to make a purchase in the following months?
WITH FirstPurchase AS (
	SELECT CustomerID, MIN(InvoiceMonth) AS CohortMonth
    FROM transactions
    GROUP  BY CustomerID
),
CohortData AS (
	SELECT t.CustomerID, c.CohortMonth,
    TIMESTAMPDIFF(MONTH,
		STR_TO_DATE(CONCAT(c.CohortMonth,'-01'),'%Y-%m-%d'),
        STR_TO_DATE(CONCAT(t.InvoiceMonth,'-01'),'%Y-%m-%d')
	) AS MonthIndex
    FROM transactions t 
    JOIN FirstPurchase c
    ON t.CustomerID  = c.CustomerID
)
SELECT CohortMonth, MonthIndex, COUNT(DISTINCT CustomerID) AS ActiveCustomers
FROM CohortData
GROUP BY CohortMonth, MonthIndex
ORDER BY CohortMonth, MonthIndex;