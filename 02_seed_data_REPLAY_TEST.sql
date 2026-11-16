USE crownfield_hospital_replay_test;

INSERT INTO Patient
    (PatientID, PatientFirstName, PatientLastName, Postcode)
VALUES
    ('OP001', 'Amina', 'Yusuf', 'NE1 4AB'),
    ('OP002', 'Daniel', 'Reed', 'N16 7QP'),
    ('OP003', 'Sofia', 'Bennett', 'E8 2LD'),
    ('OP004', 'Michael', 'Okoro', 'SE6 3RT');

SELECT * FROM Patient;





INSERT INTO Specialty (SpecialtyName)
VALUES
    ('Glaucoma'),
    ('Retina'),
    ('Cornea');

SELECT * FROM Specialty;


INSERT INTO Clinic (ClinicName)
VALUES
    ('City Road'),
    ('Bedford'),
    ('Croydon');

SELECT * FROM Clinic;


INSERT INTO Clinician (ClinicianName, SpecialtyID)
VALUES
    ('Dr Maya Shah', 1),
    ('Dr Leo Grant', 2),
    ('Dr Priya Nair', 3);

SELECT * FROM Clinician;


INSERT INTO Diagnosis (DiagnosisName)
VALUES
    ('Ocular hypertension'),
    ('Diabetic macular oedema'),
    ('Glaucoma suspect'),
    ('Keratoconus');

SELECT * FROM Diagnosis;


INSERT INTO Medicine (MedicineName)
VALUES
    ('Latanoprost'),
    ('Timolol'),
    ('Aflibercept'),
    ('Sodium chloride drops');

SELECT * FROM Medicine ORDER BY MedicineID;


INSERT INTO Appointment
    (PatientID, ClinicianID, ClinicID,
     AppointmentDate, AppointmentTime, Notes)
VALUES
    ('OP001', 1, 1, '2026-10-05', '09:00:00', 'Review IOP'),
    ('OP002', 2, 1, '2026-10-05', '09:30:00', 'OCT before review'),
    ('OP001', 1, 2, '2026-11-16', '10:15:00', 'Visual field test'),
    ('OP003', 1, 1, '2026-10-06', '11:00:00', 'Monitor'),
    ('OP004', 3, 3, '2026-10-07', '14:00:00', 'Corneal topography');

SELECT * FROM Appointment ORDER BY AppointmentID;


INSERT INTO AppointmentDiagnosis
    (AppointmentID, DiagnosisID)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 3),
    (5, 4);

SELECT *
FROM AppointmentDiagnosis
ORDER BY AppointmentID, DiagnosisID;


INSERT INTO Prescription (AppointmentID)
VALUES
    (1),
    (2),
    (3),
    (5);

SELECT *
FROM Prescription
ORDER BY PrescriptionID;


INSERT INTO PrescriptionItem
    (PrescriptionID, MedicineID)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (4, 4);

SELECT *
FROM PrescriptionItem
ORDER BY PrescriptionItemID;


INSERT INTO FollowUp
    (AppointmentID, DueDate, Priority, Status)
VALUES
    (1, DATE_ADD('2026-10-05', INTERVAL 6 WEEK), 'High', 'Planned'),
    (2, DATE_ADD('2026-10-05', INTERVAL 4 WEEK), 'Urgent', 'Planned'),
    (3, DATE_ADD('2026-11-16', INTERVAL 12 WEEK), 'Routine', 'Planned'),
    (4, DATE_ADD('2026-10-06', INTERVAL 26 WEEK), 'Routine', 'Planned'),
    (5, DATE_ADD('2026-10-07', INTERVAL 8 WEEK), 'Routine', 'Planned');

SELECT *
FROM FollowUp
ORDER BY FollowUpID;


INSERT INTO Patient
    (PatientID, PatientFirstName, PatientLastName, Postcode)
VALUES
    ('OP005', 'Clive', 'Farrow', 'S1 2AB'),
    ('OP006', 'Deborah', 'Hargreaves', 'LS1 3AD'),
    ('OP007', 'Adrian', 'Whitlock', 'M1 4AA'),
    ('OP008', 'Fiona', 'Bramwell', 'B1 2JP'),
    ('OP009', 'Gareth', 'Wainwright', 'SW1 4AB'),
    ('OP010', 'Penelope', 'Marsh', 'L1 3AA'),
    ('OP011', 'Simon', 'Weatherby', 'NE1 2AB'),
    ('OP012', 'Louise', 'Fenwick', 'S2 4AA'),
    ('OP013', 'Trevor', 'Ashcombe', 'LS2 3AB'),
    ('OP014', 'Elaine', 'Pritchard', 'M2 4AA');


SELECT *
FROM Patient
ORDER BY PatientID;

SELECT COUNT(*) AS TotalPatients
FROM Patient;


INSERT INTO Specialty (SpecialtyName)
VALUES
    ('Cataract'),
    ('Paediatric Ophthalmology'),
    ('Oculoplastics'),
    ('Neuro-Ophthalmology'),
    ('Uveitis'),
    ('Ocular Oncology'),
    ('Refractive Surgery'),
    ('Strabismus'),
    ('Low Vision'),
    ('Ocular Surface');

