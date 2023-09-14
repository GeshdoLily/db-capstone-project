DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN bookedDate DATE, IN tableNumber INT)
BEGIN
	DECLARE alreadyBooked INT DEFAULT 0;
    
    SELECT IFNULL(
	(SELECT 1 FROM Bookings
	WHERE BookingDate = bookedDate AND TableNo = tableNumber), 0)
    INTO alreadyBooked;
    
    SELECT CONCAT('Table ', tableNumber, 
    CASE WHEN
    alreadyBooked = 1 THEN ' is already booked'
    ELSE ' is not already booked' END) AS 'Booking status';
    
END$$
DELIMITER ;
