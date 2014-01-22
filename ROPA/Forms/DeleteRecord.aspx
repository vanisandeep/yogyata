<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteRecord.aspx.cs" Inherits="ROPA_DeleteRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

     <table runat="server"  id="Delteuser"  >
   
        <tr>
    <td>
    <asp:Label ID="lbldlet" runat="server" Text="Enter FirstName"></asp:Label>
   </td>
    <td>
   
    <asp:TextBox ID="txtSrch" runat="server"></asp:TextBox>
    </td>
    <td>
    <asp:Button  ID="bttnseach" runat="server" Text="Delete" 
            onclick="bttnseach_Click" OnClientClick="javascript:confirm('Are You Sure want to delete the Record');" />
    </td></tr>
    </table>
    </div>

       <div>
    <asp:Label ID="lblmssg" runat="server"  ForeColor="Red" Visible="false" ></asp:Label>
    </div>
    </form>
</body>
</html>
