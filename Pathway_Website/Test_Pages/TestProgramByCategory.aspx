<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TestProgramByCategory.aspx.cs" Inherits="Test_Pages_TestProgramByCategory" %>

<asp:Content ID="Test_ProgramByCategory" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1 style="font-weight:bold;">Test For Getting Program By Category</h1>
    <h2 style="font-weight:bold;">Category</h2>
    <asp:DropDownList ID="DL_Allcategories" runat="server" 
        DataSourceID="ODS_AllCategories" 
        DataTextField="CategoryName" 
        DataValueField="CategoryID"
        AppendDataBoundItems="true" AutoPostBack="True">      
        <asp:ListItem Value="">Select a Category</asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ODS_AllCategories" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Category_List" 
        TypeName="Pathway_System.BLL.TestDataController" />

    <h2 style="font-weight:bold;">Program</h2>
    <asp:GridView ID="GV_Programs" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ODS_Programs">
        <Columns>
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
            <asp:BoundField DataField="CategoryDescription" HeaderText="CategoryDescription" SortExpression="CategoryDescription" />
            <asp:BoundField DataField="ProgramName" HeaderText="ProgramName" SortExpression="ProgramName" />
            <asp:BoundField DataField="CredentialType" HeaderText="CredentialType" SortExpression="CredentialType" />
        </Columns>
        <EmptyDataTemplate>
            No data available now
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ODS_Programs" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProgramByCategory" TypeName="Pathway_System.BLL.TestDataController">
        <SelectParameters>
            <asp:ControlParameter ControlID="DL_Allcategories" Name="CateID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

