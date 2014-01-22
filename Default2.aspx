<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Scripts/jquery-1.8.2.js" type="text/javascript"></script>

    <script src="Scripts/jquery-2.0.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
function WaterMark(txtName, event) {
        var defaultText = "Enter Username Here";
// Condition to check textbox length and event type
        if (txtFname.value.length == 0 & event.type == "blur") {
//if condition true then setting text color and default text in textbox
            txtFname.style.color = "Gray";
            txtFname.value = defaultText;
}
// Condition to check textbox value and event type
        if (txtFname.value == defaultText & event.type == "focus") {
            txtFname.style.color = "black";
            txtFname.value = "";
}
    }

  $(document).ready(function () {
            $('#txtFname').keyup(function (e) {
                 if($('#txtLname').val($(this).val().length==0)))
                 {

                 alert('hi');
                 }


            });

            $('#txtLname').keyup(function (e) {
                $('#txtFname').val($(this).val());
            });
        });

    </script>



</head>

<body>

    <form id="form1" runat="server">
    
    <div>

    <table>
    <tr>
    <td><asp:Label ID="lblFname" Text="FirstName" runat="server"></asp:Label></td>
    <td><asp:TextBox ID="txtFname" runat="server" onblur = "WaterMark(this, event);" onfocus = "WaterMark(this, event);"></asp:TextBox></td>
    </tr>
   
        <tr><td><asp:Label ID="lblLname" Text="Last name" runat="server"></asp:Label></td>
    <td><asp:TextBox ID="txtLname" runat="server" ReadOnly="true"></asp:TextBox></td>
    </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
