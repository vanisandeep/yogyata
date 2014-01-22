<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedbackdetails.aspx.cs" Inherits="ROPA_Forms_Feedbackdetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>



<script type="text/javascript" src="../../Scripts/jquery-1.8.2.intellisense.js"></script>

<script src="../../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../../Scripts/jquery-ui-1.8.24.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery-ui-1.8.24.js" type="text/javascript"></script>


 <style type="text/css">  
        #mask {
            position: fixed;
            left: 0;
            top: 0;
            z-index: 4;
            -ms-opacity: 0.4;
            opacity: 0.4;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=40)"; /* first!*/
            filter: alpha(opacity=40); /* second!*/
            background-color: gray;
            display: none;
            width: 100%;
            height: 100%;
        }

        .auto-style1 {
            width: 45%;
            height: 24px;
        }
        .auto-style2 {
            height: 24px;
        }
        .highlight
{
background-color:#9999FF;
}

td { cursor:pointer;}

        
    </style>


    <script type="text/javascript" language="javascript">
//        $(document).ready(function () {
//        //Change the cursor in gridview according to Even
//        //    $("#<%=grdFddfrm.ClientID%> tr").filter(":even").bind("mouseover", function () {
//   // $(this).css("cursor", "pointer");
////});
////Change the cursor according to Odd 
////$("#<%=grdFddfrm.ClientID%> tr").filter(":odd").
////bind("mouseover", function () {
//  //  $(this).css("cursor", "wait");
////});

////$("#<%=grdFddfrm.ClientID%>").slideUp(2500).
////slideDown(2500);
////$("#<%=grdFddfrm.ClientID%> tr").filter(":odd").
//            //css("background-color", "#c8ebcc");
        //            $("#<%=grdFddfrm.ClientID%> tr").filter(":not(:has(table, th))").
//click(function (e) {
//    var $cell = $(e.target).closest("td");
//    $("#<%=grdFddfrm.ClientID%> td").
//removeClass("highlight");
//    $cell.addClass("highlight");
//    $("#message").text('You have selected: ' + $cell.
//text());
//});

        //        });

        $(function () {
            alert('hi');
            $(".grdFddfrm > tbody > tr:not(:has(table, th))")
.css("cursor", "pointer")
.click(function (event) {
    var $row = $(this);
    var firstParam = $("td", $row).eq(0).text();
    var secondParam = $("td", $row).eq(1).text();
    //var thirdParam = $("td", $row).eq(3).text();
    var baseUrl = "../"
    var navUrl = baseUrl + "/ROPA/Forms/Feedbackdetails.aspx" +
"?Feedbackid=" + firstParam +
"&Comments=" + secondParam;
    top.location = navUrl;
});
        });

     


        function ShowPopup() {
            $('#mask').show();
            $('#<%=pnlpopup.ClientID %>').show();
        }
        function HidePopup() {
            $('#mask').hide();
            $('#<%=pnlpopup.ClientID %>').hide();
        }
        $(".btnClose").live('click', function () {
            HidePopup();
        });
    </script>
    
    <div id="mask">
    </div>

<body>
    <form id="form1" runat="server">


  <div align="center">
<fieldset style="width:400px;height:230px;">
<table border="0" cellpadding="3" cellspacing="3">

<tr><td colspan="2">
   
   <asp:GridView ID="grdFddfrm" runat="server" AutoGenerateColumns="False"  
  DataKeyNames="FeedBackId" OnRowCommand="grdFddfrm_RowCommand">

   <Columns>
                <asp:BoundField DataField="Feedbackid" HeaderText="FeedBackId" />
                <asp:BoundField DataField="Comments" HeaderText="Commments" />
                <asp:TemplateField HeaderText="" SortExpression="">
                    <ItemTemplate>
        
         <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="ShowPopup"    OnClientClick="javascript:confirm('Are You sure want to edit the record');return true;" CommandArgument='<%#Eval("FeedBackId") %>'>Edit</asp:LinkButton>
                        </ItemTemplate>
                 </asp:TemplateField>
            </Columns>
        </asp:GridView>

</td></tr>
</table>
<div id="message"></div>
</div>

</fieldset>

        <asp:Panel ID="pnlpopup" runat="server"  BackColor="White" Height="175px"
           
            Width="300px" Style="z-index:111;background-color: White; position: absolute; left: 35%; top: 12%;  border: outset 2px gray;padding:5px; display:none;">
            <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
                <tr style="background-color: #0924BC">
                    <td colspan="2" style="color:White; font-weight: bold; font-size: 1.2em; padding:3px"
                        align="center">
                       FeedBack Details  <a id="closebtn" style="color: white; float: right;text-decoration:none" class="btnClose"  href="#">X</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 45%; text-align: center;">
                        <asp:Label ID="LabelValidate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                
                <tr>
                    <td align="right">
                        Comments :
                    </td>
                    <td>
                        <asp:TextBox ID="txtfeedbackcommnts" runat="server"  TextMode="MultiLine" />
                        <asp:RequiredFieldValidator ID="rqtxt" runat="server" ControlToValidate="txtfeedbackcommnts" ErrorMessage="*" ValidationGroup="req" Text="Not empty" ForeColor="Red" Font-Bold="true"
                        ></asp:RequiredFieldValidator>
                    </td>
              
                </tr>
              
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click"  ValidationGroup="req"/>
                        <input type="button" class="btnClose" value="Cancel" />
                        
                    </td>
                </tr>
            </table>

</asp:Panel>


    </div>
    </form>
</body>
</html>
