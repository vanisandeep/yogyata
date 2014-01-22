<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResponseForm.aspx.cs" Inherits="ROPA_ResponseForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"  type="text/javascript"></script>
    <style type="text/css">
        p {
            margin: 15px 0;
        }
    </style>

    <script type="text/javascript">
        
        function chkuploaded(sender, args) {
            if (document.getElementById("cphMaster_rdbtn_prvideelesigns_1").checked == true) {
                var id = sender.id.replace("cv_chk", "hid");
                var ctrl = $("#" + id);
                if (ctrl != null && ctrl.val() == 1) { args.IsValid = true; }
                else {
                    args.IsValid = false;
                    var erroMessage = "Please Upload Sign on Hard Copy Document ";
                    sender.errormessage = erroMessage;
                }
            }
        }
        function TextEnable() {
            if ($("#cphMaster_ConflictOfInterest")[0].className == "aspNetDisabled") {
                document.getElementById("cphMaster_ConflictOfInterest").disabled = true;
            }

            else {

                if (document.getElementById("cphMaster_ConflictOfInterest_0").checked == false && document.getElementById("cphMaster_ConflictOfInterest_1").checked == false) {
                    document.getElementById("cphMaster_ConflictDescription").disabled = true;
                }
                if (document.getElementById("cphMaster_ConflictOfInterest_0").checked == true) {
                    document.getElementById("cphMaster_ConflictDescription").disabled = false;
                }

                else if (document.getElementById("cphMaster_ConflictOfInterest_1").checked == true) {

                    document.getElementById("cphMaster_ConflictDescription").value = "";
                    document.getElementById("cphMaster_ConflictDescription").disabled = true;
                }
            }
        }
        function ConflictDescriptiontxt(sender, args) {
            args.IsValid = true;
            if ((document.getElementById("cphMaster_ConflictOfInterest_0").checked == true) && $.trim(document.getElementById("cphMaster_ConflictDescription").value) == "") {
                args.IsValid = false;
            }
        }

        function Imagevalidate(sender, args) {
            var ctrl1 = $("#<%=rdbtn_prvideelesigns_0.ClientID%>");
            var ctrl2 = $("#<%=rdbtn_prvideelesigns_1.ClientID%>");

            if (ctrl1[0].checked == true)

                if (ctrl1[0].checked == true) {
                    var ctrlid = sender.id;
                    var id = ctrlid.replace("cv_", "");
                    var ctrl = document.getElementById(id);
                    if ((ctrl.src.indexOf(".jpg") != -1) || (ctrl.src.indexOf(".png") != -1) || (ctrl.src.indexOf(".gif") != -1) || (ctrl.src.indexOf(".jpeg") != -1) || (ctrl.src.indexOf(".jpe") != -1) || (ctrl.src.indexOf(".jfif") != -1) || (ctrl.src.indexOf(".tiff") != -1) || (ctrl.src.indexOf(".tif") != -1) || (ctrl.src.indexOf(".bmp") != -1) || (ctrl.src.indexOf(".dib") != -1)) {

                        if (!ctrl.isDisabled) {
                            if ((ctrl.src.indexOf('NoImage') > -1))
                                args.IsValid = false;
                            else
                                args.IsValid = true;
                        }
                        else {
                            args.IsValid = false;
                        }
                    }
                    else
                        args.IsValid = false;
                }
                else if (ctrl2[0].checked == true) {
                    args.IsValid = true;
                }
            var errorMessage = "Please Upload Image";  //"In Release Form " + (ReleaseFormeNo(id) + 1) + ": Please check Sign on Hard Copy";
            sender.errormessage = errorMessage;

        }

        function chksignatures(sender, args) {

            if (sender != null) {
                var id = sender.id.replace("cv_", "");
                var ctrl = $("#<%=rdbtn_prvideelesigns_0.ClientID%>"); //$("#" + id[0]);
                var ctrl1 = $("#<%=rdbtn_prvideelesigns_1.ClientID%>"); //$("#" + id[1]);

                if (ctrl[0].checked) { args.IsValid = true; }
                else if (ctrl1[0].checked) { args.IsValid = true; }
                else { args.IsValid = false; }

            }
            // ErrorMessage="Please check Sign on Hard Copy"
            var errorMessage = "Please check any of the following";  //"In Release Form " + (ReleaseFormeNo(id) + 1) + ": Please check Sign on Hard Copy";
            sender.errormessage = errorMessage;
        }


        function Onchange() {
            var rbvalue = $("input[name='<%=ConflictOfInterest.UniqueID%>']:radio:checked").val();
            if (rbvalue == undefined || rbvalue == 0) {
                $('#Headertable>tbody>tr.FileUploadTr').hide();

                $('#Headertable>tbody>tr.GrdCItr').hide();
            }
            else {
                $('#Headertable>tbody>tr.FileUploadTr').show();
            }
        }

        $(document).ready(function () {

            Onchange();
            $("#<%=ConflictOfInterest.ClientID%>").change(function () {
                var rbvalue = $("input[name='<%=ConflictOfInterest.UniqueID%>']:radio:checked").val();
                if (rbvalue == 0 || rbvalue == "undefined") {
                    $('#Headertable>tbody>tr.FileUploadTr').hide();
                    $('#Headertable>tbody>tr.GrdCItr').hide();
                }
                else {
                    $('#Headertable>tbody>tr.FileUploadTr').show();
                }
            });
            if (document.getElementById("<%=rdbtn_prvideelesigns_0.ClientID%>").checked == false && document.getElementById("<%=rdbtn_prvideelesigns_1.ClientID%>").checked == false) {
                $("#<%= imgROUpload.ClientID%>").hide();

                
                $("#<%= td_Note.ClientID%>").hide(); //id="td_Note" runat="server"
                $("#<%= upload_doc1_a.ClientID%>").hide(); //upload_doc1_a
                $("#<%=imgROUpload.ClientID%>").attr('disabled', true);
                $("#<%=fuROUpload.ClientID%>").hide();
                $("#<%=btnROUpload.ClientID%>").hide();

            }

            if (document.getElementById("<%=rdbtn_prvideelesigns_0.ClientID%>").checked == true) {

                $("#<%= imgROUpload.ClientID%>").show();
                $("#<%= td_Note.ClientID%>").show(); //id="td_Note" runat="server"
                $("#<%= upload_doc1_a.ClientID%>").hide(); //upload_doc1_a
                $("#<%=imgROUpload.ClientID%>").attr('disabled', false);
                $("#<%=fuROUpload.ClientID%>").show();
                $("#<%=btnROUpload.ClientID%>").show();
               
            }

            if (document.getElementById("<%=rdbtn_prvideelesigns_1.ClientID%>").checked == true) {

                $("#<%=imgROUpload.ClientID%>").hide();

                $("#<%= td_Note.ClientID%>").hide(); //id="td_Note" runat="server"
                $("#<%= upload_doc1_a.ClientID%>").show();
                $("#<%= upload_doc.ClientID%>").hide();
                $("#<%=imgROUpload.ClientID%>").attr('disabled', true);
                $("#<%=fuROUpload.ClientID%>").hide();
                $("#<%=btnROUpload.ClientID%>").hide();

            }

            $("#<%=rdbtn_prvideelesigns_0.ClientID%>").change(function () {

                $("#<%= imgROUpload.ClientID%>").show();
                $("#<%= td_Note.ClientID%>").show(); //id="td_Note" runat="server"
                $("#<%= upload_doc1_a.ClientID%>").hide(); //upload_doc1_a
                $("#<%=imgROUpload.ClientID%>").attr('disabled', false);
                $("#<%=fuROUpload.ClientID%>").show();
                $("#<%=btnROUpload.ClientID%>").show();
                $("#<%= upload_doc.ClientID%>").show();
            })

            $("#<%=rdbtn_prvideelesigns_1.ClientID%>").change(function () {
            
                $("#<%=imgROUpload.ClientID%>").hide();
                $("#<%= td_Note.ClientID%>").hide(); //id="td_Note" runat="server"
                $("#<%= upload_doc1_a.ClientID%>").show();
                $("#<%=imgROUpload.ClientID%>").attr('disabled', true);
                $("#<%=fuROUpload.ClientID%>").hide();
                $("#<%=btnROUpload.ClientID%>").hide();
            })
        })

    </script>
    <fieldset style="padding-top: 0px">

        <asp:Panel runat="server" ID="PnlContainer">
            <div style="text-align: center; color: #2563a6">
                <h2>ACCREDITATION CONFLICT OF INTEREST ACKNOWLEDGMENT AND DISCLOSURE FORM</h2>
            </div>
                <asp:HiddenField ID="hdnloginRoleId" runat="server" ClientIDMode="Static"  />
            <table width="100%" cellpadding="8"  class="headerTable" id="Headertable">
                
                <tr>
                    <td>
                        <div style="width: 80%; margin: 0 auto; font-weight: bold">
                            <asp:RadioButtonList ID="ConflictOfInterest" runat="server" RepeatDirection="Horizontal" Width="90%" Style="float: left" >
                                <asp:ListItem Value="1" Text="I do have an actual conflict of interest"></asp:ListItem>
                                <asp:ListItem Value="0" Text="I don't have an actual conflict of interest"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfv_ConflictOfInterest" runat="server" ForeColor="Red" ErrorMessage="Select any one" ControlToValidate="ConflictOfInterest" Text="*" ValidationGroup="req">
                            </asp:RequiredFieldValidator>

                        </div>

                    </td>
                </tr>
                     
                
               
                   
                <tr>
                    <td>Please disclose and explain Actual Conflicts of Interest:
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="float: left; width: 99%">
                            <asp:TextBox ID="ConflictDescription" runat="server" TextMode="MultiLine" Width="99%" Height="60px" ></asp:TextBox>
                        </div>
                        <div style="float: left;">
                            <asp:CustomValidator ID="cv_ConflictDescriptiontxt" runat="server" ClientIDMode="Static"
                                ClientValidationFunction="ConflictDescriptiontxt" ErrorMessage="Enter text for Actual Conflicts of Interest"
                                ForeColor="Red" Text="*" ValidationGroup="req"></asp:CustomValidator>
                        </div>
                    </td>
                </tr>
                
     
                
                <tr id="withoutLoginUpcomingsuruploadevent" class="FileUploadTr" runat="server">

                    <td>

                        <table style="width:40%">
                            <tr>
                                <td>
                                    <asp:FileUpload ID="fileUpload1" runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Upload"  />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 <asp:label id ="lblvalidtfileupld" runat="server" Visible="false" ForeColor="red"></asp:label>   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 <asp:label id ="lblmssgwithoutlgn" runat="server" Visible="false"  text="Should upload File of type _.doc,_.docx,_.pdf Only"  ForeColor="red"></asp:label>   
                                </td>
                            </tr>

                            <tr>
                  <td>
                                <asp:label id="filesizevalidation" runat="server"  Visible="false" ForeColor="red"></asp:label>  
                      </td>
                            </tr>

                        </table>
                    </td>
                </tr>                           
                 <tr id="withoutLoginUpcomingsur"  class="GrdCItr" runat="server">
                    <td>
                        <asp:GridView ID="gvDetails" runat="server" width="80%"  CellPadding="4" ForeColor="#333333" 
                       GridLines="None" AutoGenerateColumns="false" DataKeyNames="UploadId"
                         CssClass="tbstyless"> 
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />                
                            <Columns>
                                <asp:BoundField DataField="FileName" HeaderText="FileName" />
                                <asp:TemplateField HeaderText="View">

                                    <ItemTemplate>
                                        <asp:LinkButton ID="FileLink" runat="server" CausesValidation="false"
                                            CommandName="DownLoad" Text="View"
                                            CommandArgument='<%# Eval("UploadId") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Delete"
                                            CausesValidation="false" CommandName="Delete" OnClientClick='return confirm("Are you sure want to delete this entry ?");'
                                            CommandArgument='<%# Eval("UploadId") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>

            
               
                   
             </asp:Panel>


               
                                           
    </fieldset>



    <asp:Panel ID="PnlContainer_sign_hard_copy" runat="server">
        
            <table style="margin: 10px; width: 98%; border: 0px;">
                <tr>
                    <td>
                        <asp:RadioButton ID="rdbtn_prvideelesigns_0" runat="server" GroupName="signs" Text="I will provide electronic signatures" />
                        <asp:CustomValidator ID="cv_rdbtn_prvideelesigns" runat="server" ClientValidationFunction="chksignatures"
                            Text="*" ForeColor="Red" ValidationGroup="req"></asp:CustomValidator>
                        <br />
                        <br />
                        <asp:RadioButton ID="rdbtn_prvideelesigns_1" runat="server" GroupName="signs" Text="Sign on hard copy" />
                    </td>
                    <td id="td_Note" runat="server" >
                        <b>Note:</b>&nbsp; <span class="style1">1. Should upload images of type.jpg, .png, .gif, .jpeg, .jpe, .jfif, .tiff, .tif, .bmp, .dib Only<br />
                          
                                    2. Size of the upload image should not exceed 500kb.
                         
                                    3. Each radiation oncologist in the practice must sign a release form</span>
                    </td>
                </tr>
            </table>
            <table id="upload_doc" runat="server">
                <tr>
                    <td>
                        <asp:FileUpload ID="fuROUpload" runat="server" />
                        <asp:Button ID="btnROUpload" runat="server" Width="120px" Text="Upload Signature" />
                        <asp:Label ID="Lblimage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="imgROUpload" CssClass="TogetID" runat="server" Width="143px" Height="53px" />
                        <asp:CustomValidator ID="cv_imgROUpload" runat="server" ClientValidationFunction="Imagevalidate" Text="*" ForeColor="Red"
                            ValidationGroup="req"></asp:CustomValidator></td>
                </tr>

            </table>
            <table id="upload_doc1_a" runat="server" style="margin: 2px; width: 98%; border: 0px;">
               
                <tr>
                    <td valign="top">
                        <b>Upload Signed Document</b><br />
                        
                    </td>
                    <td id="td1" runat="server">
                        <br />
                        <b>Instructions :</b><br />
                        <ol style="color: #FF0000">
                            <li>Download Response Form.</li>
                            <li>Print it and Sign on Hard Copy.</li>
                            <li>Scan the Signed Copy.</li>
                            <li>Upload the Scanned soft Copy.</li>
                            <li>Should upload File of type .jpg .png .jpeg .doc .docx .pdf Only.</li>
                           </li>
                        </ol>
                    </td>
                </tr>
              
                 <tr id="withoutLoginwithoutlognSgnhardcopy"  class="FileUploadTr" runat="server">
                    <td colspan="2">
                        <table style="width:30%">
                            <tr>
                                <td>
                                    <asp:FileUpload ID="Signhrdcpywihtotlogin" runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnsignhrdcpywithotlogin" runat="server" Text="Upload" />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                 <asp:label id ="lblvldtesgnhrdcpywthoutlogin" runat="server" Visible="false" ForeColor="red"></asp:label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                  
                                    <asp:label id="lblValdateFilesize" runat="server" Visible="false" ForeColor="red"></asp:label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>             
                   <tr id="GrdvwwithoutlognSgnhardcopy" runat="server">
                    <td colspan="2">
                        <asp:GridView ID="gvsgnhrcpy" runat="server" width="80%"  CellPadding="4" ForeColor="#333333" 
                        AutoGenerateColumns="false" DataKeyNames="UploadId"  > 
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />                
                            <Columns>
                                <asp:BoundField DataField="FileName" HeaderText="FileName" />
                                <asp:TemplateField HeaderText="View">

                                    <ItemTemplate>
                                        <asp:LinkButton ID="FileLink" runat="server" CausesValidation="false"
                                            CommandName="DownLoad" Text="View"
                                            CommandArgument='<%# Eval("UploadId") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Delete"
                                            CausesValidation="false" CommandName="Delete" OnClientClick='return confirm("Are you sure want to delete this entry ?");'
                                            CommandArgument='<%# Eval("UploadId") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>               
            
                
                
               </table>
                </asp:Panel>      
                
    

        <table>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnPrevious" CssClass="btnsLink" Text="Previous" runat="server"/></td>
                <td colspan="2" align="center">
                    <asp:Button ID="btnNext" CssClass="btnsLink" ValidationGroup="req" Text="Next" runat="server"
                        /></td>
            </tr>
            <tr>
                <td>
                                    <asp:HiddenField ID="hddnvl" runat="server" />
                </td>
            </tr>
        </table>
    </fieldset>
    </div>
    </form>
</body>
</html>
