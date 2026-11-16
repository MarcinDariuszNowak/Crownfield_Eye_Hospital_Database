
SELECT
    USER() AS LoginAccount,
    CURRENT_ROLE() AS ActiveRole;

SELECT COUNT(*) AS TotalPatients
FROM crownfield_hospital_replay_test.Patient;



UPDATE crownfield_hospital_replay_test.Patient
SET PatientLastName = 'SecurityTest'
WHERE 1 = 0;


INSERT INTO crownfield_hospital_replay_test.Patient
    (PatientID, PatientFirstName, PatientLastName, Postcode)
SELECT 'TST097', 'Test', 'Patient', 'S1 1AA'
WHERE 1 = 0;

DELETE FROM crownfield_hospital_replay_test.Patient
WHERE 1 = 0;
