<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BlankApplication.aspx.vb" Inherits="ROPA_Forms_BlankApplication" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <style type="text/css">
        .tdheight { height: 15px;}
        .contac { margin-left: 10px;
        }
        .style1 {
            color: #0033CC;
               float:left;
        }
        .style2 {
            color: #0033CC;
            font-weight: bold;
               float:left;
        }
        .selected {
    border:1px solid red !important;
  }
    </style>
    <script type="text/javascript" src="../../Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../../Scripts/jquery-2.0.3.js"></script>
    

 <script type="text/javascript">
     //Genric class for Addcssclass
     function AddCSSClass(TextboxClientId, TextboxId) {
         var j = $('#' + TextboxClientId);
         if (j.val() == "") { $("input[id*='" + TextboxId + "']").addClass("selected"); }
         else { $("input[id*='" + TextboxId + "']").removeClass("selected"); }
     }

     //Function For RadiobuttonEvents
     function OtherTextboxEvents(CheckBoxEvent, tableClass, tdClass, TextboxClientId, TextboxId, CVtxtId) {
         //CheckBox Event
         var checkboxEvent = $('#' + CheckBoxEvent);
         //TextBoxClientId
         var j = $('#' + TextboxClientId);
         //Custom validator Event
         var CVevent = $('[id$=' + CVtxtId + ']')[0];
         //Table Class 
         var tbclass = ('.' + tableClass + '>' + 'tbody' + '>' + 'tr td');
         //tdclass
         var tdclass = ('.' + tdClass);
         //Click Event
         if ((checkboxEvent).is(':checked') == true) {
             //Show Event
             $('' + tbclass + '' + tdclass).show();
             //add class
             if (j.val() == "") { $("input[id*='" + TextboxId + "']").addClass("selected"); }
             //Remove class 
             else { $("input[id*='" + TextboxId + "']").removeClass("selected"); }
             ValidatorEnable(CVevent, true);
         }
         else {
             if ((checkboxEvent).is(':checked') == false) {
                 j.val('');
                 $('' + tbclass + '' + tdclass).hide();
                 ValidatorEnable(CVevent, false);
             }
         }
     }

     //Radiobutton list events   
     function RadioButtonClick(rblUnqId, tableClass, tdclass, TextBoxClientId, TextboxId, CVtxtId) {
         var rbvalue = $("input[name='" + rblUnqId + "']:radio:checked");
         
         var j = $('#' + TextboxClientId);
         //Custom validator Event
         var CVevent = $('[id$=' + CVtxtId + ']')[0];
         //Table Class 
         var tbclass = ('.' + tableClass + '>' + 'tbody' + '>' + 'tr td');
         //tdclass
         var tdclass = ('.' + tdClass);

         if (rbvalue == "1") {
             $('' + tbclass + '' + tdclass).show();
             //add class
             if (j.val() == "") { $("input[id*='" + TextboxId + "']").addClass("selected"); }
             //Remove class 
             else { $("input[id*='" + TextboxId + "']").removeClass("selected"); }
             ValidatorEnable(CVevent, true);
         }
         else if (rbvalue == "0") {
             j.val('');
             $('' + tbclass + '' + tdclass).hide();
             ValidatorEnable(CVevent, false);
         }
         else if (rbvalue == undefined) {
             $('' + tbclass + '' + tdclass).hide();
             ValidatorEnable(CVevent, false);
         }
     }
     function OnblurEvents() {
         //TM other Event 
         $('#<%=TM_Otherstxt.ClientID %>').blur(function () { AddCSSClass('<%=TM_Otherstxt.ClientID %>', 'TM_Otherstxt'); });
         //RVS Other Events
         $('#<%=RVS_Otherstxt.ClientID %>').blur(function () { AddCSSClass('<%=RVS_Otherstxt.ClientID %>', 'RVS_Otherstxt'); });
         //CSW Other Events 
         $('#<%=CSW_Otherstxt.ClientID %>').blur(function () { AddCSSClass('<%=CSW_Otherstxt.ClientID %>', 'CSW_Otherstxt'); });
         $('#<%=TPS_Others_txt.ClientID %>').blur(function () { AddCSSClass('<%=TPS_Others_txt.ClientID %>', 'TPS_Others_txt'); });
     }
     //Funciton Load event
     function load() {
         OnblurEvents();
         var radioAAPM = $("input[name='<%=ISAAPM_rbl.UniqueID%>']:radio:checked").val();
         var textBoxAAPM = document.getElementById("<%=ISAAPM_Yestxt.ClientID %>");
         //When page is loaded first disable the Textboxes
         if (radioAAPM == undefined || (radioAAPM == "0")) {
             textBoxAAPM.disabled = true;
         }
     }
     $(document).ready(function () {

         Allradiobuttonlistclickevents();
         Allradiobuttonlistevents();
         Allcheckboxlistevents();
         //Other textbox events 
         $("#TreatmentModalities_16").click(DisableTreatment);
         $("#chk_Record_Verify_Sys_3").click(DisableRVS);
         $("#ContouringSoftware_2").click(DisableCSoftware);
         $("#chk_Treatment_Planning_Sys_20").click(DisableTPS);
         Calendar($('#<%=SurveyorWorkshopDate_Yestxt.ClientID%>'));
     });

     function Allcheckboxlistevents() {
         DisableTreatment();
         DisableRVS();
         DisableCSoftware();
         DisableTPS();
     }
     function DisableTreatment() {
         alert('hi');
         OtherTextboxEvents('TreatmentModalities_16', 'ModalitiesChktbl', 'ModalitieschkOthertxt', '<%=TM_Otherstxt.ClientID %>', 'TM_Otherstxt', 'cv_TM_Otherstxt');
     }
     function DisableRVS() {
         OtherTextboxEvents('chk_Record_Verify_Sys_3', 'RVSCSothrtbl', 'RVSOther', '<%=RVS_Otherstxt.ClientID %>', 'RVS_Otherstxt', 'cv_RVS_Otherstxt');
     }
     function DisableCSoftware() {
         OtherTextboxEvents('ContouringSoftware_2', 'RVSCSothrtbl', 'CSWOthers', '<%=CSW_Otherstxt.ClientID %>', 'CSW_Otherstxt', 'cv_CSW_Otherstxt');
     }
     function DisableTPS() {
         OtherTextboxEvents('chk_Treatment_Planning_Sys_20', 'Treatment_PlanningChktbl', 'TratmentPlanningSysOther', '<%=TPS_Others_txt.ClientID %>', 'TPS_Others_txt', 'cv_TPS_Others_txt');
     }
     function Allradiobuttonlistclickevents() {
         $("#<%=IsSurveyorOtherBody.ClientID%>").change(function () { DisableIsAgreeACR(); });
         $("#<%=IsACRMember_rbl.ClientID%>").change(function () { IsACRMemberrbl(); });


         $("#<%=ISAAPM_rbl.ClientID%>").change(function () { IsAAPMemberrbl(); });
         $("#<%=IsABRCertified_rbl.ClientID%>").change(function () { IsABRCertifiedrbl(); });
         $("#<%=IsASTROMember_rbl.ClientID%>").change(function () { IsASTROMemberrbl(); });
         $("#<%=SurveyorWorkshopDate_rbl.ClientID%>").change(function () { SurveyorWorkshopDaterbl(); });
     }

     function Allradiobuttonlistevents() {
         DisableIsAgreeACR();
         IsACRMemberrbl();
         IsAAPMemberrbl();
         IsABRCertifiedrbl();
         IsASTROMemberrbl();
         SurveyorWorkshopDaterbl();
     }



     function IsACRMemberrbl() {
         var rbvalue = $("input[name='<%=IsACRMember_rbl.UniqueID%>']:radio:checked").val();
         if (rbvalue == "1") {
             $('.Rbltbl>tbody>tr td.ACRrbldisabletxtboxes').show();
             if ($('#<%=IsACRMember_Yestxt.ClientID %>').val() == "") {
                 //textboxvalue is empty or not 
                 $("input[id*='IsACRMember_Yestxt']").addClass("selected");
             }
             else {
                 //Remove Class here if incase textboxes contains the values
                 $("input[id*='IsACRMember_Yestxt']").removeClass("selected");
             }
             ValidatorEnable($('[id$=cv_IsACRMember_Yestxt]')[0], true);
         }
         else if (rbvalue == "0") {
             $('.Rbltbl>tbody>tr td.ACRrbldisabletxtboxes').hide();
             $('#<%= IsACRMember_Yestxt.ClientID %>').val('');
             ValidatorEnable($('[id$=cv_IsACRMember_Yestxt]')[0], false);
         }
         else if (rbvalue == undefined) {
             $('.Rbltbl>tbody>tr td.ACRrbldisabletxtboxes').hide();
             ValidatorEnable($('[id$=cv_IsACRMember_Yestxt]')[0], false);
         }
     }

     function IsAAPMemberrbl() {
         RadioButtonClick('<%=ISAAPM_rbl.UniqueID%>', 'Rbltbl', 'AAPMrbldisabletxtboxes', '<%= ISAAPM_Yestxt.ClientID %>', 'ISAAPM_Yestxt', 'cv_ISAAPM_Yestxt');
     }


     function IsABRCertifiedrbl() {
         var rbvalue = $("input[name='<%=IsABRCertified_rbl.UniqueID%>']:radio:checked").val();
         if (rbvalue == "1") {
             $('.Rbltbl>tbody>tr td.ABRrbldisabletxtboxes').show();
             if ($('#<%=IsABRCertified_Yestxt.ClientID %>').val() == "") {
                 //textboxvalue is empty or not 
                 $("input[id*='IsABRCertified_Yestxt']").addClass("selected");
             }
             else {
                 //Remove Class here if incase textboxes contains the values
                 $("input[id*='IsABRCertified_Yestxt']").removeClass("selected");
             }
             ValidatorEnable($('[id$=cv_IsABRCertified_Yestxt]')[0], true);
         }
         else if (rbvalue == "0") {
             $('.Rbltbl>tbody>tr td.ABRrbldisabletxtboxes').hide();
             $('#<%= IsABRCertified_Yestxt.ClientID %>').val('');
             ValidatorEnable($('[id$=cv_IsABRCertified_Yestxt]')[0], false);
         }
         else if (rbvalue == undefined) {
             $('.Rbltbl>tbody>tr td.ABRrbldisabletxtboxes').hide();
             ValidatorEnable($('[id$=cv_IsABRCertified_Yestxt]')[0], false);
         }
     }



     function IsASTROMemberrbl() {
         var rbvalue = $("input[name='<%=IsASTROMember_rbl.UniqueID%>']:radio:checked").val();
         if (rbvalue == "1") {
             $('.Rbltbl>tbody>tr td.ASTROrbldisabletxtboxes').show();
             if ($('#<%=IsASTROMember_Yestxt.ClientID %>').val() == "") {
                 //textboxvalue is empty or not 
                 $("input[id*='IsASTROMember_Yestxt']").addClass("selected");
             }
             else {
                 //Remove Class here if incase textboxes contains the values
                 $("input[id*='IsASTROMember_Yestxt']").removeClass("selected");
             }
             ValidatorEnable($('[id$=cv_IsASTROMember_Yestxt]')[0], true);
         }
         else if (rbvalue == "0") {
             $('.Rbltbl>tbody>tr td.ASTROrbldisabletxtboxes').hide();
             $('#<%= IsASTROMember_Yestxt.ClientID %>').val('');
             ValidatorEnable($('[id$=cv_IsASTROMember_Yestxt]')[0], false);
         }
         else if (rbvalue == undefined) {
             $('.Rbltbl>tbody>tr td.ASTROrbldisabletxtboxes').hide();
             ValidatorEnable($('[id$=cv_IsASTROMember_Yestxt]')[0], false);
         }
     }

     function SurveyorWorkshopDaterbl() {
         var rbvalue = $("input[name='<%=SurveyorWorkshopDate_rbl.UniqueID%>']:radio:checked").val();
         if (rbvalue == "1") {
             $('.Rbltbl>tbody>tr td.Daterbldisabletxtboxes').show();
             if ($('#<%=IsASTROMember_Yestxt.ClientID %>').val() == "") {
                 //textboxvalue is empty or not 
                 $("input[id*='SurveyorWorkshopDate_Yestxt']").addClass("selected");
             }
             else {
                 //Remove Class here if incase textboxes contains the values
                 $("input[id*='SurveyorWorkshopDate_Yestxt']").removeClass("selected");
             }
             ValidatorEnable($('[id$=cv_SurveyorWorkshopDate_Yestxt]')[0], true);
         }
         else if (rbvalue == "0") {
             $('.Rbltbl>tbody>tr td.Daterbldisabletxtboxes').hide();
             $('#<%= SurveyorWorkshopDate_Yestxt.ClientID %>').val('');
             ValidatorEnable($('[id$=cv_SurveyorWorkshopDate_Yestxt]')[0], false);
         }
         else if (rbvalue == undefined) {
             $('.Rbltbl>tbody>tr td.Daterbldisabletxtboxes').hide();
             ValidatorEnable($('[id$=cv_SurveyorWorkshopDate_Yestxt]')[0], false);
         }

     }

     function DisableIsAgreeACR() {
         var rbvalue = $("input[name='<%=IsSurveyorOtherBody.UniqueID%>']:radio:checked").val();
         if (rbvalue == "True") {
             $('.Rbltbl>tbody>tr.YesTextDisable').show();
             $('.Rbltbl>tbody>tr.YesTextDisable').addClass("selected");
             ValidatorEnable($('[id$=rfv_IsAgreeACROnly]')[0], true);
         }
         else if (rbvalue == "False" || rbvalue == undefined) {
             $('.Rbltbl>tbody>tr.YesTextDisable').hide();
             $("table[id$=IsAgreeACROnly] input:radio:checked").removeAttr("checked");
             ValidatorEnable($('[id$=rfv_IsAgreeACROnly]')[0], false);
         }
     }

     //Function For Calendar Controller        
     function Calendar(i) {
         var maxdate = new Date();
         var mindate = new Date('01/01/2000');
         i.datepicker({
             autoSize: true,
             changeMonth: true,
             changeYear: true,
             minDate: mindate,
             maxDate: maxdate,
             currentText: "CurMonth",
             showButtonPanel: true,
             beforeShow: function (input) {
                 setTimeout(function () {
                     var buttonPane = $(input)
                        .datepicker("widget")
                        .find(".ui-datepicker-buttonpane");

                     $("<button>", {
                         text: "Clear",
                         css: 'ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all ui-state-hover',
                         click: function () {
                             $.datepicker._clearDate(input);
                         }
                     }).appendTo(buttonPane);
                 }, 1);
             }
         });
     }

     //AAPMChangeEvent
     function AAPMChangeEvent() {
         var radioAAPM = $("input[name='<%=ISAAPM_rbl.UniqueID%>']:radio:checked").val();

         var textBoxAAPM = document.getElementById("<%=ISAAPM_Yestxt.ClientID %>");
         //When page is loaded first disable the Textboxes

         if (radioAAPM == "1") {
             textBoxAAPM.disabled = false;
             textBoxAAPM.focus();
         }
         else if (radioAAPM == "0") {
             textBoxAAPM.value = "";
             textBoxAAPM.disabled = true;
         }
     }

     //validation for OtherCSW
     function ValidatingOthersCSW(sender, args) {
         args.IsValid = true;
         if ((document.getElementById("ContouringSoftware_2").checked == true) && $.trim(document.getElementById("CSW_Otherstxt").value) == "") {
             args.IsValid = false;
         }
     }
     //Validation for OtherRVS
     function ValidatingOthersRVS(sender, args) {
         args.IsValid = true;
         if ((document.getElementById("chk_Record_Verify_Sys_3").checked == true) && $.trim(document.getElementById("RVS_Otherstxt").value) == "") {
             args.IsValid = false;
         }
     }

     //Validation for OthersTM
     function ValidatingOthersTM(sender, args) {
         args.IsValid = true;
         if ((document.getElementById("TreatmentModalities_16").checked == true) && $.trim(document.getElementById("TM_Otherstxt").value) == "") {
             args.IsValid = false;
         }
     }
     //Validations OthersTPS
     function ValidatingOthersTPS(sender, args) {
         args.IsValid = true;
         if ((document.getElementById("chk_Treatment_Planning_Sys_20").checked == true) && $.trim(document.getElementById("TPS_Others_txt").value) == "") {
             args.IsValid = false;
         }
     }


     //Validation for ACR Member
     function ValidatingACRMember(sender, args) {
         var rbid = document.getElementById("IsACRMember_rbl_0");

         var txtid = document.getElementById("IsACRMember_Yestxt");
         args.IsValid = true;
         if (rbid.checked == true && $.trim(txtid.value) == "") {
             args.IsValid = false;
         }
     }
     //Validationf ro ABR member
     function ValidatingABRMember(sender, args) {
         var rbid = document.getElementById("IsABRCertified_rbl_0");
         var txtid = document.getElementById("IsABRCertified_Yestxt");
         args.IsValid = true;
         if (rbid.checked == true && $.trim(txtid.value) == "") {
             args.IsValid = false;
         }
     }

     //validation fro AAPM Member 
     function ValidatingAAPMMember(sender, args) {
         var rbid = document.getElementById("ISAAPM_rbl_0");
         var txtid = document.getElementById("ISAAPM_Yestxt");
         args.IsValid = true;
         if (rbid.checked == true && $.trim(txtid.value) == "") {
             args.IsValid = false;
         }
     }
     //Validtion for ASTRO Member
     function ValidatingASTROMember(sender, args) {
         var rbid = document.getElementById("IsASTROMember_rbl_0");
         var txtid = document.getElementById("IsASTROMember_Yestxt");
         args.IsValid = true;
         if (rbid.checked == true && $.trim(txtid.value) == "") {
             args.IsValid = false;
         }
     }
     //Validation for Checklistitems 
     function CheckItem(sender, args) {
         var chkControlId = sender.id.replace("cv_", "");
         var options = $('input:checkbox[id^=' + chkControlId + ']');
         var ischecked = false;
         args.IsValid = false;
         for (i = 0; i < options.length; i++) {
             var opt = options[i];
             if (opt.type == "checkbox") {
                 if (opt.checked) {
                     ischecked = true;
                     args.IsValid = true;
                 }
             }
             if (opt.type == "radio") {
                 if (opt.checked) {
                     ischecked = true;
                     args.IsValid = true;
                 }
             }
         }
         return args.IsValid;
     }
     //Validations For ModalitesOtherText
     function ModalitiesOtherText(sender, args) {
         var cntName = sender.id;
         var t1bid = document.getElementById(cntName + "_txt_TreatmentModalities_Others");
         var rbid = document.getElementById(cntName + "_TreatmentModalities_16");
         args.IsValid = true;
         if (rbid.checked == true) {
             if ($.trim(t1bid.value) == "") {
                 args.IsValid = false;
             }
         }
     }
     //validations for TextRequiredMembers
     function TextRequiredMembers(sender, args) {
         args.IsValid = true;
         if ((document.getElementById("SurveyorWorkshopDate_rbl_0").checked == true) && $.trim(document.getElementById("SurveyorWorkshopDate_Yestxt").value) == "") {
             args.IsValid = false;
         }
     }
     function EmailValidation() {

         var EmailId = $('#<%=TxtEmailWork.ClientID%>').val();
         if (EmailId == "") {

             $('#errmssgEmailId').css('color', 'Red').css('display', 'inline').text("Please Enter a Email Id");
         }
         else {

             $('#errmssgEmailId').css('display', 'none');
         }
     }


    </script>
    <head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  
   
    <fieldset style="padding-top: 0px;">
      
        <table>
            <tr>
                <td align="left">
                    <asp:Button ID="btn_Previous" CssClass="btnsLink" Text="Previous" runat="server"  /></td>
                <td colspan="2">
                    <div style="text-align: center; color: #2563a6">
                        <h2>Radiation Oncology Practice Accreditation Surveyor Application</h2>
                    </div>
                </td>
                <td align="right">

                    <asp:Button ID="btn_Finish" CssClass="btnsLink" ValidationGroup="req" Text="Submit" runat="server"  Height="25px" /></td>
            </tr>
        </table>
    </fieldset>
    
            <table width="100%" cellpadding="5" class="empty_tbl">
                <colgroup>
                    <col width="10%" />
                    <col width="25%" />
                    <col width="7%" />
                    <col width="55%" />
                </colgroup>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:ValidationSummary class="warning" ID="valSummary" ForeColor="Red" ValidationGroup="req" DisplayMode="List" Enabled="true" runat="server" ShowSummary="true" ShowMessageBox="false" />
                    </td>
                </tr>
                <tr>
                    <td>First Name
                    </td>
                    <td>
                        <asp:TextBox ID="TxtFname" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_TxtFname" runat="server" ForeColor="Red" ErrorMessage="First Name can not be empty" ControlToValidate="TxtFname" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                    </td>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="txtLname" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_txtLname" runat="server" ForeColor="Red" ErrorMessage="Last Name can not be empty" ControlToValidate="txtLname" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>Applying For</td>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rbtn_Applyas" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="6" Text="Trainee MD Surveyor"></asp:ListItem>
                            <asp:ListItem Value="7" Text="Trainee Physicist Surveyor"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_rbtn_Applyas" runat="server" ForeColor="Red" ErrorMessage=" Role Apply for is not Selected" ControlToValidate="rbtn_Applyas" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>

                    </td>

                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>Date

                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>Work Address
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="TxtWorkAddress" runat="server" TextMode="MultiLine" Height="73px" Width="346px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_TxtWorkAddress" runat="server" ForeColor="Red" ErrorMessage="Work Address can not be empty" ControlToValidate="TxtWorkAddress" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td class="">City</td>
                    <td>
                        <asp:TextBox ID="City_txt" runat="server"
                            CausesValidation="True" MaxLength="50"
                            ValidationGroup="req" CssClass="border"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqp1_City_txt" runat="server"
                            ControlToValidate="City_txt" ErrorMessage="Please Enter  City" Text="*" ForeColor="Red"
                            ValidationGroup="req"></asp:RequiredFieldValidator>
                    </td>
                    <td>State
                       
                    </td>
                    <td>
                        <asp:DropDownList ID="pl_State_ddl" runat="server" ValidationGroup="reg" CssClass="border" Style="margin: 0px">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                            <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                            <asp:ListItem Value="CA">California</asp:ListItem>
                            <asp:ListItem Value="CZ">Canal Zone Panama</asp:ListItem>
                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                            <asp:ListItem Value="DC">Dist of Columbia</asp:ListItem>
                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                            <asp:ListItem Value="GU">Guam</asp:ListItem>
                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                            <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                            <asp:ListItem Value="NY">New York</asp:ListItem>
                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                            <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                            <asp:ListItem Value="PW">Palau</asp:ListItem>
                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                            <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                            <asp:ListItem Value="VI">Virgin Islands</asp:ListItem>
                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                            <asp:ListItem Value="AE">Armed Forces Europe, the Middle East, and Canada</asp:ListItem>
                            <asp:ListItem Value="AP">Armed Forces Pacific</asp:ListItem>
                            <asp:ListItem Value="AA">Armed Forces Americas (except Canada)</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="0" ID="rfvddl_State" Display="Dynamic" ControlToValidate="pl_State_ddl" ValidationGroup="req" runat="server" Text="*" ErrorMessage="Please Select  State"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>Zip</td>
                    <td colspan="3">
                        <asp:TextBox ID="Zip" runat="server" CausesValidation="True"
                            Width="80px" MaxLength="5"
                            ValidationGroup="req" class="border"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="rev_Zip" runat="server"
                            ErrorMessage="Enter valid Zip" Text="*" ValidationGroup="req"
                            ControlToValidate="Zip" ForeColor="Red"
                            ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>
                        <h4>Phone Number : </h4>
                    </td>
                    <td colspan="3"></td>
                </tr>

                <tr>
                    <td>Work</td>
                    <td>
                        <asp:TextBox ID="ContactPhoneWork" MaxLength="12" class="txtNumbers" runat="server"></asp:TextBox>
                        <%-- JIRA - 484 16 th point  
                           <asp:RequiredFieldValidator ID="rfv_ContactPhoneWork" runat="server" ForeColor="Red" ErrorMessage="Please Enter Work Phone" ControlToValidate="ContactPhoneWork" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                        --%>
                        <asp:RegularExpressionValidator
                            ID="re_ContactPhoneWork" runat="server"
                            ErrorMessage="Enter Valid Work Phone Number" Text="*"
                            ControlToValidate="ContactPhoneWork" ForeColor="#CC0000"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ValidationGroup="req"></asp:RegularExpressionValidator>


                    </td>
                    <td>Home
                    </td>
                    <td>
                        <asp:TextBox ID="ContactPhoneHome" MaxLength="12" runat="server"></asp:TextBox>

                        <asp:RegularExpressionValidator
                            ID="re_ContactPhoneHome" runat="server"
                            ErrorMessage="Enter Valid Home Phone Number" Text="*"
                            ControlToValidate="ContactPhoneHome" ForeColor="#CC0000"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ValidationGroup="req"></asp:RegularExpressionValidator>
                        Example: 999-999-9999
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Example: 999-999-9999</td>
                    <td>Cell
                    </td>
                    <td>
                        <asp:TextBox ID="ContactPhoneCell" runat="server" MaxLength="12"></asp:TextBox>

                        <asp:RegularExpressionValidator
                            ID="re_ContactPhoneCell" runat="server"
                            ErrorMessage="Enter Valid Cell Phone Number" Text="*"
                            ControlToValidate="ContactPhoneCell" ForeColor="#CC0000"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ValidationGroup="req"></asp:RegularExpressionValidator>
                        Example: 999-999-9999
                        
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>
                        <h4>Fax Number :</h4>
                    </td>
                    <td colspan="3"></td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td>Work</td>
                    <td>
                        <asp:TextBox ID="ContactFaxWork" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_ContactFaxWork" runat="server" ForeColor="Red" ErrorMessage="Please Enter FAX" ControlToValidate="ContactFaxWork" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="Reg_p1_Fax_txt" runat="server"
                            ErrorMessage="Enter Valid Work FAX Number" Text="*"
                            ControlToValidate="ContactFaxWork" ForeColor="#CC0000"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ValidationGroup="req">
                        </asp:RegularExpressionValidator>

                    </td>
                    <td>Home</td>
                    <td>
                        <asp:TextBox ID="ContactFaxHome" runat="server"></asp:TextBox>

                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server"
                            ErrorMessage="Enter Valid Home FAX Number" Text="*"
                            ControlToValidate="ContactFaxHome" ForeColor="#CC0000"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ValidationGroup="req">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="tdheight">
                    <td colspan="4"></td>
                </tr>
            </table>
            <table width="100%">
                <colgroup>
                    <col width="10%" />
                    <col width="20%" />
                    <col width="25%" />
                    <col width="35%" />
                </colgroup>
                <tr>
                    <td colspan="4">
                        <h4>Email Address:</h4>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table>
                            <tr>
                                <td colspan="2">
                                    
                                            <table width="100%">
                                                <tr>
                                                    <td style="width: 14%" valign="top">Work:</td>
                                                    <td style="width: 25%" valign="top">
                                                        <asp:TextBox ID="TxtEmailWork" CssClass="contac" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfv_TxtEmailWork" runat="server" ForeColor="Red" ErrorMessage="Please Enter E-Mail" ControlToValidate="TxtEmailWork" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                                                                       </td>
                                                    <td style="width: 60%" valign="top">
                                                        <asp:Label runat="server" ID="lblAvlText"></asp:Label>
                                                        <asp:Button ID="btnChkAvl" runat="server" Text="Check Availibility"   OnClientClick="EmailValidation();"
                                                              CssClass="btnsLink1" />
                                                      
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                      <span  id="errmssgEmailId" ></span>
                                            <span id="errmssgInvalidEmailId"></span> 
                                </td>
                               

                                <td valign="top">Home</td>
                                <td valign="top">
                                    <asp:TextBox ID="TxtEmailHome" runat="server"></asp:TextBox>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ErrorMessage="Enter valid Home Email Address" Text="*" ValidationGroup="req" ControlToValidate="TxtEmailHome"
                                        ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%" class="Rbltbl" id="rbltbl">
                            <colgroup>
                                <col width="30%" />
                                <col width="20%" />
                                <col width="20%" />
                                <col width="30%" />
                            </colgroup>
                            <tr  class="ACRtrClass">
                                <td>ACR Member:</td>
                                <td>
                                    <asp:RadioButtonList ID="IsACRMember_rbl" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td  class="ACRrbldisabletxtboxes">
                                    <asp:TextBox ID="IsACRMember_Yestxt" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ID="cv_IsACRMember_Yestxt" runat="server"
                                        ClientValidationFunction="ValidatingACRMember" ErrorMessage=" Enter ACR Member text" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_IsACRMember" runat="server" ForeColor="Red" ErrorMessage="ACR Memeber is not Selected" Display="Dynamic" ControlToValidate="IsACRMember_rbl" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>

                                </td>

                            </tr>

                            <tr>

                                <td>AAPM Member:</td>
                                <td>
                                    <asp:RadioButtonList ID="ISAAPM_rbl" runat="server" RepeatDirection="Horizontal" onclick="AAPMChangeEvent()">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="AAPMrbldisabletxtboxes">
                                    <asp:TextBox ID="ISAAPM_Yestxt" runat="server"></asp:TextBox>

                                    <asp:CustomValidator ID="cv_ISAAPM_Yestxt" runat="server"
                                        ClientValidationFunction="ValidatingAAPMMember" ErrorMessage="Enter AAAPM Member text" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_ISAAPM" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="AAPM is not Selected" ControlToValidate="ISAAPM_rbl" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>ABR Certified:</td>
                                <td>
                                    <asp:RadioButtonList ID="IsABRCertified_rbl" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td class="ABRrbldisabletxtboxes">
                                    <asp:TextBox ID="IsABRCertified_Yestxt" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ID="cv_IsABRCertified_Yestxt" runat="server"
                                        ClientValidationFunction="ValidatingABRMember" ErrorMessage="Enter ABR Member text" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_IsABRCertified" runat="server" ForeColor="Red" ErrorMessage="ABR  Certified is not Selected" Display="Dynamic" ControlToValidate="IsABRCertified_rbl" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>ASTRO Member:</td>
                                <td>
                                    <asp:RadioButtonList ID="IsASTROMember_rbl" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td  class="ASTROrbldisabletxtboxes">
                                    <asp:TextBox ID="IsASTROMember_Yestxt" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ID="cv_IsASTROMember_Yestxt" runat="server"
                                        ClientValidationFunction="ValidatingASTROMember" ErrorMessage="Enter ASTRO Member text" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_IsASTROMember" runat="server" ForeColor="Red" ErrorMessage="ASTRO  is not Selected" ControlToValidate="IsASTROMember_rbl" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>

                                </td>
                            </tr>

                            <%-- This is Requirement for Client call client suggested remove this question  that reason By usin JQuery I blocked the pratical tr by using   class 
                                 Refer JIRA 553  --%>


                            <tr>
                                <td>Surveyor Workshop Attended and date:</td>
                                <td>
                                    <asp:RadioButtonList ID="SurveyorWorkshopDate_rbl" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="Daterbldisabletxtboxes">
                                    <%--<asp:TextBox ID="SurveyorWorkshopDate_Yestxt" Class="calendarFocus" ReadOnly="true" runat="server"></asp:TextBox>--%>
                                    <input type="text" id="SurveyorWorkshopDate_Yestxt" class="calendarFocus" runat="server" readonly="true" style="width: 145px;" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfv_SurveyorWorkshopDate" runat="server" ForeColor="Red" ErrorMessage=" Please Enter Surveyor Workshop Attended and  Date "
                                        ControlToValidate="SurveyorWorkshopDate_rbl" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator>

                                    <asp:CustomValidator ID="cv_SurveyorWorkshopDate_Yestxt" runat="server"
                                        ClientValidationFunction="TextRequiredMembers" ErrorMessage="Enter Surveyor Workshop Attended and date" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>


                                    <asp:RegularExpressionValidator ID="rev_SurveyorWorkshopDate_Yestxt" runat="server" ErrorMessage="Incorrect date format"
                                        Text="*" ValidationGroup="req" ForeColor="Red" ControlToValidate="SurveyorWorkshopDate_Yestxt"
                                        ValidationExpression="^(([1-9])|(0[1-9])|(1[0-2]))\/(([0-9])|([0-2][0-9])|(3[0-1]))\/(([0-9][0-9])|([1-2][0,9][0-9][0-9]))$"></asp:RegularExpressionValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>Is your facility currently accredited by the ACR?</td>
                                <td>
                                    <asp:RadioButtonList ID="IsAcreditedbyACR" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td colspan="2">
                                    <asp:RequiredFieldValidator ID="rfv_IsAcreditedbyACR" runat="server" ForeColor="Red" ErrorMessage="Accredited by ACR is not Selected" ControlToValidate="IsAcreditedbyACR" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator></td>
                            </tr>

                            <tr>
                                <td>Do you serve as a surveyor for another accrediting body?</td>
                                <td>
                                    <asp:RadioButtonList ID="IsSurveyorOtherBody" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td colspan="2">
                                    <asp:RequiredFieldValidator ID="rfv_IsSurveyorOtherBody" runat="server" ForeColor="Red" ErrorMessage="Another accrediting body is not Selected" ControlToValidate="IsSurveyorOtherBody" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator></td>
                            </tr>
                            <asp:HiddenField ID="hdnfildcheck" runat="server" />

                            <tr id="Tr1" class="YesTextDisable" runat="server">
                                <td colspan="4">
                                    <asp:Panel ID="splpanl" runat="server">
                                        <table class="ACRtableupc">
                                            <colgroup>
                                                <col width="30%" />
                                                <col width="20%" />
                                                <col width="20%" />
                                                <col width="30%" />
                                            </colgroup>
                                            <tr>
                                                <td>If yes, do you agree to only perform surveys for the ACR
                        <br />
                                                    once you have completed the surveyor training program?</td>
                                                <td>
                                                    <asp:RadioButtonList ID="IsAgreeACROnly" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
                                                        <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                                    </asp:RadioButtonList></td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="rfv_IsAgreeACROnly" runat="server" ForeColor="Red" ErrorMessage="Surveyor training program is not Selected" ControlToValidate="IsAgreeACROnly" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>


                            <tr>
                                <td>Working Status</td>
                                <td>
                                    <asp:RadioButtonList ID="WorkStatus" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="True" Text="Full Time"></asp:ListItem>
                                        <asp:ListItem Value="False" Text="Part Time"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td colspan="2">
                                    <asp:RequiredFieldValidator ID="rfv_WorkStatus" runat="server" ForeColor="Red" ErrorMessage="Working Status is not Selected" ControlToValidate="WorkStatus" Text="*" ValidationGroup="req"> </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2">Professional Experience: (check all that apply)
                    YES/NO</td>

                                <td colspan="2"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table width="100%" class="Chkltbl">


                <colgroup>
                    <col width="20%" />
                    <col width="25%" />
                    <col width="25%" />
                    <col width="30%" />
                </colgroup>
                <tr>
                    <td colspan="4"><b>Treatment Modalities</b>
                        <asp:CustomValidator ID="cv_TreatmentModalities" runat="server"
                            ClientValidationFunction="CheckItem" ErrorMessage="Please Select Treatment Modalities" Text="*" ForeColor="Red"
                            ValidationGroup="req"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td colspan="4" valign="middle">
                        <div style="float: left; width: 99%">
                            <asp:CheckBoxList ID="TreatmentModalities" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                                <asp:ListItem Value="0">Conformal RT</asp:ListItem>
                                <asp:ListItem Value="1">Intensity Modulated Radiation Therapy (IMRT)</asp:ListItem>
                                <asp:ListItem Value="2">Stereotactic Radio Surgery (SRS)</asp:ListItem>
                                <asp:ListItem Value="3">Stereotactic Body Radio Surgery (SBRT)</asp:ListItem>
                                <asp:ListItem Value="4">Radiopharmaceuticals</asp:ListItem>
                                <asp:ListItem Value="5">Brachytherapy Low Dose Radiation (LDR)</asp:ListItem>
                                <asp:ListItem Value="6">Brachytherapy High Dose Radiation (HDR)</asp:ListItem>
                                <asp:ListItem Value="7">Seed Implants</asp:ListItem>
                                <asp:ListItem Value="8">Total Body Irradiation (TBI)</asp:ListItem>
                                <asp:ListItem Value="9">CyberKnife</asp:ListItem>
                                <asp:ListItem Value="10">Gamma Knife Radiosurgery</asp:ListItem>
                                <asp:ListItem Value="11">TomoTherapy</asp:ListItem>
                                <asp:ListItem Value="12">Proton Therapy</asp:ListItem>
                                <asp:ListItem Value="13">Radioembolization With Microsphere Brachytherapy (RMBD)</asp:ListItem>
                                <asp:ListItem Value="14">Intravascular brachytherapy(IVBT)</asp:ListItem>
                                <asp:ListItem Value="15">Clinical Trials</asp:ListItem>
                                <asp:ListItem Value="16">Other</asp:ListItem>
                            </asp:CheckBoxList>
                            <table width="45%" class="ModalitiesChktbl">
                                <tr>
                                    <td width="30%"></td>
                                    <td class="ModalitieschkOthertxt">
                                        <asp:TextBox ID="TM_Otherstxt" runat="server"></asp:TextBox>
                                        <asp:CustomValidator ID="cv_TM_Otherstxt" runat="server"
                                            ClientValidationFunction="ValidatingOthersTM"
                                            ErrorMessage=" Enter Treatment Modalities for Other Text" Text="*" ForeColor="Red"
                                            ValidationGroup="req"></asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>

                        </div>

                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table width="100%"  class="RVSCSothrtbl">
                            <colgroup>
                                <col width="30%" />
                                <col width="35%" />
                                <col width="35%" />
                            </colgroup>

                            <tr>

                                <td>
                                    <b>Record and Verify Systems :
                                           <asp:CustomValidator ID="cv_chk_Record_Verify_Sys" runat="server"
                                               ClientValidationFunction="CheckItem" ErrorMessage="Please Select Record and Verify Systems" Text="*" ForeColor="Red"
                                               ValidationGroup="req"></asp:CustomValidator>
                                    </b>
                                    <asp:CheckBoxList ID="chk_Record_Verify_Sys" runat="server">
                                        <asp:ListItem Value="0">IMPAC MOSAIQ</asp:ListItem>
                                        <asp:ListItem Value="1">VARIAN ARIA</asp:ListItem>
                                        <asp:ListItem Value="2">SIEMENS LANTIS</asp:ListItem>
                                        <asp:ListItem Value="3">Other</asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                                <td valign="bottom" class="RVSOther">
                                    <asp:TextBox ID="RVS_Otherstxt" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ID="cv_RVS_Otherstxt" runat="server"
                                        ClientValidationFunction="ValidatingOthersRVS" ErrorMessage="Enter Record and Verify Systems Other text" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>
                                </td>
                                <td valign="bottom"></td>
                            </tr>
                            <tr>
                                <td colspan="4"><b>Contouring Software :</b>
                                    <asp:CustomValidator ID="cv_ContouringSoftware" runat="server"
                                        ClientValidationFunction="CheckItem" ErrorMessage="Please Select contouring Software" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="ContouringSoftware" runat="server">
                                        <asp:ListItem Value="0">MIM</asp:ListItem>
                                        <asp:ListItem Value="1">Velocity</asp:ListItem>
                                        <asp:ListItem Value="2">Other</asp:ListItem>
                                    </asp:CheckBoxList></td>
                                <td valign="bottom" colspan="2" class="CSWOthers">
                                    <asp:TextBox ID="CSW_Otherstxt" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ID="cv_CSW_Otherstxt" runat="server"
                                        ClientValidationFunction="ValidatingOthersCSW" ErrorMessage=" Enter Contouring Software Other Text" Text="*" ForeColor="Red"
                                        ValidationGroup="req"></asp:CustomValidator>
                                </td>
                                <td valign="bottom"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4"><b>Treatment Planning Systems :<asp:CustomValidator ID="cv_chk_Treatment_Planning_Sys" runat="server"
                        ClientValidationFunction="CheckItem" ErrorMessage="Please Select atleast one Treatment Planning Systems" Text="*" ForeColor="Red"
                        ValidationGroup="req"></asp:CustomValidator></b></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" >
                        <asp:CheckBoxList ID="chk_Treatment_Planning_Sys" runat="server" RepeatDirection="Horizontal" Width="111%" RepeatColumns="4">
                            <asp:ListItem Value="0">Brachyvision (Varian) </asp:ListItem>
                            <asp:ListItem Value="1">iPlan RT Dose </asp:ListItem>
                            <asp:ListItem Value="2">Corvus (Nomos)</asp:ListItem>
                            <asp:ListItem Value="3">Cyberknife Multiplan System</asp:ListItem>
                            <asp:ListItem Value="4">Eclipse/Cad Plan </asp:ListItem>
                            <asp:ListItem Value="5">Elekta/CMS (XiO/Monaco)</asp:ListItem>
                            <asp:ListItem Value="6">ISOgray (Monte Carlo) </asp:ListItem>
                            <asp:ListItem Value="7">Gammaknife (Elekta) </asp:ListItem>
                            <asp:ListItem Value="8">Monaco </asp:ListItem>
                            <asp:ListItem Value="9">GE</asp:ListItem>
                            <asp:ListItem Value="10">Mevis (CAT3D)</asp:ListItem>
                            <asp:ListItem Value="11">Multidata Planning System</asp:ListItem>
                            <asp:ListItem Value="12">Ocentra (Nuletron)</asp:ListItem>
                            <asp:ListItem Value="13">Pinnacle (ADAC)</asp:ListItem>
                            <asp:ListItem Value="14">Plato </asp:ListItem>
                            <asp:ListItem Value="15">Prowess</asp:ListItem>
                            <asp:ListItem Value="16">Scanditronix</asp:ListItem>
                            <asp:ListItem Value="17">Tomotherapy Treatment Planning System</asp:ListItem>
                            <asp:ListItem Value="18">VariSeed (Varian)</asp:ListItem>
                            <asp:ListItem Value="19">Viewray Treatment Planning System</asp:ListItem>
                            <asp:ListItem Value="20">Other</asp:ListItem>
                        </asp:CheckBoxList>
                        <table width="45%" class="Treatment_PlanningChktbl">
                                <tr>
                                 
                        <td class="TratmentPlanningSysOther">
                         <asp:TextBox ID="TPS_Others_txt" runat="server"></asp:TextBox>
                        <asp:CustomValidator ID="cv_TPS_Others_txt" runat="server"
                            ClientValidationFunction="ValidatingOthersTPS" ErrorMessage="Enter Treatment Planning Systems Other Text" Text="*" ForeColor="Red"
                            ValidationGroup="req"></asp:CustomValidator>
                            </td>
                                       </tr>
                            </table>
                    
                       
                    </td>
                </tr>



        </table>


    </form>
</body>
</html>
