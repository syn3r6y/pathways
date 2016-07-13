<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DBConnectionTest.aspx.cs" Inherits="TestData_Pages_DBConnectionTest" %>

<asp:Content ID="Content_TestDataCategory" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Label ID="Title_TestDataCategory" runat="server" Text="Test Data Category" Font-Size="Larger" Font-Bold="true"
         ForeColor="#0080ff"></asp:Label>
    <br />
    <br />
    <!--We need AppendDataBoundItems to show/append the item we add manully-->
    <asp:DropDownList ID="DL_TestDataCategory" runat="server" DataSourceID="ODS_TestDataCategory" DataTextField="CategoryName" DataValueField="CategoryID"
         AppendDataBoundItems="true">

        <asp:ListItem Value="">Select a Category</asp:ListItem>

    </asp:DropDownList>

    <asp:ObjectDataSource ID="ODS_TestDataCategory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="Pathway_System.BLL.TestDataController"></asp:ObjectDataSource>
</asp:Content>

