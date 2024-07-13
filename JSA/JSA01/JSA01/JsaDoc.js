function openModal(jsaDocId) {
    // ดำเนินการเปิด Modal ที่นี่
    // เช่น ใช้ jQuery เลือก Modal แล้วเรียกใช้ .modal('show')
    var myModal = new bootstrap.Modal(document.querySelector('.modal'));
    myModal.show(); // เปิด Modal
    // สามารถใช้ jsaDocId ในการดำเนินการเพิ่มข้อมูลลงใน Modal ได้
    // แสดง JsaDocID ใน modal body
    document.getElementById('JsaDocIDDisplay').innerText = jsaDocId;
}
