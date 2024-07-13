<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qmdinfo.aspx.cs" Inherits="R01.report.qm.qmdinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>รหัสเอกสารขึ้นทะเบียน: CA-P201.09</h4>

    <table class="table table-bordered" id="tbl1" runat="server">
        <tr>
            <th>รหัสเอกสาร:</th>
            <td id="Doc_Code"></td>
        </tr>
        <tr>
            <th>มาตรฐานการผลิต:</th>
            <td id="Doc_Job"></td>
        </tr>
        <tr>
            <th>ชื่อเอกสาร:</th>
            <td id="Doc_Name"></td>
        </tr>

        <tr>
            <th>ประเภท/ชนิด:</th>
             <td id="Doc_Type"></td>
        </tr>

        <tr>
            <th>จุดประสงค์:	</th>
             <td id="doc_obj"></td>
        </tr>

        <tr>
            <th>หมายเลขการแก้ไข:</th>
             <td id="Doc_Rev"></td>
        </tr>

        <tr>
            <th>วันที่อนุมัติ:</th>
             <td id="Doc_Date"></td>
        </tr>

        <tr>
            <th>จำนวนหน้า:</th>
             <td id="Doc_Pages"></td>
        </tr>

        <tr>
            <th>บันทึกการเปลี่ยนแปลง:</th>
             <td id="Doc_Remark"></td>
        </tr>

        <tr>
            <th>สถานะเอกสาร:</th>
            <td id="txtvoid" class="text-danger"></td>
        </tr>

      
	  
	  
     
	 
     
	 
	 
	 
	  

    </table>
</asp:Content>
