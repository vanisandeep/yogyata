<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search Box.aspx.cs" Inherits="ROPA_Search_Box" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
    
        <tr>
    <td>
    <asp:TextBox ID="txtSrch" runat="server"></asp:TextBox>
    </td></tr>
    <tr>
    <td>
    <asp:Button  ID="bttnseach" runat="server" Text="Search" 
            onclick="bttnseach_Click" />
    </td></tr>
    


</table>
    </div>









        <table id="tblreg" runat="server">


<tr><td><asp:Label ID="lblFrstname" runat="server" Text="First Name"></asp:Label></td>
<td>    <asp:TextBox ID="txtFrstName" runat="server"></asp:TextBox></td>
<td> <asp:RequiredFieldValidator ID="rqFrsName" runat="server" ControlToValidate="txtFrstName" ErrorMessage="Please Enter First Name"  Text="*"  ForeColor="Red" ></asp:RequiredFieldValidator>
</td>
</tr>



<tr>
<td><asp:Label ID="lblLstname" runat="server" Text="Last Name"></asp:Label></td>
<td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
<td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Enter Last Name"  Text="*"  ForeColor="Red" ></asp:RequiredFieldValidator>
</td>
</tr>

<tr><td><asp:Label ID="lblRoleId" runat="server" Text="ApplyAs Role"></asp:Label></td>
<td>   <asp:DropDownList ID="ddlRoleId" runat="server" AutoPostBack="True">
    <asp:ListItem Value="0">Select</asp:ListItem>
    </asp:DropDownList></td></tr>

  
    <tr>
    <td>
    <asp:Label ID="lblPsswrd" runat="server"  Text="Password"></asp:Label>
    
        </td>
        <td>
        <asp:TextBox ID="txtpsswrd" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
        <asp:RequiredFieldValidator ID="rqtxtpasswrd" runat="server" ControlToValidate="txtpsswrd" ErrorMessage="Not blank" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
        </td>
        </tr>
    </table>
    </div>

    




    </form>
</body>
</html>
