<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InputNumberTostring.aspx.cs" Inherits="My_Programms_InputNumberTostring" %>

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
    <asp:Label ID="lblNumb" runat="server"></asp:Label>
    </td>
    <td><asp:TextBox ID="txtNumb" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="rqtxtNumb" runat="server" ControlToValidate="txtNumb"  ClientIDMode="Static"  Text="*"  ErrorMessage="Please Enter the Number" ></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
    <td><asp:Button ID="btnsbmt" runat="server"  Text="Submit" OnClick="Btnsubmt"/></td>
 
    </tr>
    <tr>
    <td><asp:Label ID="lblreslut" runat="server" Visible="false"  ForeColor="Red" Font-Bold="true"></asp:Label></td>
    </tr>
    </table>

    </div>
    </form>
</body>
</html>
