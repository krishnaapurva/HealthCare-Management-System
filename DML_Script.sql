SET search_path TO healthcare_mngmt;

-----========= PATIENT =========------

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Aman Bansal', '1990-05-15', '123 Main St', 12345, 'Male', '555-123-4567');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Sneha Rudra', '1985-10-20', '456 Oak Ave', 67890, 'Female', '555-987-6543');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Swetha Apte', '1992-03-08', '789 Elm St', 54321, 'Female', '555-555-5555');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Bobby Simha', '1980-07-12', '321 Pine Rd', NULL, 'Male', '555-999-8888');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Priyanka Sharma', '1995-12-28', '876 Birch Ln', 98765, 'Female', '555-777-3333');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Hemanth Kumar', '1988-09-04', '567 Cedar Dr', 13579, 'Male', '555-444-2222');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Samantha Reddy', '1993-02-18', '234 Maple Ct', 24680, 'Female', '555-666-1111');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Stephen George', '1975-11-30', '789 Willow Ave', NULL, 'Male', '555-222-5555');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Asifa Alim', '1987-06-10', '876 Pineapple St', 98765, 'Female', '555-111-9999');

INSERT INTO PATIENT (Name, DateOfBirth, Address, Insurance_ID, Gender, Phone)
VALUES ('Naveen K', '1990-08-25', '123 Orange Blvd', 54321, 'Male', '555-999-4444');


------========= Doctor =======-------

-- Insert data into DOCTOR table

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Supriya Kaur', '555-111-2222', 'Cardiologist', 'supriya.kaur@gmail.com', 'Female');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Kannan Srikanth', '555-333-4444', 'Neurologist', 'kannan.srikanth@gmail.com', 'Male');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Anuj Singh', '555-555-6666', 'Dermatologist', 'anuj.singh@gmail.com', 'Male');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Vijay Kumar', '555-777-8888', 'Orthopedic Surgeon', 'vijay.kumar@gmail.com', 'Male');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Shrikar Dhawan', '555-999-0000', 'Pediatrician', 'shrikar.dhawan@gmail.com', 'Female');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Maya Patel', '555-222-3333', 'Gynecologist', 'maya.patel@gmail.com', 'Female');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Bhagyashree Umrikar', '555-444-5555', 'Psychiatrist', 'bhagyashree.umrikar@gmail.com', 'Female');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Sanjay Singhania', '555-666-7777', 'Dermatologist', 'sanjay.singhania@gmail.com', 'Male');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Varun Malhotra', '555-888-9999', 'Oncologist', 'varun.malhotra@gmail.com', 'Male');

INSERT INTO DOCTOR (Name, Phone, Specialization, Email, Gender)
VALUES ('Dr. Sriram Krishnan', '555-888-9989', 'Neurologist', 'sriram.krishnan@gmail.com', 'Female');

--========== Patient Record ==========-------

-- Insert data into PATIENT_RECORD table
INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-06', 'Normal test results', 101, '693-412-1423', 'Medicine A, Medicine B', 101);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-07', 'Allergic reaction', 101, '693-412-1423', 'Antihistamine', 101);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-08', 'High blood pressure', 101, '693-412-1423', 'Beta-blocker', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-09', 'Routine checkup', 100, '614-921-8272', 'Vitamin D supplement', 105);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-10', 'X-ray ordered', 100, '614-921-8272', 'Pain reliever', 104);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-11', 'Annual physical', 105, '666-920-8272', 'Cholesterol medication', 103);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-12', 'MRI scheduled', 107, '614-901-8073', 'Muscle relaxant', 108);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-13', 'Follow-up appointment', 103, '614-900-8272', 'Pain medication', 106);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-14', 'Dermatology consultation', 104, '660-921-8272', 'Topical cream', 105);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-15', 'Blood Pressure Check', 108, '666-921-8000', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-16', 'X-ray Examination', 107, '614-901-8073', 'Painkillers', 107);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-17', 'Blood Test', 109, '214-901-8073', 'Iron Supplements', 100);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-18', 'Blood Pressure Check', 108, '666-921-8000', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-19', 'Blood Pressure Check', 108, '666-921-8000', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-20', 'Blood Pressure Check', 108, '666-921-8000', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-21', 'Blood Pressure Check', 108, '666-921-8000', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-21', 'Blood Pressure Check', 104, '660-921-8272', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-21', 'Blood Pressure Check', 102, '666-921-8014', 'Antihypertensive Medication', 102);

