DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN bookedID INT, IN bookedDate DATE)
BEGIN
    UPDATE Bookings SET BookingDate = bookedDate WHERE BookingID = bookedID;
    SELECT CONCAT('Booking ',bookedID,' updated') AS 'Confirmation';
END$$
DELIMITER ;
