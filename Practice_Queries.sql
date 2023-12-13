SET search_path TO healthcare_mngmt;

--============ Query - 1 =================--

--==== Select all columns and all rows from one table ====--

SELECT 
	* 
FROM 
	Patient_Record;

--============ Query - 2 =================--

--==== Select five columns and all rows from one table ====--

SELECT 
	Patient_ID, 
	name, 
	dateofbirth, 
	address, 
	Insurance_ID 
FROM 
	Patient;


--============ Query - 3 =================--

--==== Select all columns from all rows from one view ====--

--================= Scenario ================--

--==== All Distinct historical appointments of doctor with patients ====--

SELECT 
	* 
FROM 
	Doctor_History_View;


--============ Query - 4 =================--

--==== Using a join on 2 tables, select all columns and all =====--
--==== rows from the tables without the use of a Cartesian product =====--

--================= Scenario ================--

--==== Writing a query to get all the patient details with their =====--
--==== appointment details whose appointment status is 'Confirmed' =====--

SELECT 
	a.appointment_no, 
	p.patient_id, 
	p.name as "Patient_name", 
	dateofbirth,
	a.time, 
	a.date, 
	a.reason
FROM 
	Patient p 
JOIN 
	Appointment a 
ON 
	p.Patient_ID = a.Patient_ID
WHERE 
	a.status = 'Confirmed';


--============ Query - 5 =================--

--==== Select and order data retrieved from one table ====--

SELECT
    p.Patient_ID,
    p.Name AS Patient_Name,
    COUNT(pr.Doctor_ID) AS No_Of_Doctors_Visit
FROM
    Patient p
JOIN
    Patient_Record pr ON p.Patient_ID = pr.Patient_ID
GROUP BY
    p.Name, p.Patient_ID
HAVING
    COUNT(pr.Doctor_ID) > 1
ORDER BY No_Of_Doctors_Visit Desc;


--============ Query - 6 =================--

--==== Using a join on 3 tables, select 5 columns from the 3 =====---
--==== tables. Use syntax that would limit the output to 10 rows =====--

--============ Scenario =============--

--==== Writing a Query to get appointment details with patients and Doctor name ====--

SELECT
    a.Date,
	a.Time,
    a.Reason,
    p.Name AS Patient_Name,
    d.Name AS Doctor_Name
FROM
    Appointment a
JOIN
    Patient p ON a.Patient_ID = p.Patient_ID
JOIN
    Doctor d ON a.Doctor_ID = d.Doctor_ID
ORDER BY a.appointment_no
LIMIT 10;

--============ Query - 7 =================--

--===== Select distinct rows using joins on 3 tables ====--

SELECT DISTINCT
    pr.Record_ID,
    pr.Date,
    pr.Test_Results,
    d.Name AS Doctor_Name,
    p.Name AS Patient_Name
FROM
    Patient_Record pr
LEFT JOIN
    Doctor d ON pr.Doctor_ID = d.Doctor_ID
JOIN
    Patient p ON pr.Patient_ID = p.Patient_ID;
	
	
--============ Query - 8 =================--

--==== Use GROUP BY and HAVING in a select statement ====--
--==== using one or more tables ====--

--================= Scenario ================--

--==== Writing Query to find doctors who have treated more than 1 patients ====--

SELECT
    d.Doctor_ID,
    d.Name AS Doctor_Name,
    COUNT(pr.Patient_ID) AS Patients_Treated
FROM
    Doctor d
JOIN
    Patient_Record pr ON d.Doctor_ID = pr.Doctor_ID
GROUP BY
    d.Doctor_ID, d.Name
HAVING
    COUNT(pr.Patient_ID) > 1
ORDER BY Doctor_ID;

--============ Query - 9 =================--

--==== Use IN clause to select data from one or more tables ====--

SELECT
    p.Patient_ID,
    p.Name AS Patient_Name,
    a.Appointment_no,
    a.Date AS Appointment_Date,
    d.Name AS Doctor_Name
FROM
    Patient p
JOIN
    Appointment a ON p.Patient_ID = a.Patient_ID
JOIN
    Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE
    a.Date IN ('2023-11-07', '2023-11-08', '2023-11-09');
	
	
--============ Query - 10 =================--

--==== Select length of one column from one table ====--

SELECT
    Name AS Patient_Name,
    LENGTH(Name) AS Name_Length
FROM
    Patient;

--============ Query - 11 =================--

--==== Delete one record from one table. Use select ====--
--==== statements to demonstrate the table contents before and after ====--
--==== the DELETE statement. Make sure you use ROLLBACK ====--
--==== afterwards so that the data will not be physically removed ====--

-- before DELETE
SELECT * FROM Invoice;

-- Begin transaction
BEGIN;

-- DELETE statement to remove a specific invoice record 
DELETE 
FROM 
	Invoice 
WHERE 
	Invoice_ID = 10003;

-- after DELETE
SELECT * FROM Invoice;

-- Rollback the transaction
ROLLBACK;


--============ Query - 12 =================--

--==== Update one record from one table. Use select ====--
--==== statements to demonstrate the table contents before and after ====--
--==== the UPDATE statement. Make sure you use ROLLBACK ====--
--==== afterwards so that the data will not be physically removed ====--

--  before UPDATE
SELECT * FROM Insurance;

-- Begin transaction
BEGIN;

-- UPDATE statement to modify a specific insurance record
UPDATE Insurance
SET
    Company_Name = 'LIC Insurance',
    Contact_Person = 'Shivam Singh Chauhan',
    Contact_Number = '565-987-6543',
    Email = 'shivam.singh@lic.com'
WHERE
    Insurance_ID = 1000;

-- after UPDATE
SELECT * FROM Insurance;

-- Rollback the transaction 
ROLLBACK;

--============ Query - 13 (Advance Query - 1) =================--

--================= Scenario ================--

--==== Writing Query find doctors who have had the highest number of appointments ===--
--==== scheduled in a single day ====--

SELECT
    a.Doctor_ID,
    d.Name AS Doctor_Name,
    COUNT(a.Appointment_no) AS Appointments_Count,
	d.Specialization,
    a.Date AS Appointment_Date
FROM
    Appointment a
JOIN
    Doctor d ON a.Doctor_ID = d.Doctor_ID
GROUP BY
    a.Doctor_ID, d.Name, a.Date,d.Specialization
HAVING
    COUNT(a.Appointment_no) = (
        SELECT
            MAX(Appointments_Per_Day)
        FROM (
            SELECT
                COUNT(Appointment_no) AS Appointments_Per_Day
            FROM
                Appointment
            GROUP BY
                Doctor_ID, Date
        ) AS SubQuery
    );


--============ Query - 14 (Advance Query - 2) =================--

--================= Scenario ================--

--==== Writing Query to find the doctors with the highest average ====-- 
--==== invoice amount for patients who have insurance.====--

SELECT
    d.Doctor_ID,
    d.Name AS Doctor_Name,
    round(AVG(inv.Total_Amount),2) AS Avg_Invoice_Amount
FROM
    Doctor d
JOIN
    Appointment a ON d.Doctor_ID = a.Doctor_ID
JOIN
    Invoice inv ON a.Patient_ID = inv.Patient_ID
WHERE
    a.Patient_ID IN (
        SELECT DISTINCT Patient_ID
        FROM Patient
        WHERE Insurance_ID IS NOT NULL
    )
GROUP BY
    d.Doctor_ID, d.Name
ORDER BY
    Avg_Invoice_Amount DESC
LIMIT 1;

--================================================ END ==================================================--


