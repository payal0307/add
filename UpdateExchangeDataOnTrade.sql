-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER UpdateExchangeDataOnTrade
ON Trades
AFTER INSERT
AS
BEGIN
    DECLARE @StockID INT, @Quantity INT, @Price DECIMAL(18, 2);;

    -- Get the relevant trade details
    SELECT @StockID = inserted.stockID,
           @Quantity = inserted.quantity,
		   @Price =inserted.price
    FROM inserted;

    -- Update the exchange data
    UPDATE Exchange
    SET LastPrice = inserted.price,
        Volume = Volume + @Quantity
		FROM Exchange
		JOIN inserted ON Exchange.stockID = inserted.stockID
    WHERE Exchange.StockID = @StockID;
END;
GO
--INSERT INTO Trades VALUES ( 1, 1, 2, 5, 110.00, getdate())
