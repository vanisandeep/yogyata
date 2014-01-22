<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkboxlist.aspx.vb" Inherits="Checkboxlist" %>

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

     <script type="text/javascript" language="javascript">
         function CheckBoxList_Validation(sender, args) {
             args.IsValid = false;
             var cnt = $("#CheckBoxList1 input:checked").length;
args.IsValid = (cnt >= 3);
}
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>

    <table border="0" cellpadding="3" cellspacing="3">
<tr><td>
Select at least 3 states:</td></tr>
<tr><td>
<asp:CheckBoxList ID="CheckBoxList1" runat="server">
<asp:ListItem Text="Connecticut" Value="CT"></asp:ListItem>
<asp:ListItem Text="Massachusetts" Value="MA"></asp:ListItem>
<asp:ListItem Text="New York" Value="NY"></asp:ListItem>
<asp:ListItem Text="New Hampshire" Value="NH"></asp:ListItem>
<asp:ListItem Text="Rhode Island" Value="RI"></asp:ListItem>
</asp:CheckBoxList>
</td></tr>
<tr>
<td>
<asp:CustomValidator ID="CustomValidator1" runat="server"
ErrorMessage="Please select at least 3  states" Display="Dynamic" ClientValidationFunction="CheckBoxList_Validation"></asp:CustomValidator>
</td></tr>

<tr><td>
<asp:CheckBoxList ID="CheckBoxList2" runat="server">
<asp:ListItem Text="Connecticut" Value="CT"></asp:ListItem>
<asp:ListItem Text="Massachusetts" Value="MA"></asp:ListItem>
<asp:ListItem Text="New York" Value="NY"></asp:ListItem>
<asp:ListItem Text="New Hampshire" Value="NH"></asp:ListItem>
<asp:ListItem Text="Rhode Island" Value="RI"></asp:ListItem>
</asp:CheckBoxList>
</td></tr>
<tr>
<td>
<asp:CustomValidator ID="CustomValidator2" runat="server"
ErrorMessage="Please select at least 3  states" Display="Dynamic" ClientValidationFunction="CheckBoxList1_Validation"></asp:CustomValidator>
</td></tr>


<tr><td><asp:Button ID="btnSubmit" runat="server" Text="Submit"/></td></tr>
</table>
    
    </div>
    </form>
</body>
</html>
