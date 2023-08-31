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
CREATE TRIGGER UpdateOrderStatus
ON Trades
AFTER INSERT
AS
BEGIN
    DECLARE @OrderID INT, @TradeID INT;
    
    SELECT @TradeID = tradeID
    FROM inserted;
    
    SELECT @OrderID = orderID
    FROM Orders
    WHERE orderID = (SELECT orderID FROM Trades WHERE tradeID = @TradeID);
    
    UPDATE Orders
    SET status = 'Executed'
    WHERE orderID = @OrderID;
END
GO
