<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertFile.aspx.cs" Inherits="ROPA_Forms_InsertFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <div>
 <asp:FileUpload ID="fileUpload1" runat="server" /><br />
<asp:Button ID="btnUpload" runat="server" Text="Upload"  onclick="btnUpload_Click" />
</div>

 <div>
<asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="UploadId">
<HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="UploadId" HeaderText="Id" />
<asp:BoundField DataField="Filepath" HeaderText="FileName" />
 <asp:TemplateField HeaderText="FilePath">
<ItemTemplate>
<asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="lnkDownload_Click"></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>

    </form>
</body>
</html>
