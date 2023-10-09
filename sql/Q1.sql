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

INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('0', 'subham kalia', '(902) 643-2988', 'subham.kalia194@company.com', '2', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('1', 'rohan kalia', '(566) 197-8381', 'rohan.kalia582@company.com', '6', '1');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('2', 'rohan jain', '(800) 147-9469', 'rohan.jain533@company.com', '5', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('3', 'vedant samtani', '(934) 791-3540', 'vedant.samtani264@company.com', '3', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('4', 'vaibhav jain', '(282) 389-5874', 'vaibhav.jain74@company.com', '2', '1');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('5', 'tanya agarwal', '(292) 756-7623', 'tanya.agarwal356@company.com', '3', '1');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('6', 'subham agarwal', '(159) 441-5050', 'subham.agarwal407@company.com', '4', '8');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('7', 'kartik agarwal', '(714) 679-3690', 'kartik.agarwal384@company.com', '7', '7');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('8', 'rohan bharat', '(581) 708-5808', 'rohan.bharat854@company.com', '9', '7');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('9', 'tanya agarwal', '(688) 746-9421', 'tanya.agarwal185@company.com', '2', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('10', 'vedant saini', '(709) 266-1533', 'vedant.saini253@company.com', '7', '10');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('11', 'subham kumar', '(204) 341-1655', 'subham.kumar237@company.com', '1', '2');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('12', 'sweta bharat', '(280) 896-2711', 'sweta.bharat127@company.com', '8', '2');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('13', 'kartik jain', '(184) 430-4180', 'kartik.jain43@company.com', '3', '3');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('14', 'ritesh samtani', '(197) 995-8865', 'ritesh.samtani72@company.com', '1', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('15', 'akshat reddy', '(300) 587-8464', 'akshat.reddy857@company.com', '5', '3');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('16', 'subham saini', '(835) 885-3395', 'subham.saini809@company.com', '10', '3');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('17', 'subham agarwal', '(117) 317-4773', 'subham.agarwal130@company.com', '5', '7');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('18', 'sarthak kalia', '(713) 678-5730', 'sarthak.kalia903@company.com', '3', '6');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('19', 'vaibhav singh', '(262) 185-7986', 'vaibhav.singh964@company.com', '1', '4');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('20', 'kriti jain', '(575) 483-9865', 'kriti.jain515@company.com', '9', '7');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('21', 'tanya samtani', '(190) 656-4791', 'tanya.samtani833@company.com', '1', '5');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('22', 'kartik reddy', '(886) 989-1124', 'kartik.reddy973@company.com', '7', '9');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('23', 'akshat jha', '(251) 501-5794', 'akshat.jha470@company.com', '6', '6');
INSERT INTO `employee` (`id`, `name`, `phone_number`, `email_id`, `office_number`, `floor_number`) VALUES ('24', 'sarthak jain', '(203) 570-4734', 'sarthak.jain195@company.com', '9', '5');

INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('0', '10');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('1', '1');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('2', '7');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('3', '4');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('4', '8');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('5', '2');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('6', '10');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('7', '4');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('8', '2');
INSERT INTO `meeting_room` (`id`, `floor_number`) VALUES ('9', '5');

INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('0', '0', '2023-09-01 17:00:00', '2023-09-01 18:00:00', '17', '18');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('1', '4', '2023-09-01 09:00:00', '2023-09-01 10:00:00', '9', '10');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('2', '0', '2023-09-01 16:00:00', '2023-09-01 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('3', '8', '2023-09-02 09:00:00', '2023-09-02 10:00:00', '9', '10');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('4', '8', '2023-09-02 12:00:00', '2023-09-02 13:00:00', '12', '13');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('5', '0', '2023-09-02 14:00:00', '2023-09-02 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('6', '4', '2023-09-03 14:00:00', '2023-09-03 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('7', '8', '2023-09-03 14:00:00', '2023-09-03 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('8', '9', '2023-09-03 14:00:00', '2023-09-03 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('9', '3', '2023-09-04 12:00:00', '2023-09-04 13:00:00', '12', '13');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('10', '0', '2023-09-04 08:00:00', '2023-09-04 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('11', '9', '2023-09-04 08:00:00', '2023-09-04 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('12', '5', '2023-09-05 08:00:00', '2023-09-05 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('13', '1', '2023-09-05 09:00:00', '2023-09-05 10:00:00', '9', '10');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('14', '3', '2023-09-05 10:00:00', '2023-09-05 11:00:00', '10', '11');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('15', '6', '2023-09-06 08:00:00', '2023-09-06 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('16', '1', '2023-09-06 10:00:00', '2023-09-06 11:00:00', '10', '11');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('17', '3', '2023-09-06 08:00:00', '2023-09-06 09:00:00', '8', '9');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('18', '2', '2023-09-07 11:00:00', '2023-09-07 12:00:00', '11', '12');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('19', '9', '2023-09-07 11:00:00', '2023-09-07 12:00:00', '11', '12');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('20', '8', '2023-09-07 15:00:00', '2023-09-07 16:00:00', '15', '16');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('21', '7', '2023-09-08 16:00:00', '2023-09-08 17:00:00', '16', '17');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('22', '7', '2023-09-08 17:00:00', '2023-09-08 18:00:00', '17', '18');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('23', '7', '2023-09-08 14:00:00', '2023-09-08 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('24', '2', '2023-09-09 10:00:00', '2023-09-09 11:00:00', '10', '11');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('25', '3', '2023-09-09 14:00:00', '2023-09-09 15:00:00', '14', '15');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('26', '4', '2023-09-09 11:00:00', '2023-09-09 12:00:00', '11', '12');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('27', '4', '2023-09-10 10:00:00', '2023-09-10 11:00:00', '10', '11');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('28', '6', '2023-09-10 15:00:00', '2023-09-10 16:00:00', '15', '16');
INSERT INTO `meeting` (`id`, `meeting_room_id`, `start_time`, `end_time`, `start_hour`, `end_hour`) VALUES ('29', '9', '2023-09-10 13:00:00', '2023-09-10 14:00:00', '13', '14');

INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('18', '0');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '0');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '0');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '1');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '1');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('17', '1');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '2');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('16', '2');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('7', '2');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '3');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('7', '3');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('12', '3');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('13', '4');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('5', '4');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '4');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '5');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('6', '5');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '5');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '6');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '6');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('16', '6');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '7');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '7');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '7');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('7', '8');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('0', '8');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('6', '8');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('23', '9');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('1', '9');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '9');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('9', '10');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '10');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('3', '10');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('16', '11');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '11');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('21', '11');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '12');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('0', '12');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('16', '12');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '13');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('2', '13');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '13');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('3', '14');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('7', '14');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '14');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('6', '15');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '15');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '15');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '16');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('0', '16');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '16');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '17');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '17');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '17');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '18');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '18');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '18');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '19');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '19');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('3', '19');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '20');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '20');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('16', '20');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '21');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '21');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '21');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '22');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '22');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '22');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '23');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '23');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '23');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('0', '24');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '24');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('24', '24');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('20', '25');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('19', '25');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '25');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('16', '26');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('8', '26');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('6', '26');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('11', '27');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '27');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '27');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('14', '28');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('4', '28');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('22', '28');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('10', '29');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('1', '29');
INSERT INTO `employee_meeting` (`employee_id`, `meeting_id`) VALUES ('6', '29');

INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('0', 'onsite', '2023-09-01 06:48:00', '4', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('1', 'clinic', '2023-09-01 06:11:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('2', 'onsite', '2023-09-01 06:29:00', '17', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('3', 'hospital', '2023-09-01 06:39:00', '18', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('4', 'onsite', '2023-09-02 06:56:00', '3', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('5', 'onsite', '2023-09-02 06:41:00', '7', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('6', 'onsite', '2023-09-02 06:27:00', '12', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('7', 'clinic', '2023-09-02 06:48:00', '13', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('8', 'clinic', '2023-09-02 06:10:00', '19', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('9', 'onsite', '2023-09-02 06:21:00', '22', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('10', 'onsite', '2023-09-02 06:52:00', '23', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('11', 'clinic', '2023-09-02 06:51:00', '24', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('12', 'hospital', '2023-09-03 06:25:00', '0', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('13', 'clinic', '2023-09-03 06:43:00', '5', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('14', 'clinic', '2023-09-03 06:13:00', '6', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('15', 'clinic', '2023-09-03 06:28:00', '15', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('16', 'onsite', '2023-09-03 06:30:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('17', 'hospital', '2023-09-03 06:20:00', '22', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('18', 'onsite', '2023-09-04 06:39:00', '7', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('19', 'hospital', '2023-09-04 06:36:00', '9', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('20', 'hospital', '2023-09-04 06:16:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('21', 'clinic', '2023-09-05 06:05:00', '7', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('22', 'clinic', '2023-09-05 06:07:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('23', 'hospital', '2023-09-05 06:09:00', '23', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('24', 'clinic', '2023-09-05 06:57:00', '24', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('25', 'clinic', '2023-09-06 06:51:00', '0', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('26', 'clinic', '2023-09-06 06:03:00', '1', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('27', 'clinic', '2023-09-06 06:18:00', '2', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('28', 'hospital', '2023-09-06 06:11:00', '3', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('29', 'clinic', '2023-09-06 06:22:00', '6', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('30', 'clinic', '2023-09-06 06:02:00', '8', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('31', 'hospital', '2023-09-06 06:05:00', '9', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('32', 'hospital', '2023-09-06 06:47:00', '10', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('33', 'clinic', '2023-09-06 06:10:00', '12', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('34', 'onsite', '2023-09-06 06:32:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('35', 'hospital', '2023-09-06 06:01:00', '19', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('36', 'onsite', '2023-09-06 06:59:00', '22', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('37', 'hospital', '2023-09-07 06:08:00', '1', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('38', 'onsite', '2023-09-07 06:13:00', '3', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('39', 'hospital', '2023-09-07 06:08:00', '6', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('40', 'onsite', '2023-09-07 06:19:00', '8', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('41', 'clinic', '2023-09-07 06:35:00', '10', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('42', 'onsite', '2023-09-07 06:08:00', '19', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('43', 'onsite', '2023-09-07 06:21:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('44', 'clinic', '2023-09-08 06:32:00', '14', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('45', 'onsite', '2023-09-08 06:25:00', '20', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('46', 'onsite', '2023-09-08 06:49:00', '22', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('47', 'clinic', '2023-09-09 06:40:00', '16', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('48', 'clinic', '2023-09-09 06:10:00', '21', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('49', 'hospital', '2023-09-09 06:50:00', '4', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('50', 'hospital', '2023-09-09 06:06:00', '17', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('51', 'hospital', '2023-09-09 06:55:00', '18', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('52', 'clinic', '2023-09-10 06:03:00', '4', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('53', 'clinic', '2023-09-10 06:51:00', '10', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('54', 'hospital', '2023-09-10 06:01:00', '16', 'NEGATIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('55', 'clinic', '2023-09-10 06:56:00', '18', 'POSITIVE');
INSERT INTO `test` (`id`, `location`, `tested_at`, `employee_id`, `result`) VALUES ('56', 'onsite', '2023-09-10 06:28:00', '22', 'NEGATIVE');

INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('0', '23', '0', '2023-09-02 06:48:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('3', '24', '2', '2023-09-02 06:29:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('4', '19', '2', '2023-09-02 06:29:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('8', '23', '3', '2023-09-02 06:39:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('1', '1', '0', '2023-09-02 06:48:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('2', '5', '0', '2023-09-02 06:48:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('5', '8', '2', '2023-09-02 06:29:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('6', '20', '2', '2023-09-02 06:29:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('7', '7', '2', '2023-09-02 06:29:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('9', '23', '3', '2023-09-02 06:39:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('10', '21', '7', '2023-09-03 06:48:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('11', '5', '7', '2023-09-03 06:48:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('12', '16', '7', '2023-09-03 06:48:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('13', '15', '7', '2023-09-03 06:48:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('14', '21', '13', '2023-09-04 06:43:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('15', '1', '13', '2023-09-04 06:43:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('16', '16', '15', '2023-09-04 06:28:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('17', '0', '21', '2023-09-06 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('18', '3', '21', '2023-09-06 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('19', '6', '21', '2023-09-06 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('20', '9', '21', '2023-09-06 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('21', '12', '21', '2023-09-06 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('22', '14', '21', '2023-09-06 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('25', '8', '23', '2023-09-06 06:09:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('26', '1', '23', '2023-09-06 06:09:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('27', '10', '23', '2023-09-06 06:09:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('28', '19', '23', '2023-09-06 06:09:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('23', '8', '21', '2023-09-06 06:05:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('24', '20', '21', '2023-09-06 06:05:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('29', '19', '27', '2023-09-07 06:18:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('30', '10', '27', '2023-09-07 06:18:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('31', '3', '27', '2023-09-07 06:18:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('35', '3', '31', '2023-09-07 06:05:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('32', '0', '27', '2023-09-07 06:18:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('33', '14', '27', '2023-09-07 06:18:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('34', '22', '27', '2023-09-07 06:18:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('36', '10', '31', '2023-09-07 06:05:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('37', '3', '31', '2023-09-07 06:05:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('38', '11', '33', '2023-09-07 06:10:00', 'OPTIONAL');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('39', '20', '38', '2023-09-08 06:13:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('40', '14', '38', '2023-09-08 06:13:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('41', '22', '38', '2023-09-08 06:13:00', 'MANDATORY');
INSERT INTO `notification` (`id`, `employee_id`, `test_id`, `sent_at`, `type`) VALUES ('42', '10', '38', '2023-09-08 06:13:00', 'OPTIONAL');

INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('0', '2023-09-01 07:28:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('1', '2023-09-01 07:50:00', '1', '99.50935503023304');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('2', '2023-09-01 07:25:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('3', '2023-09-01 07:42:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('4', '2023-09-01 07:35:00', '4', '101.41603292617715');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('5', '2023-09-01 07:09:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('6', '2023-09-01 07:37:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('7', '2023-09-01 07:00:00', '7', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('8', '2023-09-01 07:33:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('9', '2023-09-01 07:44:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('10', '2023-09-01 07:19:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('11', '2023-09-01 07:13:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('12', '2023-09-01 07:38:00', '12', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('13', '2023-09-01 07:51:00', '13', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('14', '2023-09-01 07:57:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('15', '2023-09-01 07:46:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('16', '2023-09-01 07:05:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('17', '2023-09-01 07:30:00', '17', '100.71451503273568');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('18', '2023-09-01 07:43:00', '18', '101.12290875124565');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('19', '2023-09-01 07:50:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('20', '2023-09-01 07:43:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('21', '2023-09-01 07:38:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('22', '2023-09-01 07:42:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('23', '2023-09-01 07:44:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('24', '2023-09-01 07:21:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('25', '2023-09-02 07:03:00', '0', '99.40621342203731');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('26', '2023-09-02 07:44:00', '1', '99.70149889332924');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('27', '2023-09-02 07:05:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('28', '2023-09-02 07:22:00', '3', '101.14384492724147');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('29', '2023-09-02 07:26:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('30', '2023-09-02 07:21:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('31', '2023-09-02 07:35:00', '7', '100.80080765412295');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('32', '2023-09-02 07:54:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('33', '2023-09-02 07:14:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('34', '2023-09-02 07:57:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('35', '2023-09-02 07:17:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('36', '2023-09-02 07:40:00', '12', '101.23642986904802');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('37', '2023-09-02 07:04:00', '13', '100.30307785844676');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('38', '2023-09-02 07:04:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('39', '2023-09-02 07:51:00', '15', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('40', '2023-09-02 07:55:00', '16', '99.80847313685933');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('41', '2023-09-02 07:10:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('42', '2023-09-02 07:06:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('43', '2023-09-02 07:52:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('44', '2023-09-02 07:53:00', '22', '102.39933166680648');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('45', '2023-09-02 07:17:00', '23', '101.01068949450568');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('46', '2023-09-02 07:17:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('47', '2023-09-03 07:13:00', '0', '100.15656541986779');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('48', '2023-09-03 07:57:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('49', '2023-09-03 07:42:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('50', '2023-09-03 07:53:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('51', '2023-09-03 07:38:00', '5', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('52', '2023-09-03 07:05:00', '6', '101.63129289667624');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('53', '2023-09-03 07:40:00', '7', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('54', '2023-09-03 07:23:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('55', '2023-09-03 07:41:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('56', '2023-09-03 07:42:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('57', '2023-09-03 07:55:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('58', '2023-09-03 07:52:00', '12', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('59', '2023-09-03 07:43:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('60', '2023-09-03 07:41:00', '15', '102.15349454115274');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('61', '2023-09-03 07:54:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('62', '2023-09-03 07:09:00', '19', '99.31057386103423');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('63', '2023-09-03 07:52:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('64', '2023-09-03 07:33:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('65', '2023-09-03 07:44:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('66', '2023-09-03 07:22:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('67', '2023-09-03 07:46:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('68', '2023-09-04 07:14:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('69', '2023-09-04 07:35:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('70', '2023-09-04 07:39:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('71', '2023-09-04 07:07:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('72', '2023-09-04 07:18:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('73', '2023-09-04 07:51:00', '7', '100.38130031373746');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('74', '2023-09-04 07:52:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('75', '2023-09-04 07:12:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('76', '2023-09-04 07:32:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('77', '2023-09-04 07:00:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('78', '2023-09-04 07:06:00', '12', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('79', '2023-09-04 07:42:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('80', '2023-09-04 07:18:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('81', '2023-09-04 07:26:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('82', '2023-09-04 07:19:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('83', '2023-09-04 07:02:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('84', '2023-09-04 07:18:00', '22', '99.88336632520405');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('85', '2023-09-04 07:37:00', '23', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('86', '2023-09-04 07:19:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('87', '2023-09-05 07:37:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('88', '2023-09-05 07:55:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('89', '2023-09-05 07:24:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('90', '2023-09-05 07:44:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('91', '2023-09-05 07:43:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('92', '2023-09-05 07:25:00', '7', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('93', '2023-09-05 07:56:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('94', '2023-09-05 07:07:00', '9', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('95', '2023-09-05 07:03:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('96', '2023-09-05 07:57:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('97', '2023-09-05 07:36:00', '12', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('98', '2023-09-05 07:58:00', '14', '101.08886988348016');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('99', '2023-09-05 07:39:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('100', '2023-09-05 07:31:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('101', '2023-09-05 07:32:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('102', '2023-09-05 07:30:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('103', '2023-09-05 07:21:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('104', '2023-09-05 07:58:00', '23', '102.22571660278213');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('105', '2023-09-05 07:13:00', '24', '100.84418364543237');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('106', '2023-09-06 07:54:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('107', '2023-09-06 07:00:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('108', '2023-09-06 07:18:00', '2', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('109', '2023-09-06 07:07:00', '3', '99.25739573789454');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('110', '2023-09-06 07:42:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('111', '2023-09-06 07:29:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('112', '2023-09-06 07:40:00', '9', '101.75119635738979');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('113', '2023-09-06 07:29:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('114', '2023-09-06 07:36:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('115', '2023-09-06 07:11:00', '12', '99.52405336980702');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('116', '2023-09-06 07:08:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('117', '2023-09-06 07:15:00', '16', '99.96061868144658');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('118', '2023-09-06 07:00:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('119', '2023-09-06 07:55:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('120', '2023-09-06 07:26:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('121', '2023-09-06 07:52:00', '22', '102.50260789774792');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('122', '2023-09-06 07:29:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('123', '2023-09-07 07:30:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('124', '2023-09-07 07:03:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('125', '2023-09-07 07:32:00', '3', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('126', '2023-09-07 07:24:00', '6', '100.18890599419719');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('127', '2023-09-07 07:25:00', '8', '102.27538545700297');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('128', '2023-09-07 07:45:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('129', '2023-09-07 07:03:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('130', '2023-09-07 07:10:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('131', '2023-09-07 07:14:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('132', '2023-09-07 07:52:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('133', '2023-09-07 07:03:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('134', '2023-09-07 07:58:00', '21', '101.7705902129814');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('135', '2023-09-07 07:31:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('136', '2023-09-07 07:30:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('137', '2023-09-08 07:42:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('138', '2023-09-08 07:24:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('139', '2023-09-08 07:18:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('140', '2023-09-08 07:02:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('141', '2023-09-08 07:00:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('142', '2023-09-08 07:11:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('143', '2023-09-08 07:38:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('144', '2023-09-08 07:01:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('145', '2023-09-08 07:09:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('146', '2023-09-08 07:15:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('147', '2023-09-08 07:51:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('148', '2023-09-08 07:02:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('149', '2023-09-08 07:01:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('150', '2023-09-09 07:27:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('151', '2023-09-09 07:23:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('152', '2023-09-09 07:04:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('153', '2023-09-09 07:52:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('154', '2023-09-09 07:07:00', '10', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('155', '2023-09-09 07:17:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('156', '2023-09-09 07:17:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('157', '2023-09-09 07:53:00', '16', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('158', '2023-09-09 07:31:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('159', '2023-09-09 07:54:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('160', '2023-09-09 07:16:00', '21', '100.55143954190045');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('161', '2023-09-09 07:23:00', '22', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('162', '2023-09-09 07:13:00', '24', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('163', '2023-09-10 07:16:00', '0', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('164', '2023-09-10 07:23:00', '1', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('165', '2023-09-10 07:21:00', '4', '100.11902468958483');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('166', '2023-09-10 07:07:00', '6', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('167', '2023-09-10 07:09:00', '8', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('168', '2023-09-10 07:28:00', '10', '101.14451903013253');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('169', '2023-09-10 07:01:00', '11', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('170', '2023-09-10 07:24:00', '14', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('171', '2023-09-10 07:08:00', '16', '100.00529109389771');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('172', '2023-09-10 07:46:00', '17', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('173', '2023-09-10 07:17:00', '18', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('174', '2023-09-10 07:40:00', '19', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('175', '2023-09-10 07:25:00', '20', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('176', '2023-09-10 07:30:00', '21', '98.6');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('177', '2023-09-10 07:12:00', '22', '101.12049056031346');
INSERT INTO `scan` (`id`, `scanned_at`, `employee_id`, `temperature`) VALUES ('178', '2023-09-10 07:28:00', '24', '98.6');

INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('0', '14', '2023-09-01 21:00:00', '4');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('1', '7', '2023-09-02 22:00:00', '2');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('2', '22', '2023-09-03 23:00:00', '5');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('3', '9', '2023-09-04 21:00:00', '2');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('4', '7', '2023-09-05 21:00:00', '2');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('5', '2', '2023-09-06 20:00:00', '3');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('6', '1', '2023-09-07 22:00:00', '2');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('7', '14', '2023-09-08 22:00:00', '2');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('8', '16', '2023-09-09 23:00:00', '4');
INSERT INTO `symptom` (`id`, `employee_id`, `reported_at`, `symptom_id`) VALUES ('9', '18', '2023-09-10 20:00:00', '1');

INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('0', '4', '2023-09-10 08:14:00', 'BACK_TO_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('1', '17', '2023-09-09 08:16:00', 'BACK_TO_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('2', '18', '2023-09-10 09:42:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('3', '13', '2023-09-02 09:07:00', 'LEFT_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('4', '5', '2023-09-03 09:13:00', 'LEFT_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('5', '15', '2023-09-03 08:38:00', 'LEFT_WORK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('6', '7', '2023-09-05 09:03:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('7', '23', '2023-09-05 08:19:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('8', '2', '2023-09-06 08:44:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('9', '9', '2023-09-06 08:39:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('10', '12', '2023-09-06 08:19:00', 'SICK');
INSERT INTO `employee_case` (`id`, `employee_id`, `date`, `resolution`) VALUES ('11', '3', '2023-09-07 08:40:00', 'SICK');

INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('0', '0', '4', '2023-09-02 03:51:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('1', '1', '17', '2023-09-02 04:11:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('2', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('3', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('4', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('5', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('6', '3', '13', '2023-09-03 04:07:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('7', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('8', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('9', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('10', '3', '13', '2023-09-03 04:07:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('11', '4', '5', '2023-09-04 04:13:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('12', '5', '15', '2023-09-04 03:38:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('13', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('14', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('15', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('16', '3', '13', '2023-09-03 04:07:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('17', '4', '5', '2023-09-04 04:13:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('18', '5', '15', '2023-09-04 03:38:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('19', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('20', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('21', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('22', '3', '13', '2023-09-03 04:07:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('23', '4', '5', '2023-09-04 04:13:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('24', '5', '15', '2023-09-04 03:38:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('25', '6', '7', '2023-09-06 04:03:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('26', '7', '23', '2023-09-06 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('27', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('28', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('29', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('30', '3', '13', '2023-09-03 04:07:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('31', '4', '5', '2023-09-04 04:13:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('32', '5', '15', '2023-09-04 03:38:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('33', '6', '7', '2023-09-06 04:03:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('34', '7', '23', '2023-09-06 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('35', '8', '2', '2023-09-07 03:44:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('36', '9', '9', '2023-09-07 03:39:00', 'HOSPITALISED');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('37', '10', '12', '2023-09-07 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('38', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('39', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('40', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('41', '3', '13', '2023-09-03 04:07:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('42', '4', '5', '2023-09-04 04:13:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('43', '5', '15', '2023-09-04 03:38:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('44', '6', '7', '2023-09-06 04:03:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('45', '7', '23', '2023-09-06 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('46', '8', '2', '2023-09-07 03:44:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('47', '9', '9', '2023-09-07 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('48', '10', '12', '2023-09-07 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('49', '11', '3', '2023-09-08 03:40:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('50', '0', '4', '2023-09-02 03:51:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('51', '1', '17', '2023-09-02 04:11:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('52', '2', '18', '2023-09-02 04:37:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('53', '4', '5', '2023-09-04 04:13:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('54', '5', '15', '2023-09-04 03:38:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('55', '6', '7', '2023-09-06 04:03:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('56', '7', '23', '2023-09-06 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('57', '8', '2', '2023-09-07 03:44:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('58', '9', '9', '2023-09-07 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('59', '10', '12', '2023-09-07 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('60', '11', '3', '2023-09-08 03:40:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('61', '0', '4', '2023-09-10 04:07:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('62', '1', '17', '2023-09-10 03:16:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('63', '2', '18', '2023-09-10 04:39:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('64', '6', '7', '2023-09-06 04:03:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('65', '7', '23', '2023-09-06 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('66', '8', '2', '2023-09-07 03:44:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('67', '9', '9', '2023-09-07 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('68', '10', '12', '2023-09-07 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('69', '11', '3', '2023-09-08 03:40:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('70', '0', '4', '2023-09-11 03:14:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('71', '1', '17', '2023-09-10 03:16:00', 'WELL');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('72', '2', '18', '2023-09-11 04:42:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('73', '6', '7', '2023-09-06 04:03:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('74', '7', '23', '2023-09-06 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('75', '8', '2', '2023-09-07 03:44:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('76', '9', '9', '2023-09-07 03:39:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('77', '10', '12', '2023-09-07 03:19:00', 'SICK');
INSERT INTO `health_status` (`id`, `case_id`, `employee_id`, `date`, `status`) VALUES ('78', '11', '3', '2023-09-08 03:40:00', 'SICK');
