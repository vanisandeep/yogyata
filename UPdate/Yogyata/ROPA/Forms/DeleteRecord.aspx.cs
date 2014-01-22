using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;
using System.IO;
public partial class ROPA_DeleteRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
 
        }

    }


    protected void bttnseach_Click(object sender, EventArgs e)
    {
        try
        {
            lblmssg.Visible = true;
           string deletuser = txtSrch.Text.Trim();
            
          if((!string.IsNullOrEmpty(deletuser)))
          {
            ROPAUtil obj = new ROPAUtil();
            int result = Convert.ToInt16(obj.Deleteuser(deletuser));

            if (result == 1)
            {

                lblmssg.Text = "Your Application has been Deleted succesfully";
                Delteuser.Visible = false;
            }
            else 
            {
                lblmssg.Text = "Not found";
            }
          }
        }
        catch (Exception)
        {

        }
    }
    
   
}