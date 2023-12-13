# HealthCare-Management-System  
An advanced database solution carefully designed to enhance hospital operations. This database transforms healthcare management by consolidating critical data on Patients, Doctors, Appointments, Patient Records, Insurance, and Invoices. It optimizes the distribution of medical resources and improves patient care by enabling accurate matching of doctors with patients based on user inputs. With its easy-to-use interface and robust features, this database reflects the hospital's dedication to efficiency, precision, and tailored healthcare delivery, ensuring top-notch service for medical practitioners and patients.

## Assumptions and Constraints
**Assumptions:**  

1. Patient insurance coverage is not mandatory. The system's doctors attend to insured and uninsured patients, ensuring inclusive healthcare services.  
2. The hospital management system is designed with scalability and expandability in mind. It can seamlessly accommodate growth, additional functionalities, and increased data volume without compromising efficiency.  
3. The system ensures that access to sensitive patient information is strictly controlled through well-defined user permissions, granting appropriate access levels based on roles and responsibilities.  


**Constraints:**  

1. The foreign key Insurance_ID in the Invoice entity & patient entity can be null. Also, the Prescribed Medicines attribute in Patient_Record can be null.  
2. The Invoice entity has a Payment_Status attribute, which accepts only two values: Paid and Pending.  
3. In the Appointment entity, the status attribute only accepts three values: Confirmed, Cancelled, and Rescheduled.  


## Requirements Definition Documentation
**Business Rule :**
1.	A PATIENT can have one or more PATIENT_RECORD.
2.	A PATIENT_RECORD has details about one PATIENT.
3.	A DOCTOR can have one or more appointments scheduled.
4.	An APPOINTMENT can be scheduled for one DOCTOR.
5.	A DOCTOR can be associated with one or more than one PATIENT_RECORD.
6.	A PATIENT_RECORD must contain only one DOCTOR.
7.	A PATIENT can book one or more than one APPOINTMENT.
8.	An APPOINTMENT is linked to only one PATIENT.
9.	A PATIENT can have one or more than one INVOICE.
10.	An INVOICE billing is generated for a particular PATIENT.
11.	An INSURANCE can be taken by one PATIENT.
12.	A PATIENT may or may not have an INSURANCE.
13.	An INVOICE may or may not have INSURANCE details.
14.	An INSURANCE can be linked with one INVOICE.
 
## Entity and Attribute Description :
Entity Name: **PATIENT**  
Entity Description: The "PATIENT" entity represents individuals receiving medical care and treatment within a healthcare system or facility.  
Main Attributes of PATIENT:  
1. **Patient_ID:** (Primary Key) This unique identifier for each patient within the healthcare system allows for easy tracking and referencing of patient records.  
2. **Name:** The patient's full name, which includes their first name, middle name (if applicable), and last name.  
3. **DateOfBirth:** The patient's date of birth is essential for determining their age and calculating various medical metrics.  
4. **Address:** The patient's residential address, providing information about where they live. This may include street address, city, state, and postal code.  
5. **Insurance_ID (Foreign key):** A reference to the patient's insurance information, typically linked to another table in the database, where detailed information about the patient's insurance plan can be found. This foreign key establishes a relationship between the patient and their insurance.   
6. **Gender:** The patient's gender, which can be categorized as male, female, or other, depending on the healthcare system's data standards.  
7. **Phone:** The patient's contact phone number can be used for communication and appointment scheduling.  
Collectively, these attributes provide essential information about each patient, helping healthcare providers manage patient records, track their medical history, and communicate with them effectively.  

