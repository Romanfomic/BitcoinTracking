/*
  Warnings:

  - You are about to drop the `day` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `year` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `day`;

-- DropTable
DROP TABLE `year`;

-- CreateTable
CREATE TABLE `bitcoin_data` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `price` DECIMAL(10, 2) NOT NULL,
    `date` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
