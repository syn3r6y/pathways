<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewProgram.aspx.cs" Inherits="ViewProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script>
        function matchColHeights(col1, col2) {
            var col1Height = $(col1).height();
            console.log(col1Height);
            var col2Height = $(col2).height();
            console.log(col2Height);
            if (col1Height < col2Height) {
                $(col1).height(col2Height);
            } else {
                $(col2).height(col1Height);
            }
        }

        $(document).ready(function () {
            matchColHeights('#leftcol', '#rightcol');
        });

        $(document).ready(function () {
            matchColHeights('#leftcol1', '#rightcol1');
        });
    </script>

    <style type="text/css">
        .table-fix {
            margin: 0 auto;
        }

            .table-fix tr td {
                padding: 4px 8px;
                font-size: 18px;
                font-family: "Open Sans Light";
            }

        body {
            background: url('images/viewprogram-bg.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            height: 100% !important;
        }

        .heading {
            margin-top: 20px;
            padding:6px;
            -webkit-box-shadow: 0px 12px 7px -10px rgba(0, 0, 0, 0.5);
            -moz-box-shadow:    0px 12px 7px -10px rgba(0, 0, 0, 0.5);
            box-shadow:         0px 12px 7px -10px rgba(0, 0, 0, 0.5);
            background: -moz-linear-gradient(left,  rgba(255,255,255,0) 0%, rgba(255,255,255,0.5) 12%, rgba(255,255,255,1) 25%, rgba(255,255,255,1) 50%, rgba(255,255,255,1) 75%, rgba(255,255,255,0.5) 88%, rgba(255,255,255,0) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(255,255,255,0)), color-stop(12%,rgba(255,255,255,0.5)), color-stop(25%,rgba(255,255,255,1)), color-stop(50%,rgba(255,255,255,1)), color-stop(75%,rgba(255,255,255,1)), color-stop(88%,rgba(255,255,255,0.5)), color-stop(100%,rgba(255,255,255,0))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(left,  rgba(255,255,255,0) 0%,rgba(255,255,255,0.5) 12%,rgba(255,255,255,1) 25%,rgba(255,255,255,1) 50%,rgba(255,255,255,1) 75%,rgba(255,255,255,0.5) 88%,rgba(255,255,255,0) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(left,  rgba(255,255,255,0) 0%,rgba(255,255,255,0.5) 12%,rgba(255,255,255,1) 25%,rgba(255,255,255,1) 50%,rgba(255,255,255,1) 75%,rgba(255,255,255,0.5) 88%,rgba(255,255,255,0) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(left,  rgba(255,255,255,0) 0%,rgba(255,255,255,0.5) 12%,rgba(255,255,255,1) 25%,rgba(255,255,255,1) 50%,rgba(255,255,255,1) 75%,rgba(255,255,255,0.5) 88%,rgba(255,255,255,0) 100%); /* IE10+ */
            background: linear-gradient(to right,  rgba(255,255,255,0) 0%,rgba(255,255,255,0.5) 12%,rgba(255,255,255,1) 25%,rgba(255,255,255,1) 50%,rgba(255,255,255,1) 75%,rgba(255,255,255,0.5) 88%,rgba(255,255,255,0) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00ffffff', endColorstr='#00ffffff',GradientType=1 ); /* IE6-9 */

        }

        .background-div {
            margin-top: 20px;
            background: -moz-linear-gradient(left,  rgba(237,237,237,0.9) 0%, rgba(193,193,193,0.9) 50%, rgba(237,237,237,0.9) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(237,237,237,0.9)), color-stop(50%,rgba(193,193,193,0.9)), color-stop(100%,rgba(237,237,237,0.9))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(left,  rgba(237,237,237,0.9) 0%,rgba(193,193,193,0.9) 50%,rgba(237,237,237,0.9) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(left,  rgba(237,237,237,0.9) 0%,rgba(193,193,193,0.9) 50%,rgba(237,237,237,0.9) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(left,  rgba(237,237,237,0.9) 0%,rgba(193,193,193,0.9) 50%,rgba(237,237,237,0.9) 100%); /* IE10+ */
            background: linear-gradient(to right,  rgba(237,237,237,0.9) 0%,rgba(193,193,193,0.9) 50%,rgba(237,237,237,0.9) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e6ededed', endColorstr='#e6ededed',GradientType=1 ); /* IE6-9 */

            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }

        .panel-bg {
            margin-top:20px;
            background-color:white;
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }
        .inside-div {
            background-color: rgba(255, 255, 255, 0.90);
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }

        .td-value {
            font-weight: bold;
            color: #1c4279;
        }

        .col-centered {
            float: none;
            margin: 0 auto;
        }

        .center-table
        {
          margin: 0 auto !important;
          float: none !important;
        }

        .comp-adv-bg {
            margin-left: auto;
            margin-right:auto;
            margin-top:-10px;
            border-radius:50%;
            height:65px;
            width:65px;
            background: rgb(44,110,192); /* Old browsers */
            background: -moz-radial-gradient(center, ellipse cover,  rgba(44,110,192,1) 0%, rgba(28,66,121,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(44,110,192,1)), color-stop(100%,rgba(28,66,121,1))); /* Chrome,Safari4+ */
            background: -webkit-radial-gradient(center, ellipse cover,  rgba(44,110,192,1) 0%,rgba(28,66,121,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-radial-gradient(center, ellipse cover,  rgba(44,110,192,1) 0%,rgba(28,66,121,1) 100%); /* Opera 12+ */
            background: -ms-radial-gradient(center, ellipse cover,  rgba(44,110,192,1) 0%,rgba(28,66,121,1) 100%); /* IE10+ */
            background: radial-gradient(ellipse at center,  rgba(44,110,192,1) 0%,rgba(28,66,121,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2c6ec0', endColorstr='#1c4279',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
            -webkit-box-shadow: 0px 12px 7px -6px rgba(0, 0, 0, 0.5);
            -moz-box-shadow:    0px 12px 7px -6px rgba(0, 0, 0, 0.5);
            box-shadow:         0px 12px 7px -6px rgba(0, 0, 0, 0.5);
            line-height:60px;
        }

        .comp-adv {
            font-family: "Open Sans";
            font-size: 28px;
            font-weight: bold;
            color: rgba(255,255,255,1);
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 1);
        }
        .more-info-button {
            /*display:block;*/
            text-align:center;
            width:100px;
            background: #FFF; /* Old browsers */
            text-decoration:none;
            padding:6px 12px 6px 12px;
            color: rgb(44,110,192);
            border: 1px solid #2098d1;
        }
        
        .notice {
            margin-top:20px;
            background-color: #ffd1d1;
            border: 1px solid #981212;
            margin-bottom:20px;
            color:#981212;
            padding: 14px;
        }
        .small-gradient {
            background: #ffffff; /* Old browsers */
            background: -moz-linear-gradient(left,  #ffffff 0%, #e0e0e0 50%, #ffffff 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right top, color-stop(0%,#ffffff), color-stop(50%,#e0e0e0), color-stop(100%,#ffffff)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(left,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(left,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(left,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* IE10+ */
            background: linear-gradient(to right,  #ffffff 0%,#e0e0e0 50%,#ffffff 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=1 ); /* IE6-9 */
        }

        .degree-environment {
            margin-top:20px;
            padding-top:1px;
            padding-bottom:10px;
            background-color:white;
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }
    </style>

    <div class="container">
        <div class="row background-div">
            <div class="col-md-11 col-centered heading" style="text-align: center;">
                <!-- MAIN PROGRAM INFORMATION -->
                <h1 style="font-family: 'Open Sans Light'; font-size: 36px;">
                    <asp:Label ID="ProgramName" runat="server"></asp:Label>
                </h1>
                <h2 style="font-variant: small-caps; color: #808080;">
                    <asp:Label ID="CredentialType" runat="server"></asp:Label>
                </h2>
                <asp:Label ID="LB_TestCourseMarks" runat="server"></asp:Label>
                <asp:Label ID="LB_TestCourse" runat="server"></asp:Label>
                <asp:Label ID="LB_TestMarks" runat="server"></asp:Label>
            </div>
        
            <!-- WORK ENVIRONMENT-->
            <div runat="server" id="ProgramEnvironment" visible="true">
                <div class="col-md-4 col-md-offset-1 column-height panel-bg" id="leftcol" style="text-align: left; margin-bottom:20px;">
                    <div style="margin-top: 30px;">
                        <h3 style="text-align:center;">Work Environment</h3>
                        <div style="text-align:center; overflow:hidden;" class="small-gradient">
                            <img src="images/bg_accent_nait.png"/>
                        </div>
                        <table class="table-fix" style="border-top:1px solid #e8e8e8;">
                            <tr>
                                <td>Working Outdoors:</td>
                                <td class="td-value">
                                    <asp:Label ID="WorkOutdoors" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Travel:</td>
                                <td class="td-value">
                                    <asp:Label ID="Travel" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Work Schedule:</td>
                                <td class="td-value">
                                    <asp:Label ID="Schedule" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                        <div style="text-align:center; overflow:hidden;">
                            <img src="images/bg_accent_nait.png"/>
                        </div>
                    </div>
                </div>
            </div>
            <div runat="server" id="MarkInfo" visible="true">
                <div class="col-md-4 col-md-offset-2 column-height panel-bg" id="rightcol">
                    <div style="text-align: center;">
                        <h3>Competitive Advantage:</h3>
                    </div>
                    <div class="small-gradient" style="padding-bottom:10px; border-bottom:1px solid #e8e8e8;">
                    <div style="text-align: center; overflow:hidden;">
                        <img src="images/bg_accent_nait.png"/>   
                    </div>

                    <div class="comp-adv-bg" style="text-align:center;">
                        <asp:Label ID="CompetitiveAdvantage" runat="server" CssClass="comp-adv"></asp:Label>
                    </div>
                    </div>
                    <h4 style="text-align: center; margin-top:7px; margin-bottom:5px;">Entrance Requirement Details:</h4>
                    <div style="text-align:center; overflow:hidden;">
                            <img src="images/bg_accent_nait.png"/>
                        </div>
                    <div style="padding: 0 40px 20px 40px;">
                        <asp:Label ID="EntranceDetails" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <!-- ROW-->

        <div class="row background-div" style="text-align: center;">
            <div runat="server" id="ProgramGradeInfo" visible="true">
                <div class="col-md-4 col-md-offset-1" style="padding-top: 20px;">
                    
                    <div class="inside-div" id="leftcol1">
                    <h4 style="padding-top:10px; margin-top:0;">Grades Required for Program:</h4>
                        <div style="text-align:center; overflow:hidden;">
                            <img src="images/bg_accent_nait.png"/>
                        </div>
                    <asp:GridView ID="EntReq_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="EntranceReqODS"
                        GridLines="None" CssClass="table-fix table-striped">
                        <Columns>
                            <asp:TemplateField HeaderText="Course Name" SortExpression="CourseName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TB_CourseName" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LB_CourseName" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Grade" SortExpression="Mark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TB_Marks" runat="server" Text='<%# Bind("Mark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LB_Marks" runat="server" Text='<%# Bind("Mark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                        <EmptyDataTemplate>
                               <p>There are no High School marks required for this program.</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <div style="height:10px;"></div>
                    </div>
                </div>
                <div class="col-md-4 col-md-offset-2" style="padding-top: 20px;">
                    
                    <div class="inside-div" id="rightcol1">
                        <h4 style="padding-top:10px; margin-top:0;">Your Grades:</h4>
                        <div style="text-align:center; overflow:hidden;">
                            <img src="images/bg_accent_nait.png"/>
                        </div>
                        <!-- Marks entered in Profile -->
                        <asp:GridView ID="CourseMarks_Gridview" runat="server" CssClass="table-fix table-striped" GridLines="None" OnRowCreated="CourseMarks_Gridview_RowCreated">
                            <EmptyDataTemplate>
                                <p>You haven&#39;t entered your grades for this program yet. If you&#39;d like to see a comparison, click
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LearnerPathway.aspx"> here.</asp:HyperLink></p>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>


            <!-- DEGREE WORK ENVIRONMENT INFO -->
            <div runat="server" id="DegreeWorkInfo" visible="false" class="degree-environment col-md-4 col-centered">
                <h3 style="text-align: center;">Work Environment</h3>
                <div style="text-align:center; overflow:hidden;">
                   <img src="images/bg_accent_nait.png"/>
                </div>
                <table class="table-fix">
                    <tr>
                        <td>Working Outdoors:</td>
                        <td class="td-value">
                            <asp:Label ID="DegOutDoors" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Travel:</td>
                        <td class="td-value">
                            <asp:Label ID="DegTravel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Work Schedule:</td>
                        <td class="td-value">
                            <asp:Label ID="DegSchedule" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </div>

            <div class="col-md-10 col-md-offset-1 heading" style="padding-bottom: 20px; border-top:1px solid rgb(189, 189, 189)">
                <!-- PROGRAM LINK -->
                <h3 style="margin-top:5px;">Detailed Program Information:</h3>
                <div style="text-align:center; overflow:hidden;">
                            <img src="images/bg_accent_nait.png"/>
                        </div>
                <asp:HyperLink ID="ProgramLink" runat="server"></asp:HyperLink>
            </div>

            <div class="col-md-8 col-md-offset-2 notice" runat="server" id="MarksNotQualified" visible="false">
            <!-- Message Prompt if marks are not met, with upgrading info -->
           <p>It looks like you may need to improve some of your
                 course marks to enter this program. If you're interested in improving and upgrading your marks, click 
                <a href="http://www.nait.ca/95178.htm">here.</a>
            </p>
        </div>
        </div>
        <!-- ROW -->
        <asp:ObjectDataSource ID="EntranceReqODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="EntReqList_byID" TypeName="Pathway_System.BLL.PathwaysController">
            <SelectParameters>
                <asp:QueryStringParameter Name="programID" QueryStringField="programID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>




        


        <!-- ROW -->


        <!------------------PATHWAYS INFORMATION---------------------->

        <div class="row" runat="server" id="Div_FuturePathway" visible="false">
            <div class="col-md-12">
                <!-- h2 - Take Your Education Further OR What programs take you there -->
                <h2>
                    <asp:Label ID="Label1" runat="server"></asp:Label></h2>

                <!-- sentence describing if you would like to continue/get to where you could like to go, these options are available -->
                

                <!-- Add degree/diploma pathways here -->
                <%--Po's Future Pathway--%>
                <div class="row" style="background-color:rgba(28, 66, 121, 0.90);">
                    <%--Po's Future Pathway title--%>
                <asp:Label ID="PathwaysDescriptor" runat="server"><h3 style="text-align:center; font-size:30px; color:#fff;
                font-family:'Open Sans Light';">Take Your Education Further</h3></asp:Label>
                    <div class="col-md-10 col-md-offset-1" >
                        <p style="color:#fff;">
                            If you would like to continue your education, the following degree(s) 
            are suggested upon successful completion of the certain program:
                        </p>
                        <div class="col-md-8 col-md-offset-2" style="text-align:center !important;">
                        <asp:Repeater ID="RP_FuturePathWay" runat="server" >
                            <ItemTemplate>
                                    
                                <div>
                                  <asp:Label ID="LB_MyFuturePathDegreeID" runat="server" Text='<%# Eval("DegreeID") %>' Visible="false"></asp:Label>
                               
                                   
                                    <asp:Label ID="DegreeName" Text='<%# Eval("DegreeName") %>' runat="server"
                                                Style="font-size: medium; font-weight: bold; line-height:16px;
                                                 color: #fff; text-shadow: 1px 1px 5px rgba(0, 0, 0, 1);" />
                                        <br />
                                        <br />
                                        <%--<asp:HyperLink ID="HL_DegreeLink" runat="server" Font-Underline="false" ForeColor="White"
                                                   CssClass="more-info-button">More Info
                                        </asp:HyperLink>--%>
                                        <asp:LinkButton ID="LBtn_DegreeLink" runat="server" Font-Underline="false"
                                                   CssClass="more-info-button hvr-underline-from-center" style="text-align:center;"
                                             PostBackUrl='<%# "ViewProgram.aspx?programID=" + Eval("DegreeID") + "&allEnteredCourseMarks=&promptShow=false" %>'>More Info</asp:LinkButton> 
                                        <br />
                                    <br />
                                    <div style="clear:both;"></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- ROW -->

        <!-- CONTAINER FLUID -->
    <%--Po's Future Pathway ODS--%>
    <asp:ObjectDataSource ID="ODS_FuturePath" runat="server"
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetProgramDegreeLinks"
        TypeName="Pathway_System.BLL.PathwaysController">
        <SelectParameters>
            <asp:QueryStringParameter Name="programID" QueryStringField="programID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

