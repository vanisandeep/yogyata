using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;
public partial class ROPA_WebuserControllers_Feedback : System.Web.UI.UserControl
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
        ROPAEntities context = new ROPAEntities();
        var query = from m in context.Countries select m;
        ddlCountry.DataValueField = "countrycode";
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataSource = query;
        ddlCountry.DataBind();

    }
    protected void SbmtBttnId_Click(object sender, EventArgs e)
    {

        ROPAUtil obj = new ROPAUtil();
        int result = obj.InsertFeedBackRecord(NameTxt.Text.Trim(), EmailIdTxt.Text.Trim(), txtphNumb.Text.Trim(), txtAddress.Text.Trim(), ddlCountry.SelectedValue, CommentTxt.Text.Trim());

        if (result == 1)
        {
            //string mssg = obj.InsertedMessage();
            lblmssg.Visible = true;
            lblmssg.Text = obj.InsertedMessage();
            Div.Visible = false;
        }
        else
        {
            // string FailMssg = obj.FailMessage();
            lblmssg.Visible = true;
            lblmssg.Text = obj.FailMessage();
        } 


    }
}