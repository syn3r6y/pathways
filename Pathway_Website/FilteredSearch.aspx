<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FilteredSearch.aspx.cs" Inherits="FilteredSearch" %>



<asp:Content ID="Filtered_Search" ContentPlaceHolderID="MainContent" runat="Server">
    
    <style type="text/css">
        body {
            background: url('images/filter-search-bg.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            height: 100% !important;
        }


        .search-bar {
            margin-left: auto;
            margin-right: auto;
            margin-top: 15px;
            text-align: center !important;
        }

            .search-bar:first-child {
                margin-top: 60px;
                height: 50px;
                font-size: 24px;
            }

        .search-ddl {
            margin-top: 40px;
            margin-right: 10px;
        }

        .search-h1-main {
            font-family: "Open Sans Light";
            font-size: 40px;
            padding-top: 40px;
        }

        .background-fix {
            background: rgba(255, 255, 255, 0.90) url('images/search_bg.png') no-repeat right bottom;
            border-radius: 4px;
            margin-top:20px;
            min-height:100px;
        }

        .gridview-paging a {
            padding: 5px 10px 5px 10px;
            border: 1px solid #3d9ad7;
            margin-left: 2.5px;
            margin-right:2.5px;
            transition: all 0.5s ease 0s;
            text-decoration: none;
        }

            .gridview-paging a:hover {
                box-shadow: inset 0 0 0 3px #3d9ad7;
            }
    </style>

    <script>
        function viewSize_pc() {
            var height = $(window).height();
            var viewSize_pc = height - 90;
            viewSize_pc = parseInt(viewSize_pc) + 'px';
            $(".background-fix").css('min-height', viewSize_pc);
        }

        $(document).ready(function () {
            viewSize_pc();
            $(window).bind('resize', viewSize_pc);
        });
    </script>

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12 background-fix">
                <div style="text-align:center;">
                <h1 class="search-h1-main">Filtered Search</h1>
                    </div>
                <!-- KEYWORD SEARCH -->
                <div runat="server" id="KeywordSearch" visible="true">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills">
                        <li>
                            <asp:LinkButton ID="KeyNavKey" runat="server" CssClass="nav-pills-active hvr-grow-shadow">By Keyword</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="KeyNavCred" runat="server" OnClick="KeyNavCred_Click" CssClass="hvr-grow-shadow">By Credential Type</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="KeyNavCat" runat="server" OnClick="KeyNavCat_Click" CssClass="hvr-grow-shadow">By Category</asp:LinkButton></li>
                    </ul>

                    <!-- Content -->
                    <div style="text-align: center !important;">
                        <p>
                            <asp:TextBox ID="TB_Search" runat="server" class="form-control search-bar" ToolTip="Enter Info here" placeholder="Start your search.." 
                                onfocus="this.placeholder = ''" align="left" >
                            </asp:TextBox>
                            <asp:Label ID="FormMessage" runat="server" Text=""></asp:Label>
                            <asp:LinkButton ID="LinkBtn_Search" runat="server" ToolTip="Search" OnClick="LinkBtn_Search_Click" class="hvr-grow-shadow search-button search-bar">
                                <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div style="clear: both;">
                        
                        <p>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TB_Search" ErrorMessage="Only alphanumeric characters can be entered to search" ForeColor="#CC0000" SetFocusOnError="True" ValidationExpression="^[0-9a-zA-Z ]+$"></asp:RegularExpressionValidator>
                        </p>
                    </div>

                    <h2 runat="server" id="SearchKeywordHeader" visible="false">Program Results:</h2>
                    <div style="overflow-x:hidden" runat="server" id="SearchGridView" visible="false">
                    <asp:GridView ID="GV_ProgramByKeyword" runat="server" Visible="False" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ODS_ProgramByKeyword" class="table table-striped" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Program">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# String.Format("ViewProgram.aspx?programID={0}&allEnteredCourseMarks={1}&promptShow=false",DataBinder.Eval(Container.DataItem, "ProgramID"), "")%>' 
                                        Target="_blank" Text='<%# Eval("ProgramName") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CredentialType" HeaderText="Credential" SortExpression="CredentialType" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" Visible="False" />
                            <asp:BoundField DataField="CategoryDescription" HeaderText="CategoryDescription" SortExpression="CategoryDescription" Visible="False" />
                            
                        </Columns>
                        <EmptyDataTemplate>
                            <p style="font-size:16px;">No matches found. Please try again, or rephrase your search.</p>
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="gridview-paging" />
                    </asp:GridView>
                    </div>
                </div>
                <!-- END KEYWORD SEARCH -->

                <!-- CREDENTIAL SEARCH -->
                <div runat="server" id="CredentialSearch" visible="false">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills">
                        <li>
                            <asp:LinkButton ID="CredNavKey" runat="server" OnClick="CredNavKey_Click" CssClass="hvr-grow-shadow">By Keyword</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="CredNavCred" runat="server" CssClass="nav-pills-active hvr-grow-shadow">By Credential Type</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="CredNavCat" runat="server" OnClick="CredNavCat_Click" CssClass="hvr-grow-shadow">By Category</asp:LinkButton></li>
                    </ul>

                    <!-- Content -->
                    <div style="text-align: center; margin-top: 20px;" runat="server" id="Cred_Panel">
                        <asp:ImageButton ID="Certificate" runat="server" ImageUrl="~/images/certificate.png" onmouseover="this.src='/images/certificate-hover.png'"
                            onmouseout="this.src='/images/certificate.png'" OnClick="Certificate_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Diploma" runat="server" ImageUrl="~/images/diploma.png" onmouseover="this.src='/images/diploma-hover.png'"
                            onmouseout="this.src='/images/diploma.png'" OnClick="Diploma_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Degree" runat="server" ImageUrl="~/images/degree.png" onmouseover="this.src='/images/degree-hover.png'"
                            onmouseout="this.src='/images/degree.png'" OnClick="Degree_Click" CssClass="image-search" />
                    </div>
                    <div style="text-align: center; margin-bottom:20px;">
                        <asp:LinkButton ID="ShowCreds" runat="server" CssClass="search-button delete-fix hvr-underline-from-center" Visible="false" OnClick="ShowCreds_Click"
                            Style="margin-top: 40px; margin-bottom: 20px;"><i aria-hidden="true" class="glyphicon glyphicon-repeat"></i> Choose Another Type</asp:LinkButton>
                    </div>
                    <h2 runat="server" id="SearchCredHeader" visible="false">Program Results:</h2>
                    <div style="overflow-x:hidden" runat="server" id="CredGridView" visible="false">
                        <asp:GridView ID="GV_Programs" runat="server" AllowPaging="true" OnRowCreated="GV_Programs_RowCreated"
                            class="table table-striped" GridLines="None" OnRowDataBound="GV_Programs_RowDataBound" OnPageIndexChanging="GV_Programs_PageIndexChanging">
                    
                            <EmptyDataTemplate>
                               There is no data avaialble.
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="gridview-paging" />
                    </asp:GridView>
                    </div>
                </div>
                <asp:HiddenField ID="ProgramTypeContain" runat="server"></asp:HiddenField>
                <!-- END CREDENTIAL SEARCH -->

                <!-- CATEGORY SEARCH -->
                <div runat="server" id="CategorySearch" visible="false">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills">
                        <li>
                            <asp:LinkButton ID="CatNavKey" runat="server" OnClick="CatNavKey_Click" CssClass="hvr-grow-shadow">By Keyword</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="CatNavCred" runat="server" OnClick="CatNavCred_Click" CssClass="hvr-grow-shadow">By Credential Type</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="CatNavCat" runat="server" CssClass="nav-pills-active hvr-grow-shadow">By Category</asp:LinkButton></li>
                    </ul>

                    <!-- Content -->
                    <div style="text-align: center; margin-top: 20px;" runat="server" id="Img_Panel">
                        <asp:ImageButton ID="Health" runat="server" TabIndex="1" ImageUrl="~/images/health-services.png" onmouseover="this.src='/images/health-services-hover.png'"
                            onmouseout="this.src='/images/health-services.png'" OnClick="Health_Click" CssClass="image-search" Style="margin-left: 4px;" />
                        <asp:ImageButton ID="Business" runat="server" TabIndex="2" ImageUrl="~/images/business.png" onmouseover="this.src='/images/business-hover.png'"
                            onmouseout="this.src='/images/business.png'" OnClick="Business_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Engineering" runat="server" TabIndex="3" ImageUrl="~/images/engineering.png" onmouseover="this.src='/images/engineering-hover.png'"
                            onmouseout="this.src='/images/engineering.png'" OnClick="Engineering_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Construction" runat="server" TabIndex="4" ImageUrl="~/images/construction.png" onmouseover="this.src='/images/construction-hover.png'"
                            onmouseout="this.src='/images/construction.png'" OnClick="Construction_Click" CssClass="image-search" />
                        <br />
                        <asp:ImageButton ID="Environment" runat="server" TabIndex="5" ImageUrl="~/images/environmental.png" onmouseover="this.src='/images/environmental-hover.png'"
                            onmouseout="this.src='/images/environmental.png'" OnClick="Environment_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Computer" runat="server" TabIndex="6" ImageUrl="~/images/computers-it.png" onmouseover="this.src='/images/computers-it-hover.png'"
                            onmouseout="this.src='/images/computers-it.png'" OnClick="Computer_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Hospitality" runat="server" TabIndex="7" ImageUrl="~/images/culinary.png" onmouseover="this.src='/images/culinary-hover.png'"
                            onmouseout="this.src='/images/culinary.png'" OnClick="Hospitality_Click" CssClass="image-search" />
                        <asp:ImageButton ID="Design" runat="server" TabIndex="8" ImageUrl="~/images/design.png" onmouseover="this.src='/images/design-hover.png'"
                            onmouseout="this.src='/images/design.png'" OnClick="Design_Click" CssClass="image-search" />
                    </div>
                    <div style="text-align: center; margin-bottom:20px;">
                        <asp:LinkButton ID="ShowButtons" runat="server" CssClass="search-button delete-fix hvr-underline-from-center" Visible="false" OnClick="ShowButtons_Click"
                            Style="margin-top: 40px; margin-bottom: 20px;"><i aria-hidden="true" class="glyphicon glyphicon-repeat"></i> Choose Another Category</asp:LinkButton>
                    </div>
                    <div style="overflow-x:hidden"  runat="server" id="CatGridView"  visible="false">
                    <asp:GridView ID="Category_Grid" runat="server" OnRowCreated="Category_Grid_RowCreated" class="table table-striped"  OnPageIndexChanging="Category_Grid_PageIndexChanging"
                        OnRowDataBound="Category_Grid_RowDataBound" GridLines="None" AllowPaging="true" >
                         <PagerStyle CssClass="gridview-paging" />
                    </asp:GridView>
                    </div>
                    
                </div>
                <asp:HiddenField ID="CategoryContain" runat="server"></asp:HiddenField>
                <!-- END CATEGORY SERACH -->

            </div>
            <!-- COLSPAN 12 -->
        </div>

    </div>
    <!-- CONTAINER -->



    <asp:ObjectDataSource ID="ODS_ProgramByKeyword" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProgramByKeyword" TypeName="Pathway_System.BLL.PathwaysController">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="keyword" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

