<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LimitationForMultiline.aspx.vb" Inherits="LimitationForMultiline" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style  type="text/css">
    .alertmsg
{
color:#FF0000;
}
</style>
     <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             var minCount = 1;
             var maxCount =  5;
             $("#TextBox1").bind("cut copy paste", function (e) {
                 e.preventDefault();
             });
             $("#TextBox1").keypress(function () {
                 var strCount = $("#TextBox1").val().length;
                 $("#TextBox2").val(strCount);
                 if ((strCount < minCount) || (strCount > maxCount)) {
                     $("#message").text("Please key in characters in the range 1- 5");
                 }
                 else {
                     $("#message").text("");
                 }
             });

         });
     </script>
</head>
<body>
    <form id="form1" runat="server">
   <div align="center">

<table >
<tr><td>Please enter your comments below:</td></tr>
<tr><td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td></tr>

<tr>

<td>Number of characters:<asp:TextBox ID="TextBox2" runat="server" Width="30px" ReadOnly="true"></asp:TextBox></td>
</tr>

<tr><td><div id="message" class="alertmsg"></div></td>
</tr>


</table>
</div>
    </form>
</body>
</html>
