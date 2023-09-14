select `m`.`MenuName` AS `MenuName` from `menus` `m` where `m`.`MenuID` in (select `o`.`MenuID` from `orders` `o` group by `o`.`MenuID` having (count(`o`.`MenuID`) > 2));
