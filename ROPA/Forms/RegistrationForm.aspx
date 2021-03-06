﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationForm.aspx.cs" Inherits="ROPA_RegistrationForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>    <table >

  

<tr><td><asp:Label ID="lblFrstname" runat="server" Text="First Name"></asp:Label></td>
<td>    <asp:TextBox ID="txtFrstName" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td><asp:Label ID="lblLstname" runat="server" Text="Last Name"></asp:Label></td>
<td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>

</tr>

<tr><td><asp:Label ID="lblRoleId" runat="server" Text="ApplyAs Role"></asp:Label></td>
<td>   <asp:DropDownList ID="ddlRoleId" runat="server" AppendDataBoundItems="true">
    <asp:ListItem Value="0">Select</asp:ListItem>
    </asp:DropDownList></td></tr>

    <tr>
    <td>
    <asp:Label ID="lblemailId" runat="server" Text="EmailId">
    </asp:Label></td>
    <td>
    <asp:TextBox ID="txtEmailId" runat="server" ></asp:TextBox>
    </td><td>
    <asp:Button ID="chckAvliblity" runat="server"  Text="CheckAvliblity" 
                />
    </td>
    </tr>

    <tr>
        <td colspan="3">
    <asp:Label ID="lblchAvl" runat="server" Visible="false" ></asp:Label>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="lblPsswrd" runat="server"  Text="Password"></asp:Label>
        </td>
        <td>
        <asp:TextBox ID="txtpsswrd" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
      </td>
        </tr>
        <tr>
        <td>          
 <asp:FileUpload ID="fileUpload1" runat="server" />
 </td>
 <td>
 <asp:Button ID="btnUpload" runat="server" Text="Upload"  onclick="btnUpload_Click" />
 </td>
        </tr>
        <tr>
<asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="false" 
                DataKeyNames="UPloadId" OnRowCommand="gvDetails_RowCommand"
 OnRowDeleting="gvDetails_RowDeleting">

                    <Columns>
                        <asp:BoundField DataField="FIleFor" HeaderText="FIleFor" />
                        <asp:TemplateField HeaderText="View">

                            <ItemTemplate>
                                <asp:LinkButton ID="FileLink" runat="server" CausesValidation="false"
                                    CommandName="DownLoad" Text="View"
                                    CommandArgument='<%# Eval("UPloadId") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Delete"
                                    CausesValidation="false" CommandName="Delete"
                                    CommandArgument='<%# Eval("UPloadId") %>' OnClientClick='return confirm("Are you sure want to delete this entry ?");'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                
</asp:GridView>
</tr>
                     

          <tr>
    <td> <asp:Button ID="bttnsbmt" runat="server" onclick="Button1_Click" Text="Submit" />
    </td>
 <td >
 <asp:Button ID="btnreset" runat="server"  Text="Reset" onclick="btnreset_Click" />
 </td></tr>
    </table>
    </div>


   
      <div>
    <asp:Label ID="lblmssg" runat="server"  ForeColor="Red" Visible="false" ></asp:Label>
    </div>

    </form>
</body>
</html>
