DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN bookedID INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = bookedID;
    SELECT CONCAT('Booking ',bookedID,' cancelled') AS 'Confirmation';
END$$
DELIMITER ;
