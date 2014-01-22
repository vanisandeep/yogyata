using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class My_Programms_InputNumberTostring : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblreslut.Visible = true;
        }

    }
    protected void Btnsubmt(object sender, EventArgs e)
    {
        Util obj = new Util();   
       lblreslut.Text="Your  Number is :" + obj.limit( Convert.ToInt16(txtNumb.Text));
        
    }
}