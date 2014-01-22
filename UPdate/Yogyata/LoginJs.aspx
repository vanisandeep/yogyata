<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginJs.aspx.cs" Inherits="LoginJs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
.alertmsg
{
color:#FF0000;
}
</style>  
<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>


<script  type="text/javascript">
    $(document).ready(function () {
        var validator = $("#form1").validate({
            rules: {
                txtUserName: "required",
                txtPassword: { required: true, minlength: 8 }
            },
            messages: {
                txtUserName: "Please enter your UserName",
                txtPassword: { required: "Please enter yourPassword", minlength: "Password should be at least 8  characters long" }
            },
            wrapper: 'li',
            errorLabelContainer: $("#form1 div.alertmsg")
        });
        $("#btnReset").click(function (e) {
            e.preventDefault();
            $("#txtUserName").val("");
            $("#txtPassword").val("");
        });
    });
</script>
</head>
<body>
     <form id="form1" runat="server">
    <div>
     <div class="alertmsg">
   </div>
   <table>
<tr><td colspan="2" class="header">LOGIN USER</td></tr>
<tr>
<td align="right">
<asp:Label ID="lblUserName" runat="server" Text="UserName: "></asp:Label>
</td>
<td align="left">
<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
</td>
<td align="left">
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td align="center" colspan="2">
<asp:Button ID="btnSubmit" runat="server" Text="Submit"/>&nbsp;
<asp:Button ID="btnReset" runat="server" Text="Reset"/>
</td>
</tr>
</table>
    </div>
   
  
    </form>
</body>
</html>
