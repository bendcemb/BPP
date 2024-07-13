<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="R01.test.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .txtxxx {
            height: 100px;
        }
    </style>

    <div class="">
        <h1 style="color: orangered">TEST</h1>
    </div>


    <asp:TextBox runat="server" ID="txtContext" CssClass="form-control txtxxx" TextMode="MultiLine" Font-Size="Small"></asp:TextBox>


    <asp:Button runat="server" ID="btnOpen" OnClientClick="toggleContext(); return false;" Text="เปิดบริบท" />

    <div id="xcontext" class="card bg-primary bg-opacity-10" style="display: block;">
        <div class="card-body">

            <%--<asp:CheckBoxList runat="server" ID="cblx" RepeatColumns="4" Font-Size="Small" AutoPostBack="true" OnSelectedIndexChanged="cblx_SelectedIndexChanged"></asp:CheckBoxList>--%>
            <asp:CheckBoxList runat="server" ID="cblx" RepeatColumns="4" Font-Size="Small"></asp:CheckBoxList>


        </div>
        <div class="card-footer">
            <asp:Button runat="server" ID="btnSaveContext" CssClass="btn btn-success" Text="บันทึก บริบท" OnClientClick="CloseContext(); return false;" />
        </div>
    </div>


    <asp:Label runat="server" ID="lblPhone"></asp:Label>

    <script type="text/javascript">
        function moveToNext(current, next) {
            var maxLength = parseInt(current.getAttribute('maxlength'));
            if (current.value.length === maxLength) {
                document.getElementById(next).focus();
            }
        }

        function allowOnlyNumbers(event) {
            // คำสั่งเพื่อให้รับเฉพาะตัวเลข
            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                event.preventDefault();
            }
        }
    </script>

    <div class="row py-3">
        <div>
            <label>เบอร์โทร :</label>
        </div>
        <div class="row">
            <input type="tel" id="txt1" maxlength="1" onkeyup="moveToNext(this, 'txt2')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt2" maxlength="1" onkeyup="moveToNext(this, 'txt3')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt3" maxlength="1" onkeyup="moveToNext(this, 'txt4')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt4" maxlength="1" onkeyup="moveToNext(this, 'txt5')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt5" maxlength="1" onkeyup="moveToNext(this, 'txt6')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt6" maxlength="1" onkeyup="moveToNext(this, 'txt7')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt7" maxlength="1" onkeyup="moveToNext(this, 'txt8')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt8" maxlength="1" onkeyup="moveToNext(this, 'txt9')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt9" maxlength="1" onkeyup="moveToNext(this, 'txt10')" onkeypress="allowOnlyNumbers(event)" style="width: 40px;" class="form-control" />
            <input type="tel" id="txt10" maxlength="1" style="width: 40px;" class="form-control" />
        </div>
    </div>

    <script>
        function toggleContext() {
            document.getElementById('xcontext').style.display = 'block';
        }

        function CloseContext() {
            document.getElementById('xcontext').style.display = 'none';
        }

    </script>

    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    <div class="card">
        <div class="card-header">
            xxxxxxxxxxxxxx
        </div>
        <div class="card-body">
            <div class="row gap-2">

                <div class="row col-1">
                    <label>ลำดับ</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row col-11">
                    <label>กระบวนการ</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row col-6">
                    <label>Input</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row col-6">
                    <label>Output</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row col-6">
                    <label>บริบท(4.1)</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row col-6">
                    <label>ผู้มีส่วนได้ส่วนเสีย(4.2)</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                
                <div class="row">
                    <label>สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย</label>
                    <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                </div>


            </div>
        </div>
        <div class="card-footer">
            xxxxxxxxxxxx
        </div>
    </div>


</asp:Content>
