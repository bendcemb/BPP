<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="answer.aspx.cs" Inherits="R01.report.doccenter.answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .multiline-label {
            white-space: pre-line;
        }
    </style>

    <h4>เอกสารนี้ปิดแล้ว</h4>

    <table runat="server" id="answer1" cellspacing="0" style="border-width: 0px; width: 100%; border-collapse: collapse;">
        <tbody>
            <tr>
                <td>
                    <div align="center">
                        <style>
                            <!--
                            /* Font Definitions */
                            @font-face {
                                font-family: "MS Mincho";
                                panose-1: 2 2 6 9 4 2 5 8 3 4;
                            }

                            @font-face {
                                font-family: Tahoma;
                                panose-1: 2 11 6 4 3 5 4 4 2 4;
                            }

                            @font-face {
                                font-face "\@MS Mincho";
                                panose-1: 0 0 0 0 0 0 0 0 0 0;
                            }
                            /* Style Definitions */
                            p.MsoNormal, li.MsoNormal, div.MsoNormal {
                                margin: 0pt;
                                margin-bottom: .0001pt;
                                text-align: center;
                                font-size: 10.0pt;
                                font-family: Tahoma;
                            }

                            @page Section1 {
                                size: 595.35pt 841.95pt;
                                margin: 72.0pt 18.0pt 72.0pt 36.0pt;
                            }

                            div.Section1 {
                                page: Section1;
                            }
                            -->
                        </style>





                        <div class="Section1">

                            <font color="blue" size="5">เอกสารนี้ปิดแล้ว</font><br>
                            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="834" style="width: 500.65pt; margin-left: 10pt; border-collapse: collapse">
                                <tbody>
                                    <tr style="height: 21.0pt">
                                        <td width="834" colspan="9" style="width: 500.65pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" style="text-align: center"><b><span style="font-size: 12.0pt; color: black;">การขอดำเนินการเรื่องเอกสาร</span></b></p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="300" colspan="4" style="width: 180.2pt; border: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">จาก </span></b>

                                                <asp:Label runat="server" ID="lblsec_rqt"></asp:Label>

                                            </p>
                                        </td>
                                        <td width="300" colspan="2" style="width: 180.2pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">วัตถุประสงค์</span></b>

                                                <asp:Label runat="server" ID="lblreqtype"></asp:Label>
                                            </p>

                                        </td>
                                        <td width="234" colspan="3" style="width: 140.25pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">ประเภทเอกสาร</span></b>
                                                <%--ระเบียบปฏิบัติงาน(P)--%>
                                                <asp:Label runat="server" ID="lbldoctype"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="300" colspan="4" style="width: 180.2pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">หมายเลขเอกสาร</span></b>
                                                <%--<a href="/report/qm/docqm.aspx?fs=doccode&amp;key=CA-P201">CA-P201</a>--%>
                                                <asp:Label runat="server" ID="lbldocno"></asp:Label>
                                            </p>

                                        </td>
                                        <td width="534" colspan="5" style="width: 320.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">ชื่อเอกสาร</span></b>
                                                <%--การสอบเทียบ--%>
                                                <asp:Label runat="server" ID="lbldocname"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="834" colspan="9" style="width: 500.65pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">รายละเอียด</span>/<span lang="TH">เหตุผลการขอดำเนินการ</span></b><br />

                                                <asp:Label runat="server" ID="lblNOTE_" CssClass="multiline-label"></asp:Label>
                                                <asp:Label runat="server" ID="lblattfile"></asp:Label>
                                            </p>
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                หมายเลขคำขอ: 
                                                <asp:Label runat="server" ID="lblid"></asp:Label>
                                            </p>

                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="834" colspan="9" style="width: 500.65pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">รายละเอียดเพิ่มเติม:</span></b><span lang="TH"> กรณีคำสั่งปฏิบัติงาน คู่มือทางเทคนิคและเอกสารสนับสนุน ให้ระบุผู้ครอบครองสำเนาทุกครั้ง</span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="384" colspan="5" style="width: 230.15pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">สถานะเอกสาร</span></p>
                                        </td>
                                        <td width="193" colspan="2" style="width: 115.5pt; border: none; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">ผู้ขอดำเนินการ</span></p>
                                        </td>
                                        <td width="258" colspan="2" style="width: 155.0pt; border: none; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">ผู้บริหารฝ่าย</span></p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="83" colspan="2" style="width: 49.85pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">ชุด</span></p>
                                        </td>
                                        <td width="114" style="width: 68.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">ทบทวน</span></p>
                                        </td>
                                        <td width="186" colspan="2" style="width: 111.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">วันที่</span></p>
                                        </td>
                                        <td width="193" colspan="2" valign="bottom" style="width: 115.5pt; border: none; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="258" colspan="2" valign="bottom" style="width: 155.0pt; border: none; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="83" colspan="2" valign="bottom" style="width: 49.85pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="114" valign="bottom" style="width: 68.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="186" colspan="2" valign="bottom" style="width: 111.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="193" colspan="2" valign="bottom" style="width: 115.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="right" style="text-align: right"><span lang="TH">วันที่ </span>………/………/………</p>
                                        </td>
                                        <td width="258" colspan="2" valign="bottom" style="width: 155.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="right" style="text-align: right"><span lang="TH">วันที่ </span>………/………/………</p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="384" colspan="5" style="width: 230.15pt; border: solid windowtext 1.0pt; border-top: none; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">ขั้นตอนการดำเนินการ</span>&nbsp;</p>
                                        </td>
                                        <td width="193" colspan="2" style="width: 115.5pt; border: none; border-bottom: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">ลายมือชื่อผู้ดำเนินการ</span></p>
                                        </td>
                                        <td width="117" style="width: 70.0pt; border: solid windowtext 1.0pt; border-top: none; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                            <p class="MsoNormal"><span lang="TH">วันที่</span></p>
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="142" style="width: 85.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">หมายเหตุ</span></p>
                                        </td>
                                    </tr>
                                    <tr style="height: 23.25pt">
                                        <td width="82" style="width: 49.45pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: none; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">O</p>
                                        </td>
                                        <td width="301" colspan="4" style="width: 180.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">QMM <span lang="TH">ตรวจสอบผลกระทบและเอกสาร</span></p>
                                        </td>
                                        <td width="193" colspan="2" valign="bottom" style="width: 115.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="117" valign="bottom" style="width: 70.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="142" valign="bottom" style="width: 85.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                    </tr>
                                    <tr style="height: 23.25pt">
                                        <td width="82" style="width: 49.45pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: none; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">O</p>
                                        </td>
                                        <td width="301" colspan="4" style="width: 180.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal" align="left" style="text-align: left"><span lang="TH">ผู้อนุมัติเอกสาร</span></p>
                                        </td>
                                        <td width="193" colspan="2" valign="bottom" style="width: 115.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="117" valign="bottom" style="width: 70.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="142" valign="bottom" style="width: 85.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                    </tr>
                                    <tr style="height: 23.25pt">
                                        <td width="82" style="width: 49.45pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: none; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">O</p>
                                        </td>
                                        <td width="301" colspan="4" style="width: 180.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <span lang="TH">จนท.บันทึกข้อมูลและดำเนินการด้านเอกสาร</span>
                                            </p>
                                        </td>
                                        <td width="193" colspan="2" valign="bottom" style="width: 115.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="117" valign="bottom" style="width: 70.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                        <td width="142" valign="bottom" style="width: 85.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 23.25pt">
                                            <p class="MsoNormal">&nbsp;</p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="834" colspan="9" style="width: 500.65pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">ผู้ครอบครองเอกสาร/รายละเอียดการดำเนินการ</span></b><br>

                                                <asp:Label runat="server" ID="lbldocholder" CssClass="multiline-label"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="834" colspan="9" style="width: 500.65pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">
                                                <b><span lang="TH">บันทึกความเข้าใจการใช้เอกสาร</span></b><br>

                                                <asp:Label runat="server" ID="lblacknowledge" CssClass="multiline-label"></asp:Label>
                                            </p>

                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="417" colspan="5" style="width: 253.3pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal"><span lang="TH">จนท.ดำเนินการ</span></p>
                                            <p class="MsoNormal">
                                                <o:p>&nbsp;</o:p>
                                            </p>
                                            <p class="MsoNormal">
                                                <span lang="TH">
                                                    <o:p>&nbsp;</o:p></span>
                                            </p>
                                        </td>
                                        <td width="417" colspan="4" valign="top" style="width: 253.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid black .5pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal">QMM <span lang="TH">ตรวจสอบ</span></p>
                                            <p class="MsoNormal">
                                                &nbsp;
                                                       <%-- <a id="answer1_datalist1_HyperLink2_0" href="/photo/qmdoc/request/" + <label>reqfile</label>>ปิดแล้ว</a>--%>
                                                <asp:HiddenField runat="server" ID="hdfreqfile" />
                                                <a href='<%= "http://bppnet/photo/qmdoc/request/" + hdfreqfile.Value %>'>ปิดแล้ว</a>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style="height: 21.0pt">
                                        <td width="576" colspan="7" valign="top" style="width: 345.65pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="left" style="text-align: left">QM-F201</p>
                                        </td>
                                        <td width="258" colspan="2" valign="top" style="width: 155.0pt; padding: 0pt 5.4pt 0pt 5.4pt; height: 21.0pt">
                                            <p class="MsoNormal" align="right" style="text-align: right">03-01-09-59</p>
                                        </td>
                                    </tr>
                                    <tr height="0">
                                        <td width="82" style="border: none"></td>
                                        <td width="1" style="border: none"></td>
                                        <td width="114" style="border: none"></td>
                                        <td width="103" style="border: none"></td>
                                        <td width="83" style="border: none"></td>
                                        <td width="193" style="border: none"></td>
                                        <td width="25" style="border: none"></td>
                                        <td width="92" style="border: none"></td>
                                        <td width="142" style="border: none"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="9"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
