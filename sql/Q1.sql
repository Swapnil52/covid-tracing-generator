CREATE TABLE `employee` (
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(15) NOT NULL,
    `email_id` VARCHAR(255) DEFAULT NULL,
    `office_number` INT NOT NULL,
    `floor_number` INT NOT NULL,

    PRIMARY KEY (`id`)
);

CREATE TABLE `meeting_room` (
    `id` INT NOT NULL,
    `floor_number` INT NOT NULL,

    PRIMARY KEY (`id`)
);

CREATE TABLE `meeting` (
    `id` INT NOT NULL,
    `meeting_room_id` INT NOT NULL,
    `start_time` DATETIME NOT NULL,
    `end_time` DATETIME NOT NULL,
    `start_hour` INT NOT NULL,
    `end_hour` INT NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`meeting_room_id`) REFERENCES `meeting_room`(`id`)
);

CREATE TABLE `employee_meeting` (
    `employee_id` INT NOT NULL,
    `meeting_id` INT NOT NULL,

    PRIMARY KEY (`employee_id`, `meeting_id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`),
    FOREIGN KEY (`meeting_id`) REFERENCES `meeting`(`id`)
);

CREATE TABLE `test` (
    `id` INT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `tested_at` DATETIME NOT NULL,
    `employee_id` INT NOT NULL,
    `result` ENUM('NEGATIVE', 'POSITIVE') NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`)
);

CREATE TABLE `notification` (
    `id` INT NOT NULL,
    `employee_id` INT NOT NULL,
    `test_id` INT NOT NULL,
    `sent_at` DATETIME NOT NULL,
    `type` ENUM('MANDATORY', 'OPTIONAL') NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`),
    FOREIGN KEY (`test_id`) REFERENCES `test`(`id`)
);

CREATE TABLE `scan` (
    `id` INT NOT NULL,
    `scanned_at` DATETIME NOT NULL,
    `employee_id` INT NOT NULL,
    `temperature` DECIMAL(5,2) NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`)
);

CREATE TABLE `symptom` (
    `id` INT NOT NULL,
    `employee_id` INT NOT NULL,
    `reported_at` DATETIME NOT NULL,
    `symptom_id` INT NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`)
);

CREATE TABLE `employee_case` (
    `id` INT NOT NULL,
    `employee_id` INT NOT NULL,
    `date` DATETIME NOT NULL,
    `resolution` enum('SICK', 'LEFT_WORK', 'BACK_TO_WORK', 'DECEASED') NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
);

