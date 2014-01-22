using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ROPAModel;
 using System.IO;
using System.Web.UI.WebControls;

public partial class ROPA_Forms_InsertFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridviewData();
        }

    }


    private void BindGridviewData()
    {

        ROPAUtil obj = new ROPAUtil();
        gvDetails.DataSource = obj.FilesToGrid();
        gvDetails.DataBind();
    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {

        string filename = Path.GetFileName(fileUpload1.PostedFile.FileName);

        string GetExts = Path.GetExtension(filename);

        Stream str = fileUpload1.PostedFile.InputStream;
        BinaryReader br = new BinaryReader(str);
        Byte[] size = br.ReadBytes((int)str.Length);


        using (ROPAEntities obj = new ROPAEntities())
        {
            UploadFile upld = new UploadFile();

            upld.GUID = Guid.NewGuid().ToString();
            //upld.FIleFor=100;
            upld.FIleFor = filename;
            upld.SurApp_Id = 47;
            upld.fileext = GetExts;

            obj.AddToUploadFiles(upld);
            obj.SaveChanges();
        }
        BindGridviewData();
    }
    protected void lnkDownload_Click(object sender, EventArgs e)
{
 
}

}