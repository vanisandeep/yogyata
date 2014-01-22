﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;
public partial class ROPA_Forms_Feedbackdetails :PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            try
            {
                BindGrid();
            }
            catch(Exception)
            {
                
            }
        }
    }


    void BindGrid()
    {
        var obj = new ROPAUtil();
        grdFddfrm.DataSource = obj.FeedbackDetailsToGrid();
        grdFddfrm.DataBind();
    }


    protected void grdFddfrm_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ShowPopup")
        {
            var btndetails = (LinkButton)e.CommandSource;
            var gvrow = (GridViewRow)btndetails.NamingContainer;
            lblID.Text = grdFddfrm.DataKeys[gvrow.RowIndex].Value.ToString();
            txtfeedbackcommnts.Text = HttpUtility.HtmlDecode(gvrow.Cells[1].Text);
           Popup(true);
        }
    }


  
    
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        BindGrid();


        if (txtfeedbackcommnts.Text != null)
        {
        int number = Convert.ToInt32(lblID.Text);


        var obj = new ROPAUtil();
        obj.UPdateFeedbackdetails(number, txtfeedbackcommnts.Text.Trim());

            
           BindGrid(); 
         Popup(false);
        }
    }




   private  void Popup(bool isDisplay)
    {
        var builder = new StringBuilder();
        if (isDisplay)
        {
            builder.Append("<script language=JavaScript> ShowPopup(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPopup", builder.ToString());
        }
        else
        {
            builder.Append("<script language=JavaScript> HidePopup(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "HidePopup", builder.ToString());
        }

    }
}