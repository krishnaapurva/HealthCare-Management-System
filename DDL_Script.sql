--============= Step - 2 ================

--==== Creating Schema ====--

CREATE SCHEMA IF NOT EXISTS healthcare_mngmt;

--==== set the path to schema ====--

SET search_path TO healthcare_mngmt;

--==== DROP - statements to clean up objects from previous run ====--

--==== DROP Triggers and functions ====--

DROP TRIGGER IF EXISTS patient_insert_trigger ON PATIENT;
DROP TRIGGER IF EXISTS patient_record_insert_trigger ON PATIENT_RECORD;
DROP TRIGGER IF EXISTS doctor_insert_trigger ON DOCTOR;
DROP TRIGGER IF EXISTS appointment_insert_trigger ON APPOINTMENT;
DROP TRIGGER IF EXISTS invoice_insert_trigger ON INVOICE;
DROP TRIGGER IF EXISTS insurance_insert_trigger ON INSURANCE;

--====== DROP Functions =====--

DROP FUNCTION IF EXISTS insert_patient_id();
DROP FUNCTION IF EXISTS insert_record_id();
DROP FUNCTION IF EXISTS insert_doctor_id();
DROP FUNCTION IF EXISTS insert_appointment_no();
DROP FUNCTION IF EXISTS insert_invoice_id();
DROP FUNCTION IF EXISTS insert_insurance_id();

--==== DROP Sequences ====--

DROP SEQUENCE IF EXISTS Patient_ID_Seq Cascade;
DROP SEQUENCE IF EXISTS Record_ID_Seq Cascade;
DROP SEQUENCE IF EXISTS Doctor_ID_Seq Cascade;
DROP SEQUENCE IF EXISTS Appointment_no_Seq Cascade;
DROP SEQUENCE IF EXISTS Invoice_ID_Seq Cascade;
DROP SEQUENCE IF EXISTS Insurance_ID_Seq Cascade;

--==== DROP Indices ====--

DROP INDEX IF EXISTS IDX_PR_Patient_ID_FK Cascade;
DROP INDEX IF EXISTS IDX_PR_Doctor_ID_FK Cascade;
DROP INDEX IF EXISTS IDX_PR_Emergency_Contact Cascade;
DROP INDEX IF EXISTS IDX_Doctor_Phone Cascade;
DROP INDEX IF EXISTS IDX_Doctor_Specialization Cascade;
DROP INDEX IF EXISTS IDX_Appointment_Patient_ID_FK Cascade;
DROP INDEX IF EXISTS IDX_Appointment_Doctor_ID_FK Cascade;
DROP INDEX IF EXISTS IDX_Invoice_Patient_ID_FK Cascade;
DROP INDEX IF EXISTS IDX_Invoice_Insurance_ID_FK Cascade;
DROP INDEX IF EXISTS IDX_Insurance_Company_Name Cascade;
DROP INDEX IF EXISTS IDX_Insurance_Contact_Person Cascade;

--==== DROP Tables ====--

DROP TABLE IF EXISTS PATIENT Cascade;
DROP TABLE IF EXISTS PATIENT_RECORD Cascade;
DROP TABLE IF EXISTS DOCTOR Cascade;
DROP TABLE IF EXISTS APPOINTMENT Cascade;
DROP TABLE IF EXISTS INVOICE Cascade;
DROP TABLE IF EXISTS INSURANCE Cascade;

--==== Drop views ====--

DROP VIEW IF EXISTS Doctor_History_View;
DROP VIEW IF EXISTS Patient_Doctor_View;
DROP VIEW IF EXISTS Patient_Invoice_View;

------=================================== PATIENT ===========================================================-------

--===== Create PATIENT Table =====--

CREATE TABLE PATIENT (
    Patient_ID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(255),
    Insurance_ID INT,
    Gender VARCHAR(10),
    Phone VARCHAR(20),
	
	CONSTRAINT PK_PATIENT PRIMARY KEY (Patient_ID)
);

--==== Create a sequence for Patient_ID ====--

CREATE SEQUENCE Patient_ID_Seq START WITH 100 INCREMENT BY 1;

--==== Create a trigger to automatically populate Patient_ID ====--

--==== insert_patient_id() Function ====--

