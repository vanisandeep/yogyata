using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ROPA_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            lblmssg.Visible = true;
            //string username =  string( Session["UserAuthentication"]);
       

                lblmssg.Text = "Your Application has been Deleted succesfully";
               // lblmssg.Text = username;
           // }

            
        }
    }
}