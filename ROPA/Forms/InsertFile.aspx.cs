

using System;
using System.IO;
using ROPAModel;

public partial class ROPA_Forms_InsertFile : PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
	        try
	        {
				BindGridviewData();
	        }
	        catch (Exception exception)
	        {
		       
	        }
           
        }

    }


    private void BindGridviewData()
    {

	    try
	    {
			var obj = new ROPAUtil();
			gvDetails.DataSource = obj.FilesToGrid();
			gvDetails.DataBind();
    
	    }
	    catch (Exception)
	    {
		    
		   
	    }
    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {
	    try
	    {
		    var filename = Path.GetFileName(fileUpload1.PostedFile.FileName);

		    var getExts = Path.GetExtension(filename);

		    var str = fileUpload1.PostedFile.InputStream;
		    var br = new BinaryReader(str);
		    var size = br.ReadBytes((int) str.Length);


		    using (var obj = new ROPAEntities())
		    {
			    var upld = new UploadFile();
			    upld.GUID = Guid.NewGuid().ToString();
			    upld.AppVersion = (decimal) 2.30;

			    upld.FIleFor = filename;
			    upld.SurApp_Id = 47;
			    upld.fileext = getExts;

			    obj.AddToUploadFiles(upld);
			    obj.SaveChanges();
		    }
		    BindGridviewData();
	    }
	    catch (Exception)
	    {

	    }
    }
    protected void lnkDownload_Click(object sender, EventArgs e)
{
 
}

}