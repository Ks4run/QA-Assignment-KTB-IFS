# Section A — Manual Testing


### A1. ออกแบบ test scenarios สําหรับ: เพิ่มสินค้าใส่ตะกร้า (Add product to cart)ให้ครอบคลุม positive, negative และ edge cases
___

# Test Scenarios: เพิ่มสินค้าใส่ตะกร้า (Add Product to Cart)

## Positive Scenarios

| ID | Scenario | Steps | Expected Result |
|----|---------|-------|----------------|
| TC-ADD-001 | เพิ่มสินค้า 1 รายการจากหน้า Product List | คลิกปุ่ม "Add to cart" ของสินค้า | สินค้าถูกเพิ่มในตะกร้า และจำนวนสินค้าใน Cart badge เพิ่มขึ้น |
| TC-ADD-002 | เพิ่มสินค้าหลายประเภทลงตะกร้า | เพิ่ม Hoodie และ Jacket | สินค้าทั้งสองรายการปรากฏในตะกร้า |
| TC-ADD-003 | เพิ่มสินค้าเดิมหลายครั้ง | คลิก Add to cart สินค้าเดิมหลายครั้ง | จำนวนสินค้ารายการนั้นในตะกร้าเพิ่มขึ้น |
| TC-ADD-004 | ตรวจสอบการอัปเดต Cart badge | เพิ่มสินค้า | ตัวเลขที่ Cart icon เปลี่ยนทันที |
| TC-ADD-005 | เพิ่มสินค้าจากหน้าที่มี pagination | ไปหน้าถัดไปของสินค้า และกด Add to cart | สินค้าถูกเพิ่มลงตะกร้า |
| TC-ADD-006 | เพิ่มสินค้าในขณะที่มีสินค้าอยู่ในตะกร้าแล้ว | เพิ่มสินค้า A แล้วเพิ่มสินค้า B | สินค้าทั้งสองยังอยู่ในตะกร้า |
| TC-ADD-007 | รีเฟรชหน้าเว็บหลังเพิ่มสินค้า | เพิ่มสินค้า → Refresh หน้า | สินค้ายังอยู่ในตะกร้า |
| TC-ADD-008 | เพิ่มสินค้าในขณะที่ผู้ใช้ login อยู่ | Login → Add to cart | สินค้าเพิ่มในตะกร้าของผู้ใช้สำเร็จ |

---

## Negative Scenarios

| ID | Scenario | Steps | Expected Result |
|----|---------|-------|----------------|
| TC-ADD-009 | เพิ่มสินค้าเมื่อ API ล้มเหลว | จำลอง API error แล้วกด Add to cart | ระบบแสดงข้อความ error |
| TC-ADD-010 | เพิ่มสินค้าเมื่อ network หลุด | ปิด internet แล้วกด Add to cart | ระบบแจ้งเตือนว่าไม่สามารถเพิ่มสินค้าได้ |
| TC-ADD-011 | เพิ่มสินค้าด้วย SKU ที่ไม่ถูกต้อง | แก้ request ให้เป็น SKU ที่ไม่มีอยู่ | ระบบปฏิเสธคำขอ |
| TC-ADD-012 | เพิ่มสินค้าที่หมด stock | สินค้า inventory = 0 → Add to cart | ระบบไม่อนุญาตให้เพิ่มสินค้า |
| TC-ADD-013 | กดปุ่ม Add to cart รัวๆ | คลิกปุ่ม Add to cart หลายครั้งอย่างรวดเร็ว | ระบบไม่เพิ่มสินค้าเกินจำนวนที่ควร |
| TC-ADD-014 | เพิ่มสินค้าเมื่อ session หมดอายุ | session timeout → Add to cart | ระบบให้ผู้ใช้ login ใหม่ |
| TC-ADD-015 | เพิ่มสินค้าเมื่อจำนวนสินค้าในตะกร้าเกิน limit | Cart เต็ม → Add to cart | ระบบไม่อนุญาตให้เพิ่มสินค้า |

---

## Edge Case Scenarios

| ID | Scenario | Steps | Expected Result |
|----|---------|-------|----------------|
| TC-ADD-016 | เพิ่มสินค้าที่ราคาศูนย์บาท | Add to cart สินค้าที่ราคา = 0 | ระบบเพิ่มสินค้าได้และคำนวณราคาได้ถูกต้อง |
| TC-ADD-017 | เพิ่มสินค้าราคาสูงมาก | Add to cart สินค้าราคาสูง | ระบบคำนวณยอดรวมถูกต้อง |
| TC-ADD-018 | เพิ่มสินค้าแล้วเปลี่ยนหน้าเร็ว | Add to cart แล้วกดเปลี่ยนหน้า | สินค้ายังถูกเพิ่มในตะกร้า |
| TC-ADD-019 | เพิ่มสินค้าเมื่อ API response ช้า | จำลอง slow response | UI แสดง loading state และเพิ่มสินค้าเมื่อสำเร็จ |
| TC-ADD-020 | เพิ่มสินค้าเดิมจำนวนมาก | เพิ่มสินค้าเดิมหลายครั้ง | ระบบจัดการ quantity ได้ถูกต้อง |
| TC-ADD-021 | เพิ่มสินค้าจากหน้าสุดท้ายของ pagination | ไปหน้าสุดท้ายแล้ว Add to cart | สินค้าถูกเพิ่มได้ตามปกติ |
| TC-ADD-022 | เพิ่มสินค้าจากหลาย browser tab | เปิด 2 tab → Add สินค้า | Cart sync ถูกต้อง |
| TC-ADD-023 | เพิ่มสินค้าแล้ว logout/login | Add item → Logout → Login | ตรวจสอบพฤติกรรม cart |
| TC-ADD-024 | เพิ่มสินค้าที่มีทศนิยมราคา | Add สินค้าราคา decimal | ระบบคำนวณราคาได้ถูกต้อง |

