CREATE TABLE `users` (
  `user_name` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='this table includes all the website users';

CREATE TABLE `personal` (
  `user_name` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `job` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `summary` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `personal_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `skills` (
  `user_name` varchar(45) NOT NULL,
  `expertise1` varchar(45) NOT NULL,
  `expertise2` varchar(45) NOT NULL,
  `expertise3` varchar(45) NOT NULL,
  `expertise4` varchar(45) NOT NULL,
  `expertise5` varchar(45) NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `skills` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `experience` (
  `user_name` varchar(45) NOT NULL,
  `year1` varchar(45) NOT NULL,
  `experience_name1` varchar(45) NOT NULL,
  `job_position1` varchar(45) NOT NULL,
  `experience_summary1` varchar(1000) NOT NULL,
  `year2` varchar(45) NOT NULL,
  `experience_name2` varchar(45) NOT NULL,
  `job_position2` varchar(45) NOT NULL,
  `experience_summary2` varchar(1000) NOT NULL,
  `year3` varchar(45) NOT NULL,
  `experience_name3` varchar(45) NOT NULL,
  `job_position3` varchar(45) NOT NULL,
  `experience_summary3` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `experience_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `education` (
  `user_name` varchar(45) NOT NULL,
  `education_year1` varchar(45) NOT NULL,
  `education_name1` varchar(45) NOT NULL,
  `education_grade1` varchar(45) NOT NULL,
  `education_year2` varchar(45) NOT NULL,
  `education_name2` varchar(45) NOT NULL,
  `education_grade2` varchar(45) NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `education_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
