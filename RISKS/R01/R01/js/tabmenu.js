

document.addEventListener("DOMContentLoaded", function () {
    // เลือกปุ่มแท็บ Tab1 เพื่อเป็น Active
    var tab1Button = document.querySelector(".tablinks");
    tab1Button.classList.add("active");
});



function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
        tabcontent[i].classList.remove("active"); // เอาคลาส active ออกจากทุกแท็บ

    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    document.getElementById(tabName).classList.add("active"); // เพิ่มคลาส active ให้กับแท็บที่ถูกเลือก
    evt.currentTarget.className += " active";



    // เพิ่มเงื่อนไขเพื่อตั้งค่า focus ลงใน TextBox ที่ต้องการ
    if (tabName === "Tab2") {
        var txtInput = document.getElementById('<%= txtInput.ClientID %>');
        txtInput.focus();


        // เลือก GridView ด้วย ID หรือชื่อ Element
        var gridView = document.getElementById('<%= grv2.ClientID %>');

        // วนลูปผ่านทุกแถวของ GridView
        for (var i = 0; i < gridView.rows.length; i++) {
            // เลือก cell ของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell1 = gridView.rows[i].cells[1]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell2 = gridView.rows[i].cells[2];
            var cell3 = gridView.rows[i].cells[3];
            var cell4 = gridView.rows[i].cells[4];
            var cell5 = gridView.rows[i].cells[5];
            var cell6 = gridView.rows[i].cells[6];


            // เปลี่ยนสีพื้นหลังของ cell
            cell1.style.backgroundColor = "red";
            cell2.style.backgroundColor = "white";
            cell3.style.backgroundColor = "white";
            cell4.style.backgroundColor = "white";
            cell5.style.backgroundColor = "white";
            cell6.style.backgroundColor = "white";


        }

    }

    if (tabName === "Tab3") {
        var txtInput = document.getElementById('<%= txtpprocess.ClientID %>');
        txtInput.focus();

        // เลือก GridView ด้วย ID หรือชื่อ Element
        var gridView = document.getElementById('<%= grv2.ClientID %>');

        // วนลูปผ่านทุกแถวของ GridView
        for (var i = 0; i < gridView.rows.length; i++) {
            // เลือก cell ของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell = gridView.rows[i].cells[2]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี

            // เปลี่ยนสีพื้นหลังของ cell
            var cell1 = gridView.rows[i].cells[1]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell2 = gridView.rows[i].cells[2];
            var cell3 = gridView.rows[i].cells[3];
            var cell4 = gridView.rows[i].cells[4];
            var cell5 = gridView.rows[i].cells[5];
            var cell6 = gridView.rows[i].cells[6];


            // เปลี่ยนสีพื้นหลังของ cell
            cell1.style.backgroundColor = "white";
            cell2.style.backgroundColor = "red";
            cell3.style.backgroundColor = "white";
            cell4.style.backgroundColor = "white";
            cell5.style.backgroundColor = "white";
            cell6.style.backgroundColor = "white";

        }
    }

    if (tabName === "Tab4") {
        var txtInput = document.getElementById('<%= txtOutput.ClientID %>');
        txtInput.focus();

        // เลือก GridView ด้วย ID หรือชื่อ Element
        var gridView = document.getElementById('<%= grv2.ClientID %>');

        // วนลูปผ่านทุกแถวของ GridView
        for (var i = 0; i < gridView.rows.length; i++) {
            // เลือก cell ของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell = gridView.rows[i].cells[3]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี

            // เปลี่ยนสีพื้นหลังของ cell
            var cell1 = gridView.rows[i].cells[1]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell2 = gridView.rows[i].cells[2];
            var cell3 = gridView.rows[i].cells[3];
            var cell4 = gridView.rows[i].cells[4];
            var cell5 = gridView.rows[i].cells[5];
            var cell6 = gridView.rows[i].cells[6];


            // เปลี่ยนสีพื้นหลังของ cell
            cell1.style.backgroundColor = "white";
            cell2.style.backgroundColor = "white";
            cell3.style.backgroundColor = "red";
            cell4.style.backgroundColor = "white";
            cell5.style.backgroundColor = "white";
            cell6.style.backgroundColor = "white";

        }
    }

    if (tabName === "Tab5") {
        var txtInput = document.getElementById('<%= txtContext.ClientID %>');
        txtInput.focus();

        // เลือก GridView ด้วย ID หรือชื่อ Element
        var gridView = document.getElementById('<%= grv2.ClientID %>');

        // วนลูปผ่านทุกแถวของ GridView
        for (var i = 0; i < gridView.rows.length; i++) {
            // เลือก cell ของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell = gridView.rows[i].cells[4]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี

            // เปลี่ยนสีพื้นหลังของ cell
            var cell1 = gridView.rows[i].cells[1]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell2 = gridView.rows[i].cells[2];
            var cell3 = gridView.rows[i].cells[3];
            var cell4 = gridView.rows[i].cells[4];
            var cell5 = gridView.rows[i].cells[5];
            var cell6 = gridView.rows[i].cells[6];


            // เปลี่ยนสีพื้นหลังของ cell
            cell1.style.backgroundColor = "white";
            cell2.style.backgroundColor = "white";
            cell3.style.backgroundColor = "white";
            cell4.style.backgroundColor = "red";
            cell5.style.backgroundColor = "white";
            cell6.style.backgroundColor = "white";

        }
    }

    if (tabName === "Tab6") {
        var txtInput = document.getElementById('<%= txtConcern.ClientID %>');
        txtInput.focus();

        // เลือก GridView ด้วย ID หรือชื่อ Element
        var gridView = document.getElementById('<%= grv2.ClientID %>');

        // วนลูปผ่านทุกแถวของ GridView
        for (var i = 0; i < gridView.rows.length; i++) {
            // เลือก cell ของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell = gridView.rows[i].cells[5]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี

            // เปลี่ยนสีพื้นหลังของ cell
            var cell1 = gridView.rows[i].cells[1]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell2 = gridView.rows[i].cells[2];
            var cell3 = gridView.rows[i].cells[3];
            var cell4 = gridView.rows[i].cells[4];
            var cell5 = gridView.rows[i].cells[5];
            var cell6 = gridView.rows[i].cells[6];


            // เปลี่ยนสีพื้นหลังของ cell
            cell1.style.backgroundColor = "white";
            cell2.style.backgroundColor = "white";
            cell3.style.backgroundColor = "white";
            cell4.style.backgroundColor = "white";
            cell5.style.backgroundColor = "red";
            cell6.style.backgroundColor = "white";

        }
    }

    if (tabName === "Tab7") {
        var txtInput = document.getElementById('<%= txttarget.ClientID %>');
        txtInput.focus();



        // เลือก GridView ด้วย ID หรือชื่อ Element
        var gridView = document.getElementById('<%= grv2.ClientID %>');

        // วนลูปผ่านทุกแถวของ GridView
        for (var i = 0; i < gridView.rows.length; i++) {
            // เลือก cell ของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell = gridView.rows[i].cells[6]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี

            // เปลี่ยนสีพื้นหลังของ cell
            var cell1 = gridView.rows[i].cells[1]; // แทน ColumnIndex ด้วยลำดับของคอลัมน์ที่ต้องการเปลี่ยนสี
            var cell2 = gridView.rows[i].cells[2];
            var cell3 = gridView.rows[i].cells[3];
            var cell4 = gridView.rows[i].cells[4];
            var cell5 = gridView.rows[i].cells[5];
            var cell6 = gridView.rows[i].cells[6];


            // เปลี่ยนสีพื้นหลังของ cell
            cell1.style.backgroundColor = "white";
            cell2.style.backgroundColor = "white";
            cell3.style.backgroundColor = "white";
            cell4.style.backgroundColor = "white";
            cell5.style.backgroundColor = "white";
            cell6.style.backgroundColor = "red";

        }
    }

}





