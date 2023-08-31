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
CREATE TRIGGER UpdateBalances
ON Trades
AFTER INSERT
AS
BEGIN

    -- Update buyer's balance
    UPDATE Balances
    SET amount = amount - (inserted.quantity * inserted.price),
        lastUpdated = GETDATE()
    WHERE userID = inserted.buyerUserID;

    -- Update seller's balance
    UPDATE Balances
    SET amount = amount + (inserted.quantity * inserted.price),
        lastUpdated = GETDATE()
    WHERE userID = inserted.sellerUserID;
END
GO
--use stockMarketDB2
