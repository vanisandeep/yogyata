using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;

public partial class ROPA_Search_Box : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            tblreg.Visible = false;
        }
    }


    protected void bttnseach_Click(object sender, EventArgs e)
    {
        //GenrateDropdownlist();
        int value;
        value = Convert.ToInt32(txtSrch.Text);
        if (value != null)
        {

            ROPAEntities cont = new ROPAEntities();
            var kk = (from a in cont.UpcmomingSurveyors where a.SurApp_Id == value select a).FirstOrDefault();
            txtFrstName.Text = kk.FirstName;
            txtLastName.Text = kk.LastName;
            ddlRoleId.SelectedIndex = Convert.ToInt32(kk.ApplyAsRole);
            txtpsswrd.Text = kk.Password;
            tblreg.Visible = true;
        }
    }

    void GenrateDropdownlist()
    {
        //Model
        ROPAEntities context = new ROPAEntities();
        //LinQ to sql  Query
        var query = from m in context.UpcomingRoles select m;

        ddlRoleId.DataValueField = "RoleId";
        ddlRoleId.DataTextField = "RoleName";
        ddlRoleId.DataSource = query;
        ddlRoleId.DataBind();
    }
}