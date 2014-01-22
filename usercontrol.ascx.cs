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

public partial class usercontrol : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {  
        //Will create CheckBoxList dynamically
        AddingDynamicCheckBoxList();
    }

    private void AddingDynamicCheckBoxList()
    {
        Label tblabel = new Label();
        tblabel.Text = "Firstname";
        tblabel.ID = "lblFrstname";
        PlaceHolder1.Controls.Add(tblabel);
        TextBox tb = new TextBox();
        tb.ID = "test";
        PlaceHolder1.Controls.Add(tb);


        CheckBoxList ChkboxList = new CheckBoxList();
        ChkboxList.ID = "Chkbox";

        //Displaying A,B... in CheckBoxList
        for (int i = 65; i <= 90; i++)
        {
            ChkboxList.Items.Add(new ListItem(Convert.ToChar(i).ToString(), 
                                           Convert.ToChar(i).ToString()));
        }
        PlaceHolder1.Controls.Add(ChkboxList);
    }

    private void DisplaySelectedCheckBox()
    {
        // will find the CheckBoxList in PlaceHolder
        CheckBoxList Chkbox = (CheckBoxList)PlaceHolder1.FindControl("Chkbox");
        foreach (ListItem e in Chkbox.Items)
        {
            if (e.Selected)
            {
                Response.Write(String.Format("You selected: <i>{0}</i> <br>", e.Value));
            }
        }
    }


    private void ResetCheckboxes()
    {
        //Will uncheck the all the Selected CheckBoxList
        CheckBoxList Chkbox = (CheckBoxList)PlaceHolder1.FindControl("Chkbox");
        foreach (ListItem e in Chkbox.Items)
        {
            if (e.Selected)
            {
                e.Selected = false;
            }
        }
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {
        DisplaySelectedCheckBox();

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        ResetCheckboxes();
    }
}