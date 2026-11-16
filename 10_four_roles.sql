
USE crownfield_hospital_replay_test;

CREATE ROLE IF NOT EXISTS
    'hospital_admin_demo'@'localhost',
    'hospital_doctor_demo'@'localhost',
    'hospital_reception_demo'@'localhost',
    'hospital_patient_demo'@'localhost';


GRANT ALL PRIVILEGES
ON crownfield_hospital_replay_test.*
TO 'hospital_admin_demo'@'localhost';


GRANT SELECT
ON crownfield_hospital_replay_test.*
TO 'hospital_doctor_demo'@'localhost';

GRANT UPDATE (Notes)
ON crownfield_hospital_replay_test.Appointment
TO 'hospital_doctor_demo'@'localhost';


GRANT SELECT, INSERT, UPDATE
ON crownfield_hospital_replay_test.Patient
TO 'hospital_reception_demo'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON crownfield_hospital_replay_test.Appointment
TO 'hospital_reception_demo'@'localhost';


GRANT SELECT
ON crownfield_hospital_replay_test.Clinic
TO 'hospital_patient_demo'@'localhost';

GRANT SELECT
ON crownfield_hospital_replay_test.Specialty
TO 'hospital_patient_demo'@'localhost';


SHOW GRANTS FOR 'hospital_admin_demo'@'localhost';
SHOW GRANTS FOR 'hospital_doctor_demo'@'localhost';
SHOW GRANTS FOR 'hospital_reception_demo'@'localhost';
SHOW GRANTS FOR 'hospital_patient_demo'@'localhost';
