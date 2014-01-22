<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Feedback.ascx.cs" Inherits="ROPA_WebuserControllers_Feedback" %>
 <div runat="server" id="Div" align="center">
   
   <h2 style="font-family:Times New Roman;" align="center">  
 Feed Back Form 

</h2>
<div>

<p style="font-family:Times New Roman;font-size:large">
<b style="font-size:large; font-family:Times New Roman;"> 
   All Fields Are Mandatory
   </b>
 
  </p>
  
</div>
 
    <table>
  
    <tr>
    <td>
    <asp:Label ID="Namelbl" runat="server" Text="Name">
    </asp:Label>
    </td>
    <td>
    <asp:Label ID="MandtryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:TextBox ID="NameTxt" runat="server" TextMode="SingleLine">
    </asp:TextBox>
    <div style="height:10px"></div>
    </td>
    <td>
   <asp:RequiredFieldValidator ID="NamerequrdFieldid" runat="server"  
   ControlToValidate="NameTxt" Text="Mandatory" ErrorMessage="*">
   </asp:RequiredFieldValidator> 
    </td>
   
    </tr>
    <tr>
    <td>
   <asp:Label ID="EmailIdLbl" runat="server" Text="Email" >
   </asp:Label>
    </td>
     <td>
    <asp:Label ID="EmailIdMandtryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:TextBox ID="EmailIdTxt"  runat="server" TextMode="SingleLine">
    </asp:TextBox>
    <div style="height:10px"></div>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="EmailIdReqrdfldid" runat="server" ControlToValidate="EmailIdTxt" 
   Text="Mandatory" ErrorMessage="*">
   </asp:RequiredFieldValidator> 

    </td>
    </tr>


    <tr>
    <td>
    <asp:Label  ID="lblphNumb" runat="server" Text="Phone Number"></asp:Label>
    </td>
    <td></td>
    <td>
    <asp:TextBox ID="txtphNumb" runat="server" TextMode="SingleLine"></asp:TextBox>
    </td>
    </tr>

    <tr>
    <td>
    <asp:Label ID="lblAddrss" runat="server" Text="Address"></asp:Label>
    </td>
    <td></td>
    <td>
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
    </td>
    </tr>



    <tr>
    <td>
    <asp:Label ID="CountryLbl" runat="server" Text="Country" >
    </asp:Label>
    </td>
    <td>
     <asp:Label ID="CountryMandtoryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:DropDownList id="ddlCountry" runat="server" >
<asp:ListItem Value="0" >Select Country</asp:ListItem>



</asp:DropDownList>
<div style="height:10px"></div>
    </td>
    <td>
    <asp:RequiredFieldValidator  ID="CountryDrpdwnRequrd" InitialValue="0" runat="server" ControlToValidate="ddlCountry"
      Text="Mandatory" ErrorMessage="*">
      </asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="CommentLbl" runat="server" Text="Comment/Suggestion">
    </asp:Label>
    </td>
    <td>
    <asp:Label ID="CommentMandtryLbl" runat="server" Text="*" Font-Bold="true" Font-Size="Large"   ForeColor="Red">
    </asp:Label>
    </td>
    <td>
    <asp:TextBox ID="CommentTxt" runat="server"  Columns="30" Rows="5"   TextMode="MultiLine">
    </asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator  ID="CommentRequrdrequrdid" runat="server"  
     ControlToValidate="CommentTxt"
    Text="Mandatory" ErrorMessage="*">
      </asp:RequiredFieldValidator>

    
    </td>
    </tr>       
     </table>
    <div style="height:10px"></div>
    <asp:Button ID="SbmtBttnId" runat="server"  Text="Submit" 
            onclick="SbmtBttnId_Click" />
    </div>
    
      <div>
    <asp:Label ID="lblmssg" runat="server"  ForeColor="Red" Visible="false" ></asp:Label>
    </div>