INSERT INTO PATIENT_RECORD (Date, Test_Results, Patient_ID, Emergency_Contact, Prescription_Medicines, Doctor_ID)
VALUES ('2023-11-21', 'Blood Pressure Check', 101, '693-412-1423', 'Antihypertensive Medication', 102);


---------========== Appointment ==========---------

-- Insert data into APPOINTMENT table
INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-06', '09:00:00', 'Follow-up visit', 101, 101, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-07', '10:30:00', 'Annual checkup', 101, 101, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-08', '14:00:00', 'Consultation', 101, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-09', '11:45:00', 'Diagnostic tests', 100, 105, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-10', '16:15:00', 'Physical therapy', 100, 104, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-11', '13:30:00', 'Follow-up', 105, 103, 'Cancelled');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-12', '15:45:00', 'Preventive care', 107, 108, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-13', '08:30:00', 'Dental checkup', 103, 106, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-14', '12:00:00', 'X-ray appointment', 104, 105, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-15', '09:15:00', 'Specialist consultation', 108, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-16', '09:20:00', 'Follow-up', 107, 107, 'Cancelled');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-17', '10:20:00', 'Follow-up', 109, 100, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-18', '11:20:00', 'Specialist consultation', 108, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-19', '10:00:00', 'Follow-up', 108, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-20', '10:15:00', 'Follow-up', 108, 102, 'Cancelled');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-21', '10:40:00', 'Follow-up', 108, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-21', '11:00:00', 'Annual checkup', 104, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-21', '11:10:00', 'Annual checkup', 102, 102, 'Confirmed');

INSERT INTO APPOINTMENT (Date, Time, Reason, Patient_ID, Doctor_ID, Status)
VALUES ('2023-11-21', '11:30:00', 'Annual checkup', 101, 102, 'Confirmed');

--====== Insurance =====-----

-- Insert data into INSURANCE table
INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('Life Assurance Services', 'Siddharth Khanna', '555-987-6543', 'siddhu.khanna@xyzassurance.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('Safe Insurance Company', 'Babu Patel', '555-123-4567', 'babu.patel@abcinsurance.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('SafeGuard Insurers Ltd.', 'Vasanth Ravijani', '555-789-0123', 'vasanth.ravijani@safeguard.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('SecureCover Assurance', 'Ananditha Krishnan', '555-456-7890', 'ananditha.krishnan@securecover.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('TrustShield Insurance Co.', 'Irfan Ahmed', '555-321-0987', 'irfan.ahmed@trustshield.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('Reliable Coverage Inc.', 'Nanditha Sivakumar', '555-876-5432', 'nanditha.sivakumar@reliablecoverage.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('Global Protector Insurances', 'Sasikumar Sridharan', '555-234-5678', 'sasikumar.s@globalprotector.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('Unity Assurance Services', 'Deepika Kumari', '555-890-1234', 'deepika.kumari@unityassurance.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('EverSafe Insurance Solutions', 'Rishabh Singh', '555-567-4321', 'rishabh.singh@eversafe.com');

INSERT INTO INSURANCE (Company_Name, Contact_Person, Contact_Number, Email)
VALUES ('TotalGuard Underwriters', 'Sameera Reddy', '555-432-1098', 'sameera.reddy@totalguard.com');



---============== INVOICE ==========-------

-- Insert data into INVOICE table

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-06', 150.00, 'Pending', 101, 1005, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-07', 200.00, 'Pending', 101, 1005, 'Debit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-08', 100.00, 'Paid', 101, 1005, 'Cash');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-09', 180.00, 'Pending', 100, 1003, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-10', 250.00, 'Paid', 100, 1003, 'Debit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-12', 300.00, 'Pending', 107, NULL, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-13', 180.00, 'Paid', 103, NULL, 'Debit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-14', 220.00, 'Pending', 104, 1001, 'Cash');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-15', 200.00, 'Paid', 108, 1000, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-17', 300.00, 'Paid', 108, 1004, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-18', 200.00, 'Paid', 108, 1000, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-19', 200.00, 'Paid', 108, 1000, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-21', 200.00, 'Paid', 108, 1000, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-21', 250.00, 'Paid', 104, 1000, 'Credit Card');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-21', 250.00, 'Paid', 102, 1000, 'Cash');

INSERT INTO INVOICE (Date, Total_Amount, Payment_Status, Patient_ID, Insurance_ID, Payment_Method)
VALUES ('2023-11-21', 250.00, 'Paid', 101, 1000, 'Debit Card');


