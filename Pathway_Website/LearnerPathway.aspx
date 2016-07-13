<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LearnerPathway.aspx.cs" Inherits="FilteredSearch" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>


<asp:Content ID="Learner_Pathway" ContentPlaceHolderID="MainContent" runat="Server">

    <script>
        function viewSize_pc() {
            var height = $(window).height();
            var viewSize_pc = height - 188;
            viewSize_pc = parseInt(viewSize_pc) + 'px';
            $(".results-row").css('min-height', viewSize_pc);
        }

        $(document).ready(function () {
            viewSize_pc();
            $(window).bind('resize', viewSize_pc);
        });
    </script>

    <style type="text/css">
        body {
            background: url('images/profile-bg.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            height: 100% !important;
            padding-bottom: 0;
        }
        .profile-wizard{
           
            padding:20px;
            background:rgba(255, 255, 255, 0.90) url('images/wizard_bg.png') bottom left  no-repeat;
            min-height: 400px;
            margin-top:40px;
            margin-bottom: 60px;
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }
        .row-fix {
            margin-bottom:80px;
        }
        .title-banner {
           text-align:center;
        }
        .comp-ent {
           
            color:white;
             font-family:"nait-primary";
            text-transform:uppercase;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 1);
            padding:9px;
            background-color:#2d6fc0;
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }
        .comp-ent-percent {
            padding:5px;
            border-radius: 0 0 50% 50%;
            font-weight:bold;
            border: 1px solid #9b9b9b;
            background: #fefefe; /* Old browsers */
            background: -moz-radial-gradient(center, ellipse cover,  #fefefe 32%, #e2e2e2 100%); /* FF3.6+ */
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(32%,#fefefe), color-stop(100%,#e2e2e2)); /* Chrome,Safari4+ */
            background: -webkit-radial-gradient(center, ellipse cover,  #fefefe 32%,#e2e2e2 100%); /* Chrome10+,Safari5.1+ */
            background: -o-radial-gradient(center, ellipse cover,  #fefefe 32%,#e2e2e2 100%); /* Opera 12+ */
            background: -ms-radial-gradient(center, ellipse cover,  #fefefe 32%,#e2e2e2 100%); /* IE10+ */
            background: radial-gradient(ellipse at center,  #fefefe 32%,#e2e2e2 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefefe', endColorstr='#e2e2e2',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }
        .comp-ent-fix {
            padding-top:12px !important;
          
        }
        .result-panel {
            background-color: #FFF; 
            height: 480px; 
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            margin-top:20px;
            padding-bottom:10px;
            background:rgb(255, 255, 255) url('images/panel_bg.png') bottom left  no-repeat;
        }

        .result-panel-degree {
            background-color: #FFF; 
            height: 300px; 
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            margin-top:20px;
            padding-bottom:10px;
            background:rgb(255, 255, 255) url('images/panel_bg.png') bottom left  no-repeat;
        }
       
        .info-button {
             background: #FFF; /* Old browsers */
            text-decoration:none;
            padding:6px 12px 6px 12px;
            color: #5aa7cc;
            border: 1px solid #2098d1;

        }

        .textured-bg {
            background: #ffffff; /* Old browsers */
            background: -moz-linear-gradient(left,  #ffffff 0%, #e0e0e0 50%, #ffffff 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right top, color-stop(0%,#ffffff), color-stop(50%,#e0e0e0), color-stop(100%,#ffffff)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(left,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(left,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(left,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* IE10+ */
            background: linear-gradient(to right,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=1 ); /* IE6-9 */
        }
        
        .center-table
        {
          margin: 0 auto !important;
          float: none !important;
        }
        .popup-texture {
            border-top:1px solid #e8e8e8;
        }
        .step-number {
            display: inline-block;
            border-radius: 50%;
            font-size: 24px;
            width: 40px;
            height: 40px;
            background-color: #2459a3;
            color: #fff;
            font-family: "nait-primary";
            text-align: center;
            padding-top: 4px;
            padding-left: 23px;
            margin-right: 5px;
            margin-bottom: 10px;
        }

    </style>
    <div class="container-fluid">

        <div class="row" runat="server" id="wizard">
            <div class="col-md-6 col-md-offset-3 profile-wizard ">
                <!-- STEP 1-->
                <div runat="server" id="Step1" visible="true">
                    <h2>Credential Type</h2>
                    <p style=" text-indent:-20px; margin-left:20px;"><span class="step-number">1</span>Please select a credential type you're most interested in, and click 'Next' to continue.</p>
                    <asp:DropDownList ID="DL_CredentialTypes" runat="server" CssClass="form-control"
                        AppendDataBoundItems="true" ToolTip="Select a Credential Type">
                        <asp:ListItem Value="">Select a Credential Type</asp:ListItem>
                        <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                        <asp:ListItem Value="Certificate">Certificate</asp:ListItem>
                        <asp:ListItem Value="Degree">Degree</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must select a value from the list
                         before continuing." ControlToValidate="DL_CredentialTypes" ForeColor="#800000" InitialValue=""></asp:RequiredFieldValidator>
                    <div class="bottomright">
                    <asp:LinkButton ID="Step1_Next" CssClass="wizard-buttons hvr-underline-from-left" 
                        runat="server" OnClick="Step1_Next_Click">Next <i aria-hidden="true" class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
                    </div>
                </div>
                <!-- STEP 2 -->
                <div runat="server" id="Step2" visible="false">
                    <h2>Category</h2>
                    <p style=" text-indent:-20px; margin-left:20px;"><span class="step-number">2</span>Please select one of the categories listed below that best suits your interests.</p>
                    <asp:DropDownList ID="DL_AllCategories" runat="server" CssClass="form-control"
                        DataSourceID="ODS_AllCategories"
                        DataTextField="CategoryName"
                        DataValueField="CategoryID"
                        AppendDataBoundItems="true"
                        ToolTip="Select a category">
                        <asp:ListItem Value="">Select a Category</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must select a value from the list
                         before continuing." ControlToValidate="DL_AllCategories" ForeColor="#800000" InitialValue=""></asp:RequiredFieldValidator>
                    <div class="bottomleft">
                        <asp:LinkButton ID="Step2_Prev" CssClass="wizard-buttons hvr-underline-from-right"
                             runat="server" CausesValidation="false" OnClick="Step2_Prev_Click">
                            <i aria-hidden="true" class="glyphicon glyphicon-chevron-left"></i> Previous</asp:LinkButton>
                    </div>
                        <div class="bottomright">
                        <asp:LinkButton ID="Step2_Next" CssClass="wizard-buttons hvr-underline-from-left" 
                            runat="server" OnClick="Step2_Next_Click">Next <i aria-hidden="true" class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
                    </div>
                </div>
                <!-- STEP 3 -->
                <div runat="server" id="Step3" visible="false">
                    <h2>Environment</h2>
                    <p style=" text-indent:-20px; margin-left:20px;"><span class="step-number">3</span>Please choose the applicable working conditions, or work atmosphere that you are comfortable with.</p>
                    <br />
                    <p>
                        Are you open to working outdoors?<span style="margin-right: 15px;"></span>
                        <asp:CheckBox ID="CKB_WorkOurdoors" runat="server" />
                    </p>
                    <p>
                        Are you willing to work rotational shift work?<span style="margin-right: 15px;"></span><asp:CheckBox ID="CKB_ShiftWork" runat="server" />
                    </p>
                    <p>
                        Are you interested in travelling with your career?<span style="margin-right: 15px;"></span><asp:CheckBox ID="CKB_WorkTravel" runat="server" />
                    </p>
                    <div class="bottomleft">
                    <asp:LinkButton ID="Step3_Prev" CssClass="wizard-buttons hvr-underline-from-right" runat="server" 
                        CausesValidation="false" OnClick="Step3_Prev_Click">
                        <i aria-hidden="true" class="glyphicon glyphicon-chevron-left"></i> Previous</asp:LinkButton>
                     </div>
                        <div class="bottomright">
                    <asp:LinkButton ID="Step3_Next" CssClass="wizard-buttons hvr-underline-from-left" 
                        runat="server" OnClick="Step3_Next_Click">Next <i aria-hidden="true" class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
                    </div>
                     </div>

                <!-- STEP 4 -->
                <div runat="server" id="Step4" visible="false">
                    <asp:Label ID="LB_EnterMarksTitle" runat="server" >
                        <h2>Enter Your Grades(Optional)</h2>
                    </asp:Label>
                    <div runat="server" id="degreehide" visible="true">
                    <p style=" text-indent:-20px; margin-left:20px;"><span class="step-number">4</span>Would you like to enter your high school grades, and compare them with entrance requirements?
                        <asp:CheckBox ID="EntReqShow" runat="server" OnCheckedChanged="EntReqShow_CheckedChanged"
                             AutoPostBack="true"/></p>
                    </div>
                    <div style="overflow:hidden">
                    <div runat="server" id="EnterMarksShowHide" Visible="false">
                    <asp:GridView ID="GV_EnterCourseMarks" runat="server" AutoGenerateColumns="False" CssClass="table row-fix" GridLines="None" 
                        ShowFooter="True"
                        style="text-align:center;">
                        <Columns>
                            <asp:BoundField DataField="RowNumberCourse" HeaderText="CourseID"
                                SortExpression="CourseID"
                                Visible="False" />
                            <asp:TemplateField HeaderText="Course &amp; Level">
                                <FooterTemplate>
                                    <asp:LinkButton ID="Add_Btn" runat="server" Font-Underline="false"
                                        OnClick="Add_Btn_Click" CssClass="wizard-course-buttons hvr-ripple-out add-align"  
                                        CausesValidation="false"><i aria-hidden="true" class="glyphicon glyphicon-plus"></i></asp:LinkButton>
            
                                    <asp:LinkButton ID="Remove_Btn" runat="server" Font-Underline="false"
                                        CausesValidation="false"
                                        CssClass="wizard-course-buttons hvr-ripple-out add-align"
                                        OnClick="Remove_Btn_Click"><i aria-hidden="true" class="glyphicon glyphicon-minus"></i></asp:LinkButton>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DL_Course" runat="server" DataSourceID="ODS_CourseList" CssClass="form-control"
                                        DataTextField="SubjectName"
                                        DataValueField="CourseID"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Value="">Select a Course &amp; Level</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must select a value from the list
                         before continuing." ControlToValidate="DL_Course" ForeColor="#800000" Font-Size="Smaller" InitialValue=""></asp:RequiredFieldValidator>
                                    <br />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Enter Your Marks">
                                
                                <ItemTemplate>
                                    <asp:TextBox ID="TB_EnterMarks" runat="server" CssClass="form-control ent-req-input"
                                        Width="50px"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter a number between 1 - 100" 
                                        ControlToValidate="TB_EnterMarks" MinimumValue="1" MaximumValue="100" ForeColor="Maroon" 
                                        Type="Integer" Font-Size="Smaller" Display="Dynamic"></asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must enter a grade value."
                                        ControltoValidate="TB_EnterMarks" ForeColor="Maroon" Font-Size="Smaller" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                           <%-- <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />--%>
                        </Columns>
                        <EmptyDataTemplate>
                            No data available now
                        </EmptyDataTemplate>
                    </asp:GridView>
                    </div>
                    
                    <asp:Label ID="LB_NoMarksEnteredMessage" runat="server" Visible="false">
                        <h2 style="color:#a9a9a9;">Enter Your Grades</h2>
                        <p>High School grades are not used when searching for degree programs. If you would like to use this feature,
                             please select the Certificate or Diploma option.
                        </p>
                    </asp:Label>
                    <div class="bottomleft">
                    <asp:LinkButton ID="Step4_Prev" CssClass="wizard-buttons hvr-underline-from-right"
                             runat="server" CausesValidation="false" OnClick="Step4_Prev_Click">
                            <i aria-hidden="true" class="glyphicon glyphicon-chevron-left"></i> Previous</asp:LinkButton>
                    </div>
                    <div class="bottomright">
                            <asp:LinkButton ID="Results_Lbtn" runat="server" OnClick="Results_Lbtn_Click" 
                                CssClass="wizard-buttons hvr-float-shadow">See Results</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="row" ID="Results_Header" style="background-color: #FFF;" runat="server" visible="false">
        <div class="md-col-10 col-md-offset-1">
            <div style="margin-top: 50px; margin-bottom: 30px; text-align:center;">
                <asp:Label ID="LB_EnterCourse" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_EnterMarks" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LB_ProgramCount" runat="server" CssClass="program-count"></asp:Label>

                <asp:LinkButton ID="TryAgain" style="margin-bottom:14px;" Visible="false" runat="server" CssClass="btn btn-default btn-lg" OnClick="TryAgain_Click">
                  <i aria-hidden="true" class="glyphicon glyphicon-repeat" ></i>Try Again
                </asp:LinkButton>
            </div>
            <asp:Label ID="LB_ProfileResults_Title" runat="server" Visible="false">
            <h2 style="font-family:'Open Sans Light';"">Profile Results</h2>
            </asp:Label>

        </div>


    </div>

    <div class="row results-row" style="background-color: rgba(16, 52, 108, 0.50); padding-bottom:20px;" runat="server" id="Results" visible="false">

        <asp:Repeater ID="RP_ProfileResults" runat="server" DataSourceID="ODS_ProfileResults">

            <ItemTemplate>
                <div class="col-md-3 col-md-offset-half result-panel">
                    <div style="display:table; width:100%;">
                    <div style="text-align: center; height: 60px; padding-top: 10px; padding-bottom:10px; margin:0 auto; font-family:'nait-primary'; display:table-cell; vertical-align:middle;">
                        <asp:Label ID="LB_Results_ProgramName" runat="server"
                            Text='<%# Eval("ProgramName") %>' Font-Size="16px"
                             CssClass="title-banner"></asp:Label>
                    </div>
                    </div>
                    <div class="textured-bg" style="height:20px; text-align:center; overflow:hidden;">
                        <img src="images/bg_accent_nait.png" width="262"></img>
                    </div>
                    <asp:Label ID="LB_ProgramID" runat="server" Text='<%# Eval("ProgramID") %>' Visible="false"></asp:Label>
                    <div id="ProgramDetails" runat="server" style="text-align: center; margin-left:auto; margin-right:auto;">

                        <div class="textured-bg">
                        <asp:Table ID="TBle_DetailInfo" runat="server" HorizontalAlign="Center" CssClass="center-table">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkEnvironmentTitle" runat="server" Text="Work Environment: " Style="margin-right: 20px;"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkEnvironment" runat="server" Text='<%# Eval("WorkOutboors")  %>'></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_TravelTitle" runat="server" Text="Travel: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_Travel" runat="server" Text='<%# Eval("WorkTravel") %>'></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkScheduleTitle" runat="server" Text="Work Schedule: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkSchedule" runat="server" Text='<%# Eval("ShiftWork") %>'></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2"><p></p></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2"><p></p></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2"><p></p></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Label ID="LB_CompetitiveTitle" runat="server" Text="Competitive Entrance: " CssClass="comp-ent"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell ColumnSpan="2"  CssClass="comp-ent-fix">
                                    <asp:Label ID="LB_Competitve" runat="server" Text='<%# Eval("CompetitiveAdv") + "%" %>'
                                         CssClass="comp-ent-percent"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2"><p></p></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2"><p></p></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                       </div>
                        <div class="popup-texture" style="height:5px;"></div>
                         
                         <table align="center" style="margin: 0 auto;">
                           <tr>
                               <td >
                                   <asp:Label ID="EntReqHeader" runat="server" Visible="false" Width="130px" align="left" >Entrance Reqs.</asp:Label>
                               </td>
                               <td width="30px">

                               </td>
                               <td>
                                   <asp:Label ID="StatusHeader" runat="server" Visible="false" Width="80px" align="center" style="padding-left:10px;">Status</asp:Label>
                               </td>
                           </tr>
                       </table>
                         
                        <hr style="margin: 3px 0"/>
                        
                          <%--  <asp:Label ID="ReuiredTitle_Original" runat="server" Visible="false">Entrance Requirements &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp; Status </asp:Label>--%>
                            <asp:Label ID="LB_NoEntranceReqMessage" runat="server" Text="High School marks are not required."
                                Style="color: #003992; font-size: 14px;" Visible="true"></asp:Label>
                        
                        <div style="text-align: center;">
                            <asp:Repeater ID="RP_CourseMarks" runat="server" DataSource='<%# Eval("ProgramCourseMarks") %>'>
                                <ItemTemplate>
                                    <asp:Table ID="First_CourseMarksCompare" runat="server" HorizontalAlign="Center" CssClass="center-table">
                                        <asp:TableRow HorizontalAlign="Center" runat="server">
                                            <asp:TableCell runat="server" HorizontalAlign="Left" Width="130px">
                                                <asp:Label ID="LB_Results_SubjectName" runat="server" Text='<%# Eval("SubjectName") + ":" %>'></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Right" Width="30px" runat="server">
                                                <asp:Label ID="LB_Results_Marks" runat="server" Text='<%# Eval("Marks") %>'></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Center" runat="server">
                                                <asp:Label ID="LB_Results_CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell runat="server" HorizontalAlign="Center" Width="80">
                                                <asp:Label ID="LB_UserEnterMessage" runat="server" Font-Bold="true"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div style="overflow:hidden; text-align:center;">
                            <img src="images/bg_accent_nait.png" style="padding-top:5px;" width="262"/>
                            </div>
                            <div style="position:absolute; bottom:20px; text-align:center; margin: auto; left: 0; right: 0;">
                            <asp:LinkButton ID="MoreInfo_Lbtn" runat="server"
                                 CssClass="info-button hvr-underline-from-center" Font-Underline="false"  
                                 >More Info</asp:LinkButton>
                          
                            <asp:LinkButton ID="Upgrading_Lbtn" runat="server" OnClientClick="window.open('http://www.nait.ca/95178.htm')"
                                 Visible="false"
                               CssClass="info-button hvr-underline-from-center"  Font-Underline="false">Upgrading Info</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>

        <asp:Repeater ID="RP_Degree_ProfileResults" runat="server" DataSourceID="ODS_Degree_ProfileResults" Visible ="false">

            <ItemTemplate>
                <div class="col-md-3 col-md-offset-half result-panel-degree">
                    <div style="text-align: center; height: 60px; margin-top: 20px; font-family:'nait-primary';">
                        <asp:Label ID="LB_Results_ProgramName" runat="server"
                            Text='<%# Eval("ProgramName") %>' Font-Size="16px"
                            Font-Bold="true"></asp:Label>
                    </div>
                    <div class="textured-bg" style="height:20px; text-align:center; overflow:hidden;">
                        <img src="images/bg_accent_nait.png" width="262"></img>
                    </div>
                    <asp:Label ID="LB_DegreeID" runat="server" Text='<%# Eval("ProgramID") %>' Visible="false"></asp:Label>
                    <div id="ProgramDetails" runat="server" style="text-align: center;">
                        <br />
                        <asp:Table ID="TBle_DetailInfo" runat="server" HorizontalAlign="Center">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkEnvironmentTitle" runat="server" Text="Work Environment: " Style="margin-right: 20px;"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkEnvironment" runat="server" Text='<%# Eval("WorkOutboors")  %>'></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_TravelTitle" runat="server" Text="Travel: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_Travel" runat="server" Text='<%# Eval("WorkTravel") %>'></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkScheduleTitle" runat="server" Text="Work Schedule: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left">
                                    <asp:Label ID="LB_WorkSchedule" runat="server" Text='<%# Eval("ShiftWork") %>'></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <div style="height:20px; text-align:center; overflow:hidden;margin-top:20px;">
                        <img src="images/bg_accent_nait.png" width="262"></img>
                    </div>
                        
                        <p style="font-weight: bold; font-size: 14px;">

                            <asp:Label ID="ReuiredTitle_Original" runat="server" Visible="false">Entrance Requirements &nbsp; : &nbsp;Your Marks </asp:Label>
                        </p>
                        <div style="text-align: center;">
                           
                            

                            <div style="position:absolute; bottom:20px; text-align:center; margin: auto; left: 0; right: 0;">
                            <asp:LinkButton ID="MoreInfo_Lbtn" runat="server"  CssClass="info-button hvr-underline-from-center" Font-Underline="false"
                                >More Info</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>


    <asp:ObjectDataSource ID="ODS_AllCategories" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Category_List_ForSearch" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODS_CourseList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCourseList" TypeName="Pathway_System.BLL.PathwaysController"></asp:ObjectDataSource>

    <div class="second">

        <div style="display: none;">
            <h5 style="font-weight: bold;">GV Test</h5>
            <asp:GridView ID="GV_ProfileResults" runat="server"
                AllowPaging="True"
                AutoGenerateColumns="False"
                CellPadding="4"
                DataSourceID="ODS_ProfileResults"
                ForeColor="#333333" GridLines="None"
                Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" SortExpression="ProgramID" />
                    <asp:BoundField DataField="ProgramName" HeaderText="ProgramName" SortExpression="ProgramName" />
                    <asp:BoundField DataField="CredentialType" HeaderText="CredentialType" SortExpression="CredentialType" />
                    <asp:BoundField DataField="ProgramLength" HeaderText="ProgramLength" SortExpression="ProgramLength" />
                    <asp:BoundField DataField="CompetitiveAdv" HeaderText="CompetitiveAdv" SortExpression="CompetitiveAdv" />
                    <asp:BoundField DataField="WorkOutboors" HeaderText="WorkOutboors" SortExpression="WorkOutboors"></asp:BoundField>
                    <asp:BoundField DataField="ShiftWork" HeaderText="ShiftWork" SortExpression="ShiftWork"></asp:BoundField>
                    <asp:BoundField DataField="WorkTravel" HeaderText="WorkTravel" SortExpression="WorkTravel" />
                    <asp:BoundField DataField="ProgramLink" HeaderText="ProgramLink" SortExpression="ProgramLink" />
                    <asp:BoundField DataField="EntranceRequirement" HeaderText="EntranceRequirement" SortExpression="EntranceRequirement" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <EmptyDataTemplate>
                    No data available now
                </EmptyDataTemplate>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
        <my:MessageUserControl runat="server" ID="MessageUserControl" />

        <div class="row col-md-12" id="Profile_Results" runat="server">
        </div>

        <asp:ObjectDataSource ID="ODS_ProfileResults" runat="server"
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetProfileResults"
            TypeName="Pathway_System.BLL.PathwaysController">
            <SelectParameters>
                <asp:ControlParameter ControlID="DL_CredentialTypes" Name="type" PropertyName="SelectedValue" Type="String" DefaultValue="" />
                <asp:ControlParameter ControlID="DL_AllCategories" Name="categoryId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="CKB_WorkOurdoors" Name="outdoors" PropertyName="Checked" Type="Boolean" DefaultValue="false" />
                <asp:ControlParameter ControlID="CKB_ShiftWork" Name="shift" PropertyName="Checked" Type="Boolean" DefaultValue="false" />
                <asp:ControlParameter ControlID="CKB_WorkTravel" Name="travel" PropertyName="Checked" Type="Boolean" DefaultValue="false" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ODS_Degree_ProfileResults" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDegreeProfileResults" 
            TypeName="Pathway_System.BLL.PathwaysController">
            <SelectParameters>
                <asp:ControlParameter ControlID="DL_CredentialTypes" Name="type" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DL_AllCategories" Name="categoryId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="CKB_WorkOurdoors" Name="outdoors" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="CKB_ShiftWork" Name="shift" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="CKB_WorkTravel" Name="travel" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

    </div>
</asp:Content>