SELECT *
FROM Specialty
ORDER BY SpecialtyID;

SELECT COUNT(*) AS TotalSpecialties
FROM Specialty;


INSERT INTO Clinician (ClinicianName, SpecialtyID)
VALUES
    ('Dr Amy Bucket', 4),
    ('Dr John Bucket', 5),
    ('Dr Elizabeth Warden', 6),
    ('Dr Emmet Hawksworth', 7),
    ('Dr Fred Scuttle', 8),
    ('Dr Jack Bean', 9),
    ('Dr Irma Gobb', 10),
    ('Dr Eric Praline', 11),
    ('Dr Dennis Moore', 12),
    ('Dr Robert Cohen', 13);

SELECT *
FROM Clinician
ORDER BY ClinicianID;

SELECT COUNT(*) AS TotalClinicians
FROM Clinician;


INSERT INTO Clinic (ClinicName)
VALUES
    ('North Wing'),
    ('South Wing'),
    ('East Wing'),
    ('West Wing'),
    ('Central Outpatients'),
    ('Riverside Clinic'),
    ('Parkside Clinic'),
    ('Hillcrest Clinic'),
    ('Lakeside Clinic'),
    ('Oakwood Clinic');

SELECT *
FROM Clinic
ORDER BY ClinicID;

SELECT COUNT(*) AS TotalClinics
FROM Clinic;


INSERT INTO Appointment
    (PatientID, ClinicianID, ClinicID,
     AppointmentDate, AppointmentTime, Notes)
VALUES
    ('OP005', 4, 4, '2026-12-01', '09:00:00', 'Cataract assessment'),
    ('OP006', 5, 5, '2026-12-01', '10:00:00', 'Eye examination'),
    ('OP007', 6, 6, '2026-12-02', '09:30:00', 'Eyelid consultation'),
    ('OP008', 7, 7, '2026-12-02', '11:00:00', 'Vision assessment'),
    ('OP009', 8, 8, '2026-12-03', '10:30:00', 'Inflammation review'),
    ('OP010', 9, 9, '2026-12-04', '09:00:00', 'Specialist consultation'),
    ('OP011', 10, 10, '2026-12-07', '11:30:00', 'Refractive assessment'),
    ('OP012', 11, 11, '2026-12-08', '10:00:00', 'Eye alignment test'),
    ('OP013', 12, 12, '2026-12-09', '09:30:00', 'Low vision assessment'),
    ('OP014', 13, 13, '2026-12-10', '14:00:00', 'Ocular surface review');

SELECT *
FROM Appointment
ORDER BY AppointmentID;

SELECT COUNT(*) AS TotalAppointments
FROM Appointment;


INSERT INTO Diagnosis (DiagnosisName)
VALUES
    ('Cataract'),
    ('Amblyopia'),
    ('Ptosis'),
    ('Optic neuritis'),
    ('Uveitis'),
    ('Uveal melanoma'),
    ('Myopia'),
    ('Strabismus'),
    ('Age-related macular degeneration'),
    ('Dry eye');

SELECT *
FROM Diagnosis
ORDER BY DiagnosisID;

SELECT COUNT(*) AS TotalDiagnoses
FROM Diagnosis;


INSERT INTO AppointmentDiagnosis
    (AppointmentID, DiagnosisID)
VALUES
    (6, 5),
    (7, 6),
    (8, 7),
    (9, 8),
    (10, 9),
    (11, 10),
    (12, 11),
    (13, 12),
    (14, 13),
    (15, 14);

SELECT *
FROM AppointmentDiagnosis
ORDER BY AppointmentID;

SELECT COUNT(*) AS TotalAppointmentDiagnoses
FROM AppointmentDiagnosis;


INSERT INTO Prescription (AppointmentID)
VALUES
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (13),
    (14),
    (15);

SELECT *
FROM Prescription
ORDER BY PrescriptionID;

SELECT COUNT(*) AS TotalPrescriptions
FROM Prescription;


INSERT INTO Medicine (MedicineName)
VALUES
    ('Bimatoprost'),
    ('Brimonidine'),
    ('Dorzolamide'),
    ('Brinzolamide'),
    ('Atropine eye drops'),
    ('Dexamethasone eye drops'),
    ('Sodium hyaluronate eye drops'),
    ('Carbomer eye gel'),
    ('Hypromellose eye drops'),
    ('Olopatadine eye drops');

SELECT *
FROM Medicine
ORDER BY MedicineID;

SELECT COUNT(*) AS TotalMedicines
FROM Medicine;


INSERT INTO Appointment
    (PatientID, ClinicianID, ClinicID,
     AppointmentDate, AppointmentTime, Notes)
