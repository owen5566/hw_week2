create database dinBanDon default character set utf8;
use dinBanDon;
drop table if exists users;
create table users(
    uId int auto_increment not null primary key,
    userName varchar(20) null,
    uEmail varchar(50) null,
    uPassword varchar(20) null,
    nickName varchar(20) null,
    uTel varchar(15) null,
    uJoinDate timestamp,
    uAdmin enum('y','n') not null default 'n'
);
INSERT INTO `users` (`uId`, `userName`, `uEmail`, `upassword`, `nickName`, `utel`, `ujoinDate`, `uadmin`) VALUES (NULL, 'owen5566', 'owen5566@mail.com', 'owen5566', 'Owen', '0988-995-995', current_timestamp(), 'y');
INSERT INTO `users` (`uId`, `userName`, `uEmail`, `upassword`, `nickName`, `utel`, `ujoinDate`, `uadmin`) VALUES (NULL, 'rb0229', 'rb0229@mail.com', 'rb0229', 'RB', '0902-995-995', current_timestamp(), 'n');
INSERT INTO `users` (`uId`, `userName`, `uEmail`, `upassword`, `nickName`, `utel`, `ujoinDate`, `uadmin`) VALUES (NULL, 'brave0727', 'brave0727@mail.com', 'brave0727', 'Brave', '0904-995-995', current_timestamp(), 'n');

create table restuarants(
    rId int auto_increment not null primary key,
    rName varchar(20) null,
    rAddress varchar(50) null,
    rEmail varchar(50) null,
    rTel varchar(15) null,
    rOpentime varchar(50) null,
    rCategory int,
    rDesc varchar(50),
    orderCondition varchar(50)/*外送條件*/
);

create table rCategory(
    rcId int auto_increment not null primary key,
    rcName varchar(20)
);
INSERT INTO `rcategory` (`rcId`, `rcName`) VALUES (NULL, '中式便當');
INSERT INTO `rcategory` (`rcId`, `rcName`) VALUES (NULL, '麵食');
INSERT INTO `rcategory` (`rcId`, `rcName`) VALUES (NULL, '下午茶');
INSERT INTO `rcategory` (`rcId`, `rcName`) VALUES (NULL, '飲料');
INSERT INTO `rcategory` (`rcId`, `rcName`) VALUES (NULL, '火鍋');
INSERT INTO `rcategory` (`rcId`, `rcName`) VALUES (NULL, '其他');


ALTER TABLE `restuarants` 
    ADD CONSTRAINT `fk_rCategory` FOREIGN KEY (`rCategory`) REFERENCES `rcategory`(`rcId`) 
    ON DELETE SET NULL 
    ON UPDATE CASCADE;

