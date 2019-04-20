USE guacamole_db;
-- Create connection
INSERT INTO guacamole_connection (connection_name, protocol)
VALUES ('DESKTOP_APPLICATION', 'vnc');

-- Determine the connection_id
SELECT *
FROM guacamole_connection
WHERE connection_name = 'DESKTOP_APPLICATION'
  AND parent_id IS NULL;

-- Add parameters to the new connection
INSERT INTO guacamole_connection_parameter
VALUES (1, 'hostname', 'localhost');

INSERT INTO guacamole_connection_parameter
VALUES (1, 'port', '5901');

INSERT INTO guacamole_connection_permission (entity_id, connection_id, permission)
VALUES (2, 1, 'READ') -- Give the user (guest) read rights on the first connection
