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
---------------------------------


<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="StockMarketSystem.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<asp:GridView ID="StocksGridView" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="StockID" HeaderText="Stock ID" />
        <asp:BoundField DataField="Symbol" HeaderText="Symbol" />
        <asp:BoundField DataField="StockName" HeaderText="Stock Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" />
        <asp:TemplateField HeaderText="Available Quantity">
            <ItemTemplate>
                <asp:Label ID="AvailableQuantityLabel" runat="server" Text='<%# Eval("AvailableQuantity") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox ID="QuantityTextBox" runat="server" Text="0" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="BuyButton" runat="server" Text="Buy" OnClick="BuyButton_Click" CommandArgument='<%# Container.DataItemIndex %>' />
               
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<asp:Label ID="StatusLabel" runat="server" ForeColor="Green" Visible="false"></asp:Label>
<asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    </asp:Content>
