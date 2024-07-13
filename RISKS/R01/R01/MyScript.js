
//menu tab

// เมื่อหน้าเว็บโหลดเสร็จสมบูรณ์
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

}



//menu tab

