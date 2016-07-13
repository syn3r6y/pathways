<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        html {
            height:100%;
        }
        body {
          background: url(images/home-bg.jpg) no-repeat center center fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
        }

        h1.home-heading {
            font-size:60px;
            color:#FFF;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 1);
            text-align:center;
        }
        .circle-button {
            border-radius: 50%;
            width: 260px;
            height: 260px;
            background: rgba(255, 255, 255, 0.75);
            margin-left: auto;
            margin-right:auto;
            margin-top: 20px;
            margin-bottom:20px;
            -webkit-box-shadow: 4px 4px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    4px 4px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         4px 4px 5px 0px rgba(0, 0, 0, 0.75);
            text-align:center;
            margin-bottom:40px;
        }
        .circle-button a {
            color: #225899;
            text-decoration:none;
        }
        .circle-button a img {
            padding-top: 20px;
        }
        .circle-button a h4 {
            font-size: 20px;
        }
        .circle-button:hover {
            background: rgba(255, 255, 255, 1);
            -webkit-box-shadow: 0px 0px 17px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    0px 0px 17px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         0px 0px 17px 0px rgba(0, 0, 0, 0.75);
        }
        .main-desc {
            font-family: "Open Sans Light";
            padding:10px 0;
            font-size: 16px;
            color:#225899;
            /*text-shadow:0 0 10px #000, 0 0 20px #000, 0 0 30px #000, 0 0 40px #000, 0 0 50px #000, 0 0 60px #000, 0 0 70px #000;*/
            text-align: justify;
            font-weight:100 !important;

        }
        .col-centered {
            display:inline-block;
            float:none;
            /* reset the text-align */
            text-align:left;
            /* inline-block space fix */
            margin-right:-4px;
        }    
        .row-centered {
            text-align:center;
        }
        .row-info {
        background-color: rgba(255, 255, 255, 0.90);
            margin-top:40px;
            margin-bottom: 60px;
            border-radius: 4px;
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }

        .arrow-box {
	        position: relative;
	        background: rgba(255, 255, 255, 0.85);
            -webkit-box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(0, 0, 0, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(0, 0, 0, 0.75);
        }
        .arrow-box:after {
	        bottom: 100%;
	        left: 50%;
	        border: solid transparent;
	        content: " ";
	        height: 0;
	        width: 0;
	        position: absolute;
	        pointer-events: none;
	        border-color: rgba(255, 255, 255, 0);
	        border-bottom-color: rgba(255, 255, 255, 0.85);
	        border-width: 30px;
	        margin-left: -30px;
        }

    </style>   

    <div class="container-fluid">
        <div class="row">
            <h1 class="home-heading">Find Your Academic Pathway</h1>
        </div>
    </div>
    <div class="container">
        <div class="row row-centered">
            <div class="col-md-6">
                <div class="circle-button hvr-grow-shadow">
                    <a href="LearnerPathway.aspx"><img src="images/path-button.png" alt="learner pathway" />
                    <h4>Learner Pathway</h4>
                    </a>
                </div>
                <div class="col-md-8 col-centered arrow-box">
                <p class="main-desc">Choosing this option will allow you to start building a profile, giving you calculated suggestions as to what academic programs you may be interested in.</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="circle-button hvr-grow-shadow">
                    <a href="FilteredSearch.aspx"><img src="images/search-glass.png" alt="filtered search" />
                    <h4>Filtered Search</h4>
                    </a>
                </div>
                <div class="col-md-8 col-centered arrow-box">
                <p class="main-desc">Choosing this option will take you to our keyword, credential, and category search options, where you find the program you're looking for.</p>
                </div>
            </div>
        </div>

        <div class="row row-info">
            <h2 style="font-family: 'Open Sans Light'; text-align:center; font-size:36px;">What is 'Pathways'?</h2>
            <p style="font-size:16px; padding:30px;">Pathways is a site designed to help guide you on your academic journey. We try and take what you're interested in, 
                what you're looking for in a career, and provide a list of programs that fit your needs. We can also show you the
                possibilities for educational advancement beyond your chosen program. Let us help you find your path!
            </p>
        </div>
    </div>






  <%--      TEST SECTION     --%>

  
    
</asp:Content>
