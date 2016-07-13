using Pathway_System.BLL;
using Pathway_System.Entities;
using Pathway_System.Entities.DTOs;
using Pathway_System.Entities.Security;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPages_InstituteAdmin_UpdateProgram : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;

        if (User.IsInRole(SecurityRoles.InstituteAdmins))
        {
            InstituteAdminAccess.Visible = true;
            RestrictAccess.Visible = false;
        }
    }
    protected void InitialCredential_SelectedIndexChanged(object sender, EventArgs e)
    {
        //display programs DDL based on credential choice
        if(InitialCredential.SelectedValue == "Certificate")
        {
            CertificateList.Visible = true;
            DiplomaList.DataBind();
            DiplomaList.Visible = false;
            DegreeList.DataBind();
            DegreeList.Visible = false;
        }
        else if (InitialCredential.SelectedValue == "Diploma")
        {
            CertificateList.Visible = false;
            CertificateList.DataBind();
            DiplomaList.Visible = true;
            DegreeList.DataBind();
            DegreeList.Visible = false;
        }
        else if (InitialCredential.SelectedValue == "Degree")
        {
            CertificateList.DataBind();
            CertificateList.Visible = false;
            DiplomaList.DataBind();
            DiplomaList.Visible = false;
            DegreeList.Visible = true;
        }
        else 
        {
            CertificateList.Visible = false;
            DiplomaList.Visible = false;
            DegreeList.Visible = false;
        }
    }

    protected void ShowUpdateFields_Click(object sender, EventArgs e)
    {
        MessageUserControl.TryRun(() =>
         {
             //POPULATE FIELDS BASED ON SELECTION
             if (InitialCredential.SelectedValue == "Certificate")
             {

                 // Use a string to capture Program Length for spliting into two fields.
                 string programLength;
                 string[] programSplit = new string[2];
                 char[] splitChar = { ' ' };

                 show_update_form.Visible = true;
                 SubmitProgram.Visible = true;
                 DiplomaCertificate certificate = new DiplomaCertificate();
                 PathwaysController controller = new PathwaysController();


                 certificate = controller.CertificateProgram_byID(int.Parse(CertificateList.SelectedValue));

                 //Split string before populating form
                 programLength = certificate.ProgramLength;
                 programSplit = programLength.Split(splitChar);

                 ProgramID.Text = certificate.ProgramID.ToString();
                 ProgramName.Text = certificate.ProgramName;
                 CategoryList.SelectedValue = certificate.CategoryID.ToString();
                 CredentialType.Text = "Certificate";
                 ProgramLength.Text = programSplit[0];
                 ProgramLengthDDL.SelectedValue = programSplit[1];
                 ProgramLink.Text = certificate.ProgramLink;
                 Activated.Checked = certificate.Activated;
                 WorkOutdoors.Checked = certificate.WorkOutdoors;
                 ShiftWork.Checked = certificate.ShiftWork;
                 Travel.Checked = certificate.WorkTravel;
                 CompetitiveAdv.Text = certificate.CompetitveAdvantage.ToString();
                 EntReqDetail.Text = certificate.EntranceRequirementDetail;

                 DegreePathListView.Visible = false;
                 pathwaysheading_toggle.Visible = false;
                 entrance_req.Visible = true;
                 EntReqListView.Visible = true;
                 DiplomaEntReqList.Visible = false;

                 //ProgramLink Holder for comparison later on
                 ProgramLinkCompare.Value = certificate.ProgramLink;
                 //ProgramName Holder for comparison later on
                 ProgramNameCompare.Value = certificate.ProgramName;


             }

             else if (InitialCredential.SelectedValue == "Diploma")
             {

                 // Use a string to capture Program Length for spliting into two fields.
                 string programLength;
                 string[] programSplit = new string[2];
                 char[] splitChar = { ' ' };

                 show_update_form.Visible = true;
                 SubmitProgram.Visible = true;
                 DiplomaCertificate diploma = new DiplomaCertificate();

                 PathwaysController controller = new PathwaysController();

                 diploma = controller.DiplomaProgram_byID(int.Parse(DiplomaList.SelectedValue));

                 //Split string before populating form
                 programLength = diploma.ProgramLength;
                 programSplit = programLength.Split(splitChar);

                 ProgramID.Text = diploma.ProgramID.ToString();
                 ProgramName.Text = diploma.ProgramName;
                 CategoryList.SelectedValue = diploma.CategoryID.ToString();
                 CredentialType.Text = "Diploma";
                 ProgramLength.Text = programSplit[0];
                 ProgramLengthDDL.SelectedValue = programSplit[1];
                 ProgramLink.Text = diploma.ProgramLink;
                 Activated.Checked = diploma.Activated;
                 WorkOutdoors.Checked = diploma.WorkOutdoors;
                 ShiftWork.Checked = diploma.ShiftWork;
                 Travel.Checked = diploma.WorkTravel;
                 CompetitiveAdv.Text = diploma.CompetitveAdvantage.ToString();
                 EntReqDetail.Text = diploma.EntranceRequirementDetail;

                 entrance_req.Visible = true;
                 EntReqListView.Visible = false;
                 DiplomaEntReqList.Visible = true;
                 DiplomaPathListView.Visible = true;
                 pathwaysheading_toggle.Visible = true;
                 DegreePathListView.Visible = false;

                 //ProgramLink Holder for comparison later on
                 ProgramLinkCompare.Value = diploma.ProgramLink;
                 //ProgramName Holder for comparison later on
                 ProgramNameCompare.Value = diploma.ProgramName;

             }
             else if (InitialCredential.SelectedValue == "Degree")
             {
                 // Use a string to capture Program Length for spliting into two fields.
                 string programLength;
                 string[] programSplit = new string[2];
                 char[] splitChar = { ' ' };

                 show_update_form.Visible = true;
                 SubmitProgram.Visible = true;
                 Degree degree = new Degree();

                 PathwaysController controller = new PathwaysController();
                 degree = controller.DegreeProgram_byID(int.Parse(DegreeList.SelectedValue));

                 //Split string before populating form
                 programLength = degree.DegreeLength;
                 programSplit = programLength.Split(splitChar);

                 ProgramID.Text = degree.DegreeID.ToString();
                 ProgramName.Text = degree.DegreeName;
                 CategoryList.SelectedValue = degree.CategoryID.ToString();
                 CredentialType.Text = "Degree";
                 ProgramLength.Text = programSplit[0];
                 ProgramLengthDDL.SelectedValue = programSplit[1];
                 ProgramLink.Text = degree.DegreeLink;
                 Activated.Checked = degree.Activated;
                 WorkOutdoors.Checked = degree.WorkOutdoors;
                 ShiftWork.Checked = degree.ShiftWork;
                 Travel.Checked = degree.WorkTravel;

                 pathwaysheading_toggle.Visible = true;
                 EntReqListView.Visible = false;
                 DegreePathListView.Visible = true;
                 DiplomaEntReqList.Visible = false;
                 DiplomaPathListView.Visible = false;
                 entrance_req.Visible = false;

                 //ProgramLink Holder for comparison later on
                 ProgramLinkCompare.Value = degree.DegreeLink;
                 //ProgramName Holder for comparison later on
                 ProgramNameCompare.Value = degree.DegreeName;

                 DegreePathListView.DataSource = DipRelDB_ODS;
                 DegreePathListView.DataBind();
             }

             else
             {

                 DegreePathListView.Visible = false;
                 DiplomaEntReqList.Visible = false;
                 DiplomaPathListView.Visible = false;
                 pathwaysheading_toggle.Visible = false;
                 EntReqListView.Visible = false;
                 entrance_req.Visible = false;
             }

         });
    }
    protected void SubmitProgram_Click(object sender, EventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {

            // BUILD OBJECTS AND UPDATE BASED ON PROGRAM TYPE

            //Declare variables for error handling
            Uri tempUrl;
            int temp;
            string errorList = "";

            if (InitialCredential.SelectedValue == "Certificate")
            {
                //Validate non-string variables
                //Po
                bool result = int.TryParse(ProgramLength.Text.Trim(), out temp);
                if (!result)
                {
                    errorList += "- Please enter a numeric value into the program length field (whole number only). \\n";
                }
                if (temp != 0)
                {
                    //Po
                    if ((int.Parse(ProgramLength.Text.Trim())) < 0 || (int.Parse(ProgramLength.Text.Trim())) > 100)
                    {
                        errorList += "- Program length must be a whole number between 1 - 99. \\n";
                    }
                }
                //Validate URL
                //Po
                result = Uri.TryCreate(ProgramLink.Text.Trim(), UriKind.Absolute, out tempUrl) && tempUrl.Scheme == Uri.UriSchemeHttp;
                if (!result)
                {
                    errorList += "- Please enter a properly formatted URL (ex. http://www.example.com). \\n";
                }
                PathwaysController controller = new PathwaysController();

                
                
                //verify the URL does not exist 
                if (ProgramLinkCompare.Value != ProgramLink.Text.Trim())
                {
                    //Po
                    bool checkURL = controller.CheckDipCertUrl(ProgramLink.Text.Trim());
                    if (checkURL == false)
                    {
                        errorList += "- The url selected currently exists in the system, and cannot be repeated.\\n";
                    }
                }

                //verify the name does not exist
                //Po
                if (ProgramNameCompare.Value != ProgramName.Text.Trim())
                {
                    //Po
                    bool checkName = controller.CheckProgramName(ProgramName.Text.Trim());
                    if (checkName == false)
                    {
                        errorList += "- The Program Name selected currently exists in the system, and cannot be repeated.\\n";
                    }  
                }

                //Validate field lengths
                if (ProgramName.Text.Trim().Length > 100)
                {
                    errorList += "- Program Name cannot exceed 100 characters. \\n";
                }

                if (ProgramLink.Text.Trim().Length > 150)
                {
                    errorList += "- Program Link cannot exceed 150 characters. \\n";
                }
                //validate field length
                if (EntReqDetail.Text.Trim().Length > 150)
                {
                    errorList += "- Entrance Requirement Details cannot exceed 150 characters. \\n";
                }

                byte competitiveAdvantage;
                result = byte.TryParse(CompetitiveAdv.Text.Trim(), out competitiveAdvantage);
                if (!result)
                {
                    errorList += "- Please enter a numeric value into the competitive advantage field (whole numbers greater than zero only). \\n";
                }

                if (competitiveAdvantage < 0 || competitiveAdvantage > 100)
                {
                    errorList += "- Please enter a numeric value between 1 - 99. \\n";
                }

                //populate certificate
                DiplomaCertificate certificate = new DiplomaCertificate()
                {
                    ProgramID = int.Parse(ProgramID.Text),
                    ProgramName = ProgramName.Text.Trim(),
                    ProgramLength = ProgramLength.Text.Trim() + " " + ProgramLengthDDL.SelectedValue,
                    EntranceRequirementDetail = EntReqDetail.Text,
                    CompetitveAdvantage = competitiveAdvantage,
                    ProgramLink = ProgramLink.Text.Trim() ,
                    Activated = Activated.Checked,
                    WorkOutdoors = WorkOutdoors.Checked,
                    ShiftWork = ShiftWork.Checked,
                    WorkTravel = Travel.Checked,
                    CredentialType = false,
                    CategoryID = int.Parse(CategoryList.SelectedValue)
                };
                if (errorList != "")
                {
                    throw new Exception(errorList);
                }
                //process update
               // PathwaysController controller = new PathwaysController();
                controller.CertDiploma_Update(certificate);
                Clear_Click();
                Response.Write("<script type=\"text/javascript\">alert('The selected Certificate program has been updated.');</script>");
            }
            else if (InitialCredential.SelectedValue == "Diploma")
            {
                //Validate non-string variables
                bool result = int.TryParse(ProgramLength.Text.Trim(), out temp);
                if (!result)
                {
                    errorList += "- Please enter a numeric value into the program length field (whole number only). \\n";
                }
                if (temp != 0)
                {
                    if ((int.Parse(ProgramLength.Text)) < 0 || (int.Parse(ProgramLength.Text)) > 100)
                    {
                        errorList += "- Program length must be a whole number between 1 - 99. \\n";
                    }
                }
                //Validate URL
                result = Uri.TryCreate(ProgramLink.Text.Trim(), UriKind.Absolute, out tempUrl) && tempUrl.Scheme == Uri.UriSchemeHttp;
                if (!result)
                {
                    errorList += "- Please enter a properly formatted URL (ex. http://www.example.com). \\n";
                }
                PathwaysController controller = new PathwaysController();

                //verify the URL does not exist 
                if (ProgramLinkCompare.Value != ProgramLink.Text.Trim())
                {
                    bool checkURL = controller.CheckDipCertUrl(ProgramLink.Text.Trim());
                    if (checkURL == false)
                    {
                        errorList += "- The url selected currently exists in the system, and cannot be repeated.\\n";
                    }
                }

                //verify the name does not exist
                if (ProgramNameCompare.Value != ProgramName.Text.Trim())
                {
                    bool checkName = controller.CheckProgramName(ProgramName.Text.Trim());
                    if (checkName == false)
                    {
                        errorList += "- The Program Name selected currently exists in the system, and cannot be repeated.\\n";
                    }
                }

                //Validate field lengths
                if (ProgramName.Text.Trim().Length > 100)
                {
                    errorList += "- Program Name cannot exceed 100 characters. \\n";
                }

                if (ProgramLink.Text.Trim().Length > 150)
                {
                    errorList += "- Program Link cannot exceed 150 characters. \\n";
                }
                //validate field length
                if (EntReqDetail.Text.Trim().Length > 150)
                {
                    errorList += "- Entrance Requirement Details cannot exceed 150 characters. \\n";
                }

                byte competitiveAdvantage;
                result = byte.TryParse(CompetitiveAdv.Text.Trim(), out competitiveAdvantage);
                if (!result)
                {
                    errorList += "- Please enter a numeric value into the competitive advantage field (whole numbers greater than zero only). \\n";
                }

                if (competitiveAdvantage < 0 || competitiveAdvantage > 100)
                {
                    errorList += "- Please enter a numeric value between 1 - 99. \\n";
                }

                //populate diploma
                DiplomaCertificate diploma = new DiplomaCertificate()
                {
                    ProgramID = int.Parse(ProgramID.Text),
                    ProgramName = ProgramName.Text.Trim(),
                    ProgramLength = ProgramLength.Text.Trim() + " " + ProgramLengthDDL.SelectedValue,
                    EntranceRequirementDetail = EntReqDetail.Text.Trim(),
                    CompetitveAdvantage = competitiveAdvantage,
                    ProgramLink = ProgramLink.Text.Trim(),
                    Activated = Activated.Checked,
                    WorkOutdoors = WorkOutdoors.Checked,
                    ShiftWork = ShiftWork.Checked,
                    WorkTravel = Travel.Checked,
                    CredentialType = true,
                    CategoryID = int.Parse(CategoryList.SelectedValue)
                };
                if (errorList != "")
                {
                    throw new Exception(errorList);
                }
                //process update
                //PathwaysController controller = new PathwaysController();
                controller.CertDiploma_Update(diploma);
                Clear_Click();
                Response.Write("<script type=\"text/javascript\">alert('The selected Diploma program has been updated.');</script>");
            }
            else if (InitialCredential.SelectedValue == "Degree")
            {
                //Validate non-string variables
                bool result = int.TryParse(ProgramLength.Text.Trim(), out temp);
                if (!result)
                {
                    errorList += "- Please enter a numeric value into the program length field (whole number only). \\n";
                }
                if (temp != 0)
                {
                    if ((int.Parse(ProgramLength.Text.Trim())) < 0 || (int.Parse(ProgramLength.Text)) > 100)
                    {
                        errorList += "- Program length must be a whole number between 1 - 99. \\n";
                    }
                }
                //Validate URL
                result = Uri.TryCreate(ProgramLink.Text.Trim(), UriKind.Absolute, out tempUrl) && tempUrl.Scheme == Uri.UriSchemeHttp;
                if (!result)
                {
                    errorList += "- Please enter a properly formatted URL (ex. http://www.example.com). \\n";
                }

                PathwaysController controller = new PathwaysController();
                if (ProgramLinkCompare.Value != ProgramLink.Text.Trim())
                {
                    //verify the URL does not exist 
                    bool checkURL = controller.CheckDegUrl(ProgramLink.Text.Trim());
                    if (checkURL == false)
                    {
                        errorList += "- The url selected currently exists in the system, and cannot be repeated.\\n";
                    }
                }

                //verify the name does not exist
                if (ProgramNameCompare.Value != ProgramName.Text.Trim())
                {
                    bool checkName = controller.CheckProgramName(ProgramName.Text.Trim());
                    if (checkName == false)
                    {
                        errorList += "- The Program Name selected currently exists in the system, and cannot be repeated.\\n";
                    }
                }

                //Validate field lengths
                if (ProgramName.Text.Trim().Length > 100)
                {
                    errorList += "- Program Name cannot exceed 100 characters. \\n";
                }

                if (ProgramLink.Text.Trim().Length > 150)
                {
                    errorList += "- Program Link cannot exceed 150 characters. \\n";
                }

                //populate degree
                Degree degree = new Degree()
                {
                    DegreeID = int.Parse(ProgramID.Text),
                    DegreeName = ProgramName.Text.Trim(),
                    DegreeLength = ProgramLength.Text.Trim() + " " + ProgramLengthDDL.SelectedValue,
                    DegreeLink = ProgramLink.Text.Trim(),
                    Activated = Activated.Checked,
                    WorkOutdoors = WorkOutdoors.Checked,
                    ShiftWork = ShiftWork.Checked,
                    WorkTravel = Travel.Checked,
                    CategoryID = int.Parse(CategoryList.SelectedValue)
                };

                if (errorList != "")
                {
                    throw new Exception(errorList);
                }
                //process update
                //PathwaysController controller = new PathwaysController();
                controller.Degree_Update(degree);
                Clear_Click();
                Response.Write("<script type=\"text/javascript\">alert('The selected Degree program has been updated.');</script>");
                
            }
            else
            {

            }
        });
    }

    
    public void Clear_Click()
    {
        InitialCredential.SelectedIndex = 0;
        DegreePathListView.Visible = false;
        DiplomaEntReqList.Visible = false;
        DiplomaPathListView.Visible = false;
        pathwaysheading_toggle.Visible = false;
        EntReqListView.Visible = false;
        entrance_req.Visible = false;
        show_update_form.Visible = false;
        SubmitProgram.Visible = false;
        CertificateList.DataBind();
        DiplomaList.DataBind();
        DegreeList.DataBind();
        CertificateList.Visible = false;
        DiplomaList.Visible = false;
        DegreeList.Visible = false;
        
    }
    
    protected void EntReqListView_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            bool result;
            int mark;

            int selectedIndex = (e.Item.FindControl("EntReqCourses") as DropDownList).SelectedIndex;

            result = int.TryParse((e.Item.FindControl("MarkTextBox") as TextBox).Text.Trim(), out mark);

            if (!result)
            {
                errorList += "- Marks entered must be whole numbers. \\n";
            }

            if (mark < 0 || mark > 100)
            {
                errorList += "- Marks must be whole numbers between 1 - 99. \\n";
            }
            if (selectedIndex == 0)
            {
                errorList += "- You must select a course when inserting a new Entrance Requirement. \\n";
            }

            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
    protected void EntReqListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            bool result;
            int mark;

            ListViewItem item = EntReqListView.Items[e.ItemIndex];
            result = int.TryParse((item.FindControl("MarkTextBox") as TextBox).Text.Trim(), out mark);

            if (!result)
            {
                errorList += "- Marks entered must be whole numbers. \\n";
            }

            if (mark < 0 || mark > 100)
            {
                errorList += "- Marks must be whole numbers between 1 - 99. \\n";
            }


            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
    protected void DiplomaEntReqList_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            bool result;
            int mark;
            int selectedIndex = (e.Item.FindControl("EntReqCourses") as DropDownList).SelectedIndex;
            result = int.TryParse((e.Item.FindControl("MarkTextBox") as TextBox).Text.Trim(), out mark);

            if (!result)
            {
                errorList += "- Marks entered must be whole numbers. \\n";
            }

            if (mark < 0 || mark > 100)
            {
                errorList += "- Marks must be whole numbers between 1 - 99. \\n";
            }
            if (selectedIndex == 0)
            {
                errorList += "- You must select a course when inserting a new Entrance Requirement. \\n";
            }

            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
    protected void DiplomaEntReqList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            bool result;
            int mark;

            ListViewItem item = DiplomaEntReqList.Items[e.ItemIndex];
            result = int.TryParse((item.FindControl("MarkTextBox") as TextBox).Text.Trim(), out mark);

            if (!result)
            {
                errorList += "- Marks entered must be whole numbers. \\n";
            }

            if (mark < 0 || mark > 100)
            {
                errorList += "- Marks must be whole numbers between 1 - 99. \\n";
            }


            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
    protected void DiplomaPathListView_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            int selectedIndex = (e.Item.FindControl("DipDegList") as DropDownList).SelectedIndex;

            if (selectedIndex == 0)
            {
                errorList += "- You must select a program when inserting a new Pathway. \\n";
            }

            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }


        });
    }
    protected void DegreePathListView_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            int selectedIndex = (e.Item.FindControl("GetDiplomaName") as DropDownList).SelectedIndex;

            if (selectedIndex == 0)
            {
                errorList += "- You must select a program when inserting a new Pathway. \\n";
            }

            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }


        });
    }
    protected void DegreePathListView_PreRender(object sender, EventArgs e)
    {
        DegreePathListView.DataSource = DipRelDB_ODS;
        DegreePathListView.DataBind();
    }
}