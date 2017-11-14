CREATE PROCEDURE restaurantInfo()
BEGIN
    ALTER TABLE restaurants
    ADD COLUMN  description varchar(100) DEFAULT "TBD" AFTER `name`,
    ADD COLUMN  active INT DEFAULT 1 AFTER `description` ;
    SELECT * FROM restaurants ORDER BY id;
END
