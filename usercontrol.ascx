<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usercontrol.ascx.cs" Inherits="usercontrol" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
<br />
<br />

<asp:Button ID="btn_submit" runat="server" Text="Click me" onclick="btn_submit_Click" />   
<asp:Button ID="btn_reset" runat="server" Text="Clear check box" 
    onclick="btn_reset_Click" />   