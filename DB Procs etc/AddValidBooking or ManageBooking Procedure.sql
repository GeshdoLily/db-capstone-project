DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(bookedDate DATE, tableNumber INT, cusId INT)
BEGIN
    
    DECLARE alreadyBooked INT DEFAULT 0;

    START TRANSACTION;
    
    SELECT IFNULL(
	(SELECT 1 FROM Bookings
	WHERE BookingDate = bookedDate AND TableNo = tableNumber), 0)
    INTO alreadyBooked;
    
    IF alreadyBooked = 0 THEN
		INSERT INTO `littlelemondb`.`bookings`
		(`BookingDate`,
		`TableNo`,
		`CustomerID`,
		`StaffID`)
		VALUES
        (bookedDate,
		tableNumber,
		cusId,
		1);
        COMMIT;
		SELECT CONCAT('Table ',tableNumber,' is now booked!') AS 'Booking Status';
    ELSE
        ROLLBACK;
		SELECT CONCAT('Table ',tableNumber,' is already booked - booking cancelled') AS 'Booking Status';
    END IF;
END$$
DELIMITER ;