Entity Name: **PATIENT_RECORD**
Entity Description: The "PATIENT_Record" entity represents individual patients' medical records and history within a healthcare system or facility. It contains information about various aspects of a patient's healthcare journey.
Main Attributes of the Patient_Record Entity:
1. **Record_ID:** This unique identifier for each patient record allows easy tracking and referencing of specific medical records.   
2. **Date:** When the patient's medical record was created or updated. It helps in tracking the chronological history of a patient's healthcare interactions.  
3. **Test Results:** Information related to medical tests, including the results of diagnostic tests, laboratory work, and other medical assessments. This attribute may include data such as test names, values, and interpretations.  
4. **Patient_ID (Foreign key):** A reference to the patient's unique identifier, linking this patient record to the corresponding patient in the "PATIENT" entity. This establishes a relationship between a patient and their medical records.  
5. **Emergency_Contact:** Details of the patient's designated emergency contact person, including their name, relationship to the patient, and contact information. This information is essential for reaching out in case of emergencies.  
6. **Prescription_Medicines:** Information about the medications prescribed to the patient, including the name of the drug, dosage, frequency, and any specific instructions. This attribute helps in managing the patient's treatment plan.  
7. **Doctor_ID (Foreign key):** A reference to the unique identifier of the healthcare provider (doctor or physician) responsible for the patient's care. This foreign key connects the patient record and the attending physician.  
The "PATIENT_RECORD" entity stores and manages detailed information about a patient's medical history, including test results, prescribed medications, and the healthcare professionals involved in their care. It plays a crucial role in the healthcare system for monitoring, diagnosing, and treating patients.  

Entity Name: **DOCTOR**  
Entity Description: The "DOCTOR" entity represents healthcare professionals who provide medical services within a healthcare system or facility. This entity stores information about doctors, allowing for the management of their records and patient assignments.  
Main Attributes of the Doctor Entity:  
•	Doctor_ID: This is a unique identifier for each doctor within the healthcare system. It is used for tracking and referencing doctor-specific information.  
•	Name: The doctor's full name, which includes their first name, middle name (if applicable), and last name.  
•	Phone: The contact phone number for the doctor, which can be used for communication, scheduling appointments, or reaching out for medical consultations.  
•	Specialization: The medical field or area of expertise in which the doctor practices. This attribute indicates the specific branch of medicine in which the doctor has training and experience, such as cardiology, pediatrics, surgery, etc.  
•	Email: The doctor's email address serves as a primary electronic contact method for professional communication.  
•	Gender: The doctor's gender, typically categorized as male, female, or other, based on the healthcare system's data standards.  
Collectively, these attributes provide essential information about each doctor in the healthcare system, helping manage their records, patient assignments, and contact information. It also allows for categorization based on specialization and gender, which can be helpful for various administrative and patient care purposes.  


Entity Name: **APPOINTMENT**
Entity Description: The "Appointment" entity represents scheduled medical appointments within a healthcare system or facility. It includes appointment information, allowing healthcare providers to efficiently manage patient schedules and appointments.
Main Attributes of the Appointment Entity:
•	Appointment_no: A unique identifier for each appointment. This attribute helps track and reference specific appointment records and distinguish one appointment from another.
•	Date: The date on which the appointment is scheduled to occur. This attribute indicates when the patient is expected to meet with the doctor.
•	Time: The specific time of day at which the appointment is scheduled. It provides the appointment's exact timing within the scheduled date.
•	Reason: The reason for the appointment, which describes the purpose or nature of the medical visit. This information helps healthcare providers prepare for the patient's needs.
•	Patient_ID (Foreign key): A reference to the unique identifier of the patient who has scheduled the appointment, establishing a connection between the patient and the appointment. This linkage allows the healthcare system to associate appointments with specific patients.
•	Doctor_ID (Foreign Key) refers to the unique identifier of the doctor or healthcare provider with whom the appointment is scheduled. This foreign key establishes a relationship between the appointment and the attending physician.
•	Status: The status of the appointment, which can indicate whether it's confirmed, canceled, or rescheduled. This attribute helps track the appointment's current state within the scheduling process.
The "Appointment" entity is designed to manage and track scheduled medical appointments, providing essential details such as appointment date, time, reason, patient and doctor information, and appointment status. This information is crucial for healthcare facilities to maintain organized and efficient patient scheduling and promptly ensure patients receive the care they need.

