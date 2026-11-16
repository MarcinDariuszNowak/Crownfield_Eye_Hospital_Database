
USE crownfield_hospital_replay_test;


SET SESSION block_encryption_mode = 'aes-256-cbc';
SET @demo_key = RANDOM_BYTES(32);
SET @demo_iv = RANDOM_BYTES(16);


CREATE TEMPORARY TABLE DemoProtectedNotes (
    DemoID INT PRIMARY KEY,
    EncryptedNote VARBINARY(255) NOT NULL,
    InitVector BINARY(16) NOT NULL
);


INSERT INTO DemoProtectedNotes
    (DemoID, EncryptedNote, InitVector)
VALUES (
    1,
    AES_ENCRYPT('DEMO ONLY: confidential clinical note',
                @demo_key, @demo_iv),
    @demo_iv);


SELECT
    DemoID,
    HEX(EncryptedNote) AS EncryptedValue,
    CAST(AES_DECRYPT(EncryptedNote, @demo_key, InitVector)
         AS CHAR) AS DecryptedValue
FROM DemoProtectedNotes;
