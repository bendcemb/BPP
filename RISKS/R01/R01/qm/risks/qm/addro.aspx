<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addro.aspx.cs" Inherits="R01.qm.risks.qm.addro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .verticalHeader th {
            writing-mode: vertical-rl;
            transform: rotate(180deg);
            white-space: nowrap;
        }
    </style>
    <style>
        .x-newline {
            white-space: pre-line;
        }
    </style>


    <h4>บันทึกความเสี่ยงและโอกาส</h4>
    <div>
        <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="item" HeaderText="ลำดับ" />
                <asp:BoundField DataField="pinput" HeaderText="ข้อมูลนำเข้ากระบวนการ (INPUT)" />
                <asp:BoundField DataField="pprocess" HeaderText="กระบวนการ" ItemStyle-CssClass="x-newline" />
                <asp:BoundField DataField="poutput" HeaderText="ข้อมูลที่ได้จากกระบวนการ (OUTPUT)" />
                <asp:BoundField DataField="pcontext" HeaderText="บริบท(4.1)" ItemStyle-CssClass="x-newline" />
                <asp:BoundField DataField="pconcern" HeaderText="ผู้มีส่วนได้ส่วนเสีย(4.2)" />
                <asp:BoundField DataField="prequirement" HeaderText="สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย" />
            </Columns>
        </asp:GridView>

        <asp:GridView runat="server" ID="grv2" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="ctitem" HeaderText="รหัส" />
                <asp:BoundField DataField="cttype" HeaderText="I/E" />
                <asp:BoundField DataField="ctissue" HeaderText="ปัจจัยที่มีผลต่อองค์กร" />
                <asp:BoundField DataField="ctrisk" HeaderText="ลักษณะความเสี่ยง" />
                <asp:BoundField DataField="ctopportunity" HeaderText="ลักษณะโอกาส" />
                <asp:BoundField DataField="ctconcern" HeaderText="ผู้เกี่ยวข้อง" />

            </Columns>
        </asp:GridView>

        <asp:GridView runat="server" ID="grv3" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small">
            <Columns>

                <asp:BoundField DataField="roitem" HeaderText="ลำดับ" />
                <asp:BoundField DataField="rocontext" HeaderText="บริบท(4.1)" />
                <asp:BoundField DataField="ro" HeaderText="" />
                <asp:BoundField DataField="rodesc" HeaderText="ความเสี่ยง/โอกาส" />
                <asp:BoundField DataField="roimpact" HeaderText="ผลกระทบ" />
                <asp:BoundField DataField="roimpactvalue" HeaderText="S" />
                <asp:BoundField DataField="rocause" HeaderText="สาเหตุ" />
                <asp:BoundField DataField="rooppvalue" HeaderText="O" />
                <asp:BoundField DataField="rocorrection" HeaderText="มาตรการป้องกัน" />
                <asp:BoundField DataField="rodetect" HeaderText="มาตรการตรวจสอบ" />
                <asp:BoundField DataField="rodetectvalue" HeaderText="D" />
                <asp:BoundField DataField="score" HeaderText="SCORE" HeaderStyle-CssClass="verticalHeader" />
                <asp:BoundField DataField="ropriorityitem" HeaderText="R A N K" DataFormatString="" HeaderStyle-CssClass="verticalHeader" />
                <asp:BoundField DataField="romanage" HeaderText="ข้อเสนอแนะในการจัดการ" />
                <asp:BoundField DataField="roincharge" HeaderText="ผู้รับผิดชอบ/กำหนดเสร็จ" />
                <asp:BoundField DataField="roaction" HeaderText="การดำเนินการที่ได้ทำไปแล้ว" />
                <asp:BoundField DataField="actimpactvalue" HeaderText="S" />
                <asp:BoundField DataField="actoppvalue" HeaderText="O" />
                <asp:BoundField DataField="actdetecvalue" HeaderText="D" />
                <asp:BoundField DataField="R" HeaderText="R" />

                <asp:TemplateField HeaderText="" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:HyperLink ID="hplEdit" Font-Underline="false" runat="server" Text="แก้ไข"
                            NavigateUrl="~/qm/risks/qm/editrisk.aspx" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <div class="card bg-success bg-opacity-10">
        <div class="card-header">
            เพิ่มความเสี่ยง
        </div>
        <div class="card-body">
            <%--row1--%>
            <div class="d-flex justify-content-between">
                <div class="row col-1">
                    <label>
                        ลำดับ
                    </label>
                    <asp:TextBox runat="server" ID="txtroitem" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="row col-3">
                    <label>
                        (R)isk/(O)pportunity
                    </label>
                    <asp:DropDownList runat="server" ID="ddlRO" CssClass="form-control" onchange="showDropDown()">
                        <asp:ListItem Value="R">ความเสียง(R)</asp:ListItem>
                        <asp:ListItem Value="O">โอกาส(O)</asp:ListItem>

                    </asp:DropDownList>
                </div>

                <div class="row col-6">
                    <label>
                        บริบท(4.1)
                    </label>
                    <asp:DropDownList runat="server" ID="ddlContext" CssClass="form-control">
                    </asp:DropDownList>

                </div>
                <div class="row col-1">
                    <label>
                        RANK
                    </label>
                    <asp:TextBox runat="server" ID="txtRank" CssClass="form-control"></asp:TextBox>
                </div>
               <%-- <div class="row col-1">
                    <label class="text-center">
                        แจ้งลบ
                    </label>
                    <asp:CheckBox runat="server" />
                </div>--%>
            </div>
            <%--row2--%>
            <div>
                <div class="d-flex justify-content-between">
                    <div class="row col-4">
                        <label>
                            รายละเอียดความเสี่ยงหรือโอกาส
                        </label>
                        <asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="row  col-4">
                        <label>
                            ผลกระทบ
                        </label>
                        <asp:TextBox runat="server" ID="TextBox5" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="row  col-4">
                        <label>
                            สาเหตุ
                        </label>
                        <asp:TextBox runat="server" ID="TextBox6" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>
            <%--row3--%>
            <div class="d-flex justify-content-between ">
                <div class="row w-50">
                    <label>
                        มาตรการป้องกัน ณ ปัจจุบัน
                    </label>
                    <asp:TextBox runat="server" ID="txtxcxcx" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row w-50">
                    <label>
                        มาตรการในการตรวจสอบ ณ ปัจจุบัน
                    </label>
                    <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <%--row4--%>
            <div class="d-flex justify-content-between">
                <div class="row  col-4">
                    <label>
                        ข้อเสนอแนะในการจัดการ
                    </label>
                    <asp:TextBox runat="server" ID="txt1" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="row  col-4">
                    <label>
                        ผู้รับผิดชอบ/กำหนดเสร็จ
                    </label>
                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="row  col-4">
                    <label>
                        การดำเนินการที่ได้ทำไปแล้ว
                    </label>
                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <%--row5--%>
            <div class="mt-3">
                <table class="table table-bordered table-secondary">
                    <thead>
                        <%--         <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th class="text-center"></th>
                            <th class="text-center">คะแนน หลังแก้ไข</th>
                        </tr>--%>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="">
                                <label>1</label>
                            </td>

                            <td class="">
                                <label>ระดับความรุนแรง</label>
                            </td>

                            <td>
                                <div class="row ms-2 me-2">
                                    <asp:DropDownList runat="server" ID="ddlroimpactvalueR" CssClass="form-control" onchange="ddlroimpactvalueRChanged()">
                                        <asp:ListItem Value="5">ไม่สามารถส่งสินค้าได้(5)</asp:ListItem>
                                        <asp:ListItem Value="4">ไม่สามารถผลิตได้(4)</asp:ListItem>
                                        <asp:ListItem Value="3">การผลิตช้าลง(3)</asp:ListItem>
                                        <asp:ListItem Value="2">เกิดของสีย เกิดต้นทุนเพิ่ม(2)</asp:ListItem>
                                        <asp:ListItem Value="1">มีผลกระทบน้อยมาก(1)</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:DropDownList runat="server" ID="ddlroimpactvalueO" CssClass="form-control" onchange="ddlroimpactvalueOChanged()" Style="display: none;">
                                        <asp:ListItem Value="5">สร้างมูลค่าเพิ่มมากกว่า 1 ล้านบาทต่อปี/ไม่มีโอกาสเกิดอุบัติเหตุ/มีชื่อเสียงในวงการ(5)</asp:ListItem>
                                        <asp:ListItem Value="4">สร้างมูลค่าเพิ่มต่ำกว่า 5 แสนบาทต่อปี/มีโอกาสเกิดอุบัติเหตุหากตั้งใจ/มีชื่อเสียงในระดับจังหวัด(4)</asp:ListItem>
                                        <asp:ListItem Value="3">สร้างมูลค่าเพิ่มต่ำกว่า 1 แสนบาทต่อปี/มีโอกาสเกิดอุบัติเหตุแต่ไม่กระทบต่อพนักงาน/มีชื่อเสียงในท้องถิ่น(3)</asp:ListItem>
                                        <asp:ListItem Value="2">สร้างมูลค่าต่ำกว่า 5 หมื่นบาทต่อปี/มีโอกาสเกิดอุบัติเหตุได้ถ้าไม่ระวัง/พนักงานภูมิใจ(2)</asp:ListItem>
                                        <asp:ListItem Value="1">สร้างมูลค่าต่ำกว่า 1 หมื่นบาทต่อปี/มีโอกาสเกิดอุบัติเหตุได้ถ้าไม่ระวัง/พนักงานภูมิใจเล็กน้อย(1)</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </td>



                            <td class="d-flex justify-content-center">
                                <label class="pt-2 pe-2">ความรุนแรงหลังแก้ไข 1-5 (S)</label>
                                <asp:DropDownList runat="server" ID="ddlactimpactvalue" CssClass="form-control" Width="50px">
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>โอกาสเกิด</td>

                            <td>
                                <div class="row ms-2 me-2">
                                    <asp:DropDownList runat="server" ID="ddlrooppvalue" CssClass="form-control" onchange="ddlrooppvalueChanged()">
                                        <asp:ListItem Value="5">สัปดาห์ละครั้งหรือมากกว่า(5)</asp:ListItem>
                                        <asp:ListItem Value="4">สามเดือนครั้ง(4)</asp:ListItem>
                                        <asp:ListItem Value="3">หกเดือนครั้ง(3)</asp:ListItem>
                                        <asp:ListItem Value="2">ปีละครั้ง(2)</asp:ListItem>
                                        <asp:ListItem Value="1">โอกาสน้อยมากเกินปีละครั้ง(1)</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>


                            <td class="d-flex justify-content-center">
                                <label class="pt-2 pe-2">โอกาสเกิดหลังแก้ไข 1-5 (O)</label>
                                <asp:DropDownList runat="server" ID="ddlactoppvalue" CssClass="form-control" Width="50px">
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>การตรวจจับ</td>

                            <td>
                                <div class="row ms-2 me-2">
                                    <asp:DropDownList runat="server" ID="ddlrodetectvalueR" CssClass="form-control" onchange="ddlrodetectvalueRChanged()">
                                        <asp:ListItem Value="5">ไม่ได้ตรวจจับ(5)</asp:ListItem>
                                        <asp:ListItem Value="4">ตรวจจับไม่ได้(4)</asp:ListItem>
                                        <asp:ListItem Value="3">ตรวจจับด้วยด้วยประสาทสัมผัส (ตามที่ระบุในมาตรฐาน)(3)</asp:ListItem>
                                        <asp:ListItem Value="2">มีอุปกรณ์ตรวจจับ(2)</asp:ListItem>
                                        <asp:ListItem Value="1">ตรวจจับอัตโนมัติ(1)</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:DropDownList runat="server" ID="ddlrodetectvalueO" CssClass="form-control" onchange="ddlrodetectvalueOChanged()" Style="display: none;">

                                        <asp:ListItem Value="5">สามารถปฏิบัติได้จริงโดยไม่ต้องลงทุนเพิ่ม(5)</asp:ListItem>
                                        <asp:ListItem Value="4">สามารถปฏิบัติได้จริงโดยลงทุนความคุ้มทุน 1 ปี(4)</asp:ListItem>
                                        <asp:ListItem Value="3">สามารถปฏิบัติได้จริงโดยลงทุนความคุ้มทุน 2 ปี(3)</asp:ListItem>
                                        <asp:ListItem Value="2">สามารถปฏิบัติได้จริงโดยลงทุนความคุ้มทุน 3 ปี(2)</asp:ListItem>
                                        <asp:ListItem Value="1">สามารถปฏิบัติได้จริงแต่ลงทุนความคุ้มทุนมากกว่า 5 ปี(1)</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </td>



                            <td class="d-flex justify-content-center">
                                <label class="pt-2 pe-2">การตรวจจับหลังแก้ไข 1-5 (D)</label>
                                <asp:DropDownList runat="server" ID="ddlactdetecvalue" CssClass="form-control" Width="50px">
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                </asp:DropDownList>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%--button--%>
        <div class="card-footer">       
            <div class="row">
                <asp:Button runat="server" ID="btnSave" Text="บันทึก" CssClass="btn btn-success" />
            </div>
        </div>


        <%--script แสดงตัวเลขตามที่เลือกใน dropdown--%>
        <%-- <script>

            function ddlroimpactvalueChanged() {
                var selectedValue = document.getElementById("<%= ddlroimpactvalue.ClientID %>").value;
                document.getElementById("<%= txtSscore.ClientID %>").value = selectedValue;
            }

            function ddlrooppvalueChanged() {
                var selectedValue = document.getElementById("<%= ddlrooppvalue.ClientID %>").value;
                document.getElementById("<%= txtOscore.ClientID %>").value = selectedValue;
            }


            function ddlrodetectvalueRChanged() {
                var selectedValue = document.getElementById("<%= ddlrodetectvalueR.ClientID %>").value;
                document.getElementById("<%= txtDscore.ClientID %>").value = selectedValue;
            }

            function ddlrodetectvalueOChanged() {
                var selectedValue = document.getElementById("<%= ddlrodetectvalueO.ClientID %>").value;
                 document.getElementById("<%= txtDscore.ClientID %>").value = selectedValue;
             }


        </script>--%>

        <script>
            function showDropDown() {
                var ddl1 = document.getElementById("<%= ddlRO.ClientID %>");
                var ddl2 = document.getElementById("<%= ddlrodetectvalueR.ClientID %>");
                var ddl3 = document.getElementById("<%= ddlrodetectvalueO.ClientID %>");

                if (ddl1.value == "R") {
                    ddl2.style.display = "block";
                    ddl3.style.display = "none";
                } else if (ddl1.value == "O") {
                    ddl2.style.display = "none";
                    ddl3.style.display = "block";
                }


                var ddlroimpactvalueR = document.getElementById("<%= ddlroimpactvalueR.ClientID %>");
                var ddlroimpactvalueO = document.getElementById("<%= ddlroimpactvalueO.ClientID %>");

                if (ddl1.value == "R") {
                    ddlroimpactvalueR.style.display = "block";
                    ddlroimpactvalueO.style.display = "none";
                } else if (ddl1.value == "O") {
                    ddlroimpactvalueR.style.display = "none";
                    ddlroimpactvalueO.style.display = "block";
                }
            }


        </script>

    </div>

</asp:Content>
