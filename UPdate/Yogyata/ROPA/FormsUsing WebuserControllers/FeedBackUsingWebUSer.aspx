<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedBackUsingWebUSer.aspx.cs" Inherits="ROPA_FormsUsing_WebuserControllers_FeedBackUsingWebUSer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <%@Register TagPrefix="mylib" TagName="userDef"    Src="~/ROPA/WebuserControllers/Feedback.ascx" %>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <mylib:userDef ID="Mylib" runat="server"  />
    </div>

    <div>
    <asp:Button ID="lgoutbttn" runat="server" Text="Logout" onclick="lgoutbttn_Click" />
    
    </div>
    </form>
</body>
</html>
