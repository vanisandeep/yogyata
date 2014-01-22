%@ Control Language="VB" AutoEventWireup="false" CodeFile="JqueryLimitedCharacters.ascx.vb" Inherits="JqueryLimitedCharacters" %>
<link href="Styles/Site.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var limit = 3;
        $('textarea[id$=సంमहमசெவ்வாસસನಾਸੈE1]').keyup(function () {
            var len = $(this).val().length;
            if (len > limit) {
                this.value = this.value.substring(0, limit);
            }
            $('#charLeft').text(limit - len + " characters left");
        });

        var $td1 = $('textarea[id$=tసంमहमசெவ்வாસસನಾਸੈE1]');
        $td1.keydown(function () {
            var len = $(this).val().length;
            if (len > limit) {
                alert('You have exceded max limit');
            }
        });

    });
</script>
<div>
<asp:TextBox ID="సంमहमசெவ்வாસસನಾਸੈE1" runat="server" TextMode="MultiLine"/><br />
<span id="charLeft"></span>
<asp:TextBox ID="tసంमहमசெவ்வாસસನಾਸੈE1" runat="server" TextMode="MultiLine"/><br />

</div>
