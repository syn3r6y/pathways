<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageCategory.aspx.cs" Inherits="AdminPages_InstituteAdmin_ManageCategory" %>
<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <style type="text/css">
        .height-fix {
            margin: 0 auto;
        }
        .desc-fix {
            max-width:600px !important;
            width:600px;
            height:66px;
        }
        .tdCenter {
            text-align: center; /* center textbox horizontally */
            vertical-align: middle; /* center textbox vertically */
        }
    </style>

    <div id="SuperUserAccess" runat="server" visible="false" align="center">
    <h1>Manage Category</h1>
    <asp:ListView ID="CategoryList" runat="server" DataSourceID="CategoryODS" InsertItemPosition="LastItem" OnItemUpdating="CategoryList_ItemUpdating" OnItemInserting="CategoryList_ItemInserting">
        <AlternatingItemTemplate>
            <tr style="background-color: #efefef;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Update"  CssClass="listview-buttons"/>
                </td>
                <td style="text-align:center;">
                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>'/>
                </td>
                <td>
                    <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryDescriptionLabel" runat="server" Text='<%# Eval("CategoryDescription") %>' />
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Eval("Activated") %>' Enabled="false" />
                </td>
               
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Update"  CssClass="listview-buttons" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel"  CssClass="listview-buttons"/>
                </td>
                <td style="text-align:center;">
                    <asp:Label ID="CategoryIDLabel" enable="false" runat="server" Text='<%# Bind("CategoryID") %>'/>
                </td>
                <td class="tdCenter">
                    <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' class="listview-textbox height-fix"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldCatName" runat="server" ControlToValidate="CategoryNameTextBox" Display="None" ErrorMessage="Category Name is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Update" ValidateRequestMode="Inherit" Text="*">Category Name is required.</asp:RequiredFieldValidator> <br />
                    
                </td>
                <td>

                    <asp:TextBox ID="CategoryDescriptionTextBox" runat="server"  Text='<%# Bind("CategoryDescription") %>' class="listview-textbox desc-fix" TextMode="MultiLine"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldCatDesc" runat="server" ControlToValidate="CategoryDescriptionTextBox" Display="None" ErrorMessage="Category Description is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Update" Text="*">Category Description is required.</asp:RequiredFieldValidator><br />
                           
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Bind("Activated") %>' />
                </td>               
            </tr>
        
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert"  CssClass="listview-buttons"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear"  CssClass="listview-buttons"/>
                </td>
                <td style="text-align:center;">
                    <asp:Label ID="CategoryIDLabel" enable="false" runat="server" Text='<%# Bind("CategoryID") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' class="listview-textbox"  />
                    <asp:RequiredFieldValidator ID="RequiredFieldCatNamee" runat="server" ErrorMessage="Category Name is required." Display="None" Text="*" Font-Underline="False" ControlToValidate="CategoryNameTextBox" SetFocusOnError="True" ValidationGroup="Insert" ForeColor="Red"></asp:RequiredFieldValidator>
                  
                </td>
                <td>
                    <asp:TextBox ID="CategoryDescriptionTextBox" runat="server" width=500px Text='<%# Bind("CategoryDescription") %>' class="listview-textbox desc-fix" TextMode="MultiLine"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldCatDescin" runat="server" ControlToValidate="CategoryDescriptionTextBox" Display="None" ErrorMessage="Category Description is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert" Text="*"></asp:RequiredFieldValidator><br />
                   
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Bind("Activated") %>' />
                </td>                
            </tr>           
        
        </InsertItemTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Update"  CssClass="listview-buttons"/>
                </td>
                <td style="text-align:center;">
                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>'/>
                </td>
                <td>
                    <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryDescriptionLabel" runat="server" Text='<%# Eval("CategoryDescription") %>' />
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Eval("Activated") %>' Enabled="false" />
                </td>
                
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" class="table align-fix" >
                            <tr runat="server"  class="listview-heading align-fix">
                                <th runat="server"></th>
                                <th runat="server" style="text-align:center;" class="align-fix" >Category ID</th>
                                <th runat="server" class="align-fix" style="width:200px;">Category Name</th>
                                <th runat="server" class="align-fix" style="width:620px;">Category Description</th>
                                <th runat="server" style="width:80px;">Currently Active</th>
                                
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" align="center">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="listview-buttons"/>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Update"  CssClass="listview-buttons"/>
                </td>
                <td style="text-align:center;">
                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>'/>
                </td>
                <td>
                    <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryDescriptionLabel" runat="server" Text='<%# Eval("CategoryDescription") %>' />
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Eval("Activated") %>' Enabled="false" />
                </td>
               
            </tr>
        </SelectedItemTemplate>
       
    </asp:ListView>
     <asp:ValidationSummary ID="CategoryUPValidationSummary" runat="server" ShowSummary="False" ShowMessageBox="True" ValidationGroup="Update"/>
     <asp:ValidationSummary ID="CategoryINValidationSummary1" runat="server" ShowSummary="False" ShowMessageBox="True" ValidationGroup="Insert" />
    <asp:ObjectDataSource ID="CategoryODS" runat="server" DataObjectTypeName="Pathway_System.Entities.Category" InsertMethod="Category_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="Pathway_System.BLL.PathwaysController" UpdateMethod="Category_Update"></asp:ObjectDataSource>


        <div class="col-md-12" visible="false">
            <my:MessageUserControl runat="server" ID="MessageUserControl"/>
        </div>

    </div>

    
       

   <div id="RestrictAccess" runat="server" visible="true" class="restrict-access">
        <h3>Access Denied</h3>
        <p>You do not have the required permissions to access this page.</p>
        <p>Please <a href="../../Account/Login.aspx">Login</a> with an authorized account to view.</p>
    </div>


</asp:Content>

