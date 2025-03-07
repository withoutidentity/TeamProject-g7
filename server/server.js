require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());

// Serve static files from the same directory as index.html


// เชื่อมต่อฐานข้อมูล MySQL
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

db.connect(err => {
  if (err) {
    console.error('❌ Database connection failed:', err);
    return;
  }
  console.log('✅ Connected to MySQL Database');
});

// 📌 ดึงข้อมูล courses ทั้งหมด (อัปเดตให้ใช้ course_code เป็น PK)
app.get('/courses', (req, res) => {
  const sql = `
    SELECT c.course_code, c.course_name, c.credits, 
           sc.subcategory_id, s.subcategory_name, 
           cat.category_id, cat.category_name
    FROM courses c
    LEFT JOIN course_subcategory sc ON c.course_code = sc.course_code
    LEFT JOIN subcategories s ON sc.subcategory_id = s.subcategory_id
    LEFT JOIN categories cat ON s.category_id = cat.category_id
  `;
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// 🚀 เริ่มเซิร์ฟเวอร์
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
