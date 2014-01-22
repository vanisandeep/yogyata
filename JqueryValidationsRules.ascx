<%@ Control Language="VB" AutoEventWireup="false" CodeFile="JqueryValidationsRules.ascx.vb" Inherits="JqueryValidationsRules" %>




  <form id="form" runat="server">
<table border="0" cellpadding="3" cellspacing="3">
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
</form>