function xsave() {
    // รับอ็อบเจกต์ของ CheckBoxList ที่มี ID เป็น cblContext
    var checkBoxList = document.getElementById('<%= cblContext.ClientID %>');

    // ตรวจสอบว่าอ็อบเจกต์ checkBoxList ไม่เป็น null
    if (checkBoxList) {
        // สร้างตัวแปรเพื่อเก็บข้อมูลที่เลือกใน CheckBoxList
        var selectedValues = [];

        // วนลูปผ่านรายการที่เลือกใน CheckBoxList
        for (var i = 0; i < checkBoxList.length; i++) {
            // ตรวจสอบว่ารายการนั้นถูกเลือกหรือไม่
            if (checkBoxList[i].checked) {
                // เพิ่มค่าของรายการที่เลือกลงใน selectedValues
                selectedValues.push(checkBoxList[i].value);
            }
        }

        // ตรวจสอบว่ามีข้อมูลที่เลือกหรือไม่
        if (selectedValues.length > 0) {
            // รวมข้อมูลที่เลือกเป็นสตริงด้วยเครื่องหมายคอมมา
            var concatenatedValues = selectedValues.join(', ');

            // รับอ็อบเจกต์ของช่องข้อมูล txtContext
            var txtContext = document.getElementById('<%= txtContext.ClientID %>');

            // ตั้งค่าของช่องข้อมูล txtContext ให้มีค่าเท่ากับข้อมูลที่เลือกใน CheckBoxList
            txtContext.value = concatenatedValues;
        }
    }
}






