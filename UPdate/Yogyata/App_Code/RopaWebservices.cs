using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using ROPAModel;

/// <summary>
/// Summary description for RopaWebservices
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class RopaWebservices : System.Web.Services.WebService {

    public RopaWebservices () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }


     [WebMethod]
    public int insertRecord(string FName, string EmailId, string PhoneNumb, string Address, string CuntryCode, string commnts)
    {

        int result = 0;
        using (ROPAEntities cont = new ROPAEntities())
        {
            FeedBackForm obj = new FeedBackForm();
            obj.FirstName = FName;
            obj.EmailId = EmailId;
            obj.PhoneNumber = PhoneNumb;
            obj.Addres = Address;
            obj.countrycode = CuntryCode;
            obj.Commments = commnts;
            obj.insertDate = DateTime.Now;
            cont.AddToFeedBackForms(obj);
            result = cont.SaveChanges();
            return result;
        }
        }

     [WebMethod]
     public string RecordInserted()
     {
         return "Record  Ineserted Succesfully.....";
     }
    
    }

