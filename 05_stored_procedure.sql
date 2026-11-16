
USE crownfield_hospital_project;

CREATE PROCEDURE GetPatientAppointments(
    IN requestedPatientID VARCHAR(10))
READS SQL DATA
SELECT
    a.AppointmentID,
    a.AppointmentDate,
    a.AppointmentTime,
    c.ClinicianName,
    cl.ClinicName,
    a.Notes
FROM Appointment a
INNER JOIN Clinician c
    ON a.ClinicianID = c.ClinicianID
INNER JOIN Clinic cl
    ON a.ClinicID = cl.ClinicID
WHERE a.PatientID = requestedPatientID
ORDER BY a.AppointmentDate, a.AppointmentTime;

CALL GetPatientAppointments('OP005');
