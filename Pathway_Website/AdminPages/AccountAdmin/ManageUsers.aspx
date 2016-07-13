<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="AdminPages_SuperUser_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="ManageAdminAccess" runat="server" visible="false">
        
            <h1 style="font-size:50px;">Site Administration</h1>

        <div class="row">
            <div class="col-md-9">
                <h2>Users</h2>
                <asp:HiddenField ID="UserIdField" runat="server" />
                <asp:ListView ID="User_ListView" runat="server" DataSourceID="UsersODS" OnItemCommand="User_ListView_ItemCommand">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #efefef;">

                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="InstitutionLabel" runat="server" Text='<%# Eval("Institution") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <asp:Label ID="UserNameID" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                            </td>
                            <td>
                                <asp:Button ID="ViewRoleButton" runat="server" CommandName="ViewRole" Text="View Role Info" CssClass="listview-buttons"/>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="InstitutionLabel" runat="server" Text='<%# Eval("Institution") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>

                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="InstitutionLabel" runat="server" Text='<%# Eval("Institution") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                 <asp:Label ID="UserNameID" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                            </td>
                     
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="">

                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="InstitutionLabel" runat="server" Text='<%# Eval("Institution") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <asp:Label ID="UserNameID" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                            </td>
                            <td>
                                <asp:Button ID="ViewRoleButton" runat="server" CommandName="ViewRole" Text="View Role Info" CssClass="listview-buttons"/>
                            </td>
                
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" class="table align-fix">
                                        <tr runat="server" style="" class="listview-heading align-fix">

                                            <th runat="server">User Name</th>
                                            <th runat="server">Full Name</th>
                                            <th runat="server">Institute</th>
                                            <th runat="server">Email</th>
                                            <th runat="server">Roles</th>

                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>

                            </tr>
                            <tr runat="server">
                                <td runat="server"  align="center">
                                    <asp:DataPager runat="server" ID="DataPager2" PageSize="5">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="listview-buttons"></asp:NextPreviousPagerField>
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="">

                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="InstitutionLabel" runat="server" Text='<%# Eval("Institution") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <asp:Label ID="UserNameID" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="UsersODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="User_List" TypeName="Pathway_System.BLL.UsersRolesController"></asp:ObjectDataSource>
            </div>
            <div class="col-md-3">
                <h2>Roles</h2>
               <!-- ROLES LISTVIEW -->
                <asp:ListView ID="RoleListView" runat="server"
                    ItemType="Microsoft.AspNet.Identity.EntityFramework.IdentityRole"
                    OnItemCommand="RoleListView_ItemCommand">
                     <AlternatingItemTemplate>
                        <tr style="background-color: #efefef;">
                            <td>
                                <asp:Label Text='<%# Item.Name %>' runat="server" ID="NameLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Item.Users.Count %>' runat="server" ID="UsersCountLabel" /></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server">
                            <tr>
                                <td>No roles in this site.
                    <asp:LinkButton runat="server" CommandName="AddDefaultRoles" Text="Add default security roles" ID="AddDefaultRolesButton" />
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label Text='<%# Item.Name %>' runat="server" ID="NameLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Item.Users.Count %>' runat="server" ID="UsersCountLabel" /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table runat="server" id="itemPlaceholderContainer"
                                        class="table align-fix">
                                        <tr runat="server" class="listview-heading align-fix">
                                            <th runat="server">Role Name</th>
                                            <th runat="server">Users</th>
                                        </tr>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                               
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>


        <hr />


        <asp:ObjectDataSource ID="RoleListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Role_List" TypeName="Pathway_System.BLL.UsersRolesController"></asp:ObjectDataSource>
        <div class="col-md-6 col-md-offset-3">
        <h2>
            <asp:Label ID="UserName" runat="server" Text=""></asp:Label><small><asp:Label ID="Email" runat="server" Text=""></asp:Label></small></h2>
        <h3>
            <asp:Label ID="FullName" runat="server" Text=""></asp:Label></h3>
        <h3>
            <asp:Label ID="Institute" runat="server" Text=""></asp:Label></h3>

        <asp:GridView ID="UserRoleView" runat="server" AutoGenerateColumns="false" class="table table-striped" GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="Role Name">
                    
                    <ItemTemplate>
                        <asp:Label ID="RoleName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" />
                    <FooterTemplate>
                        <asp:DropDownList ID="UserRolesDDL" runat="server" AppendDataBoundItems="true" 
                            DataSourceID="RoleListODS" DataTextField="Name" DataValueField="Name" CssClass="form-control ddl-fix"
                            >
                            <asp:ListItem Value="">-----[Add User to Role]-----</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please select a Role to add." Display="Dynamic" ControlToValidate="UserRolesDDL" 
                        InitialValue="" Text="*" ForeColor="#cc0000"></asp:RequiredFieldValidator>

                        <asp:Button ID="AddRole" runat="server" Text="Add Role" OnClick="AddRole_Click" CssClass="listview-buttons"/>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                         <asp:LinkButton runat="server" Text="Remove..." ID="RemoveRoleButton" OnClick="RemoveRoleButton_Click" OnClientClick="return confirm('Are you sure you want to delete the selected role from this user?');"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <p>This user is not currently assigned to a role.
                    <asp:LinkButton Font-Underline="false" CssClass="listview-buttons" ID="RemoveUserFromSystem" runat="server" 
                        OnClick="RemoveUserFromSystem_Click" OnClientClick="if ( !confirm('Are you sure you want to delete this user?')) return false;">
                        Delete User..
                    </asp:LinkButton>
                </p>
                
                        <asp:DropDownList ID="UserRolesDDLonEmpty" runat="server" AppendDataBoundItems="true" 
                            DataSourceID="RoleListODS" DataTextField="Name" DataValueField="Name" CssClass="form-control ddl-fix">
                            <asp:ListItem Value="">-----[Add User to Role]-----</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="AddRoleEmpty" runat="server" Text="Add Role" OnClick="AddRoleEmpty_Click" CssClass="listview-buttons"/>
                        
            </EmptyDataTemplate>
        </asp:GridView>
            </div>
    </div>

    <div id="RestrictAccess" runat="server" visible="true" class="restrict-access">
        <h3>Access Denied</h3>
        <p>You do not have the required permissions to access this page.</p>
        <p>Please <a href="../../Account/Login.aspx">Login</a> with an authorized account to view.</p>
    </div>

</asp:Content>

