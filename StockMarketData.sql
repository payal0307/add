-- Users
use stockMarketDB2
INSERT INTO Users VALUES ( 'jiya', 'jiya@gmail.com', 5000.00, 1)
INSERT INTO Users VALUES ( 'riya',  'riya@gmail.com', 7500.00,2)
select * from Users

INSERT INTO Brokers VALUES ( 'yash',  'india')
INSERT INTO Brokers VALUES ( 'riyansh',  'india')

-- Stocks
INSERT INTO Stocks VALUES('AAPL', 'Apple Inc.', 'Technology', 'Consumer Electronics',1)
INSERT INTO Stocks VALUES    ( 'MSFT', 'Microsoft Corporation',  'Technology', 'Software',2)
select * from Stocks
-- Orders
use stockMarketDB1
select * from Trades
 INSERT INTO Orders VALUES   ( 1, 1, 'Buy', 10, 150.25, getdate(),  'Pending')
INSERT INTO Orders VALUES     ( 2, 2, 'Sell', 5, 100.50,getdate() ,  'Pending')

-- Trades
INSERT INTO Trades VALUES ( 1, 2, 1, 5, 150.55,getdate())
INSERT INTO Trades VALUES ( 1, 1, 2, 10, 310.25, getdate())
select * from Portfolio
-- Balances
INSERT INTO Balances VALUES( 1, 4000.00, getdate())
 INSERT INTO Balances values ( 2, 7000.00, getdate())

-- Transactions
INSERT INTO Transactions VALUES ( 1, 1, 'Buy', 10, 150.25, getdate())
INSERT INTO Transactions VALUES ( 2, 2, 'Sell', 5, 300.50, getdate())



-- Portfolio
INSERT INTO Portfolio VALUES ( 1, 1, 150,'profit')
INSERT INTO Portfolio VALUES ( 2, 2, 75 ,'lose')

-- Watchlist
INSERT INTO Watchlist VALUES ( 1, 2)
INSERT INTO Watchlist VALUES ( 2, 1)

INSERT INTO PriceHistory VALUES ( 1, 145.00, 155.00, 142.50, 152.75, 10000, getdate())
INSERT INTO PriceHistory VALUES ( 1, 153.00, 158.50, 150.25, 157.50, 12000, getdate())


INSERT INTO Exchange VALUES (1, 'AAPL', 'Apple Inc.',       157.50,   120000,   'NSE',getdate())
INSERT INTO Exchange VALUES (2, 'MSFT', 'Microsoft Corporation',  310.25,   85000,  'BSE',getdate())



    (3, 'RELIANCE', 'Reliance Industries Ltd.', 2500.75, 50000, 'NSE'),
    (4, 'TCS', 'Tata Consultancy Services Ltd.', 3500.25, 60000, 'BSE');
	