___

### A2. หากคุณมีเวลา explore ระบบนี้ 30 นาทีคุณจะใช้กลยุทธ์อย่างไร และเพราะอะไร
___
- จะทดสอบด้วย Happy Case flow ตาม Acceptant Criteria ให้ครบก่อน ถ้าเวลายังเหลือ จะ Exploratory test ด้วยการเล่นไปเรื่อยๆ เผื่อจะเจอ อะไรที่หลุดจาก Business Requirement
___
### A3. เขียน bug report เมื่อ login ด้วยรหัสผ่านผิด แล้วระบบแสดงข้อความ 'Something went wrong'
___
```
#### Bug Report: Login ด้วยรหัสผ่านผิดแสดงข้อความไม่ถูกต้อง

#### Summary
เมื่อผู้ใช้ login ด้วยรหัสผ่านผิด ระบบแสดงข้อความ **"Something went wrong"** ซึ่งไม่สื่อความหมายกับผู้ใช้ ควรแสดงข้อความที่ระบุว่ารหัสผ่านไม่ถูกต้อง

---

#### Environment
- Environment: SIT/UAT
- Application: ODT x merchandise
- Platform: Web (Chrome)
- Browser Version: x.x
- Build Number: y.y.y
- App Version: z.z.z
- Test Date: 2026-03-04

---

#### Preconditions
- ผู้ใช้มีบัญชีที่ถูกต้องในระบบ
- อยู่ที่หน้า Login Page

---

#### Steps to Reproduce
1. เปิดหน้า Login
2. กรอก **Username ที่ถูกต้อง**
3. กรอก **Password ที่ไม่ถูกต้อง**
4. กดปุ่ม **Login**

---

#### Actual Result
ระบบแสดงข้อความแจ้งเตือน: `Something went wrong`

---

#### Expected Result
ระบบควรแสดงข้อความที่ถูกต้อง เช่น: `Invalid username or password`
---

#### Evidence
- Screenshot แนบใน ticket
- Console log / Network response (ถ้ามี)

---

#### Severity
Medium

---

#### Priority
High

---

#### Assignee
Developer Team - Authentication Module

---
```


___

# Section B — Automation Thinking 

### B1. หากต้องเริ่มทํา automation สําหรับระบบนี้คุณจะ automate อะไรก่อน และเพราะอะไร
- จะเริ่มวางโครงที่เหมาะสมกับ project และ เริ่มต้นด้วย Case หลักที่เป็น Happy Case หรือ  Case ตาม Acceptant Criteria ก่อน
___

### B2. อธิบาย test pyramid และคุณจะนํามาใช้กับระบบนี้อย่างไร
- Test pyramid จะมีฐาณเป็น Unit test ขึ้นมาจะเป็น System / Integration test ขึ้นมาอีกจะเป็น UI test และยอด pyramid จะเป็น End-to-end test
    - โดยที่รูปทรงบ่งบอกว่า อะไรที่ควรมีมากไปถึงน้อย
    - Unit test -> เป็นส่วนที่ Developer ต้อง implement เนื่องด้วยใช้ effort น้อยที่สุดในการทำ test
    - System / Integration test -> QA จะเริ่มเข้ามามีบทบาทในการทดสอบร่วมแล้ว โดยสามารถเริ่มได้ที่ API test ได้เลย โดยการ เทส call service ก่อนได้เลย
    - UI test -> ตามตัวหัวข้อเลย เริ่มมีการ test ด้วยการลอง Click, Input field เพื่อทดสอบ การ handle element หรือ การ navigate/redirect หน้า
    - End-to-end test -> การทดสอบที่จะเป็น full loop โดยการนำ test case ที่ร้อยเรียงเป็น scenario เข้ามาทดสอบเพื่อเป็น Exit เพื่อ Verify ระบบว่าทำงานถูกต้องตาม Requirement แล้ว

___

### B3. หาก UI tests flaky บน CI แต่รันผ่านบนเครื่องคุณ คุณจะสืบสวนและแก้ไขอย่างไร
- set ให้ทุก action/step มีการ delay เพิ่มขึ้น (เพราะการรัน automate บางครั้ง UI หรือ DOM Element โหลดไม่ทัน) และ run local ด้วย debug mode เพื่อ investigate issues step-by-step

___

# Section C — Robot Framework 

### C1. เขียน Robot Framework test สําหรับ login สําเร็จ
* [Test script](tests/odt-merchandise.robot)
* [How to Run](README.md)

### C2. คุณจะออกแบบโครงสร้าง Robot tests อย่างไรให้ดูแลง่ายเมื่อโปรเจกต์โตขึ้น
- สร้าง folder /resource และ สร้าง sub-folder keywords และ variables เพื่อจัดการเป็นส่วนๆ โดยจะเริ่มที่ variable จัดการตัวแปรและนำไปประกอบที่ -> keyword เพื่อร้อยเรียง step -> และนำ keyword ที่เป็นเหมือน function ในการทำ test action เข้ามาประกอบที่ไฟล์ test script ที่เป็น *.robot ไฟล์

```
├── tests/
    ├──test-script.robot
├── resources/
    ├──keywords/
        ├──*.robot
    ├──variables/
        ├──*.robot
```