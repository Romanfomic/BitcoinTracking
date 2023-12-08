-- CreateTable
CREATE TABLE `Year` (
    `day` INTEGER NOT NULL,
    `month` INTEGER NOT NULL,
    `value` DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (`day`, `month`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Day` (
    `day` INTEGER NOT NULL,
    `month` INTEGER NOT NULL,
    `hour` INTEGER NOT NULL,
    `value` DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (`day`, `month`, `hour`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