Entity Name: **INVOICE**
Entity Description: The "Invoice" entity represents financial documents generated by a healthcare system or medical facility to bill patients for the services they have received. It includes information related to invoicing, payment tracking, and patient billing.
Main Attributes of the Invoice Entity:
•	Invoice_ID: A unique identifier for each invoice for tracking and referencing specific invoice records. This attribute ensures that each invoice is distinct and can be easily identified.
•	Date: The date on which the invoice is issued. It specifies when the billing statement is generated and presented to the patient for payment.
•	Total_Amount: The total amount due on the invoice represents the cost of medical services or treatments provided to the patient. This may include charges for consultations, procedures, medications, or any other healthcare services.
•	Payment_Status: The current status of the invoice's payment, indicating whether it has been paid, partially paid, or remains unpaid. It helps in monitoring the financial transactions associated with the invoice.
•	Patient_ID (Foreign key): A reference to the unique identifier of the patient for whom the invoice is generated. This links the invoice to the specific patient's billing information, allowing for accurate billing.
•	Insurance_ID (Foreign Key) refers to the unique identifier of the patient's insurance information. It establishes a connection between the invoice and the patient's insurance plan, which can be used to coordinate benefits and billing.
•	Payment_Method: The method by which the patient is expected to make the payment, such as cash, credit card, check, or through insurance. This attribute specifies how the patient is expected to settle their financial obligation.
The "Invoice" entity serves the crucial function of billing patients for healthcare services and tracking payment status. It includes the invoice date, total amount due, payment status, patient details, insurance information, and the payment method. This entity is essential for managing the financial aspects of healthcare operations and ensuring accurate and timely billing.

Entity Name: **INSURANCE**
Entity Description: The "Insurance" entity represents insurance companies or providers that offer insurance coverage to individuals, including policies related to healthcare, medical, or other forms of insurance. It contains information about insurance providers and policies.
Main Attributes of the Insurance Entity:
•	Insurance_ID: A unique identifier for each insurance provider or policy within the healthcare system or facility. This attribute ensures that each insurance entry can be easily referenced and distinguished.
•	Company_Name: The insurance company or provider offering the insurance coverage. This attribute specifies the organization responsible for providing insurance services.
•	Contact_Person: The name of the individual or department within the insurance company that can be contacted for inquiries or assistance. It may include the name of a specific contact person or department name.
•	Contact_Number: The contact phone number for the insurance company or contact person. This phone number is a primary means of communication with the insurance provider.
•	Email: The email address for contacting the insurance company or specific contact person. It provides an electronic means of communication for inquiries or information exchange.
The "Insurance" entity is designed to store information about insurance providers, making it useful for healthcare facilities to manage insurance policies and coordinate with insurance companies regarding patient coverage, claims, and billing. This information can be used to ensure that patients receive the benefits they are entitled to under their insurance policies.

## Relationship and Cardinality:
Relationship: takes between INSURANCE and PATIENT 
Cardinality: 0:1 between INSURANCE and PATIENT 
Business rule: A PATIENT may have zero or one INSURANCE, but INSURANCE is taken for a PATIENT.

Relationship: books between PATIENT and APPOINTMENT 
Cardinality: 1:M between PATIENT and APPOINTMENT 
Business rule: Each PATIENT can have many APPOINTMENTS, but an APPOINTMENT is linked to a PATIENT.

Relationship: scheduled between DOCTOR an APPOINTMENT
Cardinality: 1:M between DOCTOR an APPOINTMENT
Business rule: Each APPOINTMENT is scheduled with one DOCTOR, and a DOCTOR can be scheduled for many APPOINTMENTs.
 
Relationship: has between PATIENT and PATIENT RECORD 
Cardinality: 1:M between PATIENT and PATIENT RECORD 
Business rule: Every PATIENT can have one or more than one PATIENT RECORD, and a PATIENT_RECORD is associated with a PATIENT.

Relationship: has between DOCTOR and PATIENT RECORD 
Cardinality: 1:M between DOCTOR and PATIENT RECORD 
Business rule: Every PATIENT_RECORD has a DOCTOR, and a DOCTOR is associated with one or many PATIENT_RECORD.
 
Relationship: billed between PATIENT and INVOICE 
Cardinality: 1:M between PATIENT and INVOICE 
Business rule: A PATIENT can be billed for one or many INVOICEs, and each INVOICE is associated with a PATIENT.
 
Relationship: has between INSURANCE and INVOICE 
Cardinality: 0:1 between INSURANCE and INVOICE
Business rule: Each INVOICE may be linked to one INSURANCE, but an INSURANCE is linked to an INVOICE.

