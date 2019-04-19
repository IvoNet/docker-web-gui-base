
USE guacamole_db;

-- Generate salt
SET @salt = UNHEX(SHA2(UUID(), 256));

-- Create base entity entry for user
INSERT INTO guacamole_entity (name, type)
VALUES ('ivonet', 'USER');

-- Create user and hash password with salt
INSERT INTO guacamole_user (
    entity_id,
    password_salt,
    password_hash,
    password_date
)
SELECT
    entity_id,
    @salt,
    UNHEX(SHA2(CONCAT('secret', HEX(@salt)), 256)),
    CURRENT_TIMESTAMP
FROM guacamole_entity
WHERE
    name = 'ivonet'
    AND type = 'USER';
