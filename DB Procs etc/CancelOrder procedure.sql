DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN inID INT)
BEGIN
DELETE FROM Orders WHERE OrderID = inID;
SELECT CONCAT('Order ',inID,' is cancelled') AS Confirmation;
END$$
DELIMITER ;
