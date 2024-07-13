// สำหรับทุกลิงก์ในแท็บ
document.querySelectorAll('.nav-link').forEach(function (link) {
    link.addEventListener('click', function (event) {
        event.preventDefault(); // ป้องกันการโหลดหน้าใหม่เมื่อคลิกที่ลิงก์

        // กำหนดค่าสถานะแท็บ
        document.querySelectorAll('.nav-link').forEach(function (tab) {
            tab.classList.remove('active');
        });
        this.classList.add('active');

        // ซ่อนเนื้อหาของแท็บที่ไม่ได้เลือก
        document.querySelectorAll('.tab-content').forEach(function (content) {
            content.style.display = 'none';
        });

        // แสดงเนื้อหาที่เกี่ยวข้องกับแท็บที่เลือก
        var target = this.getAttribute('data-target');
        document.querySelector(target).style.display = 'block';
    });
});


//function openModal(doc_id, create_by) {
//    // ดำเนินการเปิด Modal ที่นี่
//    // เช่น ใช้ jQuery เลือก Modal แล้วเรียกใช้ .modal('show')
//    var myModal = new bootstrap.Modal(document.querySelector('.modal'));
//    myModal.show(); // เปิด Modal
//    // สามารถใช้ jsaDocId ในการดำเนินการเพิ่มข้อมูลลงใน Modal ได้
//    // แสดง JsaDocID ใน modal body
    
//    document.getElementById('JsaDocIDDisplay').innerText = doc_id;
//    document.getElementById('txtCreateBy').innerText = create_by;
//}

function openModal(doc_id, create_by) {
    var myModal = new bootstrap.Modal(document.querySelector('.modal'));

    // กำหนดค่าในส่วนต่าง ๆ ของ Modal
    document.getElementById('JsaDocIDDisplay').innerText = doc_id;
    document.getElementById('txtCreateBy').value = create_by;

    // เรียกใช้ .show() เพื่อแสดง Modal
    myModal.show();
}






function saveDataToDatabase() {
    // เรียกใช้ AJAX เพื่อส่งข้อมูลไปยัง Controller เพื่อบันทึกลงในฐานข้อมูล
    var jsaDocId = document.getElementById('JsaDocIDDisplay').innerText;
    $.ajax({
        type: 'POST',
        url: '/Data/SaveData', // ระบุ URL ของ Controller และ Action Method
        data: { jsaDocId: jsaDocId },
        success: function (response) {
            if (response.success) {
                console.log('Data saved successfully');
            } else {
                console.error('Error saving data:', response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('Error saving data:', error);
        }
    });
}