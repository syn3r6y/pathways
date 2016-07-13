using System;
using System.Data;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pathway_System.Entities.DTOs;
using Pathway_System.BLL;


public partial class FilteredSearch : System.Web.UI.Page
{
    string allEnteredCourseMarks = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["ProgramID"] = "";

        if (TB_Search.Text == "")
        {
            GV_ProgramByKeyword.Visible = false;
            SearchKeywordHeader.Visible = false;
            
        }
        else
        {
            GV_ProgramByKeyword.Visible = true;
            SearchKeywordHeader.Visible = true;
            SearchGridView.Visible = true;
        }

    }
    protected void LinkBtn_Search_Click(object sender, EventArgs e)
    {

        GV_ProgramByKeyword.Visible = true;
        SearchKeywordHeader.Visible = true;
        SearchGridView.Visible = true;
    }

    protected void Health_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "1";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Business_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "2";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Engineering_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "3";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Construction_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "4";
            List<ProgramByCategory> Categorylist;
            PathwaysController systemmgr = new PathwaysController();
            Categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (Categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = Categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Environment_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "5";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Computer_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "6";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Hospitality_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "7";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Design_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            CategoryContain.Value = "8";
            List<ProgramByCategory> categorylist;
            PathwaysController systemmgr = new PathwaysController();
            categorylist = systemmgr.GetProgramByCategory(int.Parse(CategoryContain.Value));

            if (categorylist == null)
            {
                FormMessage.Text = "Selected Category does not exist on file.";
                FormMessage.ForeColor = Color.Red;

            }
            else
            {
                Category_Grid.DataSource = categorylist;
                Category_Grid.DataBind();
                Img_Panel.Visible = false;
                ShowButtons.Visible = true;
                Category_Grid.Visible = true;
                CatGridView.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FormMessage.Text = ex.Message;
            FormMessage.ForeColor = Color.Red;
        }
    }
    protected void Category_Grid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
        }

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[0].Text = "Program";
            e.Row.Cells[1].Text = "Credential";
            e.Row.Cells[2].Text = "Category";
            e.Row.Cells[5].Visible = false;
        }
    }
    protected void ShowButtons_Click(object sender, EventArgs e)
    {
        Img_Panel.Visible = true;
        ShowButtons.Visible = false;
        Category_Grid.Visible = false;
        CatGridView.Visible = false;
    }
    protected void Certificate_Click(object sender, ImageClickEventArgs e)
    {
        ProgramTypeContain.Value = "Certificate";
        List<ProgramByType> programtype;
        PathwaysController controller = new PathwaysController();
        programtype = controller.GetProgramByType(ProgramTypeContain.Value);
        GV_Programs.DataSource = programtype;
        GV_Programs.DataBind();
        GV_Programs.Visible = true;
        Cred_Panel.Visible = false;
        ShowCreds.Visible = true;
        CredGridView.Visible = true;
    }
    protected void Diploma_Click(object sender, ImageClickEventArgs e)
    {
        ProgramTypeContain.Value = "Diploma";
        List<ProgramByType> programtype;
        PathwaysController controller = new PathwaysController();
        programtype = controller.GetProgramByType(ProgramTypeContain.Value);
       
        GV_Programs.DataSource = programtype;
        GV_Programs.DataBind();
        GV_Programs.Visible = true;
        Cred_Panel.Visible = false;
        ShowCreds.Visible = true;
        CredGridView.Visible = true;
    }
    protected void Degree_Click(object sender, ImageClickEventArgs e)
    {
        ProgramTypeContain.Value = "Degree";
        List<ProgramByType> programtype;
        PathwaysController controller = new PathwaysController();
        programtype = controller.GetProgramByType(ProgramTypeContain.Value);
        

        GV_Programs.DataSource = programtype;
        GV_Programs.DataBind();
        GV_Programs.Visible = true;
        Cred_Panel.Visible = false;
        ShowCreds.Visible = true;
        CredGridView.Visible = true;
    }
    protected void ShowCreds_Click(object sender, EventArgs e)
    {
        Cred_Panel.Visible = true;
        ShowCreds.Visible = false;
        GV_Programs.Visible = false;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
        Category_Grid.PageIndex = 0;
        GV_Programs.PageIndex = 0;
    }
    protected void KeyNavCred_Click(object sender, EventArgs e)
    {
        KeywordSearch.Visible = false;
        CredentialSearch.Visible = true;
        CategorySearch.Visible = false;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
        ShowCreds.Visible = false;
        Cred_Panel.Visible = true;
    }
    protected void KeyNavCat_Click(object sender, EventArgs e)
    {
        KeywordSearch.Visible = false;
        CredentialSearch.Visible = false;
        CategorySearch.Visible = true;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
        ShowButtons.Visible = false;
        Img_Panel.Visible = true;
    }
    protected void CredNavKey_Click(object sender, EventArgs e)
    {
        KeywordSearch.Visible = true;
        CredentialSearch.Visible = false;
        CategorySearch.Visible = false;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
    }
    protected void CredNavCat_Click(object sender, EventArgs e)
    {
        KeywordSearch.Visible = false;
        CredentialSearch.Visible = false;
        CategorySearch.Visible = true;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
        ShowButtons.Visible = false;
        Img_Panel.Visible = true;
    }
    protected void CatNavKey_Click(object sender, EventArgs e)
    {
        KeywordSearch.Visible = true;
        CredentialSearch.Visible = false;
        CategorySearch.Visible = false;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
    }
    protected void CatNavCred_Click(object sender, EventArgs e)
    {
        KeywordSearch.Visible = false;
        CredentialSearch.Visible = true;
        CategorySearch.Visible = false;
        CredGridView.Visible = false;
        CatGridView.Visible = false;
        ShowCreds.Visible = false;
        Cred_Panel.Visible = true;
    }

    protected void GV_Programs_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
        }

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[5].Visible = false;
            e.Row.Cells[0].Text = "Program";
            e.Row.Cells[1].Text = "Credential";
            e.Row.Cells[2].Text = "Category";
        }
    }

    protected void GV_Programs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string id = e.Row.Cells[5].Text;
            e.Row.Cells[5].Visible = false;

            HyperLink programLink = new HyperLink();
            programLink.Text = e.Row.Cells[0].Text;
            programLink.NavigateUrl = "ViewProgram.aspx?programID=" + id + "&allEnteredCourseMarks=" + allEnteredCourseMarks;
            programLink.Target = "_blank";

            e.Row.Cells[0].Controls.Add(programLink);
        }
    }
    protected void GV_Programs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GV_Programs.PageIndex = e.NewPageIndex;
        List<ProgramByType> programtype;
        PathwaysController controller = new PathwaysController();
        programtype = controller.GetProgramByType(ProgramTypeContain.Value);
        GV_Programs.DataSource = programtype;
        GV_Programs.DataBind();
    }

    protected void Category_Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string id = e.Row.Cells[5].Text;
            e.Row.Cells[5].Visible = false;

            HyperLink programLink = new HyperLink();
            programLink.Text = e.Row.Cells[0].Text;
            programLink.NavigateUrl = "ViewProgram.aspx?programID=" + id + "&allEnteredCourseMarks=" + allEnteredCourseMarks;
            programLink.Target = "_blank";

            e.Row.Cells[0].Controls.Add(programLink);
        }
    }
    protected void Category_Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Category_Grid.PageIndex = e.NewPageIndex;
        List<ProgramByCategory> programCategory;
        PathwaysController controller = new PathwaysController();
        programCategory = controller.GetProgramByCategory(int.Parse(CategoryContain.Value));
        Category_Grid.DataSource = programCategory;
        Category_Grid.DataBind();
    }
}