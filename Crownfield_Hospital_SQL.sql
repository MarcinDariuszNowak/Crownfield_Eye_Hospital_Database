CREATE DATABASE IF NOT EXISTS crownfield_hospital_project
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE crownfield_hospital_project;

CREATE TABLE Patient (
    PatientID VARCHAR(10) NOT NULL,
    PatientFirstName VARCHAR(80) NOT NULL,
    PatientLastName VARCHAR(80) NOT NULL,
    Postcode VARCHAR(12) NOT NULL,
    CONSTRAINT pk_patient PRIMARY KEY (PatientID)
) ENGINE = InnoDB;

CREATE TABLE Specialty (
    SpecialtyID INT NOT NULL AUTO_INCREMENT,
    SpecialtyName VARCHAR(100) NOT NULL,
    CONSTRAINT pk_specialty PRIMARY KEY (SpecialtyID),
    CONSTRAINT uq_specialty_name UNIQUE (SpecialtyName)
) ENGINE = InnoDB;

CREATE TABLE Clinician (
    ClinicianID INT NOT NULL AUTO_INCREMENT,
    ClinicianName VARCHAR(120) NOT NULL,
    SpecialtyID INT NULL,
    CONSTRAINT pk_clinician PRIMARY KEY (ClinicianID),
    CONSTRAINT fk_clinician_specialty FOREIGN KEY (SpecialtyID)
      REFERENCES Specialty (SpecialtyID)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE Clinic (
    ClinicID INT NOT NULL AUTO_INCREMENT,
    ClinicName VARCHAR(100) NOT NULL,
    CONSTRAINT pk_clinic PRIMARY KEY (ClinicID),
    CONSTRAINT uq_clinic_name UNIQUE (ClinicName)
) ENGINE = InnoDB;

CREATE TABLE Appointment (
    AppointmentID INT NOT NULL AUTO_INCREMENT,
    PatientID VARCHAR(10) NOT NULL,
    ClinicianID INT NOT NULL,
    ClinicID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Notes VARCHAR(500) NULL,
    CONSTRAINT pk_appointment PRIMARY KEY (AppointmentID),
    CONSTRAINT fk_appointment_patient FOREIGN KEY (PatientID)
      REFERENCES Patient (PatientID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_clinician FOREIGN KEY (ClinicianID)
      REFERENCES Clinician (ClinicianID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_clinic FOREIGN KEY (ClinicID)
      REFERENCES Clinic (ClinicID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_appointment_date CHECK (AppointmentDate >= '2000-01-01')
) ENGINE = InnoDB;

CREATE TABLE Diagnosis (
    DiagnosisID INT NOT NULL AUTO_INCREMENT,
    DiagnosisName VARCHAR(160) NOT NULL,
    CONSTRAINT pk_diagnosis PRIMARY KEY (DiagnosisID),
    CONSTRAINT uq_diagnosis_name UNIQUE (DiagnosisName)
) ENGINE = InnoDB;

CREATE TABLE AppointmentDiagnosis (
    AppointmentID INT NOT NULL,
    DiagnosisID INT NOT NULL,
    CONSTRAINT pk_appointment_diagnosis PRIMARY KEY (AppointmentID, DiagnosisID),
    CONSTRAINT fk_apptdiag_appointment FOREIGN KEY (AppointmentID)
      REFERENCES Appointment (AppointmentID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_apptdiag_diagnosis FOREIGN KEY (DiagnosisID)
      REFERENCES Diagnosis (DiagnosisID)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE Prescription (
    PrescriptionID INT NOT NULL AUTO_INCREMENT,
    AppointmentID INT NOT NULL,
    CONSTRAINT pk_prescription PRIMARY KEY (PrescriptionID),
    CONSTRAINT fk_prescription_appointment FOREIGN KEY (AppointmentID)
      REFERENCES Appointment (AppointmentID)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE Medicine (
    MedicineID INT NOT NULL AUTO_INCREMENT,
    MedicineName VARCHAR(150) NOT NULL,
    CONSTRAINT pk_medicine PRIMARY KEY (MedicineID),
    CONSTRAINT uq_medicine_name UNIQUE (MedicineName)
) ENGINE = InnoDB;


CREATE TABLE PrescriptionItem (
    PrescriptionItemID INT NOT NULL AUTO_INCREMENT,
    PrescriptionID INT NOT NULL,
    MedicineID INT NOT NULL,
    Dose VARCHAR(80) NULL,
    Route VARCHAR(80) NULL,
    Frequency VARCHAR(100) NULL,
    Duration VARCHAR(100) NULL,
    CONSTRAINT pk_prescription_item PRIMARY KEY (PrescriptionItemID),
    CONSTRAINT fk_item_prescription FOREIGN KEY (PrescriptionID)
      REFERENCES Prescription (PrescriptionID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_item_medicine FOREIGN KEY (MedicineID)
      REFERENCES Medicine (MedicineID)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE FollowUp (
    FollowUpID INT NOT NULL AUTO_INCREMENT,
    AppointmentID INT NOT NULL,
    DueDate DATE NOT NULL,
    Priority VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Planned',
    CONSTRAINT pk_followup PRIMARY KEY (FollowUpID),
    CONSTRAINT fk_followup_appointment FOREIGN KEY (AppointmentID)
      REFERENCES Appointment (AppointmentID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_followup_priority CHECK (Priority IN ('Routine', 'High', 'Urgent')),
    CONSTRAINT chk_followup_status CHECK (Status IN ('Planned', 'Completed', 'Cancelled'))
) ENGINE = InnoDB;


ALTER TABLE FollowUp
  ADD CONSTRAINT uq_followup_appointment UNIQUE (AppointmentID);
