DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookedID INT)

BEGIN
    DELETE FROM Bookings WHERE BookingID = bookedID;
    SELECT CONCAT('Booking ',bookedID,' cancelled') AS 'Confirmation';
END; //
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM Orders$$
DELIMITER ;

DELIMITER ;