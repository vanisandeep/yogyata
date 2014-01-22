using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using ROPAModel;

public partial class ROPA_Forms_DynamicRegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            GenrateFirstName();
            DropDownlist();
            GenratedButton();
            GenratedClear();
       
    }
    protected void GenrateFirstName()
    {
        Label lblFrstname = new Label();
        lblFrstname.ID = "lblFrstName";
        lblFrstname.Text = "First Name";
        plcHldrRegsform.Controls.Add(lblFrstname);

        RequiredFieldValidator rqFrstname = new RequiredFieldValidator();
        rqFrstname.ID = "rqFrstName";
        rqFrstname.ControlToValidate = "txtFrstName";
        rqFrstname.ErrorMessage = "Not empty";
        rqFrstname.Text = "*";
        rqFrstname.ForeColor = Color.Red; 
        rqFrstname.SetFocusOnError = true;
        rqFrstname.ValidationGroup = "req";
        plcHldrRegsform.Controls.Add(rqFrstname);
        TextBox txtFrstname = new TextBox();
        txtFrstname.ID = "txtFrstName";
        plcHldrRegsform.Controls.Add(txtFrstname);
    }

    protected void DropDownlist()
    {
        ROPAEntities context = new ROPAEntities();
        var query = from m in context.UpcomingRoles select m;
        Label lblddlrole = new Label();
        lblddlrole.Text = "Apply As Role";
        plcHldrRegsform.Controls.Add(lblddlrole);

        DropDownList ddldropdwnlist = new DropDownList();
        ddldropdwnlist.ID = "Ddlroleid";

        ddldropdwnlist.Items.Add(new ListItem("Select","0"));

        ddldropdwnlist.Items.Add(new ListItem(Convert.ToString(ddldropdwnlist.DataValueField="RoleId").ToString(),Convert.ToString(ddldropdwnlist.DataTextField="RoleName").ToString()));
        ddldropdwnlist.DataSource = query;
        ddldropdwnlist.DataBind();
        plcHldrRegsform.Controls.Add(ddldropdwnlist);

      //  for (int i = 65; i <= 70; i++)
        //    {
        //ddldropdwnlist.Items.Add(new ListItem(Convert.ToChar(i).ToString(),Convert.ToChar(i).ToString()));
       // plcHldrRegsform.Controls.Add(ddldropdwnlist);
       // }
    }
    protected void GenratedButton()
    {
        Button Bttnsbmt = new Button();
        Bttnsbmt.Text = "Submit";
        Bttnsbmt.Click += new EventHandler(btn_submit_Click);   
        plcHldrRegsform.Controls.Add(Bttnsbmt);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        
    }

    protected void GenratedClear()
    {
        Button bttnClr = new Button();
        bttnClr.Text = "Clear";
        bttnClr.Click += new EventHandler(btn_Clear_Click);
        plcHldrRegsform.Controls.Add(bttnClr);

    }
    protected void btn_Clear_Click(Object sender, EventArgs e)
    {
        clear();
    }

    void clear()
    {
        TextBox txtrest = (TextBox)plcHldrRegsform.FindControl("txtFrstName");
        txtrest.Text = "";

        DropDownList ddlrest = (DropDownList)plcHldrRegsform.FindControl("Ddlroleid");
        ddlrest.ClearSelection();
    }
   
   



   
}