INSERT INTO `restuarants` (`rId`, `rName`, `rAddress`, `rEmail`, `rTel`, `rOpentime`, `rCategory`, `rDesc`, `orderCondition`) VALUES (NULL, '御弁當', '台灣大道三段99號B1', NULL, '04-2252-1717', '1100-1930', '1', '主餐附三菜一湯，可加減飯量(備註)', '4個以上可外送');
INSERT INTO `restuarants` (`rId`, `rName`, `rAddress`, `rEmail`, `rTel`, `rOpentime`, `rCategory`, `rDesc`, `orderCondition`) VALUES (NULL, '金湯_老麵館', '台中市黎明路二段336號', NULL, '04-2252-0277', '1100-1930', '2', '*大碗(飯,麵)一律加25元
*冬粉與麵類同價(請註記)', '$500以上可外送，1030前訂');
INSERT INTO `restuarants` (`rId`, `rName`, `rAddress`, `rEmail`, `rTel`, `rOpentime`, `rCategory`, `rDesc`, `orderCondition`) VALUES (NULL, '派克脆皮雞排-台中黎明店', '臺中市南屯區永定里黎明路二段56號', NULL, '04 2385 0200
', '1100-2230', '3', '雞排有四種口味,原味,梅粉,胡椒,辣味;雞排要切請註明', '$200以上可外送');
INSERT INTO `restuarants` (`rId`, `rName`, `rAddress`, `rEmail`, `rTel`, `rOpentime`, `rCategory`, `rDesc`, `orderCondition`) VALUES (NULL, '可不可熟成紅茶 福星店', '	
台中市西屯區福星路649號', NULL, '04-27085116', '1100-2130', '4', '濃郁好喝的紅茶；冷露(冬瓜)
可點無糖即不會另外加糖', '$200以上可外送');




create table products(
    pId int auto_increment not null primary key,
    rId int null, 
    pName varchar(20) null, 
    pCategory varchar(10) null,/*每間餐廳分類可能有些許不同，就不像餐廳類別一樣另外建表了*/
    unitPrice int null
);
ALTER TABLE `products` ADD CONSTRAINT `fk_rid` FOREIGN KEY (`rId`) REFERENCES `restuarants`(`rId`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE;

INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '1', '排骨便當', '便當', '80');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '1', '控肉便當', '便當', '80');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '1', '雞腿便當', '便當', '80');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '2', '牛肉麵', '麵類', '90');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '2', '酸辣湯餃', '水餃/鍋貼', '70');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '3', '脆皮雞排', '雞排', '60');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '3', '甜不辣', '炸物點心', '50');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '4', '紅茶', '茶類', '30');
INSERT INTO `products` (`pId`, `rId`, `pName`, `pCategory`, `unitPrice`) VALUES (NULL, '4', '黑糖鮮奶', '奶類', '55');

create table orders(
    oId int auto_increment not null primary key,
    startTime timestamp,
    closeTime datetime null,
    adminId int null,/*表單管理者*/
    ifLock enum('y','n') not null default 'n' /*給個開關讓管理者可以上鎖表單*/
);
ALTER TABLE `orders` ADD CONSTRAINT `fk_adminID_uID` FOREIGN KEY (`adminId`) REFERENCES `users`(`uId`) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

INSERT INTO `orders` (`oId`, `startTime`, `closeTime`, `adminId`, `ifLock`) VALUES (NULL, current_timestamp(), '2020-08-10 11:00:00', '1', 'n');
INSERT INTO `orders` (`oId`, `startTime`, `closeTime`, `adminId`, `ifLock`) VALUES (NULL, current_timestamp(), '2020-08-11 11:00:00', '1', 'y');

create table orderDetails(
    odId int auto_increment not null primary key,
    oId int not null,
    uId int not null,
    pId int not null,
    amount int not null default 1,
    odDesc varchar(50),/*可以加點備註，如小辣*/
    patYet enum('y','n') not null default 'n'
);
ALTER TABLE `orderdetails` ADD CONSTRAINT `fk_oId` FOREIGN KEY (`oId`) REFERENCES `orders`(`oId`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE; 
ALTER TABLE `orderdetails` ADD CONSTRAINT `fk_uId` FOREIGN KEY (`uId`) REFERENCES `users`(`uId`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE; 
ALTER TABLE `orderdetails` ADD CONSTRAINT `fk_pId` FOREIGN KEY (`pId`) REFERENCES `products`(`pId`) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE;

INSERT INTO `orderdetails` (`odId`, `oId`, `uId`, `pId`, `amount`, `odDesc`, `patYet`) VALUES (NULL, '1', '1', '1', '1', '不要淋肉湯', 'n');
INSERT INTO `orderdetails` (`odId`, `oId`, `uId`, `pId`, `amount`, `odDesc`, `patYet`) VALUES (NULL, '1', '2', '2', '1', NULL, 'y');
INSERT INTO `orderdetails` (`odId`, `oId`, `uId`, `pId`, `amount`, `odDesc`, `patYet`) VALUES (NULL, '2', '3', '5', '1', NULL, 'n');
INSERT INTO `orderdetails` (`odId`, `oId`, `uId`, `pId`, `amount`, `odDesc`, `patYet`) VALUES (NULL, '2', '1', '8', '5', '都微糖少冰', 'n');
