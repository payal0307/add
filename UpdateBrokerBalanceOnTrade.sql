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
CREATE TRIGGER UpdateBrokerBalanceOnTrade
ON Trades
AFTER INSERT
AS
BEGIN
    -- Avoid sending additional result sets
    SET NOCOUNT ON;

    -- Declare variables for broker information and commission calculations
    DECLARE @BrokerID INT, @CommissionRate DECIMAL(10, 2), @TotalCommission DECIMAL(18, 2);

    -- Retrieve broker information and calculate total commission
    SELECT
        @BrokerID = i.brokerID,
        @CommissionRate = b.commissionRate,
        @TotalCommission = b.commissionRate * i.quantity * i.price
    FROM inserted i
    INNER JOIN Brokers b ON i.brokerID = b.brokerID;

    -- Begin transaction to ensure data consistency
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Update broker's balance with the calculated total commission
        UPDATE Balances
        SET amount = amount + @TotalCommission
        WHERE userID = @BrokerID;

        -- Log the transaction in the BrokerTransactionLog table
        INSERT INTO BrokerTransactionLog (brokerID, transactionType, amount)
        VALUES (@BrokerID, 'Credit', @TotalCommission);

        -- Commit the transaction if everything is successful
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction in case of an error
        ROLLBACK;
    END CATCH;
END;
GO
