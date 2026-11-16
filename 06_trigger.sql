
USE crownfield_hospital_project;

DELIMITER //

CREATE TRIGGER trg_followup_date
BEFORE INSERT ON FollowUp
FOR EACH ROW
BEGIN
    IF NEW.DueDate < (
        SELECT AppointmentDate
        FROM Appointment
        WHERE AppointmentID = NEW.AppointmentID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Follow-up date cannot be before appointment date';
    END IF;
END //

DELIMITER ;


SELECT
    TRIGGER_NAME,
    EVENT_MANIPULATION,
    EVENT_OBJECT_TABLE,
    ACTION_TIMING
FROM information_schema.TRIGGERS
WHERE TRIGGER_SCHEMA = 'crownfield_hospital_project'
  AND TRIGGER_NAME = 'trg_followup_date';
