<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CheckBoxList.aspx.vb" Inherits="ROPA_Forms_CheckBoxList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<script type="text/javascript" src="../../Scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../../Scripts/jquery-2.0.3.js"></script>
    
<head runat="server">
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

    <script type="text/javascript">

    //checkbox list items
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
        $(document).ready(function () {
           
        });
        </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     <table width="100%" class="Chkltbl">


                <colgroup>
                    <col width="20%" />
                    <col width="25%" />
                    <col width="25%" />
                    <col width="30%" />
                </colgroup>

                <tr><td><asp:Button ID="btn_Finish"  ValidationGroup="req" Text="Submit" runat="server"  Height="25px" /></td></tr>

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
    </div>
    </form>
</body>
</html>
