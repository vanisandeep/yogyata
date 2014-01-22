using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyROPAlib;

public partial class ROPA_AddUsingDll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Class1 c = new Class1();
        Response.Write( c.ADD(1, 2));
       

    }
}