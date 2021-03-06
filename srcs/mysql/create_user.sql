-- Create an user to interact with the database with all privileges
-- Then create a new database.

-- --------------------------------------------------------

--
-- Database : `42_inception`
--
CREATE DATABASE IF NOT EXISTS `42_inception`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE 42_inception;

-- --------------------------------------------------------

-- id : user42
-- password : user42
CREATE USER 'user42'@'%' IDENTIFIED BY 'user42';
GRANT ALL PRIVILEGES ON *.* TO 'user42'@'%' WITH GRANT OPTION;