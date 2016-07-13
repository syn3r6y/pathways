<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageCourse.aspx.cs" Inherits="AdminPages_SuperUser_ManageCourse" %>
<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="SuperUserAccess" runat="server" visible="false" align="center">
    <h1>Manage Course</h1>
   
    <asp:ListView ID="CourseList" runat="server" DataSourceID="CourseODS" InsertItemPosition="LastItem" 
        OnItemInserting="CourseList_ItemInserting" OnItemUpdating="CourseList_ItemUpdating">
        <AlternatingItemTemplate>
            <tr style="background-color: #efefef;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit"  CssClass="listview-buttons"/>
                </td>
                <td>
                    <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                </td>
                <td>
                    <asp:Label ID="SubjectNameLabel" runat="server" Text='<%# Eval("SubjectName") %>' />
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Eval("Activated") %>' Enabled="false" />
                </td>
               
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Update" CssClass="listview-buttons"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="listview-buttons"/>
                </td>
                <td>
                    <asp:Label ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SubjectNameTextBox" runat="server" Text='<%# Bind("SubjectName") %>' class="listview-textbox"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldSubNameed" runat="server" ControlToValidate="SubjectNameTextBox" Display="None" ErrorMessage="Subject Name is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Update" ValidateRequestMode="Inherit" Text="*">Subject Name is required.</asp:RequiredFieldValidator> <br />
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
            <tr>
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"  ValidationGroup="Insert" CssClass="listview-buttons"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="listview-buttons"/>
                </td>
                <td>
                    <asp:Label ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SubjectNameTextBox" runat="server" Text='<%# Bind("SubjectName") %>' class="listview-textbox"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldSubName" runat="server" ControlToValidate="SubjectNameTextBox" Display="None" ErrorMessage="Subject Name is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert" ValidateRequestMode="Inherit" Text="*">Subject Name is required.</asp:RequiredFieldValidator>             
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Bind("Activated") %>' />
                </td>
                
            </tr>
              
        </InsertItemTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="listview-buttons"/>
                </td>
                <td>
                    <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                </td>
                <td>
                    <asp:Label ID="SubjectNameLabel" runat="server" Text='<%# Eval("SubjectName") %>' />
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
                        <table id="itemPlaceholderContainer" runat="server" border="0" class="table align-fix">
                            <tr runat="server" class="listview-heading align-fix">
                                <th runat="server"></th>
                                <th runat="server">Course ID</th>
                                <th runat="server">Subject Name</th>
                                <th runat="server" style="text-align:center; margin-right:10px !important;">Currently Active</th>
                                
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" align="center">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="7">
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
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="listview-buttons"/>
                </td>
                <td>
                    <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                </td>
                <td>
                    <asp:Label ID="SubjectNameLabel" runat="server" Text='<%# Eval("SubjectName") %>' />
                </td>
                <td align="center">
                    <asp:CheckBox ID="ActivatedCheckBox" runat="server" Checked='<%# Eval("Activated") %>' Enabled="false" />
                </td>
                
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
         <asp:ValidationSummary ID="CourseUPValidationSummary" runat="server" ShowMessageBox="True" ShowSummary="False"  ValidationGroup="Update" />
        <asp:ValidationSummary ID="CourseINValidationSummary" runat="server"  ShowMessageBox="True" ShowSummary="False" ValidationGroup="Insert" />
    <asp:ObjectDataSource ID="CourseODS" runat="server" DataObjectTypeName="Pathway_System.Entities.Course" InsertMethod="Course_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="Course_List" TypeName="Pathway_System.BLL.PathwaysController" UpdateMethod="Course_Update"></asp:ObjectDataSource>
</div>

    <div class="col-md-12" visible="false">
            <my:MessageUserControl runat="server" ID="MessageUserControl"/>
        </div>

    <div id="RestrictAccess" runat="server" visible="true" class="restrict-access">
        <h3>Access Denied</h3>
        <p>You do not have the required permissions to access this page.</p>
        <p>Please <a href="../../Account/Login.aspx">Login</a> with an authorized account to view.</p>
    </div>
</asp:Content>

