<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form01.aspx.cs" Inherits="KPI01.form01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>form1</title>
    <style>
        .smalltextbox {
            width: 60px;
            text-align: right;
            font-size: smaller;
            height: 50px;
        }


        .text-wrap-x {
            word-wrap: break-word;
            white-space: normal; /* ทำให้ข้อความสามารถแสดงผลเป็นหลายบรรทัดได้ */
        }

        .gridview-striped tbody tr:nth-child(even) {
            background-color: LightGray;
        }

        .gridview-striped tbody tr:nth-child(odd) {
            background-color: White;
        }
    </style>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="p-3">

    <form id="form1" runat="server">
        <div>

            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>

            <div>
                <div class="d-flex">
                    <div>
                        <b>ปี</b>
                        <asp:DropDownList runat="server" ID="ddlYear" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Width="100px"></asp:DropDownList>
                    </div>
                    <div>
                        <b>เลือกประเภทของกิจกรรม</b>
                        <asp:DropDownList runat="server" ID="ddlGenre" OnSelectedIndexChanged="ddlGenre_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                            <asp:ListItem>เลือกทุกประเภท</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br />
            <div class="d-flex justify-content-between">
                <b>สรุปประสิทธิภาพการปฏิบัติงาน แยกตามกิจกรรม/ กระบวนการ</b>
                <div class="d-flex">
                    <b>ประจำเดือน</b>
                    <asp:DropDownList runat="server" ID="ddlMonth" CssClass="" Width="100px"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="true" Font-Size="Small" OnRowDataBound="GridView1_RowDataBound"
                CssClass="table table-bordered gridview-striped">
                <Columns>

                    <asp:TemplateField HeaderText="ฝ่าย/แผนก">
                        <ItemTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("section") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="ลำดับ">
                        <ItemTemplate>
                            <%--  <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>--%>
                            <asp:Label ID="lblNo" runat="server" Text='<%# Eval("no") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="กิจกรรม">
                        <ItemTemplate>
                            <asp:Label ID="lblActivities" runat="server" Text='<%# Eval("activities") %>' Width="200px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="รายละเอียดการคำนวณ">
                        <ItemTemplate>
                            <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("desc") %>' Width="150px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="แหล่งข้อมูล" ItemStyle-Wrap="true">
                        <ItemTemplate>
                            <asp:Label ID="lblsouce" runat="server" Text='<%# Eval("souce") %>' CssClass="text-wrap-x" Width="80px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="เป้าหมาย ปีที่แล้ว" HeaderStyle-Wrap="true" ControlStyle-CssClass="smalltextbox" HeaderStyle-Width="60px"
                        ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%--Text='<%# String.Format("{0:N0}", Eval("Beforetarget")) %>'--%>
                            <asp:Label ID="lblBeforetarget" runat="server" Text='<%# string.Format("{0:N0}", Eval("Beforetarget")) %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="เป้าหมาย ปีปัจจุบัน" HeaderStyle-Wrap="true" ControlStyle-CssClass="smalltextbox" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCurrentTarget" runat="server" Text='<%# string.Format("{0:N0}", Eval("currenttarget")) %>' Width="60px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="m01">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM01" runat="server" CssClass="smalltextbox" Text='<%# Eval("m01") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="m02">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM02" runat="server" CssClass="smalltextbox" Text='<%# Eval("m02") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m03">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM03" runat="server" CssClass="smalltextbox" Text='<%# Eval("m03") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m04">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM04" runat="server" CssClass="smalltextbox" Text='<%# Eval("m04") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="m05">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM05" runat="server" CssClass="smalltextbox" Text='<%# Eval("m05") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m06">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM06" runat="server" CssClass="smalltextbox" Text='<%# Eval("m06") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m07">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM07" runat="server" CssClass="smalltextbox" Text='<%# Eval("m07") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="m08">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM08" runat="server" CssClass="smalltextbox" Text='<%# Eval("m08") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m09">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM09" runat="server" CssClass="smalltextbox" Text='<%# Eval("m09") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m10">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM10" runat="server" CssClass="smalltextbox" Text='<%# Eval("m10") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="m11">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM11" runat="server" CssClass="smalltextbox" Text='<%# Eval("m11") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="m12">
                        <ItemTemplate>
                            <asp:TextBox ID="txtM12" runat="server" CssClass="smalltextbox" Text='<%# Eval("m12") %>' TextMode="Number"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="รวม" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="lbltotal" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="เฉลี่ย" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="lblAverage" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
