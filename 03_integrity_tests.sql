
USE crownfield_hospital_project;

SELECT 'Patient' AS TableName, COUNT(*) AS RecordCount FROM Patient
UNION ALL
SELECT 'Specialty', COUNT(*) FROM Specialty
UNION ALL
SELECT 'Clinician', COUNT(*) FROM Clinician
UNION ALL
SELECT 'Clinic', COUNT(*) FROM Clinic
UNION ALL
SELECT 'Appointment', COUNT(*) FROM Appointment
UNION ALL
SELECT 'Diagnosis', COUNT(*) FROM Diagnosis
UNION ALL
SELECT 'AppointmentDiagnosis', COUNT(*) FROM AppointmentDiagnosis
UNION ALL
SELECT 'Prescription', COUNT(*) FROM Prescription
UNION ALL
SELECT 'PrescriptionItem', COUNT(*) FROM PrescriptionItem
UNION ALL
SELECT 'Medicine', COUNT(*) FROM Medicine
UNION ALL
SELECT 'FollowUp', COUNT(*) FROM FollowUp;


SELECT 'Prescriptions without items' AS Test,
       COUNT(*) AS Problems
FROM Prescription p
LEFT JOIN PrescriptionItem pi
    ON p.PrescriptionID = pi.PrescriptionID
WHERE pi.PrescriptionItemID IS NULL

UNION ALL

SELECT 'Items without medicines',
       COUNT(*)
FROM PrescriptionItem pi
LEFT JOIN Medicine m
    ON pi.MedicineID = m.MedicineID
WHERE m.MedicineID IS NULL

UNION ALL

SELECT 'Follow-ups without appointments',
       COUNT(*)
FROM FollowUp f
LEFT JOIN Appointment a
    ON f.AppointmentID = a.AppointmentID
WHERE a.AppointmentID IS NULL

UNION ALL

SELECT 'Items missing treatment details',
       COUNT(*)
FROM PrescriptionItem
WHERE Dose IS NULL
   OR Route IS NULL
   OR Frequency IS NULL
   OR Duration IS NULL;




SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'crownfield_hospital_project'
ORDER BY TABLE_NAME, CONSTRAINT_TYPE;



SELECT
    TABLE_NAME,
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'crownfield_hospital_project'
  AND TABLE_NAME IN ('prescriptionitem', 'followup')
ORDER BY TABLE_NAME, ORDINAL_POSITION;



SELECT
    tc.TABLE_NAME,
    tc.CONSTRAINT_NAME,
    cc.CHECK_CLAUSE
FROM information_schema.TABLE_CONSTRAINTS AS tc
JOIN information_schema.CHECK_CONSTRAINTS AS cc
    ON tc.CONSTRAINT_SCHEMA = cc.CONSTRAINT_SCHEMA
   AND tc.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
WHERE tc.TABLE_SCHEMA = 'crownfield_hospital_project'
  AND tc.CONSTRAINT_TYPE = 'CHECK'
ORDER BY tc.TABLE_NAME, tc.CONSTRAINT_NAME;



START TRANSACTION;

UPDATE FollowUp
SET Priority = 'Invalid'
WHERE FollowUpID = 1;

ROLLBACK;

SELECT FollowUpID, Priority
FROM FollowUp
WHERE FollowUpID = 1;


START TRANSACTION;

INSERT INTO FollowUp
    (AppointmentID, DueDate, Priority, Status)
VALUES
    (6, '2026-11-30', 'Routine', 'Planned');

ROLLBACK;

SELECT COUNT(*) AS FollowUpsForAppointment6
FROM FollowUp
WHERE AppointmentID = 6;


START TRANSACTION;

INSERT INTO Patient
    (PatientID, PatientFirstName, PatientLastName, Postcode)
VALUES ('TST086', 'Test', 'Patient', 'S1 1AA');

SELECT * FROM Patient WHERE PatientID = 'TST086';

UPDATE Patient
SET PatientLastName = 'UpdatedExample'
WHERE PatientID = 'TST086';

SELECT * FROM Patient WHERE PatientID = 'TST086';

DELETE FROM Patient
WHERE PatientID = 'TST086';

SELECT COUNT(*) AS AfterDelete
FROM Patient WHERE PatientID = 'TST086';

ROLLBACK;

SELECT COUNT(*) AS AfterRollback
FROM Patient WHERE PatientID = 'TST086';

SELECT COUNT(*) AS TotalPatients
FROM Patient;


START TRANSACTION;

INSERT INTO Patient
    (PatientID, PatientFirstName, PatientLastName, Postcode)
VALUES ('TST087', 'Rollback', 'Test', 'S1 1AA');

SELECT COUNT(*) AS BeforeRollback
FROM Patient WHERE PatientID = 'TST087';

ROLLBACK0;

SELECT COUNT(*) AS AfterRollback
FROM Patient WHERE PatientID = 'TST087';

SELECT COUNT(*) AS TotalPatients
FROM Patient;


