using System;
using System.Collections.Generic;
using System.Linq;
using ROPAModel;
using System.IO;
using System.Drawing;


public partial class ROPA_RegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindGridviewData();

            GenrateDropdownlist();
            tblreg.Visible = true;
        }
    }


    private void BindGridviewData()
    {
        List<UploadFile> L = ResolveList();
        if (L.Count == 0) return;

		ROPAUtil obj = new ROPAUtil();
        gvDetails.DataSource = L;
        gvDetails.DataBind();
    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {

        string filename = Path.GetFileName(fileUpload1.PostedFile.FileName);
		
		Stream stream = fileUpload1.PostedFile.InputStream;

		string extension = Path.GetExtension(filename);
		//Write Save Logic  to file/
		BinaryReader br = new BinaryReader(stream);
		Byte[] size = br.ReadBytes((int)stream.Length);
		//SaveToFolder(stream, filename);
        
		//Database already here 
		List<UploadFile> L = ResolveList();
        using (ROPAEntities obj = new ROPAEntities())
        {
            Guid G = Guid.NewGuid();
            UploadFile upld = new UploadFile();
            upld.GUID = G.ToString();
            upld.FIleFor = filename;
            upld.SurApp_Id = null;
            obj.AddToUploadFiles(upld);
            obj.SaveChanges();

            L.Add(upld);
        }
        UpdateSession(L);
        BindGridviewData();
    }

	private void SaveToFolder(Stream stream, string filename)
	{
		string extension = Path.GetExtension(filename);
		//Write Save Logic  to file/
		BinaryReader br = new BinaryReader(stream);
		Byte[] size = br.ReadBytes((int)stream.Length);
	}

    private void UpdateSession(List<UploadFile> L)
    {
        Session["L"] = L;
    }

    private List<UploadFile> ResolveList()
    {
			if (Session["L"] == null)
			{
				return new List<UploadFile>();
			}
			return (List<UploadFile>)Session["L"];

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ROPAUtil obj = new ROPAUtil();

            bool x = obj.CheckAvliablity(txtEmailId.Text.Trim());
            if ((x))
            {
                lblchAvl.Text = obj.CheckAvliablitySuccessMessage();
                lblchAvl.Visible = true;
                lblchAvl.ForeColor = Color.Red;
                return;
            }


            List<UploadFile> L = ResolveList();

            int result = obj.InsertRecord(txtFrstName.Text.Trim(), txtLastName.Text.Trim(), Convert.ToInt32(ddlRoleId.SelectedValue), txtpsswrd.Text.Trim(), txtEmailId.Text.Trim(), L);

            if (result == 1)
            {
                lblmssg.Visible = true;
                lblmssg.Text = obj.InsertedMessage();
                tblreg.Visible = false;
                ClearSession();
            }

        }
        catch (Exception)
        {

        }
    }

    private void ClearSession()
    {
        Session["L"] = null;
    }

    void GenrateDropdownlist()
    {
		try
		{
			ROPAEntities context = new ROPAEntities();
			var query = from m in context.UpcomingRoles select m;
			ddlRoleId.DataValueField = "RoleId";
			ddlRoleId.DataTextField = "RoleName";
			ddlRoleId.DataSource = query;
			ddlRoleId.DataBind();
		}
		catch (Exception)
		{
 
		}
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Clear();
    }

    void Clear()
    {
        txtEmailId.Text = "";
        txtFrstName.Text = "";
        txtLastName.Text = "";
        txtpsswrd.Text = "";
        ddlRoleId.ClearSelection();

        using (ROPAEntities context = new ROPAEntities())
        {
         var deleteQuery = (from u in context.UploadFiles where u.SurApp_Id ==null  select u).ToList();
            context.DeleteObject(deleteQuery);
            context.SaveChanges();
        }
		gvDetails.DataSource = null;
		gvDetails.DataBind();
		ClearSession();
    }

		
	}



	//protected void chckAvliblity_Click(object sender, EventArgs e)
	//{
	//    try
	//    {
	//        string u = txtEmailId.Text.Trim();
	//        if (string.IsNullOrEmpty(u))
	//        {
	//            txtEmailId.Focus();
	//            return;
	//        }
 
	//        ROPAUtil Obj = new ROPAUtil();
	//        bool isAvaiable = Obj.CheckAvliablity(u);
	//        lblchAvl.Text = isAvaiable ? Obj.CheckAvliablitySuccessMessage() : Obj.CheckAvliablityFailMessage();
	//        lblchAvl.Visible = true;
	//        lblchAvl.ForeColor = isAvaiable ? Color.Green : Color.Red;

	//    }
	//    catch (Exception )
	//    {

	//    }
	//}
//}