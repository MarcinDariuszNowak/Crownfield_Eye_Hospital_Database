
SELECT
    USER() AS LoginAccount,
    CURRENT_USER() AS AuthenticatedAccount,
    DATABASE() AS ActiveDatabase;


SHOW GRANTS FOR CURRENT_USER;


CREATE ROLE IF NOT EXISTS 'hospital_readonly_test'@'localhost';

GRANT SELECT
ON crownfield_hospital_replay_test.*
TO 'hospital_readonly_test'@'localhost';

SHOW GRANTS FOR 'hospital_readonly_test'@'localhost';



CREATE USER 'hospital_viewer_test'@'localhost'
IDENTIFIED BY RANDOM PASSWORD;


GRANT 'hospital_readonly_test'@'localhost'
TO 'hospital_viewer_test'@'localhost';


SET DEFAULT ROLE 'hospital_readonly_test'@'localhost'
TO 'hospital_viewer_test'@'localhost';


SHOW GRANTS FOR 'hospital_viewer_test'@'localhost';


