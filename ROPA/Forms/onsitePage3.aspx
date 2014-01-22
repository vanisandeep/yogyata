<%@ Page Language="C#" AutoEventWireup="true" CodeFile="onsitePage3.aspx.cs" Inherits="ROPA_Forms_onsitePage3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register TagPrefix="custom"  Namespace="myControls" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
 <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/js/jquery-calendar.js"></script>
	<script type="text/javascript" src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js"></script>
    <style type="text/css">
          /* For Algorithm For Other Textboxes Enable From  checkbox list step 2   */
        /*Please Refer  Algorithm*/
        #Q20_Ctxtothershow,#Q22B_txtshow,#Q23D_txtshow,#Q23C_othrtxtshow,#Q23B_ch_othertxtshow ,#Q20_Btxtothershow {
            display:none;
        }

          /*For Step  2  of Algorithm TextBox Enable And Disable */
         /* Please Refer Algorithm*/ 
        /* Disable the All textbox  When page is loaded first time*/
        /*disable the text box fileds using dispaly none when page is loaded */
        #Q18_txtshow,#Q19_txtshow,#Q20_txtshow,#Q21_txtshow,#Q22A_txtshow,#Q23A_txtshow ,#Q24A_txtshow,#Q24B_txtshow, #Q25A_txtshow,#Q25B_txtshow{
            display: none;
        }
    </style>


     <script type="text/javascript">

     $(document).ready(function () {
             ValidatorEnable($('[id$=rfv_Q20_othrcmmtns]')[0], false);
             ValidatorEnable($('[id$=rfv_Q22B_ch_txtcmmnt]')[0], false);
             ValidatorEnable($('[id$=rfv_Q23_D_txtcmmnt]')[0], false);
             ValidatorEnable($('[id$=rfv_Q23_txtcmmnt]')[0], false);
             ValidatorEnable($('[id$=rfv_Q23B_ch_txtshow]')[0], false);
             ValidatorEnable($('[id$=rfv_Q20Bothrcmmtnt]')[0], false);
          
             /* For Algorithm For Other Textboxes Enable From  checkbox list step 3  */
             /* Please Refer Algorithm*/
             $("#Q21C_ch_4").click(DisableQ20ch);
             $("#Q22B_ch_5").click(DisableQ21bch);
             $("#Q23D_ch_5").click(DisableQ22Dch);
             $("#Q23c_ch_7").click(DisableQ22Cch);
             $("#Q23B_ch_5").click(DisableQ22Bch);
             $("#Q21B_ch_5").click(DisableQ20Bch);
             /* For the Step 4  of Algorithm I am define the  Onchange function  */
             /* Please Refer Algorithm*/
             //Calling the Function 

             ShowDiv();




            $("#<%=Q19_rb.ClientID%>").change(function () {
                var txtQ19 = $('#<%= Q19_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q19_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" || rbvalue == "8") {
                    txtQ19.removeAttr('disabled');
                    $('#Q19_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q19_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "16") {
                    txtQ19.removeAttr('disabled');
                    $('#Q19_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q19_txtcmmnt]')[0], false);
                }
                else {
                    txtQ19.attr('disabled', true);
                    txtQ19.val('');
                    $('#Q19_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q19_txtcmmnt]')[0], false);

                }
            });


            $("#<%=Q20_rb.ClientID%>").change(function () {
                var textBox20 = $('#<%= Q20_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q20_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" || rbvalue == "8") {
                    textBox20.removeAttr('disabled');
                    $('#Q20_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q20_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "16") {
                    textBox20.removeAttr('disabled');
                    $('#Q20_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q20_txtcmmnt]')[0], false);
                }
                else {
                    textBox20.attr('disabled', true);
                    textBox20.val('');
                    $('#Q20_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q20_txtcmmnt]')[0], false);
                }
            });


            //Q21_rb
            $("#<%=Q21_rb.ClientID%>").change(function () {
                var textBox21 = $('#<%= Q21_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q21_rb.UniqueID%>']:radio:checked").val();
                //Recommendation
                if (rbvalue == "4") {
                    textBox21.removeAttr('disabled');
                    $('#Q21_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], true);
                    ValidatorEnable($('[id$= cv_Q21B_ch]')[0], true);
                    EnabableDependsQ20A();
                }
                    // No
                else if (rbvalue == "8") {
                    DisableDependsQ20A();
                    ValidatorEnable($('[id$= cv_Q21B_ch]')[0], false);
                    ResetQ20A();
                    textBox21.removeAttr('disabled');
                    $('#Q21_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], true);
                }
                    // Does not apply
                else if (rbvalue == "16") {

                    textBox21.removeAttr('disabled');
                    $('#Q21_txtshow').show();
                    ValidatorEnable($('[id$= cv_Q21B_ch]')[0], true);
                    ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], false);
                    EnabableDependsQ20A();
                }

                    //Yes
                else {

                    textBox21.attr('disabled', true);
                    textBox21.val('');
                    $('#Q21_txtshow').hide();
                    ValidatorEnable($('[id$= cv_Q21B_ch]')[0], true);
                    ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], false);
                    EnabableDependsQ20A();
                }
            });
             $("#<%=Q23A_rb.ClientID%>").change(function () {
                 var textBox23A = $('#<%= Q23A_txtcmmnt.ClientID %>');
                   var rbvalue = $("input[name='<%=Q23A_rb.UniqueID%>']:radio:checked").val();
                 if (rbvalue == "4") {
                     EnabableDependsQ22A();
                       textBox23A.removeAttr('disabled');
                       $('#Q23A_txtshow').show();
                       ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], true);
                 }
                 else if (rbvalue == "8")
                 {
                     DisableDependsQ22A();
                     ResetQ22A();
                     textBox23A.removeAttr('disabled');
                     $('#Q23A_txtshow').show();
                     ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], true);
                 }
                 else if (rbvalue == "16") {
                     EnabableDependsQ22A();
                     textBox23A.removeAttr('disabled');
                     $('#Q23A_txtshow').show();
                     ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], false);
                 }
                 else
                 {
                     EnabableDependsQ22A();
                     textBox23A.attr('disabled', true);
                     textBox23A.val('');
                     $('#Q23A_txtshow').hide();
                     ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], false);
                 }
               });



            //Q22A_ click event
            $("#<%=Q22A_rb.ClientID%>").change(function () {
                var textBox22A = $('#<%= Q22A_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q22A_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" ) {
                    EnabableDependsQ21A();
                    textBox22A.removeAttr('disabled');
                    $('#Q22A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "8")
                {
                    DisableDependsQ21A();
                    ResetQ21A();
                    textBox22A.removeAttr('disabled');
                    $('#Q22A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], true);


                }
                else if (rbvalue == "16") {
                    EnabableDependsQ21A();
                    textBox22A.removeAttr('disabled');
                    $('#Q22A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], false);
                }
                else {
                    EnabableDependsQ21A();
                    textBox22A.attr('disabled', true);
                    textBox22A.val('');
                    $('#Q22A_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], false);
                }
            });

            //Q24A Event
            $("#<%=Q24A_rb.ClientID%>").change(function () {
                var textBox24A = $('#<%= Q24A_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q24A_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" || rbvalue == "8") {
                    textBox24A.removeAttr('disabled');
                    $('#Q24A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q24A_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "16") {
                    textBox24A.removeAttr('disabled');
                    $('#Q24A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q24A_txtcmmnt]')[0], false);
                }
                else {
                    textBox24A.attr('disabled', true);
                    textBox24A.val('');
                    $('#Q24A_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q24A_txtcmmnt]')[0], false);
                }
            });


            //Q24B event fucntion
            $("#<%=Q24B_rb.ClientID%>").change(function () {
                var textBox24B = $('#<%= Q24B_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q24B_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" || rbvalue == "8") {
                    textBox24B.removeAttr('disabled');
                    $('#Q24B_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q24B_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "16") {
                    textBox24B.removeAttr('disabled');
                    $('#Q24B_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q24B_txtcmmnt]')[0], false);
                }
                else {
                    textBox24B.attr('disabled', true);
                    textBox24B.val('');
                    $('#Q24B_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q24B_txtcmmnt]')[0], false);
                }
            });


            $("#<%=Q25A_rb.ClientID%>").change(function () {
                var textBox25A = $('#<%=Q25A_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q25A_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" || rbvalue == "8") {
                    textBox25A.removeAttr('disabled');
                    $('#Q25A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q25A_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "16") {
                    textBox25A.removeAttr('disabled');
                    $('#Q25A_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q25A_txtcmmnt]')[0], false);
                }
                else {
                    textBox25A.attr('disabled', true);
                    textBox25A.val('');
                    $('#Q25A_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q25A_txtcmmnt]')[0], false);
                }
            });

            //Q25B event fucntion
            $("#<%=Q25B_rb.ClientID%>").change(function () {
                var textBox25B = $('#<%= Q25B_txtcmmnt.ClientID %>');
                var rbvalue = $("input[name='<%=Q25B_rb.UniqueID%>']:radio:checked").val();
                if (rbvalue == "4" || rbvalue == "8") {
                    textBox25B.removeAttr('disabled');
                    $('#Q25B_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q25B_txtcmmnt]')[0], true);
                }
                else if (rbvalue == "16") {
                    textBox25B.removeAttr('disabled');
                    $('#Q25B_txtshow').show();
                    ValidatorEnable($('[id$=RFV_Q25B_txtcmmnt]')[0], false);
                }
                else {
                    textBox25B.attr('disabled', true);
                    textBox25B.val('');
                    $('#Q25B_txtshow').hide();
                    ValidatorEnable($('[id$=RFV_Q25B_txtcmmnt]')[0], false);
                }
            });
        });


         function DisableDependsQ22A() {
             var rbvalue = $("input[name='<%=Q23A_rb.UniqueID%>']:radio:checked").val();
             if (rbvalue == "8" || rbvalue == undefined)
             {
                 $('#<%=Q23B_ch.ClientID %> input:checkbox').attr('disabled', 'disabled');
                 $('#<%=Q23c_ch.ClientID %> input:checkbox').attr('disabled', 'disabled');
                 ValidatorEnable($('[id$=cv_Q23B_ch]')[0], false);
                 ValidatorEnable($('[id$=rfv_Q23B_ch_txtshow]')[0], false);
                 ValidatorEnable($('[id$=cv_Q23c_ch]')[0], false);
                 ValidatorEnable($('[id$=rfv_Q23_txtcmmnt]')[0], false);
                 $('#Q23B_ch_othertxtshow').hide();
                 $('#Q23C_othrtxtshow').hide();
                 $('#Q23_C_txtcmmnt').val('');
                 $('#Q23B_ch_txtshow').val('');         
             }
         }
         
         function EnabableDependsQ22A()
         {
             var rbvalue = $("input[name='<%=Q23A_rb.UniqueID%>']:radio:checked").val();
             if (rbvalue == "2" || rbvalue == "4" || rbvalue == "16")
             {
                 $('#<%=Q23B_ch.ClientID %> input:checkbox').removeAttr('disabled');
                 ValidatorEnable($('[id$=cv_Q23B_ch]')[0], true);
                 ValidatorEnable($('[id$= rfv_Q23B_ch_txtshow]')[0], true);

                 $('#<%=Q23c_ch.ClientID %> input:checkbox').removeAttr('disabled');
                 ValidatorEnable($('[id$=cv_Q23c_ch]')[0], true);
                 ValidatorEnable($('[id$= rfv_Q23_txtcmmnt]')[0], true);
             }
         }
        
         function ResetQ22A()
         {
             var rbvalue = $("input[name='<%=Q23A_rb.UniqueID%>']:radio:checked").val();
             if (rbvalue == "8" || rbvalue == undefined)
             {
                 $('#<%=Q23B_ch.ClientID %> input:checkbox').attr('checked', false);
                 $('#<%=Q23c_ch.ClientID %> input:checkbox').attr('checked', false);
             }
         }
         function DisableDependsQ21A()
         {
             var rbvalue = $("input[name='<%=Q22A_rb.UniqueID%>']:radio:checked").val();
             var textBox22A = $('#<%= Q22A_txtcmmnt.ClientID %>');
             if (rbvalue == "8" || rbvalue == undefined)
             {
                 $('#<%=Q22B_ch.ClientID %> input:checkbox').attr('disabled', 'disabled');
                 ValidatorEnable($('[id$=cv_Q22B_ch]')[0], false);
                 ValidatorEnable($('[id$= rfv_Q22B_ch_txtcmmnt]')[0], false);
                 $('#Q22B_txtshow').hide();              
             }
         }                
         function EnabableDependsQ21A()
         {
             var rbvalue = $("input[name='<%=Q22A_rb.UniqueID%>']:radio:checked").val();
             if (rbvalue == "2" || rbvalue == "4" || rbvalue == "16")
             { 
                 $('#<%=Q22B_ch.ClientID %> input:checkbox').removeAttr('disabled');
                 ValidatorEnable($('[id$=cv_Q22B_ch]')[0], true);
                 ValidatorEnable($('[id$= rfv_Q22B_ch_txtcmmnt]')[0], true);
             }
         }

         function ResetQ21A()
         {
             var rbvalue = $("input[name='<%=Q22A_rb.UniqueID%>']:radio:checked").val();
             var textBox22A = $('#<%= Q22A_txtcmmnt.ClientID %>');
             if (rbvalue == "8" || rbvalue == undefined)
             {
                 $('#<%=Q22B_ch.ClientID %> input:checkbox').attr('checked', false);
                 textBox22A.val('');
             }
         }

        function DisableDependsQ20A() {
            var rbvalue = $("input[name='<%=Q21_rb.UniqueID%>']:radio:checked").val();
            if (rbvalue == "8" || rbvalue == undefined) {
                $('#<%= Q21B_ch.ClientID %> input:checkbox').attr('disabled', 'disabled');
                $('#<%= Q21C_ch.ClientID %> input:checkbox').attr('disabled', 'disabled');
                $('#Q20_Btxtothershow').hide();
                $('#Q20_Ctxtothershow').hide();
                ValidatorEnable($('[id$=cv_Q21C_ch]')[0], false);
                ValidatorEnable($('[id$=rfv_Q20_othrcmmtns]')[0], false);
            }
        }


        function EnabableDependsQ20A() {
            //Get checked  item selected 
            var rbvalue = $("input[name='<%=Q21_rb.UniqueID%>']:radio:checked").val();
            if (rbvalue == "2" || rbvalue == "4" || rbvalue == "16") {
                $('#<%=Q21B_ch.ClientID %> input:checkbox').removeAttr('disabled');
                $('#<%=Q21C_ch.ClientID %> input:checkbox').removeAttr('disabled');
                ValidatorEnable($('[id$=cv_Q21C_ch]')[0], true);
                ValidatorEnable($('[id$=cv_Q21_ch]')[0], true);
                ValidatorEnable($('[id$=rfv_Q20_othrcmmtns]')[0], true);
            }
        }

        function ResetQ20A() {
            var rbvalue = $("input[name='<%=Q21_rb.UniqueID%>']:radio:checked").val();
            if (rbvalue == "8" || rbvalue == undefined) {
                $('#<%=Q20_COthertxtcmmnt.ClientID%>').val('');
                $('#<%=Q20_Bothrcmmnt.ClientID %>').val('');
                $('#<%=Q21B_ch.ClientID %> input:checkbox').attr('checked', false);
                $('#<%=Q21C_ch.ClientID %> input:checkbox').attr('checked', false);
            }
        }


        function ShowOtherEvent() {
            if ($("#Q21C_ch_4").is(':checked') == true) {
                $('#Q20_Ctxtothershow').show();
            }
            else {
                $('#Q20_Ctxtothershow').hide();
                //ValidatorEnable($('[id$=rfv_Q22B_ch_txtcmmnt]')[0], false);
            }

            if ($("#Q22B_ch_5").is(':checked') == true) {
                $('#Q22B_txtshow').show();

            }
            else {
                $('#Q22B_txtshow').hide();
            }


            if ($("#Q23D_ch_5").is(':checked') == true) {
                $('#Q23D_txtshow').show();
            }
            else {
                $('#Q23D_txtshow').hide();

            }

            if ($("#Q23c_ch_7").is(':checked') == true) {
                $('#Q23C_othrtxtshow').show();
            }
            else {
                $('#Q23C_othrtxtshow').hide();
            }
            if ($("#Q23B_ch_5").is(':checked') == true) {
                $('#Q23B_ch_othertxtshow').show();
            }
            else {
                $('#Q23B_ch_othertxtshow').hide();
            }

            if ($("#Q21B_ch_5").is(':checked') == true) {
                $('#Q20_Btxtothershow').show();
            }
            else {
                $('#Q20_Btxtothershow').hide();

            }

        }
        function ShowDiv() {
            ShowOtherEvent();
            var Q21_rb = $("input[name='<%=Q21_rb.UniqueID%>']:radio:checked").val();
            if (Q21_rb == undefined) {
                ValidatorEnable($('[id$= cv_Q21B_ch]')[0],false);
                DisableDependsQ20A();
                $('#Q21_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], false);
            }
            else if (Q21_rb == "4") {
                ValidatorEnable($('[id$= cv_Q21B_ch]')[0], true);
                EnabableDependsQ20A();
                $('#Q21_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], true);
            }

            else if (Q21_rb == "8") {
                ValidatorEnable($('[id$= cv_Q21B_ch]')[0], false);
                DisableDependsQ20A();
                $('#Q21_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], true);
            }
            else if (Q21_rb == "16") {
                ValidatorEnable($('[id$= cv_Q21B_ch]')[0], true);
                EnabableDependsQ20A();
                $('#Q21_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], false);
            }
            else {
                ValidatorEnable($('[id$= cv_Q21B_ch]')[0], true);
                EnabableDependsQ20A();
                $('#Q21_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q21_txtcmmnt]')[0], false);
            }

            //Q22rb event 
            var Q22A_rb = $("input[name='<%=Q22A_rb.UniqueID%>']:radio:checked").val();
            if (Q22A_rb == undefined)
            {
                DisableDependsQ21A();
                $('#Q22A_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], false);
            }
            if (Q22A_rb == "4") {
                EnabableDependsQ21A();
                $('#Q22A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], true);
            }
            else if (Q22A_rb == "8")
            {
                DisableDependsQ21A();
                $('#Q22A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], true);
            }
            else if (Q22A_rb == "16") {
                EnabableDependsQ21A();
                $('#Q22A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], false);
            }
            else {
                EnabableDependsQ21A();
                $('#Q22A_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q22A_txtcmmnt]')[0], false);
            }
            var Q23A_rb = $("input[name='<%=Q23A_rb.UniqueID%>']:radio:checked").val();


            if (Q23A_rb == "4" || Q23A_rb == "8") {
                $('#Q23A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], true);
            }
            else if (Q23A_rb == "16") {
                $('#Q23A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], false);
            }
            else {
                $('#Q23A_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q23A_txtcmmnt]')[0], false);
            }





            //Q18 rb
            var Q18_rb = $("input[name='<%=Q18_rb.UniqueID%>']:radio:checked").val();
            if (Q18_rb == "4" || Q18_rb == "8") {
                $('#Q18_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q18_txtcmmnt]')[0], true);
            }
            else if (Q18_rb == "16") {
                $('#Q18_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q18_txtcmmnt]')[0], false);
            }
            else {
                $('#Q18_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q18_txtcmmnt]')[0], false);
            }
            //Q19 rb event
            var Q19_rb = $("input[name='<%=Q19_rb.UniqueID%>']:radio:checked").val();

            if (Q19_rb == "4" || Q19_rb == "8") {
                $('#Q19_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q19_txtcmmnt]')[0], true);
            }
            else if (Q19_rb == "16") {
                $('#Q19_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q19_txtcmmnt]')[0], false);
            }
            else {
                $('#Q19_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q19_txtcmmnt]')[0], false);
            }

            var Q20_rb = $("input[name='<%=Q20_rb.UniqueID%>']:radio:checked").val();
            if (Q20_rb == "4" || Q20_rb == "8") {
                $('#Q20_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q20_txtcmmnt]')[0], true);

            }
            else if (Q20_rb == "16") {
                $('#Q20_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q20_txtcmmnt]')[0], false);
            }
            else {
                $('#Q20_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q20_txtcmmnt]')[0], false);
            }
            



            //Q24A_rb
            var Q24A_rb = $("input[name='<%=Q24A_rb.UniqueID%>']:radio:checked").val();
            if (Q24A_rb == "4" || Q24A_rb == "8") {
                $('#Q24A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q24A_txtcmmnt]')[0], true);
            }
            else if (Q24A_rb == "16") {
                $('#Q24A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q24A_txtcmmnt]')[0], false);
            }
            else {
                $('#Q24A_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q24A_txtcmmnt]')[0], false);
            }

            //Q24B_Radio button  
            var Q24B_rb = $("input[name='<%=Q24B_rb.UniqueID%>']:radio:checked").val();
            if (Q24B_rb == "4" || Q24B_rb == "8") {
                $('#Q24B_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q24B_txtcmmnt]')[0], true);
            }
            else if (Q24B_rb == "16") {
                $('#Q24B_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q24B_txtcmmnt]')[0], false);
            }
            else {
                $('#Q24B_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q24B_txtcmmnt]')[0], false);
            }


            var Q25A_rb = $("input[name='<%=Q25A_rb.UniqueID%>']:radio:checked").val();
            if (Q25A_rb == "4" || Q25A_rb == "8") {
                $('#Q25A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q25A_txtcmmnt]')[0], true);
            }
            else if (Q25A_rb == "16") {
                $('#Q25A_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q25A_txtcmmnt]')[0], false);
            }
            else {
                $('#Q25A_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q25A_txtcmmnt]')[0], false);
            }

            var Q25B_rb = $("input[name='<%=Q25B_rb.UniqueID%>']:radio:checked").val();
            if (Q25B_rb == "4" || Q25B_rb == "8") {
                $('#Q25B_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q25B_txtcmmnt]')[0], true);
            }
            else if (Q25B_rb == "16") {
                $('#Q25B_txtshow').show();
                ValidatorEnable($('[id$=RFV_Q25B_txtcmmnt]')[0], false);
            }
            else {
                $('#Q25B_txtshow').hide();
                ValidatorEnable($('[id$=RFV_Q25B_txtcmmnt]')[0], false);
            }

        }

        /* For Algorithm For Other Textboxes Enable From  checkbox list step 3  */
        /* Please Refer Algorithm*/
        function DisableQ20ch() {

            if ($("#Q21C_ch_4").is(':checked') == true) {
                $('#Q20_Ctxtothershow').show();
                ValidatorEnable($('[id$=rfv_Q20_othrcmmtns]')[0], true);
            }
            else {
                $('#Q20_Ctxtothershow').hide();
                $('#Q20_COthertxtcmmnt').val('');
                ValidatorEnable($('[id$=rfv_Q20_othrcmmtns]')[0], false);
            }
        }

        /* For Algorithm For Other Textboxes Enable From  checkbox list step 3  */
        /* Please Refer Algorithm*/

        function DisableQ21bch() {
            if ($("#Q22B_ch_5").is(':checked') == true) {
                $('#Q22B_txtshow').show();
                ValidatorEnable($('[id$=rfv_Q22B_ch_txtcmmnt]')[0], true);
            }
            else {
                $('#Q22B_txtshow').hide();
                $('#Q22B_txtshow_othrcmmnt').val('');
                ValidatorEnable($('[id$=rfv_Q22B_ch_txtcmmnt]')[0], false);
            }
        }

        /* For Algorithm For Other Textboxes Enable From  checkbox list step 3  */
        /* Please Refer Algorithm*/


        function DisableQ22Dch() {
            if ($("#Q23D_ch_5").is(':checked') == true) {
                $('#Q23D_txtshow').show();
                ValidatorEnable($('[id$=rfv_Q23_D_txtcmmnt]')[0], true);
            }
            else {
                $('#Q23D_txtshow').hide();
                $('#Q23D_ch_txtcmmnt').val('');
                ValidatorEnable($('[id$=rfv_Q23_D_txtcmmnt]')[0], false);
            }

        }


        /* For Algorithm For Other Textboxes Enable From  checkbox list step 3  */
        /* Please Refer Algorithm*/
        function DisableQ22Cch() {
            if ($("#Q23c_ch_7").is(':checked') == true) {
                $('#Q23C_othrtxtshow').show();
                ValidatorEnable($('[id$=rfv_Q23_txtcmmnt]')[0], true);
            }
            else {
                $('#Q23C_othrtxtshow').hide();
                $('#Q23_C_txtcmmnt').val('');
                ValidatorEnable($('[id$=rfv_Q23_txtcmmnt]')[0], false);
            }
        }


        function DisableQ20Bch() {

            if ($("#Q21B_ch_5").is(':checked') == true) {
                $('#Q20_Btxtothershow').show();
                ValidatorEnable($('[id$=rfv_Q20Bothrcmmtnt]')[0], true);
            }
            else {
                $('#Q20_Btxtothershow').hide();
                $('#Q20_Bothrcmmnt').val('');
                ValidatorEnable($('[id$=rfv_Q20Bothrcmmtnt]')[0], false);
            }
        }


        /* For Algorithm For Other Textboxes Enable From  checkbox list step 3  */
        /* Please Refer Algorithm*/
        function DisableQ22Bch() {
            if ($("#Q23B_ch_5").is(':checked') == true) {
                $('#Q23B_ch_othertxtshow').show();
                ValidatorEnable($('[id$=rfv_Q23B_ch_txtshow]')[0], true);
            }
            else {
                $('#Q23B_ch_othertxtshow').hide();
                $('#Q23B_ch_txtshow').val('');
                ValidatorEnable($('[id$=rfv_Q23B_ch_txtshow]')[0], false);
            }
        }

        //DisableFor other Textboxes Validtions when page is loaded first time 

        //validation for checkbox list  customervalidation
        function CheckOne(sender, args) {
            var chkControlId = sender.id.replace("cv_", "");
            var options = document.getElementById(chkControlId).getElementsByTagName('input');
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
            }
        }
     </script>


    <title>
     Onsite Page 3 
    
    </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     <asp:Panel ID="pnl_astro_page3" runat="server">
        <asp:HiddenField ID="HiddenAstroPage3" runat="server" />
        <asp:ValidationSummary ID="valSummary" ForeColor="Red" ValidationGroup="req"
            DisplayMode="List" runat="server" ShowSummary="true"
            ShowMessageBox="false" ClientIDMode="Static" />


        <div style="height: 10px;"></div>
        <div class="insideForms tabletdpad">

            <table>
                <colgroup>
                    <col style="width: 2%" />
                    <col style="width: 55%" />
                    <col style="width: 43%" />
                </colgroup>
                <tr class="tableVertical">
                    <td colspan="3">
                        <h4>Portal Imaging</h4>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td>17.</td>
                    <td>Is there a policy for obtaining patient imaging?
                           <asp:RequiredFieldValidator ID="RFV_Q18_rb" runat="server" ControlToValidate="Q18_rb"
                               ErrorMessage="Q17.is not selected" ForeColor="Red" ValidationGroup="req" ClientIDMode="Static">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q18_rb" runat="server" RepeatDirection="Horizontal" Width="400px" Height="19px">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
                <tr class="tableVertical">
                    <td>18.</td>
                    <td>Do you have a policy for shift changes?
                    <asp:RequiredFieldValidator ID="RFV_Q19_rb" runat="server" ControlToValidate="Q19_rb"
                        ErrorMessage="Q18. is not selected" ForeColor="Red" Text="*" ValidationGroup="req"
                        ClientIDMode="Static"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q19_rb" runat="server" RepeatDirection="Horizontal" Width="400px" Height="19px">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q19_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments:
                                                     <asp:RequiredFieldValidator ID="RFV_Q19_txtcmmnt" runat="server" ControlToValidate="Q19_txtcmmnt" ErrorMessage="Please Enter the Q18 Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q19_txtcmmnt" runat="Server" TextMode="MultiLine"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>                <tr><td colspan="3"> <h4>Portal Imaging Section Comments :</h4></td></tr> 

                <tr>  <td colspan="3" class="mdcommenttxt">                          
                                 <asp:TextBox  id="txt_PortalImangSectioncmmnts" runat="server"  textmode="MultiLine" rows="3" width="100%"></asp:TextBox>
                                 </td>
                     
                               
                            </tr>
                <tr class="tableVertical">
                    <td colspan="3">
                        <h4>Follow Up Policy</h4>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td>19.</td>
                    <td>Do you perform or receive documentation of patient follow up care?
                    <asp:RequiredFieldValidator ID="RFV_Q20_rb" runat="server"
                        ClientIDMode="Static" ControlToValidate="Q20_rb"
                        ErrorMessage="Q19 is not selected" ForeColor="Red" Text="*"
                        ValidationGroup="req"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q20_rb" runat="server" RepeatDirection="Horizontal" Width="400px" Height="19px">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q20_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments:
                                        <asp:RequiredFieldValidator ID="RFV_Q20_txtcmmnt" runat="server" ControlToValidate="Q20_txtcmmnt" ErrorMessage="Please Enter the Q19 Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q20_txtcmmnt" runat="server" TextMode="MultiLine"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr><td colspan="3"><h4> Follow Up Policy Section Comments:</h4></td></tr>

                  <tr>  <td colspan="3" class="mdcommenttxt"> 
                                 <asp:TextBox  id="txt_FolUpPolSectComments" runat="server"  textmode="MultiLine" rows="3" width="100%"></asp:TextBox>
                                 </td>
                            </tr>


                <tr class="tableVertical">

                    <td colspan="3">
                        <h4>QA Activities</h4>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td>20.</td>
                    <td>A.&nbsp;Do you have chart rounds?
                    <asp:RequiredFieldValidator ID="RFV_Q21_rb" runat="server"
                        ClientIDMode="Static" ControlToValidate="Q21_rb"
                        ErrorMessage="Q20 A is not selected" ForeColor="Red" Text="*"
                        ValidationGroup="req"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q21_rb" runat="server" RepeatDirection="Horizontal" Width="400px" Height="19px">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q21_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments: 
                                        <asp:RequiredFieldValidator ID="RFV_Q21_txtcmmnt" runat="server" ControlToValidate="Q21_txtcmmnt" ErrorMessage="Please Enter the Q20 A Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q21_txtcmmnt" runat="server" TextMode="MultiLine"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>




                <tr class="tableVertical">
                    <td></td>
                    <td>B.&nbsp;Who attends chart rounds?
                     <asp:CustomValidator ID="cv_Q21B_ch" runat="server" ClientValidationFunction="CheckOne" ErrorMessage="Please Select atleast One Q20 B. Who attends chart rounds" ForeColor="Red" Text="*" ValidationGroup="req">             
                    </asp:CustomValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="Q21B_ch" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" Width="550px">
                                        <asp:ListItem Value="0"> Radiation Oncologist</asp:ListItem>
                                        <asp:ListItem Value="1"> Medical Physicist</asp:ListItem>
                                        <asp:ListItem Value="2"> Radiation Therapist</asp:ListItem>
                                        <asp:ListItem Value="3"> Dosimetrist</asp:ListItem>
                                        <asp:ListItem Value="4"> Nurse</asp:ListItem>
                                        <asp:ListItem Value="5">Other</asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr id="Q20_Btxtothershow">
                                <td>
                                    <asp:TextBox id="Q20_Bothrcmmnt" runat="server" TextMode="MultiLine"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfv_Q20Bothrcmmtnt" runat="server" ControlToValidate="Q20_Bothrcmmnt" ErrorMessage="Please Enter the  Q20 B other comments" SetFocusOnError="true" Text="*" ValidationGroup="req" ForeColor="Red" ClientIDMode="Static"></asp:RequiredFieldValidator>
                               
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>



                <tr class="tableVertical">
                    <td></td>
                    <td>C.&nbsp;What is presented at chart rounds ?
                     <asp:CustomValidator ID="cv_Q21C_ch" runat="server" ClientValidationFunction="CheckOne" ErrorMessage="Please Select atleast one Q20C. What is presented at chart rounds " ForeColor="Red" Text="*" ValidationGroup="req">             
                     </asp:CustomValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="Q21C_ch" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" Width="550px">
                                        <asp:ListItem Value="0"> Consultation patients (not treated)</asp:ListItem>
                                        <asp:ListItem Value="1">New Starts</asp:ListItem>
                                        <asp:ListItem Value="2">Boost or conedowns</asp:ListItem>
                                        <asp:ListItem Value="3"> Patients on treatment</asp:ListItem>
                                        <asp:ListItem Value="4"> Other</asp:ListItem>
                                    </asp:CheckBoxList></td>
                            </tr>
                             <tr id="Q20_Ctxtothershow">
                                <td>
                                    <asp:TextBox ID="Q20_COthertxtcmmnt" runat="server" textmode="multiline"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rfv_Q20_othrcmmtns" runat="server" ControlToValidate="Q20_COthertxtcmmnt" ErrorMessage="Please Enter the  Q20 C other comments" SetFocusOnError="true" Text="*" ValidationGroup="req" ForeColor="Red" ClientIDMode="Static"></asp:RequiredFieldValidator>
                               
                                </td>
                           </tr>

                       </table>
                    </td>
                     
                </tr>


                <tr class="tableVertical">
                    <td>21</td>
                    <td>A.&nbsp;Do you have periodic Quality Assurance (QA) &nbsp;  &nbsp;&nbsp;&nbsp;or Continous Quality Improvement (CQI) meetings
         <asp:RequiredFieldValidator ID="RFV_Q22A_rb" ErrorMessage="Q21 A.is not selected" Text="*"
             ForeColor="Red" runat="server" ControlToValidate="Q22A_rb"
             ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q22A_rb" runat="server" RepeatDirection="Horizontal" Width="400px"
                                        ClientIDMode="Static">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q22A_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments:
                                        <asp:RequiredFieldValidator ID="RFV_Q22A_txtcmmnt" runat="server" ControlToValidate="Q22A_txtcmmnt" ErrorMessage="Please Enter the Q21 A Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>

                                    <asp:TextBox ID="Q22A_txtcmmnt" runat="server" TextMode="multiline" ></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>



                <tr class="tableVertical">
                    <td></td>
                    <td>B.&nbsp;Who attends these meetings?
                    <asp:CustomValidator ID="cv_Q22B_ch" runat="server" ClientValidationFunction="CheckOne" ErrorMessage="Please Select atleast one Q21 B. Who attends these meetings" ForeColor="Red" Text="*" ValidationGroup="req">             
                    </asp:CustomValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="Q22B_ch" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" Width="600px">
                                        <asp:ListItem Value="0"> Radiation Oncologist</asp:ListItem>
                                        <asp:ListItem Value="1">Medical Physicist</asp:ListItem>
                                        <asp:ListItem Value="2">Radiation Therapist</asp:ListItem>
                                        <asp:ListItem Value="3">Dosimetrist</asp:ListItem>
                                        <asp:ListItem Value="4">Nurse</asp:ListItem>
                                        <asp:ListItem Value="5">Other</asp:ListItem>
                                    </asp:CheckBoxList></td>
                            </tr>
                             <tr id="Q22B_txtshow">
                                <td>
                                    <asp:TextBox ID="Q22B_txtshow_othrcmmnt" runat="server" textmode="multiline"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_Q22B_ch_txtcmmnt" runat="server" ControlToValidate="Q22B_txtshow_othrcmmnt" ErrorMessage="Please Enter the  Q21 B other comments" SetFocusOnError="true" Text="*" ValidationGroup="req" ForeColor="Red" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td>22.</td>
                    <td> A.&nbsp; Do you have Morbidity and Mortality (M&M) conferences? 
                  <asp:RequiredFieldValidator ID="RFV_Q23A_rb" ErrorMessage="Q22 A. is not selected" Text="*"
                      ForeColor="Red" runat="server" ControlToValidate="Q23A_rb"
                      ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q23A_rb" runat="server" RepeatDirection="Horizontal" Width="400px"
                                        ClientIDMode="Static">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q23A_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments:
                                        <asp:RequiredFieldValidator ID="RFV_Q23A_txtcmmnt" runat="server" ControlToValidate="Q23A_txtcmmnt" ErrorMessage="Please Enter the Q22 A Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q23A_txtcmmnt" runat="server" TextMode="multiline"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>




                <tr class="tableVertical">
                    <td></td>
                    <td>B.&nbsp;Who attends these meetings? 
                    <asp:CustomValidator ID="cv_Q23B_ch" runat="server" ClientValidationFunction="CheckOne" ErrorMessage="Please Select atleast one Q22 B. Who attends these meetings" ForeColor="Red" Text="*" ValidationGroup="req">             
                    </asp:CustomValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="Q23B_ch" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" Width="600px">


                                        <asp:ListItem Value="0"> Radiation Oncologist</asp:ListItem>
                                        <asp:ListItem Value="1"> Medical Physicist</asp:ListItem>
                                        <asp:ListItem Value="2"> Radiation Therapist</asp:ListItem>
                                        <asp:ListItem Value="3"> Dosimetrist</asp:ListItem>
                                        <asp:ListItem Value="4"> Nurse</asp:ListItem>
                                        <asp:ListItem Value="5">Other</asp:ListItem>
                                    </asp:CheckBoxList></td>
                            </tr>
                             <tr id="Q23B_ch_othertxtshow">
                                <td>
                                    <asp:TextBox ID="Q23B_ch_txtshow" runat="server" textmode="multiline"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_Q23B_ch_txtshow" runat="server" ControlToValidate="Q23B_ch_txtshow" ErrorMessage="Please Enter the  Q22 B other comments" SetFocusOnError="true" Text="*" ValidationGroup="req" ForeColor="Red" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>




                <tr class="tableVertical">
                    <td></td>
                    <td>C.&nbsp;Please describe the screening criteria to capture the patients for M&M:  
                      <asp:CustomValidator ID="cv_Q23c_ch" runat="server" ClientValidationFunction="CheckOne" ErrorMessage="Please Select at least one Q22C. describe the screening criteria to capture the patients for M&M" ForeColor="Red" Text="*" ValidationGroup="req">             
                      </asp:CustomValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="Q23c_ch" runat="Server" RepeatDirection="Vertical" RepeatColumns="1" Width="600px">
                                        <asp:ListItem Value="0">Any interrupted treatment</asp:ListItem>
                                        <asp:ListItem Value="1">Any death during treatment or within 2 weeks of treatment completion</asp:ListItem>
                                        <asp:ListItem Value="2">Any hospital admission during treatment or within 2 weeks of treatment completion</asp:ListItem>
                                        <asp:ListItem Value="3">Any weight loss of 10% or more</asp:ListItem>
                                        <asp:ListItem Value="4">Wrong patient</asp:ListItem>
                                        <asp:ListItem Value="5">Any wrong site/volume/dose</asp:ListItem>
                                        <asp:ListItem Value="6">Any significant acute or late complications</asp:ListItem>
                                        <asp:ListItem Value="7">Other</asp:ListItem>
                                    </asp:CheckBoxList></td>
                            </tr>
                           <tr id="Q23C_othrtxtshow">
                                <td>
                                    <asp:TextBox ID="Q23_C_txtcmmnt" runat="server" textmode="multiline"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_Q23_txtcmmnt" runat="server" ControlToValidate="Q23_C_txtcmmnt" ErrorMessage="Please Enter the  Q22 C other comments" SetFocusOnError="true" Text="*" ValidationGroup="req" ForeColor="Red" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr class="tableVertical">
                    <td></td>
                    <td>D.&nbsp;Who screens for these criteria?
                           <asp:CustomValidator ID="cv_Q23D_ch" runat="server" ClientValidationFunction="CheckOne" ErrorMessage="Please Select at least one Q22 D.  describe the screening criteria to capture the patients for M&M" ForeColor="Red" Text="*" ValidationGroup="req">             
                      </asp:CustomValidator>
                    </td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="Q23D_ch" runat="Server" RepeatDirection="Horizontal" RepeatColumns="2" Width="600px">
                                        <asp:ListItem Value="0">  Radiation Oncologist</asp:ListItem>
                                        <asp:ListItem Value="1">Medical Physicist</asp:ListItem>
                                        <asp:ListItem Value="2">Radiation Therapist</asp:ListItem>
                                        <asp:ListItem Value="3">Dosimetrist</asp:ListItem>
                                        <asp:ListItem Value="4">Nurse</asp:ListItem>
                                        <asp:ListItem Value="5">Other</asp:ListItem>
                                    </asp:CheckBoxList></td>
                            </tr>
                            <tr id="Q23D_txtshow">
                                <td>
                                    <asp:TextBox ID="Q23D_ch_txtcmmnt" runat="server" textmode="multiline"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_Q23_D_txtcmmnt" runat="server" ControlToValidate="Q23D_ch_txtcmmnt" ErrorMessage="Please Enter the  Q22 D other comments" SetFocusOnError="true" Text="*" ValidationGroup="req" ForeColor="Red" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td>23.</td>
                    <td>A.&nbsp;Do you perform Facility Qualtiy Improvement (FQI or Focus Studies)?
                       <asp:RequiredFieldValidator ID="RFV_Q24A_rb" ErrorMessage="Q23A.is not selected" Text="*"
                           ForeColor="Red" runat="server" ControlToValidate="Q24A_rb"
                           ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q24A_rb" runat="Server" RepeatDirection="Horizontal" Width="400px"
                                        ClientIDMode="Static">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q24A_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments:
                                          <asp:RequiredFieldValidator ID="RFV_Q24A_txtcmmnt" runat="server" ControlToValidate="Q24A_txtcmmnt" ErrorMessage="Please Enter the Q23 A Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>

                                    </span>
                                    <asp:TextBox ID="Q24A_txtcmmnt" runat="server" TextMode="multiline"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td></td>
                    <td>B.&nbsp;Verified by surveyor

                        <asp:RequiredFieldValidator ID="RFV_Q24B_rb" runat="server"
                            ClientIDMode="Static" ControlToValidate="Q24B_rb"
                            ErrorMessage="Q23 B. is not selected" ForeColor="Red" Text="*"
                            ValidationGroup="req"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q24B_rb" runat="Server" RepeatDirection="Horizontal" Width="400px"
                                        ClientIDMode="Static">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q24B_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments: 
                                        <asp:RequiredFieldValidator ID="RFV_Q24B_txtcmmnt" runat="server" ControlToValidate="Q24B_txtcmmnt" ErrorMessage="Please Enter the Q23 B Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q24B_txtcmmnt" runat="server" TextMode="multiline"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                <tr class="tableVertical">
                    <td>24.</td>
                    <td>A.&nbsp;Do you perform outcome studies? 
                        <asp:RequiredFieldValidator ID="RFV_Q25A_rb" runat="server"
                            ClientIDMode="Static" ControlToValidate="Q25A_rb"
                            ErrorMessage="Q24 A. is not selected" ForeColor="Red" Text="*"
                            ValidationGroup="req"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q25A_rb" runat="Server" RepeatDirection="Horizontal" Width="400px"
                                        ClientIDMode="Static">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q25A_txtshow">
                                <td>
                                    <span class="mdcommenttxt">Comments:
                                   
                    <asp:RequiredFieldValidator ID="RFV_Q25A_txtcmmnt" runat="server" ControlToValidate="Q25A_txtcmmnt" ErrorMessage="Please Enter the Q24 A Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q25A_txtcmmnt" runat="server" TextMode="multiline"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="tableVertical">
                    <td></td>
                    <td>B.&nbsp;Verified by surveyor
                    <asp:RequiredFieldValidator ID="RFV_Q25B_rb" runat="server"
                        ClientIDMode="Static" ControlToValidate="Q25B_rb"
                        ErrorMessage="Q24 B. is not selected" ForeColor="Red" Text="*"
                        ValidationGroup="req"></asp:RequiredFieldValidator></td>
                    <td>
                        <table class="MDtxtarawdth">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="Q25B_rb" runat="Server" RepeatDirection="Horizontal" Width="400px"
                                        ClientIDMode="Static">
                                        <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Recommendation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Does not apply" Value="16"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr id="Q25B_txtshow">


                                <td>
                                    <span class="mdcommenttxt">Comments:
                                        <asp:RequiredFieldValidator ID="RFV_Q25B_txtcmmnt" runat="server" ControlToValidate="Q25B_txtcmmnt" ErrorMessage="Please Enter the Q24 B Comments" ForeColor="Red" Text="*" ValidationGroup="req" ClientIDMode="Static"></asp:RequiredFieldValidator>
                                    </span>
                                    <asp:TextBox ID="Q25B_txtcmmnt" runat="server" TextMode="multiline"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>


                 <tr>
                                <td colspan="3"><h4>QA ActivitiesSection Comments: </h4></td>
                     </tr>
                <tr>  <td colspan="3" class="mdcommenttxt"> 
                                 <asp:TextBox  id="txt_QAActivitieSectComments" runat="server"  textmode="MultiLine" rows="3" width="100%"></asp:TextBox>
                                 </td>
                            </tr>


            </table>

        </div>



    </asp:Panel>
    </div>
    </form>
</body>
</html>
