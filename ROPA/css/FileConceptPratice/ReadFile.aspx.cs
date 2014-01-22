using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class FileConceptPratice_ReadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {
            LblMessage.Text = "";
        }
    }
    //ButtonClick Event method
    protected void పంపుసందేశం(object sender, EventArgs e)
    {
        try
        {
            //Buttonclick event
            సందేశం2();
            //Reset the TextBoxs
            పంపుసందేశం1();
        }
        catch (Exception e1) { 
        
        }
    }

    //saved the file into text file
    protected void సందేశం2()
    {
        try
        {

            using (StreamWriter w = new StreamWriter(Server.MapPath(@"~\upload\data.txt"), true))
            {
                w.WriteLine("సందేశం");
                w.WriteLine("<br/>");
                w.WriteLine(సంमहमசெவ்வாસસನಾਸੈE1.Text.Trim());
                w.WriteLine("<br/>");
                w.WriteLine(LblDateTime.Text = DateTime.Now.ToString());
                 // Write the text
                //variable name
                int పంపు = 0;
                //count the variable name
                పంపు = సంमहमசெவ்வாસસನಾਸੈE1.Text.Length;
                //write the  data into a file in our project
                w.WriteLine(పంపు);
            
               }
            LblMessage.Text = "థాంక్స్....(Thanks)";
        }
        catch (Exception e)
        { }
 
    }

    //Reset Controls
    protected void పంపుసందేశం1()
    {
        సంमहमசெவ்வாસસನಾਸੈE1.Text = "";  
    }
}