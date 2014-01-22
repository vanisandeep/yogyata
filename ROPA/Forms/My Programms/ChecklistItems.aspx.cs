using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class My_Programms_ChecklistItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Control add = (Control)(Page.LoadControl("~/usercontrol.ascx"));
        PlaceHolder1.Controls.Add(add);
    }
}