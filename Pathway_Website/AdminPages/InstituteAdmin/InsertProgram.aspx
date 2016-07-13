<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="InsertProgram.aspx.cs" Inherits="AdminPages_InstituteAdmin_InsertProgram" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <div id="InstituteAdminAccess" runat="server" visible="false">
        <h1>Insert Program</h1>
        
        <div class="col-md-6"> <!-- START LEFT COLUMN -->

             <!-- START PANEL -->
            <div class="panel panel-primary">

                <!-- PROGRAM INFORMATION -->
                <div class="panel-heading">Program Information</div>
                <div class="panel-body">
                    
                    <!-- PROGRAM NAME -->
                    <p>
                        <asp:Label ID="ProgramName_Label" runat="server" Text="Program Name:" CssClass="label-program"></asp:Label>
                        <asp:TextBox ID="ProgramName" runat="server" class="form-control text-fix" ></asp:TextBox>
                    </p>

                    <asp:RequiredFieldValidator ID="ProgramNameValidator" runat="server" ErrorMessage="Program Name is required." 
                        ControlToValidate="ProgramName" Text="*" ForeColor="#cc0000"></asp:RequiredFieldValidator>
                    
                    <div style="clear: both; height: 10px;"></div><!-- CLEARFIX -->
                   
                     <!-- CATEGORY -->
                    <p>
                        <asp:Label ID="ProgramCategory" runat="server" Text="Category:" CssClass="label-program"></asp:Label>
                        <asp:DropDownList ID="CategoryList" runat="server" DataSourceID="CategoryListODS" DataTextField="CategoryName"
                             DataValueField="CategoryID" CssClass="form-control search-ddl ddl-fix" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">---------[Select}---------</asp:ListItem>
                        </asp:DropDownList>
                    </p>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please select a Category from the list." Display="Dynamic" ControlToValidate="CategoryList" 
                        InitialValue="0" Text="*" ForeColor="#cc0000"></asp:RequiredFieldValidator>

                    <div style="clear: both; height: 10px;"></div><!-- CLEARFIX -->
                  
                    <!-- CREDENTIAL TYPE -->
                    <p>
                        <asp:Label ID="CredentialType_Label" runat="server" Text="Credential Type:" CssClass="label-program"></asp:Label>
                        <asp:DropDownList ID="CredentialType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CredentialType_SelectedIndexChanged" CssClass="form-control search-ddl ddl-fix">
                            <asp:ListItem Value="0">---------------[Select]---------------</asp:ListItem>
                            <asp:ListItem>Certificate</asp:ListItem>
                            <asp:ListItem>Diploma</asp:ListItem>
                            <asp:ListItem>Degree</asp:ListItem>
                        </asp:DropDownList>
                    </p>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please select a Credential from the list." Display="Dynamic" ControlToValidate="CredentialType" 
                        InitialValue="0" Text="*" ForeColor="#cc0000"></asp:RequiredFieldValidator>

                    <div style="clear: both; height: 10px;"></div><!-- CLEARFIX -->

                    <!-- PROGRAM LENGTH -->
                    <p>
                        <asp:Label ID="ProgramLength_Label" runat="server" Text="Program Length:" CssClass="label-program"></asp:Label>
                        <asp:TextBox ID="ProgramLength" runat="server" class="form-control pgm-length-fix"></asp:TextBox>

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                              ErrorMessage="Please enter a numeric value for Program Length." ControlToValidate="ProgramLength" 
                              Text="*" ForeColor="#cc0000" CssClass="require-fix" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:DropDownList ID="ProgramLengthDDL" runat="server" CssClass="form-control pgm-ddl-fix" >
                            <asp:ListItem Text="---------[Select]---------" Value="0" />
                           <asp:ListItem Text="Day(s)" Value="Day(s)" />
                            <asp:ListItem Text="Week(s)" Value="Week(s)" />
                            <asp:ListItem Text="Month(s)" Value="Month(s)" />
                            <asp:ListItem Text="Year(s)" Value="Year(s)" />
                        </asp:DropDownList>   
                    </p>
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Please select a Program Length value from the list." Display="Dynamic" ControlToValidate="ProgramLengthDDL" 
                        InitialValue="0" Text="*" ForeColor="#cc0000"></asp:RequiredFieldValidator>

                    <div style="clear: both; height: 10px;"></div><!-- CLEARFIX -->

                    <!-- PROGRAM LINK -->
                    <p>
                        <asp:Label ID="ProgramLink_Label" runat="server" Text="Program Link:" CssClass="label-program"></asp:Label>
                        <asp:TextBox ID="ProgramLink" runat="server" class="form-control text-fix"></asp:TextBox>
                    </p>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Program Link is required." ControlToValidate="ProgramLink" Text="*" Display="Dynamic" 
                        Font-Italic="False" ForeColor="#cc0000"></asp:RequiredFieldValidator>

                    <div style="clear: both; height: 10px;"></div><!-- CLEARFIX -->

                    <!-- ACTIVATED -->
                    <p>
                        <asp:Label ID="Activated_Label" runat="server" Text="Is this program currently in operation?" CssClass="checkbox-label-program"></asp:Label>
                        <asp:CheckBox ID="Activated" runat="server" />
                    </p>
                </div>
                <!-- END PROGRAM INFORMATION-->
            </div>
             <!-- END PANEL-->

             <!-- START PANEL -->
            <div class="panel panel-primary">

                <!-- START WORK ENVIRONMENT -->
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
            </div><!-- END PANEL -->

        </div><!-- END LEFT COLUMN -->



        <!-- START RIGHT COLUMN -->
        <div id="entrance_req" runat="server" visible="false" class="col-md-6">
            <!-- START PANEL -->
            <div class="panel panel-primary">

                <!-- START ENTRANCE REQUIREMENTS -->
                <div class="panel-heading">Entrance Requirements</div>
                <div class="panel-body">

                    <!-- COMPETETIVE ADVANTAGE -->
                    <p>
                        <asp:Label ID="CompetitiveAdv_Label" runat="server" Text="Competitive Advantage:" CssClass="label-program-long"></asp:Label>
                        <asp:TextBox ID="CompetitiveAdv" runat="server" class="form-control text-fix"></asp:TextBox>
                    </p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="Competitive Advatange is required." Text="*" ForeColor="#cc0000" ControlToValidate="CompetitiveAdv"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <div style="clear: both; height: 10px;"></div>

                    <!-- ENTRANCE REQUIREMENT DETAIL-->
                    <p>
                        <asp:Label ID="EntReqDetail_Label" runat="server" Text="Entrance Requirement Details:" CssClass="label-program-long"></asp:Label>
                        <asp:TextBox ID="EntReqDetail" runat="server" class="form-control text-fix"></asp:TextBox>
                    </p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Entrance Requirement Details are required." Text="*" ForeColor="#cc0000" ControlToValidate="EntReqDetail"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <div style="clear: both; height: 10px;"></div>

                    <!-- DISPLAY COURSE GRIDVIEW CHECKBOX-->
                    <p>
                        <asp:Label ID="InsertCourse_Label" runat="server" Text="Would you like to add entrance requirement courses?" 
                            CssClass="checkbox-label-program"></asp:Label>
                        <asp:CheckBox ID="ShowCoursesView" runat="server" AutoPostBack="True" OnCheckedChanged="ShowCoursesView_CheckedChanged"/>
                    </p>

                    <!-- ADD COURSE GRIDVIEW -->
                    <asp:GridView ID="Course_Gridview" runat="server" ShowFooter="True" AutoGenerateColumns="false" class="table table-striped" GridLines="None" Visible="false">
                        <Columns>

                            <asp:BoundField DataField="RowNumberCourse" HeaderText="Course #" />

                            <asp:TemplateField HeaderText="Course">
                                <ItemTemplate>
                                    <asp:DropDownList ID="CourseList" runat="server" DataSourceID="CourseListODS" DataTextField="SubjectName"
                                         DataValueField="CourseID" AppendDataBoundItems="true" CssClass="form-control course-ddl-fix">
                                        <asp:ListItem Value="0">---------[Select]---------</asp:ListItem>
                                    </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#cc0000" 
                                ErrorMessage="Please select a Program Length value from the list." Display="Dynamic" ControlToValidate="CourseList" 
                                InitialValue="0" Text="*" CssClass="require-fix"></asp:RequiredFieldValidator>
                                
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mark" ItemStyle-CssClass="course-gv-fix">
                                <ItemTemplate>
                                    <asp:TextBox ID="EnterMark" runat="server" CssClass="form-control pgm-length-fix"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Entrance Requirement mark must be a number between 1 - 100" 
                                        ControlToValidate="EnterMark" MinimumValue="1" MaximumValue="100" ForeColor="#cc0000" 
                                        Type="Integer" Font-Size="Smaller" Display="Dynamic" Text="*"></asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ForeColor="#cc0000"
                                    ErrorMessage="Please enter a Mark when inserting a course." Text="*" ControlToValidate="EnterMark"
                                    Display="Dynamic" CssClass="require-fix"></asp:RequiredFieldValidator>
                                    
                                </ItemTemplate>

                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                    <asp:LinkButton ID="ButtonAdd" runat="server" Text="Add Another Course..." OnClick="ButtonAdd_Click" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center" CausesValidation="False" />
                                    <asp:LinkButton ID="ButtonSubtract" runat="server" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center"
                                         OnClick="ButtonSubtract_Click" CausesValidation="false">
                                        <i aria-hidden="true" class="glyphicon glyphicon-remove"></i> Remove...</asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <!-- END COURSE GRIDVIEW -->

                </div><!-- END ENTRANCE REQUIREMENTS -->
            </div><!-- END PANEL -->
        </div>

        <div id="degree_link" runat="server" visible="false" class="col-md-6">

            <!-- START PANEL -->
            <div class="panel panel-primary" runat="server">

                <!-- START DIPLOMA PATHWAYS -->
                <div class="panel-heading">Diploma Pathways</div>
                <div class="panel-body">

                    <!-- DISPLAY DIPLOMA PATHWAY GRIDVIEW CHECKBOX-->
                    <p>
                        <asp:Label ID="ShowDipPathwayGridView" runat="server" Text="Would you like to link this program to a Diploma program?" 
                            CssClass="checkbox-label-program"></asp:Label>
                        <asp:CheckBox ID="ShowDipPathView" runat="server" AutoPostBack="True" OnCheckedChanged="ShowDipPathView_CheckedChanged"/>
                    </p>

                    <!-- START  DIPLOMA PATHWAY GRIDVIEW -->
                    <asp:GridView ID="Program_GridView" runat="server" ShowFooter="True" AutoGenerateColumns="false" class="table table-striped" GridLines="None" Visible="false">
                        <Columns>
                            <asp:BoundField DataField="RowNumberProgram" HeaderText="Program #" />

                            <asp:TemplateField HeaderText="Program">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ProgramList" runat="server" DataSourceID="DiplomaListODS" 
                                        DataTextField="ProgramName" DataValueField="ProgramID" CssClass="form-control search-ddl"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="----------[Select]----------" Value="0" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ForeColor="#cc0000"
                                    ErrorMessage="Please select a Program Name value from the list when inserting a Pathway." Display="Dynamic" 
                                    ControlToValidate="ProgramList" InitialValue="0" Text="*"></asp:RequiredFieldValidator>
                                </ItemTemplate>

                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                    <asp:LinkButton ID="ProgramAdd" runat="server" Text="Add Another Program..." OnClick="ProgramAdd_Click" CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center"  CausesValidation="False"/>
                                     <asp:LinkButton ID="DiplomaRemove" runat="server" CssClass="btn btn-default btn-sm delete-fix"
                                         OnClick="DiplomaRemove_Click" CausesValidation="false">
                                        <i aria-hidden="true" class="glyphicon glyphicon-remove"></i> Remove...</asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <!-- END DIPLOMA PATHWAY GRIDVIEW -->

                </div> <!-- END DIPLOMA PATHWAY -->
            </div><!-- END PANEL -->
        </div>
        <div class="col-md-6"></div>
        <div id="degree_pathways" runat="server" visible="false" class="col-md-6">
             <!-- START PANEL -->
            <div class="panel panel-primary">
                 <!-- START DEGREE PATHWAY -->
                <div class="panel-heading">Degree Pathways</div>
                <div class="panel-body">
                    <!-- DISPLAY DEGREE PATHWAY GRIDVIEW CHECKBOX-->
                    <p>
                        <asp:Label ID="ShowDegPath_Label" runat="server" Text="Would you like to link this program to a Degree program?" 
                            CssClass="checkbox-label-program"></asp:Label>
                        <asp:CheckBox ID="ShowDegPathView" runat="server" AutoPostBack="True" OnCheckedChanged="ShowDegPathView_CheckedChanged"/>
                    </p>

                     <!-- START DEGREE PATHWAY GRIDVIEW -->
                    <asp:GridView ID="DegreeList_GridView" runat="server" ShowFooter="True" AutoGenerateColumns="false"
                         class="table table-striped" GridLines="None" Visible="false" >
                        <Columns>
                            <asp:BoundField DataField="RowNumberDegree" HeaderText="Program #" />

                            <asp:TemplateField HeaderText="Program">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DegreeList" runat="server" DataSourceID="DegreeListODS" 
                                        DataTextField="DegreeName" DataValueField="DegreeID" CssClass="form-control ddl-fix"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="----------[Select]----------" Value="0" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ForeColor="#cc0000"
                                    ErrorMessage="Please select a Program Name value from the list when inserting a Pathway." Display="Dynamic" 
                                    ControlToValidate="DegreeList" InitialValue="0" Text="*" CssClass="require-fix"></asp:RequiredFieldValidator>
                                </ItemTemplate>

                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                    <asp:LinkButton ID="DegreeAdd" runat="server" Text="Add Another Program..." OnClick="DegreeAdd_Click" 
                                        CssClass="btn btn-default btn-sm delete-fix hvr-underline-from-center"  CausesValidation="False"/>
                                    <asp:LinkButton ID="DegreeRemove" runat="server" CssClass="btn btn-default btn-sm delete-fix"
                                         OnClick="DegreeRemove_Click" CausesValidation="false">
                                        <i aria-hidden="true" class="glyphicon glyphicon-remove"></i> Remove...</asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView> <!-- END DEGREE PATHWAY GRIDVIEW -->

                </div> <!-- END DEGREE PATHWAY -->
            </div> <!-- END PANEL -->
        </div> <!-- END RIGHT COLUMN -->


         <!-- SUBMIT BUTTON -->
        <div class="col-md-12" align="center">
            <asp:LinkButton ID="SubmitProgram" runat="server" OnClick="SubmitProgram_Click" 
                CssClass="listview-buttons"  Font-Underline="false">Submit Program</asp:LinkButton>

        </div>
        <div class="col-md-12" visible="false">
            <my:MessageUserControl runat="server" ID="MessageUserControl"/>
        </div>
        <!-- REQUIRED FIELD VALIDATION -->
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" CssClass="messagebox-fix" ShowMessageBox="true"/>

        <asp:ObjectDataSource ID="CourseListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Course_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="CategoryListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DiplomaListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Diploma_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DegreeListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Degree_List" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
    
    
    </div>
    

    <div id="RestrictAccess" runat="server" visible="true" class="restrict-access">
        <h3>Access Denied</h3>
        <p>You do not have the required permissions to access this page.</p>
        <p>Please <a href="../../Account/Login.aspx">Login</a> with an authorized account to view.</p>
    </div>

</asp:Content>

