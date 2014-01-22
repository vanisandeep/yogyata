<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JqueryTextboxs.aspx.cs" Inherits="JqueryTextboxs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <style type="text/css">
     .alertmsg{color:#FF0000;}
</style>  <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.validate.js" type="text/javascript"></script>



<script type="text/javascript">
    $(document).ready(function () {
    alert('hi');
        $("#form1").validate({
      
            //Rules for the validate the textboxes
            //this is user defined rules 
            txtPassword: { required: true, minlength: 8 },
            messages: { txtFname: 'Please Enter Your First Name', txtLname: 'Please Enter  Your Last Name' },
            wrapper: 'li', errorLabelContainer: $("#form1 div.alertmsg")
            alert('hi');
        });
       
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div  class="alertmsg"></div>
    
    <table>
    <tr>
    <td><asp:Label ID="lblFname" Text="FirstName" runat="server"></asp:Label></td>
    <td><asp:TextBox ID="txtFname" runat="server"></asp:TextBox></td>
    </tr>
   
        <tr><td><asp:Label ID="lblLname" Text="Last name" runat="server"></asp:Label></td>
    <td><asp:TextBox ID="txtLname" runat="server"></asp:TextBox></td>
    </tr>
    
    <tr>
<td align="center" colspan="2">
<asp:Button ID="btnSubmit" runat="server" Text="Submit"/></td>
<td>
<asp:Button ID="btnReset" runat="server" Text="Reset"/>
</td>
</tr>
    </table>

    </div>
    </form>
</body>
</html>