CREATE OR REPLACE FUNCTION insert_patient_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Patient_ID := nextval('Patient_ID_Seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--==== patient_insert_trigger ====-- 

CREATE TRIGGER patient_insert_trigger
BEFORE INSERT ON PATIENT
FOR EACH ROW
EXECUTE FUNCTION insert_patient_id();

------================================== DOCTOR ============================================================-------

--==== Create DOCTOR Table ====--

CREATE TABLE DOCTOR (
    Doctor_ID INT,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Specialization VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Gender VARCHAR(10),
	
	CONSTRAINT PK_DOCTOR PRIMARY KEY (Doctor_ID)
);

--==== Indices on Frequency Column ====--

CREATE INDEX IDX_Doctor_Phone ON DOCTOR(Phone);
CREATE INDEX IDX_Docto_Specialization ON DOCTOR(Specialization);

--==== Create a sequence for Doctor_ID ====--

CREATE SEQUENCE Doctor_ID_Seq START WITH 100 INCREMENT BY 1;

--==== Create a trigger to automatically populate Doctor_ID ====--

--==== insert_doctor_id() function ====--

CREATE OR REPLACE FUNCTION insert_doctor_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Doctor_ID := nextval('Doctor_ID_Seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--==== doctor_insert_trigger ====--

CREATE TRIGGER doctor_insert_trigger
BEFORE INSERT ON DOCTOR
FOR EACH ROW
EXECUTE FUNCTION insert_doctor_id();

------================================== PATIENT_RECORD ============================================================-------

--==== Create PATIENT_RECORD Table ====--

CREATE TABLE PATIENT_RECORD (
    Record_ID INT NOT NULL,
    Date DATE NOT NULL,
    Test_Results TEXT,
    Patient_ID INT NOT NULL,
    Emergency_Contact VARCHAR(20),
    Prescription_Medicines TEXT,
    Doctor_ID INT NOT NULL,
    
	CONSTRAINT PK_PATIENT_RECORD PRIMARY KEY (Record_ID),
	CONSTRAINT FK_Patient_Record_Patient FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    CONSTRAINT FK_Patient_Record_Doctor FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Doctor_ID)
);

--==== Indices on Foreign key ====--

CREATE INDEX IDX_PR_Patient_ID_FK ON PATIENT_RECORD(Patient_ID);
CREATE INDEX IDX_PR_Doctor_ID_FK ON PATIENT_RECORD(Doctor_ID);

--==== Indices on Frequency column ====--

CREATE INDEX IDX_PR_Emergency_Contact ON PATIENT_RECORD(Emergency_Contact);

--==== Create a sequence for Record_ID ====--

CREATE SEQUENCE Record_ID_Seq START WITH 10 INCREMENT BY 1;

--==== Create a trigger to automatically populate Record_ID ====--

--==== insert_record_id() Function ====--

CREATE OR REPLACE FUNCTION insert_record_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Record_ID := nextval('Record_ID_Seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--==== patient_record_insert_trigger ====--

CREATE TRIGGER patient_record_insert_trigger
BEFORE INSERT ON PATIENT_RECORD
FOR EACH ROW
EXECUTE FUNCTION insert_record_id();

------================================ APPOINTMENT ==============================================================-------

--==== Create APPOINTMENT Table ====--

CREATE TABLE APPOINTMENT (
    Appointment_no INT NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Reason VARCHAR(255) NOT NULL,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
	
	CONSTRAINT PK_APPOINTMENT PRIMARY KEY (Appointment_no),
    CONSTRAINT FK_Appointment_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    CONSTRAINT FK_Appointment_Doctor_ID FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Doctor_ID),
	CONSTRAINT Status CHECK (Status IN ('Confirmed', 'Cancelled', 'Rescheduled'))
);

--==== Indices on Foreign key ====--

CREATE INDEX IDX_Appointment_Patient_ID_FK ON APPOINTMENT(Patient_ID);
CREATE INDEX IDX_Appointment_Doctor_ID_FK ON APPOINTMENT(Doctor_ID);

--==== Create a sequence for Appointment_no ====--

CREATE SEQUENCE Appointment_no_Seq START WITH 1 INCREMENT BY 1;

--==== Create a trigger to automatically populate Appointment_no ====--

--==== insert_appointment_no() Function ====--

CREATE OR REPLACE FUNCTION insert_appointment_no()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Appointment_no := nextval('Appointment_no_Seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--==== appointment_insert_trigger ====--

CREATE TRIGGER appointment_insert_trigger
BEFORE INSERT ON APPOINTMENT
FOR EACH ROW
EXECUTE FUNCTION insert_appointment_no();

------=============================== INSURANCE ===============================================================-------

--==== Create INSURANCE table ====--

CREATE TABLE INSURANCE (
    Insurance_ID INT NOT NULL,
    Company_Name VARCHAR(255) NOT NULL,
    Contact_Person VARCHAR(255),
    Contact_Number VARCHAR(20),
    Email VARCHAR(255),

	CONSTRAINT PK_INSURANCE PRIMARY KEY (Insurance_ID)
);

--==== Indices on frequent Column ====--

CREATE INDEX IDX_Insurance_Company_Name ON INSURANCE(Company_Name);
CREATE INDEX IDX_Insurance_Contact_Person ON INSURANCE(Contact_Person);

--==== Create a sequence for Insurance_ID ====--

CREATE SEQUENCE Insurance_ID_Seq START WITH 1000 INCREMENT BY 1;

--==== Create a trigger to automatically populate Insurance_ID ====--

--==== insert_insurance_id() ====--

CREATE OR REPLACE FUNCTION insert_insurance_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Insurance_ID := nextval('Insurance_ID_seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--==== insurance_insert_triger ====--

CREATE TRIGGER insurance_insert_trigger
BEFORE INSERT ON INSURANCE
FOR EACH ROW
EXECUTE FUNCTION insert_insurance_id();

------=============================== INVOICE ===============================================================-------

--==== Create INVOICE Table ====--

CREATE TABLE INVOICE (
    Invoice_ID INT NOT NULL,
    Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Payment_Status VARCHAR(20) NOT NULL,
    Patient_ID INT NOT NULL,
    Insurance_ID INT,
    Payment_Method VARCHAR(20),
	
	CONSTRAINT PK_INVOICE PRIMARY KEY (Invoice_ID),
    CONSTRAINT FK_Invoice_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    CONSTRAINT FK_Invoice_Insurance_ID FOREIGN KEY (Insurance_ID) REFERENCES INSURANCE(Insurance_ID),
	CONSTRAINT Payment_Status CHECK (Payment_Status IN ('Paid', 'Pending'))
);

--==== Indices on Foreign key ====-- 

CREATE INDEX IDX_Invoice_Patient_ID_FK ON INVOICE(Patient_ID);
CREATE INDEX IDX_Invoice_Insurance_ID_FK ON INVOICE(Insurance_ID);

--==== Create a sequence for Invoice_ID ====--

CREATE SEQUENCE Invoice_ID_Seq START WITH 10000 INCREMENT BY 1;

--==== Create a trigger to automatically populate Invoice_ID ====--

--==== insert_invoice_id() Function ====--

CREATE OR REPLACE FUNCTION insert_invoice_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Invoice_ID := nextval('Invoice_ID_Seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--==== invoice_insert_trigger ====--

CREATE TRIGGER invoice_insert_trigger
BEFORE INSERT ON INVOICE
FOR EACH ROW
EXECUTE FUNCTION insert_invoice_id();

------==============================================================================================-------

------================== VIEWS ========================--

--======== Create view to get historical data of doctor check up patient ==================--

CREATE VIEW Doctor_History_View AS
SELECT Distinct 
	d.Doctor_ID, 
	d.name AS "Doctor_Name", 
	d.Specialization, 
	pr.patient_id AS "Patient_Name", p.name 
FROM 
	Patient_Record pr
LEFT JOIN 
	Doctor d ON d.Doctor_ID = pr.Doctor_ID
LEFT JOIN 
	Patient p ON p.Patient_ID = pr. Patient_ID;

--======== Create View to Patient and their corresponding Doctors ========---

CREATE VIEW Patient_Doctor_View AS
SELECT 
    p.Patient_ID,
    p.Name AS Patient_Name,
    p.DateOfBirth,
    p.Address,
    p.Gender AS Patient_Gender,
    p.Phone AS Patient_Phone,
    d.Doctor_ID,
    d.Name AS Doctor_Name,
    d.Specialization,
    d.Email AS Doctor_Email,
    d.Gender AS Doctor_Gender
FROM 
    PATIENT p
JOIN 
    APPOINTMENT a ON p.Patient_ID = a.Patient_ID
JOIN 
    DOCTOR d ON a.Doctor_ID = d.Doctor_ID;


--======== Creata a view to get compiles patients invoice details ========--

CREATE VIEW Patient_Invoice_View AS
SELECT 
    p.Patient_ID,
    p.Name AS Patient_Name,
    i.Invoice_ID,
    i.Date AS Invoice_Date,
    i.Total_Amount,
    i.Payment_Status,
    i.Payment_Method
FROM 
    PATIENT p
JOIN 
    INVOICE i ON p.Patient_ID = i.Patient_ID;

--========================================================================================================---

--============= Check the DBMS data dictionary to make sure that all objects have been created successfully =====--

SELECT table_name, table_schema, table_type, is_insertable_into
FROM information_schema.tables
WHERE table_schema = 'healthcare_mngmt';

SELECT *
FROM information_schema.tables
WHERE table_schema = 'healthcare_mngmt';

--================================================ END ==================================================--
