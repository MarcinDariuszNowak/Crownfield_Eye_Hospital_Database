
USE crownfield_hospital_project;

SELECT
    pi.PrescriptionItemID,
    m.MedicineName,
    pi.Dose,
    pi.Route,
    pi.Frequency,
    pi.Duration
FROM PrescriptionItem pi
INNER JOIN Medicine m
    ON pi.MedicineID = m.MedicineID
ORDER BY pi.PrescriptionItemID;


SELECT
    COUNT(*) AS TotalItems,
    SUM(CASE
        WHEN Dose IS NULL
          OR Route IS NULL
          OR Frequency IS NULL
          OR Duration IS NULL
        THEN 1 ELSE 0 END) AS IncompleteItems,
    SUM(CASE
        WHEN Dose IS NOT NULL
         AND Route IS NOT NULL
         AND Frequency IS NOT NULL
         AND Duration IS NOT NULL
        THEN 1 ELSE 0 END) AS CompleteItems
FROM PrescriptionItem;
