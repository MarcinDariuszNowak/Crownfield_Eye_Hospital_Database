
USE crownfield_hospital_project;

SELECT
    p.PatientID,
    p.PatientFirstName,
    p.PatientLastName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Patient p
INNER JOIN Appointment a
    ON p.PatientID = a.PatientID
GROUP BY
    p.PatientID,
    p.PatientFirstName,
    p.PatientLastName
HAVING COUNT(a.AppointmentID) > 1
ORDER BY TotalAppointments DESC, p.PatientID;


SELECT
    a.AppointmentID,
    a.AppointmentDate,
    a.AppointmentTime,
    CONCAT(p.PatientFirstName, ' ', p.PatientLastName)
        AS PatientName,
    c.ClinicianName,
    cl.ClinicName
FROM Appointment a
INNER JOIN Patient p
    ON a.PatientID = p.PatientID
INNER JOIN Clinician c
    ON a.ClinicianID = c.ClinicianID
INNER JOIN Clinic cl
    ON a.ClinicID = cl.ClinicID
ORDER BY
    a.AppointmentDate,
    a.AppointmentTime,
    a.AppointmentID;


SELECT
    a.AppointmentID,
    a.AppointmentDate,
    CONCAT(p.PatientFirstName, ' ', p.PatientLastName)
        AS PatientName,
    a.Notes
FROM Appointment a
LEFT JOIN Prescription pr
    ON a.AppointmentID = pr.AppointmentID
INNER JOIN Patient p
    ON a.PatientID = p.PatientID
WHERE pr.PrescriptionID IS NULL
ORDER BY a.AppointmentID;


SELECT
    a.AppointmentID,
    a.AppointmentDate,
    CONCAT(p.PatientFirstName, ' ', p.PatientLastName)
        AS PatientName,
    a.Notes
FROM Appointment a
INNER JOIN Patient p
    ON a.PatientID = p.PatientID
WHERE a.AppointmentID IN (
    SELECT ad.AppointmentID
    FROM AppointmentDiagnosis ad
    INNER JOIN Diagnosis d
        ON ad.DiagnosisID = d.DiagnosisID
    WHERE d.DiagnosisName = 'Uveitis')
ORDER BY a.AppointmentID;



