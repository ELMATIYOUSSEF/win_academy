
drop database if exists win_academy;

create database if not exists win_academy;

use win_academy;

create table if not exists student (
    `id` int(16) primary key auto_increment,
    `firstname` varchar(255) not null ,
    `lastname` varchar(255) not null ,
    `phone` varchar(255) not null unique ,
    `email` varchar(255) not null unique,
    `start_date` date not null
);


create table if not exists college (
   `number` int(16) primary key,
   `name`   varchar(255) not null,
   `site`   varchar(255) not null
);



create table if not exists Department (
  `id`   int(16) primary key auto_increment,
  `name` varchar(255) not null
);



create table if not exists College_Department (
  `id`             int(16) primary key auto_increment,
  `department_id`  int(16) not null,
  `college_number` int(16) not null,
  CONSTRAINT `fk_department_college_department` FOREIGN KEY (`department_id`) REFERENCES Department (`id`)
      ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_college_college_department` FOREIGN KEY (`college_number`) REFERENCES College (`number`)
      ON DELETE CASCADE ON UPDATE CASCADE
);


create table if not exists salle (
    `id`           int(16) primary key auto_increment,
    `name`         varchar(255) not null,
    `number_place` int(16) not null
);



create table if not exists module (
    `id`   int(16) primary key auto_increment,
    `name` varchar(255) not null,
    `salle_id` int(16) not null ,
    CONSTRAINT `fk_module_salle` FOREIGN KEY (`salle_id`) REFERENCES salle(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
);


create table if not exists teacher (
    `id`                       int(16) primary key auto_increment,
    `firstname`                varchar(255) not null ,
    `lastname`                 varchar(255) not null ,
    `phone`                    varchar(255) not null unique ,
    `email`                    varchar(255) not null unique,
    `isResponsable`            BOOLEAN DEFAULT FALSE,
    `start_date_of_employment` date not null,
    `index`                    varchar(255) not null,
    `department_college_id`    int(16),
    `module_id`                int(16),
    CONSTRAINT `fk_teacher_department_college` FOREIGN KEY (`department_college_id`) REFERENCES College_Department(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE ,
    CONSTRAINT `fk_module_teacher` FOREIGN KEY (`module_id`) REFERENCES Module(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE

);

create table if not exists note (
    `student_id` int(16) not null ,
    `module_id`  int(16) not null ,
    `note`       float(40) not null,
    `session`    varchar(40) not null,
    `year`       int(6),

    CONSTRAINT `fk_note_student` FOREIGN KEY (`student_id`) REFERENCES student(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_module_note` FOREIGN KEY (`module_id`) REFERENCES module(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE

);