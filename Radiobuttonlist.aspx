<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Radiobuttonlist.aspx.vb" Inherits="Radiobuttonlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

 <script src="Scripts/jquery-1.8.2.js" type="text/javascript"></script>

    <script src="Scripts/jquery-2.0.3.min.js" type="text/javascript"></script>
     <script type="text/javascript" language="javascript">

         function Validate() {
    if ($("#RadioButtonList1 :radio:checked").length == 0) {
                 alert('please select at least one value');
             }
             
         }
         </script>

<body>
    <form id="form1" runat="server">
    <div>
    
<fieldset style="width:350px;height:200px;">
<table border="0" cellpadding="3" cellspacing="3">
<tr><td>Please select a state:</td></tr>
<tr><td>
<asp:RadioButtonList ID="RadioButtonList1" runat="server">
<asp:ListItem Text="Connecticut" Value="CT"></asp:ListItem>
<asp:ListItem Text="Massachusetts" Value="MA"></asp:ListItem>
<asp:ListItem Text="New York" Value="NY"></asp:ListItem>
<asp:ListItem Text="New Hampshire" Value="NH"></asp:ListItem>
<asp:ListItem Text="Rhode Island" Value="RI"></asp:ListItem>
</asp:RadioButtonList>
</td></tr>
<tr><td>
<asp:Button ID="btnSubmit" runat="server" Text="Submit"  OnClientClick="Validate()" />
</td></tr>
</table>
</fieldset>



    </div>
    </form>
</body>
</html>
