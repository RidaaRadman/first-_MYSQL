-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `admin` (
    `AdminID` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `email` string  NOT NULL ,
    `phon` int  NOT NULL ,
    `Address` string  NULL ,
    `OpreationsID` int  NOT NULL ,
    `employID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    PRIMARY KEY (
        `AdminID`
    )
);

CREATE TABLE `opreations` (
    `OpreationsID` int  NOT NULL ,
    `AdminID` int  NOT NULL ,
    `name` string  NOT NULL ,
    `employID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    PRIMARY KEY (
        `OpreationsID`
    )
);

CREATE TABLE `entomological` (
    `entomologicalID` int  NOT NULL ,
    `OpreationsID` int  NOT NULL ,
    `type` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `entomologicalID`
    ),
    CONSTRAINT `uc_entomological_type` UNIQUE (
        `type`
    )
);

CREATE TABLE `surveillance` (
    `surveillanceID` int  NOT NULL ,
    `type` varchar(200)  NOT NULL ,
    `OpreationsID` int  NOT NULL ,
    PRIMARY KEY (
        `surveillanceID`
    ),
    CONSTRAINT `uc_surveillance_type` UNIQUE (
        `type`
    )
);

CREATE TABLE `employ` (
    `employID` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `email` string  NOT NULL ,
    `phon` int  NOT NULL ,
    `Address` string  NULL ,
    PRIMARY KEY (
        `employID`
    )
);

CREATE TABLE `stores` (
    `storesID` int  NOT NULL ,
    `Quantity` not  NULL ,
    `tools` varchar(500)  NOT NULL ,
    `OpreationsID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    PRIMARY KEY (
        `storesID`
    )
);

CREATE TABLE `Purchases` (
    `PurchasesID` int  NOT NULL ,
    `price` int  NOT NULL ,
    `quntity` not  NULL ,
    `tools` varchar(500)not  NULL ,
    `OpreationsID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    `AdminID` int  NOT NULL ,
    PRIMARY KEY (
        `PurchasesID`
    )
);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_employID` FOREIGN KEY(`employID`)
REFERENCES `employ` (`employID`);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_AdminID` FOREIGN KEY(`AdminID`)
REFERENCES `admin` (`AdminID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_employID` FOREIGN KEY(`employID`)
REFERENCES `employ` (`employID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `entomological` ADD CONSTRAINT `fk_entomological_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `surveillance` ADD CONSTRAINT `fk_surveillance_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `stores` ADD CONSTRAINT `fk_stores_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `stores` ADD CONSTRAINT `fk_stores_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `stores` ADD CONSTRAINT `fk_stores_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_AdminID` FOREIGN KEY(`AdminID`)
REFERENCES `admin` (`AdminID`);

CREATE INDEX `idx_admin_Name`
ON `admin` (`Name`);

