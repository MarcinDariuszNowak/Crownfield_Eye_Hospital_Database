
USE crownfield_hospital_replay_test;

UPDATE PrescriptionItem
SET Dose = CONCAT(
    'TEST ONLY - ',
    FORMAT(PrescriptionItemID * 0.5, 1),
    ' mg')
WHERE PrescriptionItemID BETWEEN 1 AND 15
  AND Dose IS NULL;

SELECT PrescriptionItemID, Dose
FROM PrescriptionItem
ORDER BY PrescriptionItemID;
