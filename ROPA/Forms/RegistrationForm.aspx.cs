using System;
using System.Collections.Generic;
using System.Linq;
using ROPAModel;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class ROPA_RegistrationForm : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			BindGridviewData();
			GenrateDropdownlist();
		
		}
	}


	private void BindGridviewData()
	{
		try
		{
			List<UploadFile> L = ResolveList();
			//	if (L.Count == 0) return;

			ROPAUtil obj = new ROPAUtil();
			gvDetails.DataSource = L;
			gvDetails.DataBind();
		}
		catch(Exception e) 
		{ }
	}



	protected void btnUpload_Click(object sender, EventArgs e)
	{

		string filename = Path.GetFileName(fileUpload1.PostedFile.FileName);

		Stream stream = fileUpload1.PostedFile.InputStream;

		int fileSize = fileUpload1.PostedFile.ContentLength;

		string extension = Path.GetExtension(filename);
		//Write Save Logic  to file/
		BinaryReader br = new BinaryReader(stream);
		Byte[] size = br.ReadBytes((int)stream.Length);
		//SaveToFolder(stream, filename);

		//Database already here 
		List<UploadFile> L = ResolveList();

		if (L.Count > 0)
		{
			//If file is Already Exist or not if exist skip this step
			bool flag;
			flag = IsFileExistOrNot(L, filename);
			if (IsFileExistOrNot(L, filename) == false)
			{
				using (ROPAEntities obj = new ROPAEntities())
				{
					Guid G = Guid.NewGuid();
					UploadFile upld = new UploadFile();
					upld.GUID = G.ToString();
					upld.FIleFor = filename;
					upld.SurApp_Id = null;
					upld.filecc = size;
					obj.AddToUploadFiles(upld);
					obj.SaveChanges();

					L.Add(upld);
				}
				UpdateSession(L);
				BindGridviewData();
			}
		}
		else 
		{
			//Not there here  first time 
			using (ROPAEntities obj = new ROPAEntities())
			{
				Guid G = Guid.NewGuid();
				UploadFile upld = new UploadFile();
				upld.GUID = G.ToString();
				upld.FIleFor = filename;
				upld.filecc = size;
				obj.AddToUploadFiles(upld);
				obj.SaveChanges();
				L.Add(upld);
			}
			UpdateSession(L);
			BindGridviewData();
		}
		
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
		ClearSession();
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
			var deleteQuery = (from u in context.UploadFiles where u.SurApp_Id == null select u).ToList();
			context.DeleteObject(deleteQuery);
			context.SaveChanges();
		}
		
		ClearSession();
	}

	public UploadFile GetDocument(int id)
	{
		using (ROPAEntities entity = new ROPAEntities())
		{
			var doc = (from a in entity.UploadFiles
					   where a.UPloadId == id
					   select a).FirstOrDefault();
			return doc;
		}
	}

	protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		try
		{
			if (e.CommandName == "DownLoad")
			{
				string filename = e.CommandArgument.ToString();
				int localId = Convert.ToInt32(filename);
				UploadFile doc = GetDocument(localId);
				if (filename != "")
				{
					Byte[] bytes = doc.filecc;
					string fileName = doc.FIleFor;
					Response.ContentType = doc.fileext;
					Response.ContentType = doc.FIleFor;
					Response.ContentType = "text/HTML";
					Response.AddHeader("Content-Disposition", "attachment;filename=\"" + fileName);
					Response.AddHeader("Content-Length", doc.FIleFor.ToString());
					Response.BinaryWrite(bytes);

				}
			}
		}
		catch (Exception)
		{
		}

	}
	protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		try
		{
			e.Cancel = true;
			int UploadId = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value);
			List<UploadFile> L = ResolveList();
			using (ROPAEntities contxt = new ROPAEntities())
			{
				var entity = (from surapp in contxt.UploadFiles where surapp.UPloadId == UploadId select surapp).FirstOrDefault();
				contxt.UploadFiles.DeleteObject(entity);
				contxt.SaveChanges();
				foreach (UploadFile item in L)
				{
					if (item.UPloadId == UploadId)
					{
						L.Remove(item);
						break;
					}
				}
			}

			UpdateSession(L);
			BindGridviewData();
		}
		catch (Exception ex)
		{
	//		ACR.Framework.Common.Utilities.WriteToLogFile(new StackFrame(true), "LinkButtonDelete_Click", LoginUser.UserID.ToString(), TraceEventType.Error);
		}
	}
	public bool IsFileExistOrNot(List<UploadFile> L, string uploadFileName)
	{
		bool IsAvailable = true;
		foreach (UploadFile item in L)
		{
			var Query = (from a in L where a.FIleFor == uploadFileName select a.FIleFor);
			if (Query.Count() == 0)
			{
				return false;
			}
		}
		return IsAvailable;
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