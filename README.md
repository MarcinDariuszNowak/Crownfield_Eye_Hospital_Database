# Crownfield Eye Hospital Database

## About the project

This is my project for "Introduction to Database" module.
I used MySQL to build a database for a fictional eye hospital.
The database helps organise patients, doctors, clinics, appointments, diagnoses, medicines, prescriptions and follow-up visits.

The database has 11 tables and 175 sample records. All patient details are fictional.

## Project files

- `Crownfield_Hospital_SQL.sql` - creates the database and tables.
- `02_seed_data.sql` - adds the sample data.
- `03_integrity_tests.sql` - tests rules and transactions.
- `04_individual_queries.sql` - contains my SQL queries.
- `05_stored_procedure.sql` - creates a procedure to find a patient's appointments.
- `06_trigger.sql` - checks follow-up dates.
- `07_security_audit.sql` - checks users and permissions.
- `08_security_permission_tests.sql` - tests a read-only user.
- `09_prescription_review.sql` - checks missing prescription details.
- `10_four_roles.sql` - creates four example user roles.
- `11_synthetic_doses.sql` - adds clearly labelled test values to the test database.
- `12_data_protection_demo.sql` - shows how to encrypt and decrypt a sample note.

There are also two separate test files: `Crownfield_Hospital_REPLAY_TEST.sql` and `02_seed_data_REPLAY_TEST.sql`.

## How to run the project

1. Open MySQL Workbench and connect to a local MySQL server.
2. On a new database, run `Crownfield_Hospital_SQL.sql` first.
3. Run `02_seed_data.sql` once to add the sample records.
4. Run the query and procedure files to see their results. Create the trigger once before testing it.
5. Run the integrity and security tests separately, using the correct account. Some tests are meant to show an error.

Do not run the first two files again on a database that already has tables and data. To test a fresh copy, use the two `REPLAY_TEST` files instead.

## Testing and security

I tested SQL queries, table relationships and transactions, including `ROLLBACK`.
I also tested a read-only user. The user could view data but could not add, change or delete it.
I created four example roles: administrator, doctor, receptionist and patient.
I used AES encryption to protect and then read a fictional note in a temporary table.

## Important notes

This is a student project, not a real hospital system.
Some prescription fields are empty. The example doses in the test database are marked `TEST ONLY`. They are not medical instructions.
The security examples are for learning and are not a complete hospital security system.

## My contribution

I worked on the SQL scripts, added sample data, ran the tests and checked the results in MySQL Workbench.
