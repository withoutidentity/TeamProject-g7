let currentPage = 1; // หน้าเริ่มต้น
const apiUrl = "http://localhost:5000/courses"; // 👉 ใส่ API จริงที่นี่
let allData = [];
const sections = document.querySelectorAll(".section");
const totalPages = sections.length;

// ✅ ดึงข้อมูลจาก API
async function fetchData() {
    try {
        const response = await fetch(apiUrl);
        if (!response.ok) throw new Error("โหลดข้อมูลล้มเหลว");

        allData = await response.json();
        updateCourses();
        // ✅ เมื่อโหลดข้อมูลเสร็จแล้วให้แสดงหน้าที่ 1
        showPage(currentPage);
    } catch (error) {
        console.error("Error:", error);
    }
}

// ✅ อัปเดตรายวิชาตามหมวดวิชา
function updateCourses() {
    document.querySelectorAll("ul[data-subcategory]").forEach((ul) => {
        const subcategoryName = ul.dataset.subcategory;
        ul.innerHTML = ""; // เคลียร์ข้อมูลเก่า

        // 🔥 กรองข้อมูลตาม `subcategory_name`
        const courses = allData.filter(course => course.subcategory_name === subcategoryName);

        // ✅ แสดงรายวิชาที่อยู่ในหมวดนี้
        courses.forEach(course => {
            const li = document.createElement("li");
            li.textContent = ` ${course.course_code} ${course.course_name} (${course.credits})`;
            ul.appendChild(li);
        });
    });
}

// ✅ แสดงหน้าที่เลือก
function showPage(pageNumber) {
    if (pageNumber < 1 || pageNumber > totalPages) {
        return; // ไม่อนุญาตให้อยู่นอกช่วงที่ถูกต้อง
    }

    // ซ่อนทุก section
    sections.forEach(section => {
        section.style.display = "none";
    });

    // แสดง section ที่ต้องการ
    sections[pageNumber - 1].style.display = "block";
    sections[pageNumber - 1].scrollIntoView({ behavior: "smooth", block: "start" });

    // อัปเดตค่า currentPage
    currentPage = pageNumber;
}

// ✅ ปุ่มย้อนกลับ
document.getElementById("prevPage").addEventListener("click", () => {
    if (currentPage > 1) {
        showPage(currentPage - 1);
    }
});

// ✅ ปุ่มถัดไป
document.getElementById("nextPage").addEventListener("click", () => {
    if (currentPage < totalPages) {
        showPage(currentPage + 1);
    }
});

// ✅ โหลดข้อมูลจาก API ทันทีที่หน้าเว็บเปิด
fetchData();


const sideBar = document.getElementsByClassName("side-bar");

document.getElementById("show-side-bar").addEventListener("click",(e)=>{
    sideBar[0].classList.remove("hide")
})

document.getElementById("close").addEventListener("click",(e)=>{
    sideBar[0].classList.add("hide")
})
