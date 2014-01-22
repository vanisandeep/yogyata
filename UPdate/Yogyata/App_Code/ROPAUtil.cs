using ROPAModel;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;


/// <summary>
/// Summary description for ROPAUtil
/// </summary>
public class ROPAUtil
{
	public ROPAUtil()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public partial class FeedbackDeatils
    {
     public  int Feedbackid{get; set;}
     public string Comments { get; set; }
    }



    public partial class upcoming
    {
        string emailid;
        string Applyasrole;
        string firstname;
        string lastname;
        string password;
    }


    public partial class UploadFiles
    {
        public int UploadId { get; set; }
        public string Filepath { get; set; }
    }




    public List<FeedbackDeatils> FeedbackDetailsToGrid()
    {


        using (ROPAEntities obj = new ROPAEntities())
        {
            var Query = (from a in obj.FeedBackForms select new FeedbackDeatils { Feedbackid = a.FeedBackId, Comments = a.Commments }).ToList().Take(5);
            return Query.ToList();
        }
    }



    public List<UploadFiles> FilesToGrid()
    {


        using (ROPAEntities obj = new ROPAEntities())
        {

            var query = (from a in obj.UploadFiles select new UploadFiles { UploadId = a.UPloadId, Filepath = a.FIleFor }).ToList();
            return query.ToList();
      
        }
    }

    public void BindDeatails()
    {
        using (ROPAEntities obj = new ROPAEntities())
        {
            var userdetails = (from a in obj.UpcmomingSurveyors select a).ToList().Count;
           // userdetails;
         }
    }

   


    #region updateRecord
    public void UpdateRecord(string FirstName, string Lastname, int applyAsrole, string password, string emailId)
    {
       // int result = 0;
        using (ROPAEntities context = new ROPAEntities())
        {
            UpcmomingSurveyor obj = new UpcmomingSurveyor();
            obj.FirstName = FirstName;
            obj.LastName = Lastname;
            obj.ApplyAsRole = applyAsrole;
            obj.Password = password;
            obj.EMAILID = emailId;
            obj.ModifedDate = DateTime.Now;
            obj.AppId = 2;
           // context.AddToUpcmomingSurveyors(obj);
           // result=
                context.SaveChanges();
           // return result;
        }
    }

    #endregion

    #region InsertRecordIntoRegistrationForm
    #region insertRecordL
    public int InsertRecord(string FirstName, string Lastname, int applyAsrole, string password, string emailId, List<UploadFile> L)
    {
        int result = 0;
         using (ROPAEntities context = new ROPAEntities())
        {
            UpcmomingSurveyor obj = new UpcmomingSurveyor();
            obj.FirstName = FirstName;
            obj.LastName = Lastname;
            obj.ApplyAsRole = applyAsrole;
            obj.Password = password;
            obj.AppId = 1;
            obj.ModifedDate = DateTime.Now;
            obj.EMAILID = emailId;
            context.AddToUpcmomingSurveyors(obj);
            foreach (UploadFile G in L)
            {
                UploadFiles  Upld = new UploadFiles();
                string s = G.GUID;
                var Q = (from u in context.UploadFiles where u.GUID ==s  select u).FirstOrDefault();
                Q.SurApp_Id = obj.SurApp_Id;           
            }
           context.SaveChanges();
           return result;
        }
    }
#endregion
    #endregion
    public bool CheckAvliablity(string EmailId)
    {
        using (ROPAEntities context = new ROPAEntities())
        {

            bool exists = context.UpcmomingSurveyors.Any(u => u.EMAILID == EmailId);
            return exists;
        }
    }

    public string CheckAvliablitySuccessMessage()
    {
        return "User Name is Avliable";
    }

    public string CheckAvliablityFailMessage()
    {
        return "User Name is Alreday Exists. Please Try with other Id.";
    }


    #region ForInsertFeedbackForm

    public int InsertFeedBackRecord(string FName, string EmailId, string PhoneNumb, string Address, string CuntryCode, string commnts)
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

    #endregion


    //Delete the Record using First Name 
    #region DeleteRecord

    public int Deleteuser(string FirstName)
    {

        int result = 0;
        using (ROPAEntities context = new ROPAEntities())
        {
            var UserName = (from u in context.UpcmomingSurveyors where u.FirstName == FirstName select new { u.LastName }).FirstOrDefault();
            var deleteQuery = (from u in context.UpcmomingSurveyors where u.FirstName == FirstName select u).FirstOrDefault();
            context.DeleteObject(deleteQuery);
            result=context.SaveChanges();
           return result;
        }
    }
    #endregion

    #region  GetUserEmailId

    public string GetUserDetailsByEmailId(string EmailId)
    {
        using (ROPAEntities context = new ROPAEntities())
        {
            var UserPassword = (from u in context.UpcmomingSurveyors where u.EMAILID == EmailId select u.Password).FirstOrDefault();
            return UserPassword;
        }                           
    }

    #endregion

    #region InsertMessage

    public string InsertedMessage()
    {
        return "Your Application has been inserted  succesfully...";
    }

    #endregion


    #region FailMessage
    public string FailMessage()
    {
        return "Your Record Is Not inserted into a Database ";
    }
    #endregion

    #region LoginFailMessage

    public string LoginFailMessage()
    {
        return " Please Check Your Login Name and Password.";

    }
    #endregion

    public void UPdateFeedbackdetails(int number, string Comments)
    {
        using (ROPAEntities obj = new ROPAEntities())
        {
            var query = (from a in obj.FeedBackForms where a.FeedBackId == number select a).FirstOrDefault();
            if (query != null)
            {
                query.Commments = Comments.Trim();
                query.insertDate = DateTime.Now;
                obj.SaveChanges();
            }
        }      
    }

   
}