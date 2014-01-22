using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ROPAModel;

/// <summary>
/// Summary description for PageBase
/// </summary>
public class PageBase : System.Web.UI.Page
{
	public PageBase()
	{
		//
		// TODO: Add constructor logic here
		//
	}


	
	

	protected virtual void DisplayAlert(string message)
	{
		ClientScript.RegisterStartupScript(
					this.GetType(),
					Guid.NewGuid().ToString(),
					string.Format("alert('{0}');", message.Replace("'", @"\'")),
					true
				);
	}
}