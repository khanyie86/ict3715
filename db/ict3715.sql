-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 08:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ict3715`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `initials` varchar(50) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `initials`, `surname`, `email`, `password`, `phone`, `created_at`) VALUES
(1000001, 'NP', 'Mokoena', 'khanyibu86@gmail.com', 'khanyie@86', '0838932816', '2024-05-20 17:36:00'),
(1000002, 'AB', 'Malinga', 'ab.smith@localhost.com', 'password123', '0821234567', '2024-05-20 17:36:12'),
(1000003, 'CD', 'Zulu', 'cd.johnson@localhost.com', 'adminpass', '0719876543', '2024-05-20 17:36:18'),
(1000004, 'EF', 'Williams', 'ef.williams@localhost.com', 'securepass', '0794567891', '2024-05-20 17:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` date NOT NULL,
  `capacity` int(11) NOT NULL,
  `fuel_type` varchar(100) NOT NULL,
  `insurance` date NOT NULL,
  `last_service` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `admin_id`, `route_id`, `reg_id`, `make`, `model`, `year`, `capacity`, `fuel_type`, `insurance`, `last_service`, `created_at`) VALUES
(1, 1, 1, 1, 'BlueBird', 'MiniBird', '2020-02-24', 35, 'Diesel', '2023-01-01', '2024-01-01', '2024-05-17 10:35:05'),
(2, 2, 2, 2, 'MidBus', 'Guide_SRW', '2021-01-01', 8, 'Diesel', '2023-10-01', '2023-12-01', '2024-05-17 10:36:03'),
(3, 3, 3, 3, 'Corbeil', 'SRW', '2021-01-25', 15, 'Diesel', '2023-03-30', '2024-02-01', '2024-05-17 10:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `bus_registration`
--

CREATE TABLE `bus_registration` (
  `reg_id` int(11) NOT NULL,
  `learner_id` int(11) NOT NULL,
  `bus_number` varchar(255) NOT NULL,
  `bus_limit` int(11) NOT NULL,
  `application_status` enum('''approved''','''pending''','','') NOT NULL,
  `waiting_list_number` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_registration`
--

INSERT INTO `bus_registration` (`reg_id`, `learner_id`, `bus_number`, `bus_limit`, `application_status`, `waiting_list_number`, `created_at`) VALUES
(1, 1, '1', 35, '\'approved\'', 10, '2024-05-19 18:54:46'),
(2, 2, '2', 8, '\'approved\'', 5, '2024-05-19 18:55:11'),
(3, 3, '3', 15, '\'approved\'', 6, '2024-05-19 18:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `bus_route`
--

CREATE TABLE `bus_route` (
  `bus_route_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_route`
--

INSERT INTO `bus_route` (`bus_route_id`, `bus_id`, `route_id`, `created_at`) VALUES
(1, 1, 1, '2024-05-17 12:47:17'),
(2, 2, 2, '2024-05-17 12:47:17'),
(3, 3, 3, '2024-05-17 12:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `drop_off_point`
--

CREATE TABLE `drop_off_point` (
  `drop_off_id` int(11) NOT NULL,
  `bus_route_id` int(11) NOT NULL,
  `drop_off_number` varchar(11) NOT NULL,
  `drop_off_name` varchar(255) NOT NULL,
  `drop_off_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drop_off_point`
--

INSERT INTO `drop_off_point` (`drop_off_id`, `bus_route_id`, `drop_off_number`, `drop_off_name`, `drop_off_time`, `created_at`) VALUES
(1, 1, '1A', 'Corner of Panorama and Marabou Road', '14:30:00', '2024-05-17 11:18:58'),
(2, 2, '1B', 'Corner of Kolgansstraat and Skimmerstraat', '14:39:00', '2024-05-17 11:18:58'),
(3, 3, '2A', 'Corner of Reddersburg Street and Mafeking Drive', '14:25:00', '2024-05-17 11:18:58'),
(4, 4, '2B', 'Corner of Theuns van Niekerstraat and Roosmarynstraat', '14:30:00', '2024-05-17 11:18:58'),
(5, 5, '3A', 'Corner of Jasper Drive and Tieroog Street', '14:30:00', '2024-05-17 11:18:58'),
(6, 6, '3B', 'Corner of Louise Street and Von Willich Drive', '14:40:00', '2024-05-17 11:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE `learner` (
  `learner_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `learner_name` varchar(255) NOT NULL,
  `learner_surname` varchar(255) NOT NULL,
  `learner_date_of_birth` date NOT NULL,
  `learner_home_address` varchar(255) NOT NULL,
  `learner_phone` varchar(15) NOT NULL,
  `learner_grade` enum('8','9','10','11','12') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `learner`
--

INSERT INTO `learner` (`learner_id`, `parent_id`, `bus_id`, `admin_id`, `learner_name`, `learner_surname`, `learner_date_of_birth`, `learner_home_address`, `learner_phone`, `learner_grade`, `created_at`) VALUES
(3000001, 2000001, 0, 1000002, 'Betsy', 'Calabrese', '2004-11-27', '2042 Morgan Rd', '0845607026', '12', '2024-05-20 17:37:06'),
(3000002, 2000001, 0, 1000002, 'Betsy', 'Calabrese', '2004-11-27', '2042 Morgan Rd', '0845607026', '12', '2024-05-20 17:38:45'),
(3000003, 2000001, 0, 1000002, 'Betsy', 'Calabrese', '2004-11-27', '2042 Morgan Rd', '0845607026', '12', '2024-05-20 17:38:45'),
(3000004, 2000004, 0, 1000002, 'Russell', 'Nucci', '2008-03-22', '707 Akasia St', '0826126014', '10', '2024-05-20 17:38:45'),
(3000005, 2000005, 0, 1000002, 'Brenda', 'Giordano', '2006-06-20', '533 Heuvel St', '0833333490', '11', '2024-05-20 17:38:45'),
(3000006, 2000006, 0, 1000002, 'Francis', 'Toscani', '2007-04-11', '639 Robertson Ave', '0827701832', '11', '2024-05-20 17:38:45'),
(3000007, 2000007, 0, 1000002, 'Josefina', 'Rossi', '2010-03-08', '1123 Oranje St', '0827190801', '8', '2024-05-20 17:38:45'),
(3000008, 2000008, 0, 1000002, 'Stephen', 'Mazzanti', '2004-11-10', '671 Gemsbok St', '0848680322', '12', '2024-05-20 17:38:45'),
(3000009, 2000009, 0, 1000002, 'Erin', 'Siciliano', '2004-12-11', '2179 Telford Ave', '0855210206', '12', '2024-05-20 17:38:45'),
(3000010, 2000010, 0, 1000002, 'Billie', 'Colombo', '2010-06-05', '142 Nelson Mandela Drive', '0847280809', '8', '2024-05-20 17:38:45'),
(3000011, 2000011, 0, 1000002, 'Frank', 'Bergamaschi', '2003-11-18', '894 Gray Pl', '0853309605', '12', '2024-05-20 17:38:45'),
(3000012, 2000012, 0, 1000002, 'Weston', 'Schiavone', '2004-03-17', '22 Robertson Ave', '0832507231', '12', '2024-05-20 17:38:45'),
(3000013, 2000001, 0, 1000002, 'Mary', 'Calabrese', '2004-09-29', '1850 Church St', '0842549458', '12', '2024-05-20 17:38:45'),
(3000014, 2000014, 0, 1000002, 'Teresa', 'Iadanza', '2004-05-27', '1907 Schoeman St', '0821405192', '12', '2024-05-20 17:38:45'),
(3000015, 2000015, 0, 1000002, 'Virginia', 'Davide', '2006-06-03', '678 Gemsbok St', '0834067279', '11', '2024-05-20 17:38:45'),
(3000016, 2000016, 0, 1000002, 'Misty', 'Buccho', '2007-03-28', '1500 Hoog St', '0836798051', '11', '2024-05-20 17:38:45'),
(3000017, 2000017, 0, 1000002, 'Lana', 'Sagese', '2006-06-07', '34 Mosman Rd', '0851477732', '11', '2024-05-20 17:38:45'),
(3000018, 2000018, 0, 1000002, 'Lisa', 'Moretti', '2007-04-15', '1979 Dorp St', '0852706763', '11', '2024-05-20 17:38:45'),
(3000019, 2000019, 0, 1000002, 'Evelyn', 'Trentini', '2005-09-07', '747 Daffodil Dr', '0839718116', '12', '2024-05-20 17:38:45'),
(3000020, 2000020, 0, 1000002, 'Vicky', 'Bianchi', '2004-12-18', '508 Willow St', '0824251916', '12', '2024-05-20 17:38:45'),
(3000021, 2000021, 0, 1000002, 'Sharon', 'Romano', '2005-11-12', '238 Heuvel St', '0846858947', '12', '2024-05-20 17:38:45'),
(3000022, 2000022, 0, 1000002, 'Freida', 'Padovesi', '2010-09-02', '238 Heuvel St', '0859164938', '8', '2024-05-20 17:38:45'),
(3000023, 2000023, 0, 1000002, 'John', 'Palerma', '2005-06-16', '1812 Robertson Ave', '0835459795', '12', '2024-05-20 17:38:45'),
(3000024, 2000024, 0, 1000002, 'Marc', 'Calabresi', '2006-07-30', '32 Prospect St', '0855264405', '12', '2024-05-20 17:38:45'),
(3000025, 2000025, 0, 1000002, 'Janet', 'Manna', '2009-01-24', '1500 President St', '0834885450', '9', '2024-05-20 17:38:45'),
(3000026, 2000026, 0, 1000002, 'Kathleen', 'Monaldo', '2007-12-12', '129 Zigzag Rd', '0841528631', '11', '2024-05-20 17:38:45'),
(3000027, 2000027, 0, 1000002, 'Felipe', 'Siciliano', '2011-01-26', '2425 Mark Street', '0855557524', '8', '2024-05-20 17:38:45'),
(3000028, 2000028, 0, 1000002, 'Adrianne', 'Napolitani', '2006-09-02', '1443 Bad St', '0834319526', '11', '2024-05-20 17:38:45'),
(3000029, 2000029, 0, 1000002, 'Paul', 'Fallaci', '2011-11-01', '458 Impala St', '0857958923', '8', '2024-05-20 17:38:45'),
(3000030, 2000030, 0, 1000002, 'John', 'Lo Duca', '2008-07-06', '1958 Bhoola Rd', '0858727444', '10', '2024-05-20 17:38:45'),
(3000031, 2000031, 0, 1000002, 'Dawn', 'Iadanza', '2010-03-14', '444 Barlow Street', '0853841725', '8', '2024-05-20 17:38:45'),
(3000032, 2000032, 0, 1000002, 'Willie', 'Ferrari', '2008-08-16', '593 Glyn St', '0839970010', '10', '2024-05-20 17:38:45'),
(3000033, 2000033, 0, 1000002, 'Julie', 'Pisano', '2010-12-15', '1989 Mark Street', '0853925991', '10', '2024-05-20 17:38:45'),
(3000034, 2000034, 0, 1000002, 'Donald', 'Colombo', '2005-10-18', '603 Impala St', '0842970383', '12', '2024-05-20 17:38:45'),
(3000035, 2000035, 0, 1000002, 'Amy', 'Milani', '2009-03-14', '228 Kort St', '0843451927', '9', '2024-05-20 17:38:45'),
(3000036, 2000036, 0, 1000002, 'Theresa', 'Romani', '2004-05-06', '827 Plein St', '0836114513', '12', '2024-05-20 17:38:45'),
(3000037, 2000037, 0, 1000002, 'Elizabeth', 'Colombo', '2010-03-05', '130 Rus St', '0828030923', '8', '2024-05-20 17:38:45'),
(3000038, 2000038, 0, 1000002, 'Jorge', 'Toscani', '2005-01-22', '1061 Telford Ave', '0846343401', '12', '2024-05-20 17:38:45'),
(3000039, 2000039, 0, 1000002, 'Lisa', 'Udinese', '2004-06-07', '776 Marconi St', '0839444375', '12', '2024-05-20 17:38:45'),
(3000040, 2000040, 0, 1000002, 'Glen', 'Palerma', '2006-07-12', '232 Rissik St', '0852257028', '11', '2024-05-20 17:38:45'),
(3000041, 2000041, 0, 1000002, 'Kathleen', 'De Luca', '2006-10-24', '1973 Station Road', '0859042869', '11', '2024-05-20 17:38:45'),
(3000042, 2000042, 0, 1000002, 'Robert', 'Cattaneo', '2006-11-12', '1572 Mark Street', '0836834661', '11', '2024-05-20 17:38:45'),
(3000043, 2000043, 0, 1000002, 'Kevin', 'Cocci', '2010-10-10', '1146 Bezuidenhout St', '0826993388', '8', '2024-05-20 17:38:45'),
(3000044, 2000044, 0, 1000002, 'Betty', 'Bellucci', '2007-11-10', '133 St. John Street', '0834642318', '11', '2024-05-20 17:38:45'),
(3000045, 2000045, 0, 1000002, 'Eliza', 'Marchesi', '2003-06-13', '14 Bhoola Rd', '0824901217', '12', '2024-05-20 17:38:45'),
(3000046, 2000046, 0, 1000002, 'Martha', 'Padovesi', '2006-02-02', '1724 Oost St', '0839475874', '11', '2024-05-20 17:38:45'),
(3000047, 2000047, 0, 1000002, 'Marco', 'Genovesi', '2008-11-02', '2409 Daffodil Dr', '0847098778', '10', '2024-05-20 17:38:45'),
(3000048, 2000048, 0, 1000002, 'Mary', 'Cattaneo', '2007-02-07', '2143 Langley St', '0839398264', '11', '2024-05-20 17:38:45'),
(3000049, 2000049, 0, 1000002, 'Brian', 'Udinesi', '2003-05-09', '1582 Prospect St', '0842251703', '12', '2024-05-20 17:38:45'),
(3000050, 2000050, 0, 1000002, 'Marylin', 'Pisani', '2010-10-22', '785 Schoeman St', '0847086055', '8', '2024-05-20 17:38:45'),
(3000051, 2000051, 0, 1000002, 'Janie', 'Toscani', '2007-03-17', '821 Oxford St', '0821140767', '11', '2024-05-20 17:38:45'),
(3000052, 2000052, 0, 1000002, 'James', 'Iadanza', '2007-02-19', '1190 President St', '0831995142', '11', '2024-05-20 17:38:45'),
(3000053, 2000053, 0, 1000002, 'Maria', 'Romani', '2006-02-19', '1235 Mark Street', '0825545372', '11', '2024-05-20 17:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `parent_name` varchar(255) NOT NULL,
  `parent_lastname` varchar(255) NOT NULL,
  `parent_email` varchar(100) NOT NULL,
  `parent_phone` varchar(15) NOT NULL,
  `parent_password` varchar(50) NOT NULL,
  `status` enum('''1''','''2''','''3''','''4''','') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `parent_name`, `parent_lastname`, `parent_email`, `parent_phone`, `parent_password`, `status`, `created_at`) VALUES
(2000001, 'Zoey', 'Que', 'khanyibu86@gmail.com', '0838932816', 'khanyie@86', '\'1\'', '2024-05-20 14:40:46'),
(2000002, 'Delfina', 'Milano', 'DelfinaMilano@rhyta.com', '0853932545', 'beeCexee4yoo', '\'1\'', '2024-05-20 14:40:46'),
(2000003, 'Carla', 'Calabrese', 'CarlaCalabrese@dayrep.com', '0854386318', 'pae4eej5aG', '\'1\'', '2024-05-20 14:40:46'),
(2000004, 'Editta', 'Nucci', 'EdittaNucci@superrito.com', '0839050267', 'eimohsh0ooC', '\'1\'', '2024-05-20 14:40:46'),
(2000005, 'Alfonsa', 'Giordano', 'AlfonsaGiordano@teleworm.us', '0827728367', 'Ci1wa5die', '\'1\'', '2024-05-20 14:40:46'),
(2000006, 'Benedetta', 'Toscani', 'BenedettaToscani@fleckens.hu', '0838625382', 'ufeiBu3oo', '\'1\'', '2024-05-20 14:40:46'),
(2000007, 'Gianna', 'Rossi', 'GiannaRossi@rhyta.com', '0859941184', 'HohCu7Loh', '\'1\'', '2024-05-20 14:40:46'),
(2000008, 'Luigina', 'Mazzanti', 'LuiginaMazzanti@rhyta.com', '0851186345', 'Sheisaiz0ei', '\'1\'', '2024-05-20 14:40:46'),
(2000009, 'Ortensia', 'Siciliano', 'OrtensiaSiciliano@teleworm.us', '0837516963', 'AiGhahch5', '\'1\'', '2024-05-20 14:40:46'),
(2000010, 'Pantaleone', 'Colombo', 'PantaleoneColombo@jourrapide.com', '0837838296', 'Quahd0aing', '\'1\'', '2024-05-20 14:40:46'),
(2000011, 'Camilla', 'Bergamaschi', 'CamillaBergamaschi@einrot.com', '0846622247', 'ootheo7ooD', '\'1\'', '2024-05-20 14:40:46'),
(2000012, 'Nella', 'Schiavone', 'NellaSchiavone@cuvox.de', '0857405755', 'feem7Eiz', '\'1\'', '2024-05-20 14:40:46'),
(2000013, 'Tiziano', 'Calabrese', 'TizianoCalabrese@fleckens.hu', '0844304179', 'taebe1Xei', '\'1\'', '2024-05-20 14:40:46'),
(2000014, 'Alfonsa', 'Iadanza', 'AlfonsaIadanza@jourrapide.com', '0838967759', 'aiSa3Boosh1', '\'1\'', '2024-05-20 14:40:46'),
(2000015, 'Andrea', 'Davide', 'AndreaDavide@jourrapide.com', '0828334560', 'thoo7eeS', '\'1\'', '2024-05-20 14:40:46'),
(2000016, 'Ester', 'Buccho', 'EsterBuccho@armyspy.com', '0848575616', 'fu4guChoo', '\'1\'', '2024-05-20 14:40:46'),
(2000017, 'Edoardo', 'Sagese', 'EdoardoSagese@rhyta.com', '0853690476', 'Ohbaungae9oo', '\'1\'', '2024-05-20 14:40:46'),
(2000018, 'Filiberto', 'Moretti', 'FilibertoMoretti@fleckens.hu', '0822326313', 'ailoo7ahZ', '\'1\'', '2024-05-20 14:40:46'),
(2000019, 'Ines', 'Trentini', 'InesTrentini@armyspy.com', '0855116828', 'cexooH1Hoh', '\'1\'', '2024-05-20 14:40:46'),
(2000020, 'Marina', 'Bianchi', 'MarinaBianchi@dayrep.com', '0858197289', 'ePhephoo3', '\'1\'', '2024-05-20 14:40:46'),
(2000021, 'Fiamma', 'Romano', 'FiammaRomano@gustr.com', '0835053239', 'eb0aiMai', '\'1\'', '2024-05-20 14:40:46'),
(2000022, 'Andrea', 'Padovesi', 'AndreaPadovesi@dayrep.com', '0859282378', 'Shool8zeem', '\'1\'', '2024-05-20 14:40:46'),
(2000023, 'Violetta', 'Palerma', 'ViolettaPalerma@dayrep.com', '0827989493', 'AiShohoh6sh', '\'1\'', '2024-05-20 14:40:46'),
(2000024, 'Alfio', 'Calabresi', 'AlfioCalabresi@armyspy.com', '0848546404', 'rua8maiQua5', '\'1\'', '2024-05-20 14:40:46'),
(2000025, 'Geronima', 'Manna', 'GeronimaManna@teleworm.us', '0847704000', 'ohV2joengou4', '\'1\'', '2024-05-20 14:40:46'),
(2000026, 'Corinna', 'Monaldo', 'CorinnaMonaldo@armyspy.com', '0834501435', 'edahY4eg', '\'1\'', '2024-05-20 14:40:46'),
(2000027, 'Battista', 'Siciliano', 'BattistaSiciliano@cuvox.de', '0831464995', 'Tohl4wev4', '\'1\'', '2024-05-20 14:40:46'),
(2000028, 'Fantino', 'Napolitani', 'FantinoNapolitani@cuvox.de', '0841389935', 'aetigh0Aivae', '\'1\'', '2024-05-20 14:40:46'),
(2000029, 'Emanuela', 'Fallaci', 'EmanuelaFallaci@teleworm.us', '0857576710', 'Zoe4keis1ee', '\'1\'', '2024-05-20 14:40:46'),
(2000030, 'Arturo', 'Lo Duca', 'ArturoLoDuca@jourrapide.com', '0858951745', 'yai4ahPee', '\'1\'', '2024-05-20 14:40:46'),
(2000031, 'Tiziana', 'Iadanza', 'TizianaIadanza@fleckens.hu', '0822364013', 'iucheiW9ah', '\'1\'', '2024-05-20 14:40:46'),
(2000032, 'Taziana', 'Ferrari', 'TazianaFerrari@einrot.com', '0853940017', 'IecohW5d', '\'1\'', '2024-05-20 14:40:46'),
(2000033, 'Santina', 'Pisano', 'SantinaPisano@fleckens.hu', '0831898228', 'aedaeR6o', '\'1\'', '2024-05-20 14:40:46'),
(2000034, 'Aurelia', 'Colombo', 'AureliaColombo@rhyta.com', '0846892352', 'Aipa7kahn3', '\'1\'', '2024-05-20 14:40:46'),
(2000035, 'Vera', 'Milani', 'VeraMilani@gustr.com', '0857739848', 'aiF9uYeigh', '\'1\'', '2024-05-20 14:40:46'),
(2000036, 'Elda', 'Romani', 'EldaRomani@rhyta.com', '0829908994', 'Cae6eev0aop', '\'1\'', '2024-05-20 14:40:46'),
(2000037, 'Virgilia', 'Colombo', 'VirgiliaColombo@armyspy.com', '0851027918', 'vei7dueC5eu', '\'1\'', '2024-05-20 14:40:46'),
(2000038, 'Nunzia', 'Toscani', 'NunziaToscani@teleworm.us', '0841085158', 'Ohqu3ve7ai', '\'1\'', '2024-05-20 14:40:46'),
(2000039, 'Debora', 'Udinese', 'DeboraUdinese@gustr.com', '0848974472', 'dae1meiCh', '\'1\'', '2024-05-20 14:40:46'),
(2000040, 'Mariano', 'Palerma', 'MarianoPalerma@teleworm.us', '0859706688', 'shie0ohChei', '\'1\'', '2024-05-20 14:40:46'),
(2000041, 'Fausto', 'De Luca', 'FaustoDeLuca@superrito.com', '0855376399', 'ooZ7aeCh7gu', '\'1\'', '2024-05-20 14:40:46'),
(2000042, 'Eugenia', 'Cattaneo', 'EugeniaCattaneo@rhyta.com', '0825460604', 'Joz8aehoh', '\'1\'', '2024-05-20 14:40:46'),
(2000043, 'Alide', 'Cocci', 'AlideCocci@rhyta.com', '0859205781', 'aequ6bai1Ei', '\'1\'', '2024-05-20 14:40:46'),
(2000044, 'Geronima', 'Bellucci', 'GeronimaBellucci@armyspy.com', '0838668346', 'haebai6H', '\'1\'', '2024-05-20 14:40:46'),
(2000045, 'Iacopo', 'Marchesi', 'IacopoMarchesi@gustr.com', '0833458656', 'johai9Ku3ah', '\'1\'', '2024-05-20 14:40:46'),
(2000046, 'Loredana', 'Padovesi', 'LoredanaPadovesi@einrot.com', '0831606193', 'Beu3eeNg', '\'1\'', '2024-05-20 14:40:46'),
(2000047, 'Cornelio', 'Genovesi', 'CornelioGenovesi@jourrapide.com', '0854428285', 'aiXoowie4ki', '\'1\'', '2024-05-20 14:40:46'),
(2000048, 'Gilda', 'Cattaneo', 'GildaCattaneo@dayrep.com', '0821686604', 'Quahghu6j', '\'1\'', '2024-05-20 14:40:46'),
(2000049, 'Lorenzo', 'Udinesi', 'LorenzoUdinesi@rhyta.com', '0836732833', 'meG8uphie0v', '\'1\'', '2024-05-20 14:40:46'),
(2000050, 'Ileana', 'Pisani', 'IleanaPisani@dayrep.com', '0833803686', 'sohTeekoh2', '\'1\'', '2024-05-20 14:40:46'),
(2000051, 'Adelaide', 'Toscani', 'AdelaideToscani@cuvox.de', '0858478931', 'Ex8teaY9', '\'1\'', '2024-05-20 14:40:46'),
(2000052, 'Nadia', 'Iadanza', 'NadiaIadanza@gustr.com', '0839158643', 'phaim3aShoo', '\'1\'', '2024-05-20 14:40:46'),
(2000053, 'Dorotea', 'Mazzi', 'DoroteaMazzi@rhyta.com', '0842941924', 'bae4aaT9vov', '\'1\'', '2024-05-20 14:40:46'),
(2000054, 'Elvia', 'Rossi', 'ElviaRossi@superrito.com', '0858052745', 'bevuu5OguBoo', '\'1\'', '2024-05-20 14:40:46'),
(2000055, 'Emanuela', 'Lorenzo', 'EmanuelaLorenzo@armyspy.com', '0824870596', 'aaw6Ohcha6j', '\'1\'', '2024-05-20 14:40:46'),
(2000056, 'Oberto', 'Palerma', 'ObertoPalerma@armyspy.com', '0823130522', 'iet4goxaeHo', '\'1\'', '2024-05-20 14:40:46'),
(2000057, 'Tranquillina', 'Zetticci', 'TranquillinaZetticci@superrito.com', '0822699469', 'Wiehieth9em', '\'1\'', '2024-05-20 14:40:46'),
(2000058, 'Veronica', 'Baresi', 'VeronicaBaresi@einrot.com', '0827042091', 'iNge9laaqu3', '\'1\'', '2024-05-20 14:40:46'),
(2000059, 'Lioba', 'Fiorentini', 'LiobaFiorentini@gustr.com', '0837964354', 'Ach7aenoh', '\'1\'', '2024-05-20 14:40:46'),
(2000060, 'Laura', 'Dellucci', 'LauraDellucci@rhyta.com', '0846724505', 'Xe2iNgo7tuo', '\'1\'', '2024-05-20 14:40:46'),
(2000061, 'Cesio', 'Palerma', 'CesioPalerma@gustr.com', '0825410918', 'Piel2Eek9', '\'1\'', '2024-05-20 14:40:46'),
(2000062, 'Prisca', 'Pagnotto', 'PriscaPagnotto@einrot.com', '0854673657', 'ohpioheiw2V', '\'1\'', '2024-05-20 14:40:46'),
(2000063, 'Arsenio', 'Buccho', 'ArsenioBuccho@teleworm.us', '0851434375', 'Doothahgh3e', '\'1\'', '2024-05-20 14:40:46'),
(2000064, 'Donato', 'Marino', 'DonatoMarino@gustr.com', '0837300369', 'Fo1paiz2', '\'1\'', '2024-05-20 14:40:46'),
(2000065, 'Alfreda', 'Lori', 'AlfredaLori@rhyta.com', '0829518174', 'Ex4xangoo', '\'1\'', '2024-05-20 14:40:46'),
(2000066, 'Aloisia', 'Lucchesi', 'AloisiaLucchesi@cuvox.de', '0826057403', 'eid5Aeyiarah', '\'1\'', '2024-05-20 14:40:46'),
(2000067, 'Quintina', 'Mazzanti', 'QuintinaMazzanti@cuvox.de', '0831448302', 'ohrun0Iequ', '\'1\'', '2024-05-20 14:40:46'),
(2000068, 'Alceo', 'Arcuri', 'AlceoArcuri@armyspy.com', '0825087471', 'Seer0pu1o', '\'1\'', '2024-05-20 14:40:46'),
(2000069, 'Violante', 'Lombardi', 'ViolanteLombardi@einrot.com', '0855835606', 'suzi5Oipie', '\'1\'', '2024-05-20 14:40:46'),
(2000070, 'Quintina', 'Bergamaschi', 'QuintinaBergamaschi@rhyta.com', '0844264343', 'eineoKea4t', '\'1\'', '2024-05-20 14:40:46'),
(2000071, 'Renata', 'Trevisan', 'RenataTrevisan@fleckens.hu', '0859028319', 'Aiwe2ahthah', '\'1\'', '2024-05-20 14:40:46'),
(2000072, 'Erminia', 'Trentino', 'ErminiaTrentino@superrito.com', '0835566745', 'Ae3phah8ae', '\'1\'', '2024-05-20 14:40:46'),
(2000073, 'Guendalina', 'Esposito', 'GuendalinaEsposito@dayrep.com', '0823467547', 'Shah0eing6ei', '\'1\'', '2024-05-20 14:40:46'),
(2000074, 'Liviano', 'Russo', 'LivianoRusso@teleworm.us', '0857013539', 'Wihu1mooso', '\'1\'', '2024-05-20 14:40:46'),
(2000075, 'Artemio', 'Lombardo', 'ArtemioLombardo@rhyta.com', '0849362402', 'ehoop6Eesoo', '\'1\'', '2024-05-20 14:40:46'),
(2000076, 'Colomba', 'Bergamaschi', 'ColombaBergamaschi@teleworm.us', '0847065847', 'eochab8Boh0ah', '\'1\'', '2024-05-20 14:40:46'),
(2000077, 'Manuele', 'Lombardo', 'ManueleLombardo@fleckens.hu', '0857233702', 'Odisha7oo', '\'1\'', '2024-05-20 14:40:46'),
(2000078, 'Affiano', 'Pinto', 'AffianoPinto@einrot.com', '0825800782', 'uhiuT7yoo8J', '\'1\'', '2024-05-20 14:40:46'),
(2000079, 'Agnese', 'Li Fonti', 'AgneseLiFonti@armyspy.com', '0837442015', 'wooNgi1jee', '\'1\'', '2024-05-20 14:40:46'),
(2000080, 'Elisabetta', 'Costa', 'ElisabettaCosta@jourrapide.com', '0852255893', 'thieN2gai', '\'1\'', '2024-05-20 14:40:46'),
(2000081, 'Duccio', 'Calabresi', 'DuccioCalabresi@superrito.com', '0851000470', 'ieNeemohc2oh', '\'1\'', '2024-05-20 14:40:46'),
(2000082, 'Ileana', 'Pugliesi', 'IleanaPugliesi@superrito.com', '0839406996', 'aeR2hagaigh', '\'1\'', '2024-05-20 14:40:46'),
(2000083, 'Clemente', 'Romani', 'ClementeRomani@gustr.com', '0846079604', 'uuF3vaequ', '\'1\'', '2024-05-20 14:40:46'),
(2000084, 'Dora', 'Siciliano', 'DoraSiciliano@einrot.com', '0859668379', 'HeingahF4c', '\'1\'', '2024-05-20 14:40:46'),
(2000085, 'Elio', 'Mancini', 'ElioMancini@superrito.com', '0856438017', 'Chei2OhBo', '\'1\'', '2024-05-20 14:40:46'),
(2000086, 'Gioacchina', 'Costa', 'GioacchinaCosta@jourrapide.com', '0847917185', 'Aeraelie7Ei', '\'1\'', '2024-05-20 14:40:46'),
(2000087, 'Sabina', 'Rizzo', 'SabinaRizzo@teleworm.us', '0825393935', 'tiewo4Aiph0', '\'1\'', '2024-05-20 14:40:46'),
(2000088, 'Blanda', 'Ferri', 'BlandaFerri@einrot.com', '0859319309', 'gohSh6Lu', '\'1\'', '2024-05-20 14:40:46'),
(2000089, 'Priscilla', 'Schiavone', 'PriscillaSchiavone@cuvox.de', '0858967886', 'Joo6JohNge2n', '\'1\'', '2024-05-20 14:40:46'),
(2000090, 'Daphne', 'Pisani', 'DaphnePisani@superrito.com', '0845501857', 'Wee9Jae9ooZ3', '\'1\'', '2024-05-20 14:40:46'),
(2000091, 'Casimiro', 'Colombo', 'CasimiroColombo@cuvox.de', '0845905079', 'Eequi1quaiV', '\'1\'', '2024-05-20 14:40:46'),
(2000092, 'Espedito', 'Lucchese', 'EspeditoLucchese@gustr.com', '0821751257', 'Kai5atie3noh', '\'1\'', '2024-05-20 14:40:46'),
(2000093, 'Filiberta', 'Lucciano', 'FilibertaLucciano@teleworm.us', '0834556500', 'ath4Ohd1', '\'1\'', '2024-05-20 14:40:46'),
(2000094, 'Ramiro', 'Mancini', 'RamiroMancini@armyspy.com', '0855373253', 'Daezich9vi', '\'1\'', '2024-05-20 14:40:46'),
(2000095, 'Lilla', 'Manfrin', 'LillaManfrin@rhyta.com', '0837956689', 'coa8ohwohRu', '\'1\'', '2024-05-20 14:40:46'),
(2000096, 'Beato', 'Beneventi', 'BeatoBeneventi@rhyta.com', '0857645636', 'dae6ahR0dai3', '\'1\'', '2024-05-20 14:40:46'),
(2000097, 'Gildo', 'Capon', 'GildoCapon@einrot.com', '0822476685', 'ii2ooqu0Ohc', '\'1\'', '2024-05-20 14:40:46'),
(2000098, 'Batilda', 'Palermo', 'BatildaPalermo@jourrapide.com', '0841292996', 'tieQu6Yai', '\'1\'', '2024-05-20 14:40:46'),
(2000099, 'Isidoro', 'Panicucci', 'IsidoroPanicucci@armyspy.com', '0821705096', 'jee5Ein1', '\'1\'', '2024-05-20 14:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `pick_up_point`
--

CREATE TABLE `pick_up_point` (
  `pick_up_id` int(11) NOT NULL,
  `bus_route_id` int(11) NOT NULL,
  `pick_up_number` varchar(11) NOT NULL,
  `pick_up_name` varchar(255) NOT NULL,
  `pick_up_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pick_up_point`
--

INSERT INTO `pick_up_point` (`pick_up_id`, `bus_route_id`, `pick_up_number`, `pick_up_name`, `pick_up_time`, `created_at`) VALUES
(1, 1, '1A', 'Corner of Panorama and Marabou Road', '06:22:00', '2024-05-15 17:41:00'),
(2, 2, '1B', 'Corner of Kolgansstraat and Skimmerstraat', '06:30:00', '2024-05-15 17:41:00'),
(3, 3, '2A', 'Corner of Reddersburg Street and Mafeking Drive', '06:25:00', '2024-05-15 17:41:00'),
(4, 4, '2B', 'Corner of Theuns van Niekerstraat and Roosmarynstraat', '06:35:00', '2024-05-15 17:41:00'),
(5, 5, '3A', 'Corner of Jasper Drive and Tieroog Street', '06:20:00', '2024-05-15 17:41:00'),
(6, 6, '3B', 'Corner of Louise Street and Von Willich Drive', '06:40:00', '2024-05-15 17:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `pick_up_id` int(11) NOT NULL,
  `drop_off_id` int(11) NOT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `pick_up_id`, `drop_off_id`, `route_name`, `created_at`) VALUES
(1, 1, 1, 'Rooihuiskraal', '2024-05-14 14:27:29'),
(2, 2, 2, 'Wierdapark', '2024-05-14 17:25:04'),
(3, 3, 3, 'Centurion', '2024-05-14 17:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_list`
--

CREATE TABLE `waiting_list` (
  `waiting_list_id` int(11) NOT NULL,
  `learner_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `requested_year` year(4) NOT NULL,
  `learner_name` varchar(255) NOT NULL,
  `learner_phone` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waiting_list`
--

INSERT INTO `waiting_list` (`waiting_list_id`, `learner_id`, `admin_id`, `requested_year`, `learner_name`, `learner_phone`, `created_at`) VALUES
(1, 1, 1, '2025', 'Doda', '0833602763', '2024-05-19 17:06:43'),
(2, 2, 2, '2025', 'Adelfina', '0841705613', '2024-05-19 17:07:51'),
(3, 3, 3, '2025', 'Nilde', '0842751839', '2024-05-19 17:08:08'),
(4, 4, 4, '2025', 'Fernanda', '0858693124', '2024-05-19 17:07:37'),
(5, 5, 5, '2025', 'Gaspare', '0849751277', '2024-05-19 17:08:28'),
(6, 6, 6, '2025', 'dora', '0854192726', '2024-05-19 17:08:43'),
(7, 7, 7, '2025', 'Doda', '0852940179', '2024-05-19 17:09:00'),
(8, 0, 0, '2025', 'Cristian', '0828957203', '0000-00-00 00:00:00'),
(9, 9, 9, '2025', 'Violetta', '0847525122', '2024-05-19 17:09:18'),
(10, 10, 10, '2025', 'Severo', '0844349535', '2024-05-19 17:11:08'),
(11, 11, 11, '2025', 'Ernesto', '0838851286', '2024-05-19 17:11:54'),
(12, 12, 12, '2025', 'Cristiana', '0836272615', '2024-05-19 17:12:13'),
(13, 13, 13, '2025', 'Quinzio', '0856642113', '2024-05-19 17:13:08'),
(14, 14, 14, '2025', 'Ivana', '0832732375', '2024-05-19 17:13:30'),
(15, 15, 15, '2025', 'Castore', '0841030850', '2024-05-19 17:13:49'),
(16, 16, 16, '2025', 'Artemia', '0829761140', '2024-05-19 17:10:30'),
(17, 17, 17, '2025', 'Crispina', '0858613125', '2024-05-19 17:10:49'),
(18, 18, 18, '2025', 'Adalgisa', '0824089884', '2024-05-19 17:10:12'),
(19, 19, 19, '2025', 'Publio', '0834056775', '2024-05-19 17:09:53'),
(20, 20, 20, '2025', 'Angelina', '0839598757', '2024-05-19 17:09:35'),
(21, 21, 21, '2025', 'Ernesto', '0838851286', '2024-05-19 17:14:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `fk_reg_id` (`reg_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `bus_registration`
--
ALTER TABLE `bus_registration`
  ADD PRIMARY KEY (`reg_id`),
  ADD KEY `fk_learner_id` (`learner_id`);

--
-- Indexes for table `bus_route`
--
ALTER TABLE `bus_route`
  ADD PRIMARY KEY (`bus_route_id`),
  ADD KEY `fk_bus_id` (`bus_id`),
  ADD KEY `fk_route_id` (`route_id`);

--
-- Indexes for table `drop_off_point`
--
ALTER TABLE `drop_off_point`
  ADD PRIMARY KEY (`drop_off_id`),
  ADD KEY `bus_route_id` (`bus_route_id`);

--
-- Indexes for table `learner`
--
ALTER TABLE `learner`
  ADD PRIMARY KEY (`learner_id`),
  ADD KEY `fk_admin_id` (`admin_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `fk_parent_id` (`parent_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `pick_up_point`
--
ALTER TABLE `pick_up_point`
  ADD PRIMARY KEY (`pick_up_id`),
  ADD KEY `fk_bus_route_id` (`bus_route_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_pick_up_id` (`pick_up_id`),
  ADD KEY `fk_drop_off_id` (`drop_off_id`);

--
-- Indexes for table `waiting_list`
--
ALTER TABLE `waiting_list`
  ADD PRIMARY KEY (`waiting_list_id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000005;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240000006;

--
-- AUTO_INCREMENT for table `bus_registration`
--
ALTER TABLE `bus_registration`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bus_route`
--
ALTER TABLE `bus_route`
  MODIFY `bus_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drop_off_point`
--
ALTER TABLE `drop_off_point`
  MODIFY `drop_off_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `learner`
--
ALTER TABLE `learner`
  MODIFY `learner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3000054;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001002;

--
-- AUTO_INCREMENT for table `pick_up_point`
--
ALTER TABLE `pick_up_point`
  MODIFY `pick_up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waiting_list`
--
ALTER TABLE `waiting_list`
  MODIFY `waiting_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `route_id` FOREIGN KEY (`route_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `bus_registration`
--
ALTER TABLE `bus_registration`
  ADD CONSTRAINT `fk_learner_id` FOREIGN KEY (`learner_id`) REFERENCES `bus_registration` (`reg_id`);

--
-- Constraints for table `bus_route`
--
ALTER TABLE `bus_route`
  ADD CONSTRAINT `fk_bus_id` FOREIGN KEY (`bus_id`) REFERENCES `bus_route` (`bus_route_id`),
  ADD CONSTRAINT `fk_route_id` FOREIGN KEY (`route_id`) REFERENCES `bus_route` (`bus_route_id`);

--
-- Constraints for table `drop_off_point`
--
ALTER TABLE `drop_off_point`
  ADD CONSTRAINT `bus_route_id` FOREIGN KEY (`bus_route_id`) REFERENCES `drop_off_point` (`drop_off_id`);

--
-- Constraints for table `learner`
--
ALTER TABLE `learner`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `fk_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`);

--
-- Constraints for table `pick_up_point`
--
ALTER TABLE `pick_up_point`
  ADD CONSTRAINT `fk_bus_route_id` FOREIGN KEY (`bus_route_id`) REFERENCES `pick_up_point` (`pick_up_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `fk_drop_off_id` FOREIGN KEY (`drop_off_id`) REFERENCES `route` (`route_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
