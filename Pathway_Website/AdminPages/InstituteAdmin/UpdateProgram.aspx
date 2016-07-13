<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UpdateProgram.aspx.cs" Inherits="AdminPages_InstituteAdmin_UpdateProgram" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="InstituteAdminAccess" runat="server" visible="false">
        <h1 style="text-align: center;">Update Program</h1>

        <div class="row">
            <asp:HiddenField ID="ProgramLinkCompare" runat="server" />
            <asp:HiddenField ID="ProgramNameCompare" runat="server" />
            <!-- INITIAL PROGRAM SELECTION -->
            <div class="col-md-6 col-md-offset-3">

                <div class="panel panel-primary offset3">
                    <div class="panel-heading">Please select a program to update:</div>
                    <div class="panel-body">
                        <!-- SELECT CREDENTIAL TYPE -->
                        <p class="update-text-fix">
                            Please select the program credential type:
                        </p>
                        <asp:DropDownList ID="InitialCredential" runat="server" AutoPostBack="True" OnSelectedIndexChanged="InitialCredential_SelectedIndexChanged" CssClass="form-control search-ddl ddl-fix">
                            <asp:ListItem Value="0">[Select]</asp:ListItem>
                            <asp:ListItem>Certificate</asp:ListItem>
                            <asp:ListItem>Diploma</asp:ListItem>
                            <asp:ListItem>Degree</asp:ListItem>
                        </asp:DropDownList>

                        <div style="clear: both; height: 10px;"></div>

                        <!-- SELECT PROGRAM -->
                        <p class="update-text-fix">
                            Please select a program:
                        </p>
                        <asp:DropDownList ID="CertificateList" runat="server" DataSourceID="CertificateODS" DataTextField="ProgramName"
                            DataValueField="ProgramID" Visible="false" CssClass="form-control search-ddl ddl-fix">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DiplomaList" runat="server" DataSourceID="DiplomaListODS" DataTextField="ProgramName" DataValueField="ProgramID" Visible="false" CssClass="form-control search-ddl ddl-fix"></asp:DropDownList>
                        <asp:DropDownList ID="DegreeList" runat="server" DataSourceID="DegreeListODS" DataTextField="DegreeName" DataValueField="DegreeID" Visible="false" CssClass="form-control search-ddl ddl-fix"></asp:DropDownList>
                        <div style="clear: both; height: 10px;"></div>
                    </div>
                </div>
                <!-- SHOW UPDATE FIELDS -->
                <p style="text-align: center; margin-bottom: 20px;">
                    <asp:LinkButton ID="ShowUpdateFields" runat="server" OnClick="ShowUpdateFields_Click"
                        CssClass="listview-buttons" Font-Underline="false" CausesValidation="false">Show Program</asp:LinkButton>
                </p>
            </div>
        </div>
        <!-- END INITIAL PROGRAM SELECTION -->



        <div id="show_update_form" runat="server" visible="false">
            <!-- SHOWS ALL FIELD INFORMATION -->
            <div class="col-md-6">
                <!-- LEFT COLUMN -->
                <div class="panel panel-primary">
                    <!-- PROGRAM INFORMATION PANEL -->
                    <div class="panel-heading">Program Information</div>
                    <div class="panel-body">
                        <!-- PROGRAM ID -->
                        <p>
                            <asp:Label ID="ProgramID_Label" runat="server" Text="Program ID:" CssClass="label-program"></asp:Label>
                            <asp:TextBox ID="ProgramID" runat="server" ReadOnly="true" class="form-control text-fix"></asp:TextBox>
                        </p>
                        <div style="clear: both; height: 10px;"></div>

                        <!-- PROGRAM NAME -->
                        <p>
                            <asp:Label ID="ProgramName_Label" runat="server" Text="Program Name:" CssClass="label-program"></asp:Label>
                            <asp:TextBox ID="ProgramName" runat="server" class="form-control text-fix"></asp:TextBox>

                        </p>

                        <asp:RequiredFieldValidator ID="ProgramNameValidator" runat="server" ErrorMessage="Program Name is required."
                            ForeColor="#cc0000" ControlToValidate="ProgramName" Text="*"></asp:RequiredFieldValidator>

                        <div style="clear: both; height: 10px;"></div>

                        <!-- PROGRAM CATEGORY -->
                        <p>
                            <asp:Label ID="ProgramCategory" runat="server" Text="Category:" CssClass="label-program"></asp:Label>
                            <asp:DropDownList ID="CategoryList" runat="server" DataSourceID="CategoryListODS" DataTextField="CategoryName"
                                DataValueField="CategoryID" CssClass="form-control search-ddl ddl-fix">
                            </asp:DropDownList>
                        </p>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="#cc0000"
                            ErrorMessage="Please select a Category from the list." Display="Dynamic" ControlToValidate="CategoryList"
                            InitialValue="0" Text="*"></asp:RequiredFieldValidator>

                        <div style="clear: both; height: 10px;"></div>

                        <!-- CREDENTIAL TYPE -->
                        <p>
                            <asp:Label ID="CredentialType_Label" runat="server" Text="Credential Type:" CssClass="label-program"></asp:Label>
                            <asp:TextBox ID="CredentialType" runat="server" AutoPostBack="True" ReadOnly="true"
                                class="form-control text-fix">

                            </asp:TextBox>
                        </p>

                        <div style="clear: both; height: 10px;"></div>

                        <!-- PROGRAM LENGTH -->
                        <p>
                            <asp:Label ID="ProgramLength_Label" runat="server" Text="Program Length:" CssClass="label-program"></asp:Label>
                            <asp:TextBox ID="ProgramLength" runat="server" class="form-control pgm-length-fix"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="#cc0000"
                                ErrorMessage="Please enter a numeric value for program length." ControlToValidate="ProgramLength"
                                Text="*" CssClass="require-fix" Display="Dynamic"></asp:RequiredFieldValidator>

                            <asp:DropDownList ID="ProgramLengthDDL" runat="server" CssClass="form-control pgm-ddl-fix">
                                <asp:ListItem Text="Day(s)" Value="Day(s)" />
                                <asp:ListItem Text="Week(s)" Value="Week(s)" />
                                <asp:ListItem Text="Month(s)" Value="Month(s)" />
                                <asp:ListItem Text="Year(s)" Value="Year(s)" />
                            </asp:DropDownList>

                        </p>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#cc0000"
                            ErrorMessage="Please select a Program Length value from the list." Display="Dynamic" ControlToValidate="ProgramLengthDDL"
                            InitialValue="0" Text="*"></asp:RequiredFieldValidator>

                        <div style="clear: both; height: 10px;"></div>

                        <!-- PROGRAM LINK -->
                        <p>
                            <asp:Label ID="ProgramLink_Label" runat="server" Text="Program Link:" CssClass="label-program"></asp:Label>
                            <asp:TextBox ID="ProgramLink" runat="server" class="form-control text-fix"></asp:TextBox>
                        </p>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="#cc0000"
                            ErrorMessage="Please enter a program link." ControlToValidate="ProgramLink" Text="*"
                            Display="Dynamic" Font-Italic="False"></asp:RequiredFieldValidator>

                        <div style="clear: both; height: 10px;"></div>

                        <!-- PROGRAM ACTIVATED -->
                        <p>
                            <asp:Label ID="Activated_Label" runat="server" Text="Is this program currently in operation?" CssClass="checkbox-label-program"></asp:Label>
                            <asp:CheckBox ID="Activated" runat="server" />
                        </p>
                    </div>
                </div>
                <!-- END OF PROGRAM INFORMATION PANEL -->

                <!--WORK ENVIRONMENT PANEL -->
                <div class="panel panel-primary">
                    <div class="panel-heading">Work Environment</div>
                    <div class="panel-body">

                        <!-- WORK OUTDOORS -->
                        <p>
                            <asp:Label ID="WorkOutdoors_Label" runat="server" Text="Does this career path require work outdoors?" CssClass="checkbox-label-program"></asp:Label>
                            <asp:CheckBox ID="WorkOutdoors" runat="server" />
                        </p>

                        <!-- SHIFT WORK -->
                        <p>
                            <asp:Label ID="ShiftWork_Label" runat="server" Text="Does this career path require shift work?" CssClass="checkbox-label-program"></asp:Label>
                            <asp:CheckBox ID="ShiftWork" runat="server" />
                        </p>

                        <!-- TRAVEL -->
                        <p>
                            <asp:Label ID="Travel_Label" runat="server" Text="Does this career path require travel?" CssClass="checkbox-label-program"></asp:Label>
                            <asp:CheckBox ID="Travel" runat="server" />
                        </p>
                    </div>
                </div>
            </div>
            <!-- END OF LEFT COLUMN -->



            <!-- START OF RIGHT COLUMN -->
            <!-- ENTRANCE REQUIREMENTS START-->
            <div id="entrance_req" runat="server" visible="false">
                <div class="col-md-6">
                    <!-- ENT REQ PANEL START -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">Entrance Requirements</div>
                        <div class="panel-body">

                            <!-- COMPETITIVE ADVANTAGE -->
                            <p>
                                <asp:Label ID="CompetitiveAdv_Label" runat="server" Text="Competitive Advantage:" CssClass="label-program-long"></asp:Label>
                                <asp:TextBox ID="CompetitiveAdv" runat="server" class="form-control text-fix"></asp:TextBox>
                            </p>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="#cc0000"
                                ErrorMessage="Please enter a Competitive Advatange." Text="*" ControlToValidate="CompetitiveAdv"
                                Display="Dynamic"></asp:RequiredFieldValidator>

                            <div style="clear: both; height: 10px;"></div>

                            <!-- ENTRANCE REQUIREMENT DETAILS -->
                            <p>
                                <asp:Label ID="EntReqDetail_Label" runat="server" Text="Entrance Requirements Details:" CssClass="label-program-long"></asp:Label>
                                <asp:TextBox ID="EntReqDetail" runat="server" class="form-control text-fix"></asp:TextBox>
                            </p>

                            

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="#cc0000"
                                ErrorMessage="Please enter the Entrance Requirement Details." Text="*" ControlToValidate="EntReqDetail"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <div style="clear: both; height: 10px;"></div>
                            <br />
                            <!-- COURSE INFORMATION LISTVIEW FOR CERTIFICATES -->
                            <asp:ListView ID="EntReqListView" runat="server" InsertItemPosition="LastItem" DataSourceID="EntranceReqODS"
                                Visible="false" DataKeyNames="ProgramID,CourseID" OnItemInserting="EntReqListView_ItemInserting" OnItemUpdating="EntReqListView_ItemUpdating">
                                <AlternatingItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Bind("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Bind("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="MarkLabel" runat="server" Text='<%# Bind("Mark") %>' />
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDTextBox" runat="server" Text='<%# Bind("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="MarkTextBox" runat="server" Text='<%# Bind("Mark") %>' CssClass="form-control ent-req-input" />
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
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ProgramIDTextBox" runat="server" value="<%# ProgramID.Text %>" Text='<%# Bind("ProgramID")%>' onkeydown="javascript:return false" CssClass="ent-req-fix" />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="EntReqCourses" runat="server" CssClass="form-control course-select-fix"
                                                DataSourceID="CourseListODS"
                                                DataTextField="SubjectName"
                                                DataValueField="CourseID"
                                                SelectedValue='<%# Bind("CourseID") %>' AppendDataBoundItems="True">
                                                <asp:ListItem Text="--[Select]--" Value="" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="MarkTextBox" runat="server" Text='<%# Bind("Mark") %>' CssClass="form-control ent-req-input" />
                                        </td>
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Bind("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Bind("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="MarkLabel" runat="server" Text='<%# Bind("Mark") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table align-fix">
                                                    <tr runat="server" style="">
                                                        <th runat="server"></th>
                                                        <th runat="server">Program ID</th>
                                                        <th runat="server">Course ID</th>
                                                        <th runat="server">Course Name</th>
                                                        <th runat="server">Mark</th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <%--<td runat="server" style="">
                                                <asp:DataPager ID="DataPager1" runat="server">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="listview-buttons" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>--%>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Bind("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Bind("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="MarkLabel" runat="server" Text='<%# Bind("Mark") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>

                            </asp:ListView>

                            <!-- COURSE INFORMATION LISTVIEW FOR DIPLOMAS -->
                            <asp:ListView ID="DiplomaEntReqList" runat="server" DataSourceID="DiplomaEntranceReqODS"
                                InsertItemPosition="LastItem" Visible="false" DataKeyNames="ProgramID,CourseID" OnItemInserting="DiplomaEntReqList_ItemInserting"
                                OnItemUpdating="DiplomaEntReqList_ItemUpdating">
                                <AlternatingItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="MarkLabel" runat="server" Text='<%# Eval("Mark") %>' />
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDTextBox" runat="server" Text='<%# Bind("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="MarkTextBox" runat="server" Text='<%# Bind("Mark") %>' CssClass="form-control ent-req-input" />
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
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center"  />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ProgramIDTextBox" runat="server" value="<%# ProgramID.Text %>" Text='<%# Bind("ProgramID")%>' onkeydown="javascript:return false" CssClass="ent-req-fix" />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="EntReqCourses" runat="server" CssClass="form-control"
                                                DataSourceID="CourseListODS"
                                                DataTextField="SubjectName"
                                                DataValueField="CourseID"
                                                SelectedValue='<%# Bind("CourseID") %>' AppendDataBoundItems="True">
                                                <asp:ListItem Text="--Select One--" Value="" />
                                            </asp:DropDownList>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="MarkTextBox" runat="server" Text='<%# Bind("Mark") %>' CssClass="form-control ent-req-input" />
                                        </td>
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="MarkLabel" runat="server" Text='<%# Eval("Mark") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table align-fix">
                                                    <tr runat="server" style="">
                                                        <th runat="server"></th>
                                                        <th runat="server">Program ID</th>
                                                        <th runat="server">Course ID</th>
                                                        <th runat="server" width="145px">Course Name</th>
                                                        <th runat="server">Mark</th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style=""></td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="MarkLabel" runat="server" Text='<%# Eval("Mark") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <!-- ENT REQ PANEL END -->

                </div>

            </div>
            <!-- ENTRANCE REQUIREMENTS END -->


            <div class="row">
                <!-- PATHWAYS SECTION -->
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <!-- PATHWAYS PANEL -->
                    <div class="panel panel-primary" id="pathwaysheading_toggle" visible="false" runat="server">
                        <div runat="server" class="panel-heading">Degree & Diploma Pathways/Relationships</div>
                        <div class="panel-body">
                            <!-- PATHWAYS LISTVIEW FOR DIPLOMAS -->
                            <asp:ListView ID="DiplomaPathListView" runat="server" DataKeyNames="ProgramID,DegreeID" DataSourceID="DegRelDB_ODS" OnItemInserting="DiplomaPathListView_ItemInserting" InsertItemPosition="LastItem" Visible="False">
                                <AlternatingItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="GetDegreeName" runat="server" Enabled="False" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DegreeListODS"
                                                DataTextField="DegreeName"
                                                DataValueField="DegreeID"
                                                SelectedValue='<%# Bind("DegreeID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel1" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel1" runat="server" Text='<%# Eval("DegreeID") %>' />
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
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ProgramIDTextBox" runat="server" value="<%# ProgramID.Text %>" Text='<%# Bind("ProgramID")%>' onkeydown="javascript:return false" CssClass="form-control ent-req-fix" />
                                            <%-- <asp:TextBox ID="ProgramIDTextBox" runat="server" Text='<%# Bind("ProgramID") %>' />--%>
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:DropDownList ID="DipDegList" runat="server" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DegreeListODS"
                                                DataTextField="DegreeName"
                                                DataValueField="DegreeID"
                                                SelectedValue='<%# Bind("DegreeID") %>' AppendDataBoundItems="True">
                                                <asp:ListItem Text="--[Select]--" Value="" />
                                            </asp:DropDownList>
                                        </td>


                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="GetDegreeName" runat="server" Enabled="False" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DegreeListODS"
                                                DataTextField="DegreeName"
                                                DataValueField="DegreeID"
                                                SelectedValue='<%# Bind("DegreeID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table align-fix">
                                                    <tr runat="server" style="">
                                                        <th runat="server"></th>
                                                        <th runat="server">Program ID</th>
                                                        <th runat="server">Degree ID</th>
                                                        <th runat="server">Degree Name</th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style=""></td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="GetDegreeName" runat="server" Enabled="False" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DegreeListODS"
                                                DataTextField="DegreeName"
                                                DataValueField="DegreeID"
                                                SelectedValue='<%# Bind("DegreeID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>

                            <!-- PATHWAYS LISTVIEW FOR DEGREES -->
                            <asp:ListView ID="DegreePathListView" runat="server" DataKeyNames="ProgramID,DegreeID" OnItemInserting="DegreePathListView_ItemInserting"
                                InsertItemPosition="LastItem" Visible="false" OnPreRender="DegreePathListView_PreRender">
                                <AlternatingItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="GetDiplomaName" runat="server" Enabled="False" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DiplomaListODS"
                                                DataTextField="ProgramName"
                                                DataValueField="ProgramID"
                                                SelectedValue='<%# Bind("ProgramID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel1" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel1" runat="server" Text='<%# Eval("ProgramID") %>' />
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
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DegreeIDTextBox" runat="server" value="<%# ProgramID.Text %>" Text='<%# Bind("DegreeID")%>' onkeydown="javascript:return false" CssClass="form-control ent-req-fix" />
                                            <%--<asp:TextBox ID="DegreeIDTextBox" runat="server" Text='<%# Bind("DegreeID") %>' />--%>
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:DropDownList ID="GetDiplomaName" runat="server" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DiplomaListODS"
                                                DataTextField="ProgramName"
                                                DataValueField="ProgramID"
                                                SelectedValue='<%# Bind("ProgramID") %>' AppendDataBoundItems="True">
                                                <asp:ListItem Text="----[Select]----" Value="" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="DegreeIDLabel" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="GetDiplomaName" runat="server" Enabled="False" CssClass="form-control ddl-pathway-fix"
                                                DataSourceID="DiplomaListODS"
                                                DataTextField="ProgramName"
                                                DataValueField="ProgramID"
                                                SelectedValue='<%# Bind("ProgramID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-striped" gridlines="None">
                                                    <tr runat="server" style="">
                                                        <th runat="server"></th>
                                                        <th runat="server">Degree ID</th>
                                                        <th runat="server">Program ID</th>
                                                        <th runat="server">Diploma Name</th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" align="center">
                                                <asp:DataPager runat="server" ID="DataPager2" PageSize="5">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center"></asp:NextPreviousPagerField>
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DegreeID") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="ProgramIDLabel" runat="server" Text='<%# Eval("ProgramID") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="GetDiplomaName" runat="server" Enabled="False" CssClass="ddl-pathway-fix"
                                                DataSourceID="DiplomaListODS"
                                                DataTextField="ProgramName"
                                                DataValueField="ProgramID"
                                                SelectedValue='<%# Bind("ProgramID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="DipRelDB_ODS" runat="server" ConnectionString="<%$ ConnectionStrings:Pathway_Model %>" DeleteCommand="DELETE FROM [DegreeRelationship] WHERE [ProgramID] = @ProgramID AND [DegreeID] = @DegreeID" InsertCommand="INSERT INTO [DegreeRelationship] ([ProgramID], [DegreeID]) VALUES (@ProgramID, @DegreeID)" SelectCommand="SELECT [ProgramID], [DegreeID] FROM [DegreeRelationship] WHERE ([DegreeID] = @DegreeID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProgramID" Type="Int32" />
                                    <asp:Parameter Name="DegreeID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProgramID" Type="Int32" />
                                    <asp:Parameter Name="DegreeID" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DegreeList" Name="DegreeID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="DegRelDB_ODS" runat="server" ConnectionString="<%$ ConnectionStrings:Pathway_Model %>" DeleteCommand="DELETE FROM [DegreeRelationship] WHERE [ProgramID] = @ProgramID AND [DegreeID] = @DegreeID" InsertCommand="INSERT INTO [DegreeRelationship] ([ProgramID], [DegreeID]) VALUES (@ProgramID, @DegreeID)" SelectCommand="SELECT [ProgramID], [DegreeID] FROM [DegreeRelationship] WHERE ([ProgramID] = @ProgramID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProgramID" Type="Int32" />
                                    <asp:Parameter Name="DegreeID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProgramID" Type="Int32" />
                                    <asp:Parameter Name="DegreeID" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DiplomaList" Name="ProgramID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ObjectDataSource ID="DegreeRelationshipODS" runat="server" DataObjectTypeName="Pathway_System.Entities.DTOs.DegreeRelationshipInfo" DeleteMethod="DegreeRel_Delete" InsertMethod="DegreeRel_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="DiplomaProgram_byID" TypeName="Pathway_System.BLL.PathwaysController">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DiplomaList" Name="programID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                    <!-- END PANEL -->
                </div>
                <!-- END PATHWAYS SECTION -->
            </div>
            <!-- ROW -->
            <!-- SUBMIT UPDATE -->
            <div class="col-md-12" align="center">
                <asp:LinkButton ID="SubmitProgram" runat="server" OnClick="SubmitProgram_Click" CssClass="listview-buttons" Font-Underline="false" Visible="false">Update Program</asp:LinkButton>
            </div>
            <div class="col-md-12">
                <my:MessageUserControl runat="server" ID="MessageUserControl" />
            </div>

            <!-- REQUIRED FIELD VALIDATION -->
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" CssClass="messagebox-fix" ShowMessageBox="true" />

            <asp:ObjectDataSource ID="CourseListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Course_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="CategoryListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="DiplomaListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Diploma_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="DegreeListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Degree_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>

            <asp:ObjectDataSource ID="EntranceReqODS" runat="server" DataObjectTypeName="Pathway_System.Entities.DTOs.EntranceRequirementInfo" DeleteMethod="EntReq_Delete" InsertMethod="EntReq_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="EntReqList_byID" TypeName="Pathway_System.BLL.PathwaysController" UpdateMethod="EntReq_Update">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CertificateList" Name="programID" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <asp:ObjectDataSource ID="DiplomaEntranceReqODS" runat="server" DataObjectTypeName="Pathway_System.Entities.DTOs.EntranceRequirementInfo" DeleteMethod="EntReq_Delete" InsertMethod="EntReq_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="EntReqList_byID" TypeName="Pathway_System.BLL.PathwaysController" UpdateMethod="EntReq_Update">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DiplomaList" Name="programID" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <asp:ObjectDataSource ID="CertificateODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Certificate_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
        </div>
        <!-- FIELD INFORMATION END -->
    </div>
    <div id="RestrictAccess" runat="server" visible="true" class="restrict-access">
        <h3>Access Denied</h3>
        <p>You do not have the required permissions to access this page.</p>
        <p>Please <a href="../../Account/Login.aspx">Login</a> with an authorized account to view.</p>
    </div>
</asp:Content>

