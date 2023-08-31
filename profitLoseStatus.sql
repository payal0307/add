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
CREATE TRIGGER profitLoseStatus
ON Trades
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @buyingPrice DECIMAL(18, 2);
    DECLARE @profitLoss DECIMAL(18, 2);
    DECLARE @profitLossStatus VARCHAR(20);

    SELECT @buyingPrice = closePrice
    FROM PriceHistory
    WHERE stockID = (SELECT stockID FROM inserted) AND tradeDate = (SELECT tradeDate FROM inserted);

    SET @profitLoss = (SELECT (i.price - @buyingPrice) * i.quantity FROM inserted AS i);

    IF @profitLoss > 0 
        SET @profitLossStatus = 'Profit';
    ELSE
        SET @profitLossStatus = 'Loss';

		UPDATE Portfolio
    SET profitLossStatus = @profitLossStatus
    WHERE stockID = (SELECT stockID FROM inserted);
END;
--use stockMarketDB1

GO
--INSERT INTO Trades VALUES ( 1, 2, 1, 5, 150.45,getdate())
--inserted.price > Portfolio.closePrice
GO
