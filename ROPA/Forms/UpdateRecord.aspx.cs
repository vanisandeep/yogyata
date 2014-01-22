using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;

public partial class ROPA_Forms_UpdateRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GenrateDropdownlist();
        }
    }
    protected void bttnsubmt_Click(object sender, EventArgs e)
    {
      //Get Record by id

        //int value;
       // value = Convert.ToInt32(txtInt.Text);

        string emailid;
        emailid = txtInt.Text.Trim();

        if (emailid != null)
        {
            ROPAEntities cont = new ROPAEntities();
            var Query = (from a in cont.UpcmomingSurveyors where a.EMAILID==emailid select a).FirstOrDefault();
            txtFrstName.Text = Query.FirstName;
            txtLastName.Text = Query.LastName;
            ddlRoleId.SelectedIndex = Convert.ToInt32(Query.ApplyAsRole);
            txtpsswrd.Text = Query.Password;
            txtEmailId.Text = Query.EMAILID;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string emailid;
        emailid = txtInt.Text.Trim();
        ROPAEntities context = new ROPAEntities();

        var Query = (from a in context.UpcmomingSurveyors where a.EMAILID == emailid select a).FirstOrDefault();
        if (Query != null)
        {
            ROPAUtil obj = new ROPAUtil();
           Query.FirstName = txtFrstName.Text.Trim();
           Query.LastName = txtLastName.Text.Trim();
           Query.ApplyAsRole = Convert.ToInt32(ddlRoleId.SelectedValue);
           Query.Password = txtpsswrd.Text.Trim();
           Query.EMAILID = txtEmailId.Text.Trim();
           Query.ModifedDate = DateTime.Now;
           Query.AppId = 2;
           context.SaveChanges();
         }

    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
       
    }
    void clear()
    {
        txtFrstName.Text = "";
        txtLastName.Text = "";
        ddlRoleId.ClearSelection();
        txtEmailId.Text = "";
        txtpsswrd.Text = "";
    }
}