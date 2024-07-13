//// สำหรับทุกลิงก์ในแท็บ
//document.querySelectorAll('.nav-link').forEach(function (link) {
//    link.addEventListener('click', function (event) {
//        event.preventDefault(); // ป้องกันการโหลดหน้าใหม่เมื่อคลิกที่ลิงก์

//        // กำหนดค่าสถานะแท็บ
//        document.querySelectorAll('.nav-link').forEach(function (tab) {
//            tab.classList.remove('active');
//        });
//        this.classList.add('active');

//        // ซ่อนเนื้อหาของแท็บที่ไม่ได้เลือก
//        document.querySelectorAll('.tab-content').forEach(function (content) {
//            content.style.display = 'none';
//        });

//        // แสดงเนื้อหาที่เกี่ยวข้องกับแท็บที่เลือก
//        var target = this.getAttribute('data-target');
//        document.querySelector(target).style.display = 'block';
//    });
//});

