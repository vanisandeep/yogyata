using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ROPA_FormsUsing_WebuserControllers_FeedBackUsingWebUSer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
    }
    protected void lgoutbttn_Click(object sender, EventArgs e)
    {

        Session.Abandon();
        Session.Remove("Username");
        Session.Clear();
        FormsAuthentication.SignOut();
        // Response.Redirect(Request.UrlReferrer.ToString());
        Response.Redirect("~/ROPA/Forms/LoginPage.aspx");
    }
}