VALUES
    ('OP005', 1, 1, '2026-12-14', '09:00', 'Ocular hypertension review'),
    ('OP006', 13, 8, '2026-12-14', '10:00', 'Dry eye treatment review'),
    ('OP007', 8, 8, '2026-12-15', '09:00', 'Uveitis treatment review'),
    ('OP008', 1, 1, '2026-12-15', '10:00', 'Ocular hypertension review'),
    ('OP009', 13, 8, '2026-12-16', '09:00', 'Dry eye treatment review'),
    ('OP010', 8, 8, '2026-12-16', '10:00', 'Uveitis treatment review'),
    ('OP011', 1, 1, '2026-12-17', '09:00', 'Ocular hypertension review'),
    ('OP012', 13, 8, '2026-12-17', '10:00', 'Dry eye treatment review'),
    ('OP013', 1, 1, '2026-12-18', '09:00', 'Ocular hypertension review'),
    ('OP014', 13, 8, '2026-12-18', '10:00', 'Dry eye treatment review');

SELECT *
FROM Appointment
ORDER BY AppointmentID;

SELECT COUNT(*) AS TotalAppointments
FROM Appointment;


INSERT INTO AppointmentDiagnosis
    (AppointmentID, DiagnosisID)
VALUES
    (16, 1),
    (17, 14),
    (18, 9),
    (19, 1),
    (20, 14),
    (21, 9),
    (22, 1),
    (23, 14),
    (24, 1),
    (25, 14);

SELECT *
FROM AppointmentDiagnosis
ORDER BY AppointmentID;

SELECT COUNT(*) AS TotalAppointmentDiagnoses
FROM AppointmentDiagnosis;


UPDATE Prescription
SET AppointmentID = CASE PrescriptionID
    WHEN 5 THEN 16
    WHEN 6 THEN 17
    WHEN 7 THEN 18
    WHEN 8 THEN 19
    WHEN 9 THEN 20
    WHEN 10 THEN 21
    WHEN 11 THEN 22
    WHEN 12 THEN 23
    WHEN 13 THEN 24
    WHEN 14 THEN 25
END
WHERE PrescriptionID BETWEEN 5 AND 14
  AND AppointmentID BETWEEN 6 AND 15;


SELECT
    PrescriptionID,
    AppointmentID
FROM Prescription
ORDER BY PrescriptionID;


INSERT INTO PrescriptionItem
    (PrescriptionID, MedicineID)
VALUES
    (5, 5),
    (6, 11),
    (7, 10),
    (8, 6),
    (9, 12),
    (10, 10),
    (11, 7),
    (12, 13),
    (13, 8),
    (14, 11);

SELECT *
FROM PrescriptionItem
ORDER BY PrescriptionItemID;

SELECT COUNT(*) AS TotalPrescriptionItems
FROM PrescriptionItem;


INSERT INTO FollowUp
    (AppointmentID, DueDate, Priority, Status)
VALUES
    (16, DATE_ADD('2026-12-14', INTERVAL 4 WEEK), 'High', 'Planned'),
    (17, DATE_ADD('2026-12-14', INTERVAL 8 WEEK), 'Routine', 'Planned'),
    (18, DATE_ADD('2026-12-15', INTERVAL 2 WEEK), 'High', 'Planned'),
    (19, DATE_ADD('2026-12-15', INTERVAL 4 WEEK), 'High', 'Planned'),
    (20, DATE_ADD('2026-12-16', INTERVAL 8 WEEK), 'Routine', 'Planned'),
    (21, DATE_ADD('2026-12-16', INTERVAL 2 WEEK), 'High', 'Planned'),
    (22, DATE_ADD('2026-12-17', INTERVAL 4 WEEK), 'High', 'Planned'),
    (23, DATE_ADD('2026-12-17', INTERVAL 8 WEEK), 'Routine', 'Planned'),
    (24, DATE_ADD('2026-12-18', INTERVAL 4 WEEK), 'High', 'Planned'),
    (25, DATE_ADD('2026-12-18', INTERVAL 8 WEEK), 'Routine', 'Planned');

SELECT *
FROM FollowUp
ORDER BY FollowUpID;

SELECT COUNT(*) AS TotalFollowUps
FROM FollowUp;



SELECT 'Patient' AS TableName, COUNT(*) AS RecordCount FROM Patient
UNION ALL SELECT 'Specialty', COUNT(*) FROM Specialty
UNION ALL SELECT 'Clinician', COUNT(*) FROM Clinician
UNION ALL SELECT 'Clinic', COUNT(*) FROM Clinic
UNION ALL SELECT 'Appointment', COUNT(*) FROM Appointment
UNION ALL SELECT 'Diagnosis', COUNT(*) FROM Diagnosis
UNION ALL SELECT 'AppointmentDiagnosis', COUNT(*) FROM AppointmentDiagnosis
UNION ALL SELECT 'Prescription', COUNT(*) FROM Prescription
UNION ALL SELECT 'PrescriptionItem', COUNT(*) FROM PrescriptionItem
UNION ALL SELECT 'Medicine', COUNT(*) FROM Medicine
UNION ALL SELECT 'FollowUp', COUNT(*) FROM FollowUp;


