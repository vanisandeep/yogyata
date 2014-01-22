using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;
using Ropawebservices;
using System.Web.Services;
public partial class ROPA_FeedBackForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GenrateDropDownlist();
        }
    }

    private void GenrateDropDownlist()
    {   
      var context = new ROPAEntities();
        var query = from m in context.Countries select m;
        ddlCountry.DataValueField = "countrycode";
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataSource = query;
        ddlCountry.DataBind();

    }


    [WebMethod]
    public static void Display()
    {
       
        

    }

    protected void SbmtBttnId_Click(object sender, EventArgs e)
    {
        

    }
    void Insert()
    {

        var obj = new RopaWebservices();

		var result = obj.insertRecord(NameTxt.Text.Trim(), EmailIdTxt.Text.Trim(), txtphNumb.Text.Trim(), txtAddress.Text.Trim(), ddlCountry.SelectedValue, CommentTxt.Text.Trim());

        if (result == 1)
        {

            lblmssg.Visible = true;
            lblmssg.Text = obj.RecordInserted();

        }
        else
        {

            lblmssg.Visible = true;
            lblmssg.Text = obj.HelloWorld();
        }   
    }
}