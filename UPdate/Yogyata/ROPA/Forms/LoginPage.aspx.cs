using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using ROPAModel;

public partial class ROPA_Forms_LoginPage :System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
          //  string script = "<script type=\"text/javascript\">alert('abc');</script>";
           // ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if((!string.IsNullOrEmpty(txtUserName.Text.Trim())))
        {
            GetUserName();
        }
        
    }

    private void GetUserName()
    {
       ROPAUtil obj = new ROPAUtil();
     
       string UserEmail= obj.GetUserDetailsByEmailId(txtUserName.Text.Trim());
       if ((!string.IsNullOrEmpty(UserEmail)))
       {
           if (txtPassword.Text.Trim() == UserEmail)
           {
               Response.Redirect("~/ROPA/FormsUsing WebuserControllers/FeedBackUsingWebUSer.aspx");
           }
           else 
           {


               string message = obj.LoginFailMessage();
               System.Text.StringBuilder sb = new System.Text.StringBuilder();

               sb.Append("<script type = 'text/javascript'>");

               sb.Append("window.onload=function(){");

               sb.Append("alert('");

               sb.Append(message);

               sb.Append("')};");

               sb.Append("</script>");

               ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                         
           }
       }
      
    }
}