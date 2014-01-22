<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedBackForm.aspx.cs" Inherits="ROPA.Forms.RopaFeedBackForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>



</head>

 <script type="text/javascript">
     $(document).ready(function () {
         $.ajax({
             type: "POST",
             contentType: "application/json; charset=utf-8",
             url: "FeedBackForm.aspx/DisplayData",
             data: "{}",
             dataType: "json",
             success: function (data) {
                 $("#lbltxt").text(data.d);
             },
             error: function (result) {
                 alert("Error");
             }
         });
     });
</script>


<body>
    <form id="form1" runat="server">
    <div runat="server" id="Div" align="center">
   
   <h2 style="font-family:Times New Roman;" align="center">  
 Feed Back Form 

</h2>
<div>

<p style="font-family:Times New Roman;font-size:large">
<b style="font-size:large; font-family:Times New Roman;"> 
   All Fields Are Mandatory
   </b>
 
  </p>
  
</div>
 
    <table>
  
    <tr>
    <td>
    <asp:Label ID="Namelbl" runat="server" Text="Name">
    </asp:Label>
    </td>
    <td>
    <asp:Label ID="MandtryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:TextBox ID="NameTxt" runat="server" TextMode="SingleLine">
    </asp:TextBox>
    <div style="height:10px"></div>
    </td>
    <td>
   <asp:RequiredFieldValidator ID="NamerequrdFieldid" runat="server"  
   ControlToValidate="NameTxt" Text="Mandatory" ErrorMessage="*">
   </asp:RequiredFieldValidator> 
    </td>
   
    </tr>
    <tr>
    <td>
   <asp:Label ID="EmailIdLbl" runat="server" Text="Email" >
   </asp:Label>
    </td>
     <td>
    <asp:Label ID="EmailIdMandtryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:TextBox ID="EmailIdTxt"  runat="server" TextMode="SingleLine">
    </asp:TextBox>
    <div style="height:10px"></div>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="EmailIdReqrdfldid" runat="server" ControlToValidate="EmailIdTxt" 
   Text="Mandatory" ErrorMessage="*">
   </asp:RequiredFieldValidator> 

    </td>
    </tr>


    <tr>
    <td>
    <asp:Label  ID="lblphNumb" runat="server" Text="Phone Number"></asp:Label>
    </td>
    <td></td>
    <td>
    <asp:TextBox ID="txtphNumb" runat="server" TextMode="SingleLine"></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td>
    <asp:Label ID="lblAddrss" runat="server" Text="Address"></asp:Label>
    </td>
    <td></td>
    <td>
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
    </td>
    </tr>



    <tr>
    <td>
    <asp:Label ID="CountryLbl" runat="server" Text="Country" >
    </asp:Label>
    </td>
    <td>
     <asp:Label ID="CountryMandtoryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:DropDownList id="ddlCountry" runat="server" >
<asp:ListItem Value="0" >Select Country</asp:ListItem>



</asp:DropDownList>
<div style="height:10px"></div>
    </td>
    <td>
    <asp:RequiredFieldValidator  ID="CountryDrpdwnRequrd" InitialValue="0" runat="server" ControlToValidate="ddlCountry"
      Text="Mandatory" ErrorMessage="*">
      </asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="CommentLbl" runat="server" Text="Comment/Suggestion">
    </asp:Label>
    </td>
    <td>
    <asp:Label ID="CommentMandtryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:TextBox ID="CommentTxt" runat="server"  Columns="30" Rows="5"   TextMode="MultiLine">
    </asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator  ID="CommentRequrdrequrdid" runat="server"  
     ControlToValidate="CommentTxt"
    Text="Mandatory" ErrorMessage="*">
      </asp:RequiredFieldValidator>

    
    </td>
    </tr>       
     </table>
    <div style="height:10px"></div>
    <asp:Button ID="SbmtBttnId" runat="server"  Text="Submit" 
            onclick="SbmtBttnId_Click" />
    </div>
    
      <div>
    <asp:Label ID="lblmssg" runat="server"  Visible="false" ></asp:Label>
    </div>
    </form>
</body>
</html>