CREATE TABLE `health_status` (
    `id` INT NOT NULL,
    `case_id` INT NOT NULL,
    `employee_id` INT NOT NULL,
    `date` DATETIME NOT NULL,
    `status` enum('SICK', 'HOSPITALISED', 'WELL') NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`case_id`) REFERENCES `employee_case`(`id`),
    FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`)
);

INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('0', 'ritesh saini', '(832) 655-5927', 'ritesh.saini26@company.com', '1', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('1', 'kartik agarwal', '(995) 226-6501', 'kartik.agarwal236@company.com', '7', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('2', 'kartik bharat', '(897) 100-7602', 'kartik.bharat963@company.com', '5', '1');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('3', 'tanya samtani', '(936) 562-5345', 'tanya.samtani49@company.com', '8', '8');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('4', 'tanya kumar', '(186) 377-7819', 'tanya.kumar597@company.com', '6', '5');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('5', 'ritesh singal', '(400) 571-7337', 'ritesh.singal759@company.com', '7', '3');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('6', 'akshat kalia', '(617) 194-7858', 'akshat.kalia362@company.com', '6', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('7', 'ritesh agarwal', '(212) 607-8250', 'ritesh.agarwal996@company.com', '3', '6');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('8', 'sweta jha', '(894) 860-6365', 'sweta.jha741@company.com', '3', '4');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('9', 'vaibhav kalia', '(578) 504-1953', 'vaibhav.kalia322@company.com', '7', '1');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('10', 'ritesh kalia', '(966) 907-6963', 'ritesh.kalia883@company.com', '3', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('11', 'sweta samtani', '(722) 877-8421', 'sweta.samtani36@company.com', '2', '1');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('12', 'vaibhav bharat', '(162) 959-9356', 'vaibhav.bharat72@company.com', '5', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('13', 'tanya singal', '(731) 802-6682', 'tanya.singal309@company.com', '7', '8');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('14', 'sarthak kalia', '(918) 495-3317', 'sarthak.kalia972@company.com', '8', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('15', 'vaibhav singh', '(628) 894-1432', 'vaibhav.singh743@company.com', '6', '8');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('16', 'ritesh reddy', '(374) 900-5673', 'ritesh.reddy326@company.com', '3', '6');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('17', 'sweta reddy', '(490) 119-1562', 'sweta.reddy666@company.com', '5', '5');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('18', 'akshat singh', '(816) 637-2053', 'akshat.singh761@company.com', '3', '5');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('19', 'subham jain', '(355) 861-1251', 'subham.jain505@company.com', '9', '5');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('20', 'kartik kumar', '(936) 715-4717', 'kartik.kumar570@company.com', '4', '2');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('21', 'ritesh bharat', '(755) 239-3928', 'ritesh.bharat989@company.com', '9', '2');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('22', 'sweta kumar', '(662) 332-5484', 'sweta.kumar953@company.com', '10', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('23', 'tanya agarwal', '(744) 314-5736', 'tanya.agarwal470@company.com', '2', '8');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('24', 'tanya bharat', '(602) 125-1150', 'tanya.bharat415@company.com', '9', '9');

INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('0', '1');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('1', '6');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('2', '6');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('3', '1');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('4', '7');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('5', '1');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('6', '7');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('7', '6');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('8', '9');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('9', '5');

INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('0', '6', '2023-09-01 08:00:00', '2023-09-01 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('1', '0', '2023-09-01 12:00:00', '2023-09-01 13:00:00', '12', '13');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('2', '9', '2023-09-01 14:00:00', '2023-09-01 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('3', '1', '2023-09-02 10:00:00', '2023-09-02 11:00:00', '10', '11');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('4', '7', '2023-09-02 16:00:00', '2023-09-02 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('5', '9', '2023-09-02 08:00:00', '2023-09-02 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('6', '4', '2023-09-03 13:00:00', '2023-09-03 14:00:00', '13', '14');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('7', '6', '2023-09-03 12:00:00', '2023-09-03 13:00:00', '12', '13');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('8', '2', '2023-09-03 08:00:00', '2023-09-03 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('9', '5', '2023-09-04 14:00:00', '2023-09-04 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('10', '0', '2023-09-04 14:00:00', '2023-09-04 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('11', '5', '2023-09-04 16:00:00', '2023-09-04 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('12', '9', '2023-09-05 16:00:00', '2023-09-05 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('13', '3', '2023-09-05 15:00:00', '2023-09-05 16:00:00', '15', '16');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('14', '9', '2023-09-05 09:00:00', '2023-09-05 10:00:00', '9', '10');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('15', '9', '2023-09-06 13:00:00', '2023-09-06 14:00:00', '13', '14');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('16', '6', '2023-09-06 16:00:00', '2023-09-06 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('17', '8', '2023-09-06 08:00:00', '2023-09-06 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('18', '9', '2023-09-07 16:00:00', '2023-09-07 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('19', '8', '2023-09-07 12:00:00', '2023-09-07 13:00:00', '12', '13');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('20', '9', '2023-09-07 17:00:00', '2023-09-07 18:00:00', '17', '18');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('21', '5', '2023-09-08 09:00:00', '2023-09-08 10:00:00', '9', '10');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('22', '1', '2023-09-08 12:00:00', '2023-09-08 13:00:00', '12', '13');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('23', '6', '2023-09-08 15:00:00', '2023-09-08 16:00:00', '15', '16');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('24', '7', '2023-09-09 09:00:00', '2023-09-09 10:00:00', '9', '10');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('25', '5', '2023-09-09 14:00:00', '2023-09-09 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('26', '8', '2023-09-09 08:00:00', '2023-09-09 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('27', '0', '2023-09-10 16:00:00', '2023-09-10 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('28', '8', '2023-09-10 11:00:00', '2023-09-10 12:00:00', '11', '12');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('29', '6', '2023-09-10 12:00:00', '2023-09-10 13:00:00', '12', '13');

INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '0');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '0');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '0');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '1');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('12', '1');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '1');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '2');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('13', '2');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('6', '2');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('18', '3');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '3');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('17', '3');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('0', '4');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '4');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '4');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '5');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '5');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '5');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('17', '6');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '6');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '6');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '7');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '7');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '7');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '8');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '8');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '8');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '9');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '9');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('17', '9');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '10');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '10');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '10');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '11');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '11');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('18', '11');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('17', '12');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('18', '12');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '12');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '13');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '13');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '13');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '14');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '14');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('18', '14');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '15');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '15');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '15');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '16');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '16');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '16');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '17');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '17');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '17');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '18');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '18');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '18');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '19');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '19');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '19');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '20');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('3', '20');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('13', '20');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '21');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '21');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('3', '21');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('13', '22');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('17', '22');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '22');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('3', '23');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '23');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('15', '23');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '24');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '24');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '24');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '25');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '25');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '25');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '26');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '26');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('13', '26');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '27');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '27');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '27');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '28');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('13', '28');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '28');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '29');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '29');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '29');

INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('0', 'hospital', '2023-09-01 06:33:00', '1', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('1', 'onsite', '2023-09-01 06:21:00', '2', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('2', 'onsite', '2023-09-01 06:14:00', '3', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('3', 'clinic', '2023-09-01 06:21:00', '5', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('4', 'hospital', '2023-09-01 06:12:00', '7', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('5', 'clinic', '2023-09-01 06:14:00', '9', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('6', 'hospital', '2023-09-01 06:24:00', '11', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('7', 'hospital', '2023-09-01 06:40:00', '12', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('8', 'clinic', '2023-09-01 06:46:00', '13', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('9', 'onsite', '2023-09-01 06:33:00', '16', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('10', 'onsite', '2023-09-01 06:22:00', '23', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('11', 'clinic', '2023-09-02 06:38:00', '5', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('12', 'onsite', '2023-09-02 06:14:00', '6', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('13', 'hospital', '2023-09-02 06:57:00', '18', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('14', 'clinic', '2023-09-02 06:44:00', '19', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('15', 'clinic', '2023-09-02 06:55:00', '22', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('16', 'clinic', '2023-09-03 06:37:00', '0', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('17', 'onsite', '2023-09-03 06:15:00', '1', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('18', 'clinic', '2023-09-03 06:09:00', '8', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('19', 'hospital', '2023-09-03 06:41:00', '10', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('20', 'clinic', '2023-09-03 06:48:00', '13', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('21', 'hospital', '2023-09-03 06:03:00', '20', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('22', 'clinic', '2023-09-03 06:47:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('23', 'hospital', '2023-09-04 06:45:00', '0', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('24', 'hospital', '2023-09-04 06:43:00', '10', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('25', 'clinic', '2023-09-04 06:08:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('26', 'clinic', '2023-09-04 06:11:00', '15', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('27', 'clinic', '2023-09-04 06:36:00', '17', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('28', 'hospital', '2023-09-05 06:37:00', '18', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('29', 'hospital', '2023-09-05 06:52:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('30', 'hospital', '2023-09-06 06:14:00', '1', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('31', 'onsite', '2023-09-06 06:41:00', '3', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('32', 'clinic', '2023-09-06 06:47:00', '4', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('33', 'clinic', '2023-09-06 06:50:00', '5', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('34', 'hospital', '2023-09-06 06:16:00', '11', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('35', 'onsite', '2023-09-06 06:27:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('36', 'hospital', '2023-09-06 06:59:00', '17', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('37', 'hospital', '2023-09-06 06:52:00', '23', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('38', 'clinic', '2023-09-06 06:10:00', '24', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('39', 'hospital', '2023-09-07 06:37:00', '2', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('40', 'hospital', '2023-09-07 06:06:00', '3', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('41', 'hospital', '2023-09-07 06:44:00', '4', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('42', 'hospital', '2023-09-07 06:59:00', '9', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('43', 'clinic', '2023-09-07 06:54:00', '13', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('44', 'hospital', '2023-09-07 06:49:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('45', 'onsite', '2023-09-08 06:34:00', '1', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('46', 'hospital', '2023-09-08 06:55:00', '3', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('47', 'hospital', '2023-09-08 06:42:00', '17', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('48', 'onsite', '2023-09-09 06:28:00', '4', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('49', 'onsite', '2023-09-09 06:14:00', '13', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('50', 'onsite', '2023-09-09 06:19:00', '15', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('51', 'onsite', '2023-09-09 06:14:00', '17', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('52', 'hospital', '2023-09-09 06:10:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('53', 'onsite', '2023-09-09 06:55:00', '24', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('54', 'hospital', '2023-09-09 06:15:00', '7', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('55', 'hospital', '2023-09-09 06:45:00', '16', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('56', 'clinic', '2023-09-10 06:55:00', '2', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('57', 'hospital', '2023-09-10 06:57:00', '17', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('58', 'clinic', '2023-09-10 06:18:00', '23', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('59', 'hospital', '2023-09-10 06:39:00', '6', 'NEGATIVE');

INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('0', '5', '7', '2023-09-02 06:40:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('1', '22', '7', '2023-09-02 06:40:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('2', '1', '7', '2023-09-02 06:40:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('3', '6', '7', '2023-09-02 06:40:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('4', '22', '7', '2023-09-02 06:40:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('5', '8', '12', '2023-09-03 06:14:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('6', '13', '12', '2023-09-03 06:14:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('9', '0', '14', '2023-09-03 06:44:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('10', '21', '14', '2023-09-03 06:44:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('7', '1', '12', '2023-09-03 06:14:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('8', '22', '12', '2023-09-03 06:14:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('11', '17', '14', '2023-09-03 06:44:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('12', '18', '14', '2023-09-03 06:44:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('13', '4', '14', '2023-09-03 06:44:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('14', '21', '21', '2023-09-04 06:03:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('15', '21', '23', '2023-09-05 06:45:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('16', '24', '23', '2023-09-05 06:45:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('17', '10', '23', '2023-09-05 06:45:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('18', '14', '23', '2023-09-05 06:45:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('19', '4', '28', '2023-09-06 06:37:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('20', '5', '28', '2023-09-06 06:37:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('21', '14', '28', '2023-09-06 06:37:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('22', '17', '28', '2023-09-06 06:37:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('23', '23', '28', '2023-09-06 06:37:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('24', '24', '28', '2023-09-06 06:37:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('25', '17', '28', '2023-09-06 06:37:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('26', '4', '28', '2023-09-06 06:37:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('28', '4', '46', '2023-09-09 06:55:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('29', '13', '46', '2023-09-09 06:55:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('30', '15', '46', '2023-09-09 06:55:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('31', '21', '46', '2023-09-09 06:55:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('32', '24', '46', '2023-09-09 06:55:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('27', '22', '45', '2023-09-09 06:34:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('33', '23', '46', '2023-09-09 06:55:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('34', '13', '46', '2023-09-09 06:55:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('35', '15', '46', '2023-09-09 06:55:00', 'OPTIONAL');

INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('0', '2023-09-01 07:48:00', '0', '99.3931972091908');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('1', '2023-09-01 07:44:00', '1', '102.33956724522216');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('2', '2023-09-01 07:29:00', '2', '102.51123966582563');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('3', '2023-09-01 07:57:00', '3', '100.82332107399466');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('4', '2023-09-01 07:22:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('5', '2023-09-01 07:57:00', '5', '100.91872288966658');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('6', '2023-09-01 07:00:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('7', '2023-09-01 07:03:00', '7', '101.16786595248139');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('8', '2023-09-01 07:04:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('9', '2023-09-01 07:22:00', '9', '99.35749548292966');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('10', '2023-09-01 07:14:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('11', '2023-09-01 07:54:00', '11', '100.95094938496429');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('12', '2023-09-01 07:04:00', '12', '100.05466877710978');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('13', '2023-09-01 07:45:00', '13', '101.36476208717124');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('14', '2023-09-01 07:50:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('15', '2023-09-01 07:24:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('16', '2023-09-01 07:54:00', '16', '100.8436095805014');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('17', '2023-09-01 07:53:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('18', '2023-09-01 07:47:00', '18', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('19', '2023-09-01 07:04:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('20', '2023-09-01 07:59:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('21', '2023-09-01 07:58:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('22', '2023-09-01 07:34:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('23', '2023-09-01 07:20:00', '23', '101.26882626938986');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('24', '2023-09-01 07:23:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('25', '2023-09-02 07:07:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('26', '2023-09-02 07:28:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('27', '2023-09-02 07:32:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('28', '2023-09-02 07:27:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('29', '2023-09-02 07:23:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('30', '2023-09-02 07:25:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('31', '2023-09-02 07:37:00', '6', '100.0944242704512');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('32', '2023-09-02 07:25:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('33', '2023-09-02 07:43:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('34', '2023-09-02 07:15:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('35', '2023-09-02 07:42:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('36', '2023-09-02 07:22:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('37', '2023-09-02 07:03:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('38', '2023-09-02 07:05:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('39', '2023-09-02 07:55:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('40', '2023-09-02 07:22:00', '18', '101.39792348992403');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('41', '2023-09-02 07:11:00', '19', '100.95665575059085');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('42', '2023-09-02 07:42:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('43', '2023-09-02 07:01:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('44', '2023-09-02 07:19:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('45', '2023-09-02 07:04:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('46', '2023-09-02 07:36:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('47', '2023-09-03 07:23:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('48', '2023-09-03 07:29:00', '1', '100.22474491406652');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('49', '2023-09-03 07:14:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('50', '2023-09-03 07:53:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('51', '2023-09-03 07:48:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('52', '2023-09-03 07:43:00', '5', '99.5732046435607');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('53', '2023-09-03 07:16:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('54', '2023-09-03 07:22:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('55', '2023-09-03 07:27:00', '10', '100.62732072058793');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('56', '2023-09-03 07:06:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('57', '2023-09-03 07:25:00', '13', '99.320213253382');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('58', '2023-09-03 07:25:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('59', '2023-09-03 07:34:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('60', '2023-09-03 07:52:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('61', '2023-09-03 07:33:00', '18', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('62', '2023-09-03 07:31:00', '20', '100.33396376544196');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('63', '2023-09-03 07:00:00', '21', '100.85637584923124');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('64', '2023-09-03 07:18:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('65', '2023-09-03 07:56:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('66', '2023-09-03 07:38:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('67', '2023-09-04 07:42:00', '0', '101.50144006684981');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('68', '2023-09-04 07:33:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('69', '2023-09-04 07:59:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('70', '2023-09-04 07:49:00', '3', '99.8760672774458');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('71', '2023-09-04 07:29:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('72', '2023-09-04 07:20:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('73', '2023-09-04 07:11:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('74', '2023-09-04 07:52:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('75', '2023-09-04 07:10:00', '10', '101.85069781694959');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('76', '2023-09-04 07:51:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('77', '2023-09-04 07:03:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('78', '2023-09-04 07:39:00', '14', '100.61682480416074');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('79', '2023-09-04 07:13:00', '15', '100.49440573845513');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('80', '2023-09-04 07:32:00', '17', '101.4919313596432');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('81', '2023-09-04 07:22:00', '18', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('82', '2023-09-04 07:27:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('83', '2023-09-04 07:42:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('84', '2023-09-04 07:59:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('85', '2023-09-04 07:16:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('86', '2023-09-05 07:28:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('87', '2023-09-05 07:22:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('88', '2023-09-05 07:48:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('89', '2023-09-05 07:27:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('90', '2023-09-05 07:09:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('91', '2023-09-05 07:32:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('92', '2023-09-05 07:28:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('93', '2023-09-05 07:56:00', '10', '99.85469960429334');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('94', '2023-09-05 07:05:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('95', '2023-09-05 07:08:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('96', '2023-09-05 07:29:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('97', '2023-09-05 07:18:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('98', '2023-09-05 07:37:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('99', '2023-09-05 07:41:00', '18', '102.42304911046662');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('100', '2023-09-05 07:53:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('101', '2023-09-05 07:32:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('102', '2023-09-05 07:04:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('103', '2023-09-05 07:33:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('104', '2023-09-06 07:23:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('105', '2023-09-06 07:00:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('106', '2023-09-06 07:59:00', '3', '101.81092586823411');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('107', '2023-09-06 07:08:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('108', '2023-09-06 07:52:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('109', '2023-09-06 07:10:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('110', '2023-09-06 07:03:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('111', '2023-09-06 07:08:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('112', '2023-09-06 07:21:00', '11', '102.23022398959829');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('113', '2023-09-06 07:35:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('114', '2023-09-06 07:27:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('115', '2023-09-06 07:38:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('116', '2023-09-06 07:10:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('117', '2023-09-06 07:58:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('118', '2023-09-06 07:36:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('119', '2023-09-06 07:10:00', '23', '99.74604200103128');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('120', '2023-09-06 07:43:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('121', '2023-09-07 07:14:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('122', '2023-09-07 07:51:00', '2', '100.70601661391579');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('123', '2023-09-07 07:41:00', '3', '102.10268946585494');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('124', '2023-09-07 07:32:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('125', '2023-09-07 07:11:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('126', '2023-09-07 07:33:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('127', '2023-09-07 07:12:00', '9', '101.69667059499483');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('128', '2023-09-07 07:41:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('129', '2023-09-07 07:03:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('130', '2023-09-07 07:24:00', '13', '102.15969741498955');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('131', '2023-09-07 07:47:00', '14', '100.1936425751202');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('132', '2023-09-07 07:11:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('133', '2023-09-07 07:45:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('134', '2023-09-07 07:15:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('135', '2023-09-07 07:21:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('136', '2023-09-07 07:05:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('137', '2023-09-07 07:13:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('138', '2023-09-08 07:32:00', '1', '100.95664701746303');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('139', '2023-09-08 07:45:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('140', '2023-09-08 07:50:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('141', '2023-09-08 07:52:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('142', '2023-09-08 07:41:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('143', '2023-09-08 07:14:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('144', '2023-09-08 07:33:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('145', '2023-09-08 07:20:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('146', '2023-09-08 07:38:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('147', '2023-09-08 07:09:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('148', '2023-09-08 07:22:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('149', '2023-09-08 07:40:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('150', '2023-09-08 07:47:00', '17', '100.0105580912687');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('151', '2023-09-08 07:41:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('152', '2023-09-08 07:02:00', '22', '99.7312243515256');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('153', '2023-09-08 07:32:00', '23', '99.89140080385009');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('154', '2023-09-08 07:52:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('155', '2023-09-09 07:01:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('156', '2023-09-09 07:28:00', '4', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('157', '2023-09-09 07:50:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('158', '2023-09-09 07:44:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('159', '2023-09-09 07:39:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('160', '2023-09-09 07:08:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('161', '2023-09-09 07:29:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('162', '2023-09-09 07:40:00', '13', '102.22572156003473');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('163', '2023-09-09 07:33:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('164', '2023-09-09 07:03:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('165', '2023-09-09 07:44:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('166', '2023-09-09 07:49:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('167', '2023-09-09 07:15:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('168', '2023-09-09 07:46:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('169', '2023-09-09 07:32:00', '24', '101.71372183082345');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('170', '2023-09-10 07:17:00', '2', '101.46729195706627');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('171', '2023-09-10 07:47:00', '4', '99.13691167753103');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('172', '2023-09-10 07:00:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('173', '2023-09-10 07:52:00', '7', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('174', '2023-09-10 07:40:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('175', '2023-09-10 07:38:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('176', '2023-09-10 07:33:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('177', '2023-09-10 07:45:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('178', '2023-09-10 07:57:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('179', '2023-09-10 07:51:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('180', '2023-09-10 07:47:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('181', '2023-09-10 07:25:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('182', '2023-09-10 07:38:00', '17', '102.45966245629874');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('183', '2023-09-10 07:54:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('184', '2023-09-10 07:27:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('185', '2023-09-10 07:29:00', '23', '100.71236385606298');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('186', '2023-09-10 07:25:00', '24', '98.6');

INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('0', '9', '2023-09-01 23:00:00', '3');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('1', '18', '2023-09-02 20:00:00', '4');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('2', '21', '2023-09-03 21:00:00', '1');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('3', '17', '2023-09-04 22:00:00', '3');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('4', '18', '2023-09-05 19:00:00', '3');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('5', '1', '2023-09-06 20:00:00', '3');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('6', '4', '2023-09-07 22:00:00', '1');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('7', '3', '2023-09-08 21:00:00', '5');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('8', '17', '2023-09-09 22:00:00', '3');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('9', '17', '2023-09-10 23:00:00', '5');

INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('0', '7', '2023-09-09 08:22:00', 'BACK_TO_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('1', '12', '2023-09-01 08:41:00', 'DECEASED');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('2', '16', '2023-09-09 09:27:00', 'BACK_TO_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('3', '6', '2023-09-10 09:29:00', 'BACK_TO_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('4', '19', '2023-09-02 09:19:00', 'DECEASED');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('5', '20', '2023-09-03 08:56:00', 'LEFT_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('6', '0', '2023-09-04 09:32:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('7', '18', '2023-09-05 08:55:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('8', '1', '2023-09-08 08:48:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('9', '3', '2023-09-08 09:10:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('10', '23', '2023-09-10 09:05:00', 'SICK');

INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('0', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('1', '1', '12', '2023-09-02 03:41:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('2', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('3', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('4', '1', '12', '2023-09-02 03:41:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('5', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('6', '3', '6', '2023-09-03 03:50:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('7', '4', '19', '2023-09-03 04:19:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('8', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('9', '1', '12', '2023-09-02 03:41:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('10', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('11', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('12', '4', '19', '2023-09-03 04:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('13', '5', '20', '2023-09-04 03:56:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('14', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('15', '1', '12', '2023-09-02 03:41:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('16', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('17', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('18', '4', '19', '2023-09-03 04:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('19', '5', '20', '2023-09-04 03:56:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('20', '6', '0', '2023-09-05 04:32:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('21', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('22', '1', '12', '2023-09-02 03:41:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('23', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('24', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('25', '4', '19', '2023-09-03 04:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('26', '5', '20', '2023-09-04 03:56:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('27', '6', '0', '2023-09-05 04:32:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('28', '7', '18', '2023-09-06 03:55:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('29', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('30', '1', '12', '2023-09-02 03:41:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('31', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('32', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('33', '4', '19', '2023-09-03 04:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('34', '5', '20', '2023-09-04 03:56:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('35', '6', '0', '2023-09-05 04:32:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('36', '7', '18', '2023-09-06 03:55:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('37', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('38', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('39', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('40', '4', '19', '2023-09-03 04:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('41', '5', '20', '2023-09-04 03:56:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('42', '6', '0', '2023-09-05 04:32:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('43', '7', '18', '2023-09-06 03:55:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('44', '0', '7', '2023-09-02 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('45', '2', '16', '2023-09-02 04:15:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('46', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('47', '5', '20', '2023-09-04 03:56:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('48', '6', '0', '2023-09-05 04:32:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('49', '7', '18', '2023-09-06 03:55:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('50', '8', '1', '2023-09-09 03:48:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('51', '9', '3', '2023-09-09 04:10:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('52', '0', '7', '2023-09-10 03:22:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('53', '2', '16', '2023-09-10 04:27:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('54', '3', '6', '2023-09-03 03:50:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('55', '6', '0', '2023-09-05 04:32:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('56', '7', '18', '2023-09-06 03:55:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('57', '8', '1', '2023-09-09 03:48:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('58', '9', '3', '2023-09-09 04:10:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('59', '0', '7', '2023-09-10 03:22:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('60', '2', '16', '2023-09-10 04:27:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('61', '3', '6', '2023-09-11 04:29:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('62', '6', '0', '2023-09-05 04:32:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('63', '7', '18', '2023-09-06 03:55:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('64', '8', '1', '2023-09-09 03:48:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('65', '9', '3', '2023-09-09 04:10:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('66', '10', '23', '2023-09-11 04:05:00', 'SICK');
