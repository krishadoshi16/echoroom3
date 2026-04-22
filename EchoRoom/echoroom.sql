-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 05:39 PM
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
-- Database: `echoroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(20) NOT NULL,
  `is_suspended` tinyint(1) NOT NULL,
  `suspended_at` datetime(6) DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL,
  `banned_at` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `role`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`, `email`) VALUES
(1, 'pbkdf2_sha256$600000$veSiUR9oQwOejejsOzTGEt$7qMOw1f+A1+rNoUU7+m9huYMxHp6rj/dAfGiZxB7uUg=', NULL, 0, 'echouser_test1', '', '', 0, 1, '2026-03-26 12:52:52.619189', 'registered', 1, '2026-03-26 14:41:11.377120', 0, NULL, 'echouser_test1@example.com'),
(2, 'pbkdf2_sha256$600000$7UZPAE0H06zxFq7H7zSpLs$djW8kaW+g8KtBr7hP8qNFFn69HivnVzfaBqEXeNVJt4=', NULL, 0, 'seed_admin', '', '', 0, 1, '2026-03-26 13:04:15.430399', 'registered', 0, NULL, 0, NULL, 'seed_admin@example.com'),
(3, 'pbkdf2_sha256$600000$QMMHl1hZGSOfJsI2D4cAY7$GE6Olx1syuT9BX988vqObIbCDNjV0HCrCxD6SEMoUB0=', NULL, 0, 'seed_u_1_1_up_0', '', '', 0, 1, '2026-03-26 13:04:16.192612', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_0@example.com'),
(4, 'pbkdf2_sha256$600000$PSLVPqx8f4CK1zevDVlr6u$vQrYrRzTFBWWA6FZ/KtqMvnx61vnXteCHkt+CQaHtjI=', NULL, 0, 'seed_u_1_1_up_1', '', '', 0, 1, '2026-03-26 13:04:16.824506', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_1@example.com'),
(5, 'pbkdf2_sha256$600000$15bI9cqbcfMTJJdR5dH4PY$AnAeabkpJ8gtLa5MQycNVy4juBNflt2YRL7C5uHLplo=', NULL, 0, 'seed_u_1_1_up_2', '', '', 0, 1, '2026-03-26 13:04:17.400475', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_2@example.com'),
(6, 'pbkdf2_sha256$600000$uPNT8y0hKCG6m4JrTp6kD6$PWBmxlJvqDEUcIWiTkpfHWOecpS7iWvCW/S8vRgIhGE=', NULL, 0, 'seed_u_1_1_up_3', '', '', 0, 1, '2026-03-26 13:04:18.011548', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_3@example.com'),
(7, 'pbkdf2_sha256$600000$lrusN7FEJkeIviC9MB1Ohs$n20WWf4BhVWLqvJ5hZWyFq0a0MPJ4CzYrKesO1KyqzA=', NULL, 0, 'seed_u_1_1_up_4', '', '', 0, 1, '2026-03-26 13:04:18.637949', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_4@example.com'),
(8, 'pbkdf2_sha256$600000$9tyQ8HBzHnMN65e4C5YPB2$HYl2pLDlWS07yY/cJV40to5VJw2eoBPsOqLfupkiZac=', NULL, 0, 'seed_u_1_1_up_5', '', '', 0, 1, '2026-03-26 13:04:19.243230', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_5@example.com'),
(9, 'pbkdf2_sha256$600000$PkvcyiRQrmDLb85ZKhHn6P$o8tnLuCu/B2nqFWroPeJPbNMn4pnnD6rkyrZXuKWGnw=', NULL, 0, 'seed_u_1_1_up_6', '', '', 0, 1, '2026-03-26 13:04:19.902472', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_6@example.com'),
(10, 'pbkdf2_sha256$600000$va37G9NI6qkDKooqFelwP9$ziKfIyCGtqVrsy6728wHaNjXd17WIpmy+FlPCtTJRxI=', NULL, 0, 'seed_u_1_1_up_7', '', '', 0, 1, '2026-03-26 13:04:20.516313', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_7@example.com'),
(11, 'pbkdf2_sha256$600000$Hp9AdVw0tcq0g0g8UtyGnz$OJwJCrdkeECeaLeYTqjFrtZsgXYErtXIPNp72uG3/88=', NULL, 0, 'seed_u_1_1_up_8', '', '', 0, 1, '2026-03-26 13:04:21.114662', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_8@example.com'),
(12, 'pbkdf2_sha256$600000$usPyWbujcAGdgHrwVWgCeE$7R/gaNBmcsDud3t5Dgl8oTbqu3MsK4AYRMrqirObnNE=', NULL, 0, 'seed_u_1_1_up_9', '', '', 0, 1, '2026-03-26 13:04:21.748951', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_9@example.com'),
(13, 'pbkdf2_sha256$600000$hP0DRoDf1lv7R1oelnaiK4$Nsh7rx48R5U1j1fy/MiLvelP19cSbFrV/w9kG7WQmis=', NULL, 0, 'seed_u_1_1_up_10', '', '', 0, 1, '2026-03-26 13:04:22.367695', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_10@example.com'),
(14, 'pbkdf2_sha256$600000$LdO7OZPqckARLF9une8ex2$iAxjd7mmDm45/poD7+vjpH+Y8FmrZSAcVx9SSsvh/9c=', NULL, 0, 'seed_u_1_1_up_11', '', '', 0, 1, '2026-03-26 13:04:22.983388', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_up_11@example.com'),
(15, 'pbkdf2_sha256$600000$cAPTxahYPQ5KMUJlfmkrKr$YAOo/98k4T4Z/hdLYP0QwjjL9MxXyGyJXRAeO16tCZA=', NULL, 0, 'seed_u_1_1_down_0', '', '', 0, 1, '2026-03-26 13:04:23.605103', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_down_0@example.com'),
(16, 'pbkdf2_sha256$600000$wSiNrG3MmNjQI2O6MmH3ea$vAb5fDVnR6JHYso/nwAAA5rcxqPZdSqzWLb9OX2UhXs=', NULL, 0, 'seed_u_1_1_down_1', '', '', 0, 1, '2026-03-26 13:04:24.206398', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_down_1@example.com'),
(17, 'pbkdf2_sha256$600000$8KuLfprfgJYT141MjzyFt3$UTzoz8SSZzxsVCGSTEvV+qmWD6kDIMq93YDSXwXyjhc=', NULL, 0, 'seed_u_1_1_down_2', '', '', 0, 1, '2026-03-26 13:04:24.813314', 'registered', 0, NULL, 0, NULL, 'seed_u_1_1_down_2@example.com'),
(18, 'pbkdf2_sha256$600000$gxr1zEwC4JYEwlLzYkQQiP$cTp4cdnnzLvs+0Y7++pIUvUhq/O2hWSDAWpyNx77BP8=', NULL, 0, 'seed_u_1_2_up_0', '', '', 0, 1, '2026-03-26 13:04:25.449255', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_0@example.com'),
(19, 'pbkdf2_sha256$600000$e1zeQTJKkSz5tjO18VPt54$ga6x35WcuhCb5t9DEGGvvd9DMOqiUG2vKF+nwgEWlDk=', NULL, 0, 'seed_u_1_2_up_1', '', '', 0, 1, '2026-03-26 13:04:26.076744', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_1@example.com'),
(20, 'pbkdf2_sha256$600000$jPFJmplTrjjHTBdopzJRKJ$imSTfatXCt+TFaAdwyBYPTxrSlDjJjvImuSnKJPS5g4=', NULL, 0, 'seed_u_1_2_up_2', '', '', 0, 1, '2026-03-26 13:04:26.704883', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_2@example.com'),
(21, 'pbkdf2_sha256$600000$17gIgcA2LuUVrIhnn3OLjv$QgNOKqnDPsMvLky16dMo4qWTHUv9bml6tSAan71f4/Q=', NULL, 0, 'seed_u_1_2_up_3', '', '', 0, 1, '2026-03-26 13:04:27.318445', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_3@example.com'),
(22, 'pbkdf2_sha256$600000$g1qgYDDTy4dKijowitatLv$GZUkG835Ipd2yI0RDSe965PCCJQVE/Pr/dNzdp410Vw=', NULL, 0, 'seed_u_1_2_up_4', '', '', 0, 1, '2026-03-26 13:04:27.923673', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_4@example.com'),
(23, 'pbkdf2_sha256$600000$O90XCIt2nV820La09HL6fF$w5w5/P3gJXngawVVBPSfzwBai+gwKSBXj4qKy99AA3Q=', NULL, 0, 'seed_u_1_2_up_5', '', '', 0, 1, '2026-03-26 13:04:28.529527', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_5@example.com'),
(24, 'pbkdf2_sha256$600000$sAFX9BC94kJ6BSuy4VjKR2$0ql8yoWB4AeyfyX0IXhUvoC3auaVogB1i+06kvig6nw=', NULL, 0, 'seed_u_1_2_up_6', '', '', 0, 1, '2026-03-26 13:04:29.148129', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_up_6@example.com'),
(25, 'pbkdf2_sha256$600000$AHu5XIsno9FecX1FJSt5dg$B8o+yGUGuxRe/RbU9K7nzh+SGYSAKMt6EQzywc9s2Gc=', NULL, 0, 'seed_u_1_2_down_0', '', '', 0, 1, '2026-03-26 13:04:29.886346', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_down_0@example.com'),
(26, 'pbkdf2_sha256$600000$SOgyc5ujZ3R5gp2bwRT3ju$Rut2iQzj2dVBv5i5t+5Gm/U9RGHMIySTAL0K9uDubiw=', NULL, 0, 'seed_u_1_2_down_1', '', '', 0, 1, '2026-03-26 13:04:30.654129', 'registered', 0, NULL, 0, NULL, 'seed_u_1_2_down_1@example.com'),
(27, 'pbkdf2_sha256$600000$sOvcL1MA2VOHzth41yfauO$koEHmT20piy4vMukh6XwhwsP8sdW7IG94TfWv44SCcE=', NULL, 0, 'seed_u_2_1_up_0', '', '', 0, 1, '2026-03-26 13:04:31.278696', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_0@example.com'),
(28, 'pbkdf2_sha256$600000$G0RHNLWeNN3rBvCR7AX1Ey$XDl5z1EYhI7EOG2mli7enXyqvUiNAMN0ChV0gpqrayI=', NULL, 0, 'seed_u_2_1_up_1', '', '', 0, 1, '2026-03-26 13:04:31.891147', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_1@example.com'),
(29, 'pbkdf2_sha256$600000$skz3fmVyeSOEEdhNsOfPdU$5imdK9JzPpHd8r8tMUK8Kx5UqQ3dVDONWpZEaLzIKrY=', NULL, 0, 'seed_u_2_1_up_2', '', '', 0, 1, '2026-03-26 13:04:32.501677', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_2@example.com'),
(30, 'pbkdf2_sha256$600000$7c5r4hi4LQXaKU1jUTtf4d$kG8iCmJ/VPZQXmrfncMNuhiJ5xPneDBQQAy3L4BLyZo=', NULL, 0, 'seed_u_2_1_up_3', '', '', 0, 1, '2026-03-26 13:04:33.078572', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_3@example.com'),
(31, 'pbkdf2_sha256$600000$64z1rmaI3krhho2fvkPBky$62pFlzrC93vuyLKDoKnSRVe5S0cJZ5lbJvliGrcs/gw=', NULL, 0, 'seed_u_2_1_up_4', '', '', 0, 1, '2026-03-26 13:04:33.708358', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_4@example.com'),
(32, 'pbkdf2_sha256$600000$w2Q8SMcrZE0olV2MgGtiUO$jZ0tWxvweRKu86OsQ+5d8oOnSBWS2KnJu2vuhUvfvhA=', NULL, 0, 'seed_u_2_1_up_5', '', '', 0, 1, '2026-03-26 13:04:34.310570', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_5@example.com'),
(33, 'pbkdf2_sha256$600000$fsNbIJouys6y8gPq5xbsqX$cyDNidtmX16k0NKq0K17HWq+svFE/ePhPN6QY+8Z6WI=', NULL, 0, 'seed_u_2_1_up_6', '', '', 0, 1, '2026-03-26 13:04:34.923893', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_6@example.com'),
(34, 'pbkdf2_sha256$600000$QnA18CQ35y3Tc0FXhtzYzO$T+Ysg2/h6VVMPozJefUS2qAQ3NTrFjGHLpck4Egy1J8=', NULL, 0, 'seed_u_2_1_up_7', '', '', 0, 1, '2026-03-26 13:04:35.549238', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_7@example.com'),
(35, 'pbkdf2_sha256$600000$FJtRUoYJhxkPb0FrojYKdb$9iUHVT2H8hm3dGY0t/gY3+GJiyBtz8SfrjaIS+2Sf6E=', NULL, 0, 'seed_u_2_1_up_8', '', '', 0, 1, '2026-03-26 13:04:36.121444', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_up_8@example.com'),
(36, 'pbkdf2_sha256$600000$voHa4NC9uTpD7pK0o5dl01$eUYYVhG4oKb/liQyLW0Rex+QEpNhj2i/Mw78Ai4USjI=', NULL, 0, 'seed_u_2_1_down_0', '', '', 0, 1, '2026-03-26 13:04:36.742380', 'registered', 0, NULL, 0, NULL, 'seed_u_2_1_down_0@example.com'),
(37, 'pbkdf2_sha256$600000$BwUFmkYg2ivP7L21HnjzhV$5bkUqiX0BbXzZHgOJytTEp7v134m5IeasogmFe25H3c=', NULL, 0, 'seed_u_2_2_up_0', '', '', 0, 1, '2026-03-26 13:04:37.328700', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_up_0@example.com'),
(38, 'pbkdf2_sha256$600000$xQQWTDEusTD5JD0AxvlZAh$nw01Qwro+0ApkNzcI97OryipLDMLL4QUgxk/DTqQRj8=', NULL, 0, 'seed_u_2_2_up_1', '', '', 0, 1, '2026-03-26 13:04:37.951874', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_up_1@example.com'),
(39, 'pbkdf2_sha256$600000$mrkG8SmokVDtNJKfmdf1Rb$cmfVnE3FAsOmoqOVSl3+7Rbi92wNhz+5keL7XjCJiRA=', NULL, 0, 'seed_u_2_2_up_2', '', '', 0, 1, '2026-03-26 13:04:38.568212', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_up_2@example.com'),
(40, 'pbkdf2_sha256$600000$EpRpkCT5xHu3mnt3aP3igS$RLFVgEp88CIcX+1AUIDmmwRTJYEvh+hrbo5MkNwJ7qc=', NULL, 0, 'seed_u_2_2_up_3', '', '', 0, 1, '2026-03-26 13:04:39.148702', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_up_3@example.com'),
(41, 'pbkdf2_sha256$600000$6LUWDLl9Ir4NS05gPFuzny$lu+cxyJheQEuRDx3Xc64lzULLVC175F395Kzp1Iq2rg=', NULL, 0, 'seed_u_2_2_up_4', '', '', 0, 1, '2026-03-26 13:04:39.730634', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_up_4@example.com'),
(42, 'pbkdf2_sha256$600000$dudCe0RbpyK9XTZATFF3FM$Ry8Nk1KL2Z0bKOTP8ukDUumvboS3gVuwr32Ob7EY4gE=', NULL, 0, 'seed_u_2_2_down_0', '', '', 0, 1, '2026-03-26 13:04:40.308390', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_down_0@example.com'),
(43, 'pbkdf2_sha256$600000$vXfOLJt6KTlUhuEYJ37hAc$t4uhTcTnSCDonI5AoiWihT1LQkkEu4/3LOvJ9WJWvyU=', NULL, 0, 'seed_u_2_2_down_1', '', '', 0, 1, '2026-03-26 13:04:40.938361', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_down_1@example.com'),
(44, 'pbkdf2_sha256$600000$oUieZ1QCShvtMFjRjlG1qH$NfqA+Ugn7ZkNWrlAPfrpGe5miItd12VrJHbDdWUG4BQ=', NULL, 0, 'seed_u_2_2_down_2', '', '', 0, 1, '2026-03-26 13:04:41.561901', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_down_2@example.com'),
(45, 'pbkdf2_sha256$600000$Ql4ZRlRaGLhNXZhAnQO6Qw$5o0LDnKsqxIWiUkAmgD4+I1Jc6sqQCKCJrFvtcCrOCw=', NULL, 0, 'seed_u_2_2_down_3', '', '', 0, 1, '2026-03-26 13:04:42.193158', 'registered', 0, NULL, 0, NULL, 'seed_u_2_2_down_3@example.com'),
(46, 'pbkdf2_sha256$600000$APd3Kmto5iwlmOrIBJrvNJ$ZaYHDIg71Krlml5BKmpo9q7dFuDbWwrg+Grk5B+yQfk=', NULL, 0, 'admin_test', '', '', 1, 1, '2026-03-26 14:23:21.748875', 'admin', 0, NULL, 0, NULL, 'admin_test@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add debate topic', 8, 'add_debatetopic'),
(30, 'Can change debate topic', 8, 'change_debatetopic'),
(31, 'Can delete debate topic', 8, 'delete_debatetopic'),
(32, 'Can view debate topic', 8, 'view_debatetopic'),
(33, 'Can add opinion', 9, 'add_opinion'),
(34, 'Can change opinion', 9, 'change_opinion'),
(35, 'Can delete opinion', 9, 'delete_opinion'),
(36, 'Can view opinion', 9, 'view_opinion'),
(37, 'Can add vote', 10, 'add_vote'),
(38, 'Can change vote', 10, 'change_vote'),
(39, 'Can delete vote', 10, 'delete_vote'),
(40, 'Can view vote', 10, 'view_vote');

-- --------------------------------------------------------

--
-- Table structure for table `debates_category`
--

CREATE TABLE `debates_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `moderated_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `moderated_by_id` bigint(20) DEFAULT NULL,
  `suggested_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `debates_category`
--

INSERT INTO `debates_category` (`id`, `name`, `description`, `status`, `moderated_at`, `created_at`, `updated_at`, `moderated_by_id`, `suggested_by_id`) VALUES
(1, 'Technology', 'AI, software, gadgets, and the digital future', 'approved', NULL, '2026-03-26 12:59:18.160302', '2026-03-26 12:59:18.160302', NULL, NULL),
(2, 'Politics', 'Governance, policy, elections, and global affairs', 'approved', NULL, '2026-03-26 12:59:18.164832', '2026-03-26 12:59:18.164832', NULL, NULL),
(3, 'Science', 'Research, discoveries, space, and medicine', 'approved', NULL, '2026-03-26 12:59:18.168895', '2026-03-26 12:59:18.168895', NULL, NULL),
(4, 'Education', 'Schools, learning methods, and academic systems', 'approved', NULL, '2026-03-26 12:59:18.173120', '2026-03-26 12:59:18.173120', NULL, NULL),
(5, 'Environment', 'Climate, sustainability, energy, and ecology', 'approved', NULL, '2026-03-26 12:59:18.180101', '2026-03-26 12:59:18.180101', NULL, NULL),
(6, 'Society', 'Culture, ethics, social issues, and human rights', 'approved', NULL, '2026-03-26 12:59:18.181432', '2026-03-26 12:59:18.181432', NULL, NULL),
(7, 'Economy', 'Finance, trade, markets, and economic systems', 'approved', NULL, '2026-03-26 12:59:18.181432', '2026-03-26 12:59:18.181432', NULL, NULL),
(8, 'Health', 'Medicine, mental health, diet, and wellness', 'approved', NULL, '2026-03-26 12:59:18.186074', '2026-03-26 12:59:18.186074', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `debates_debatetopic`
--

CREATE TABLE `debates_debatetopic` (
  `id` bigint(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `moderated_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `created_by_id` bigint(20) NOT NULL,
  `moderated_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `debates_debatetopic`
--

INSERT INTO `debates_debatetopic` (`id`, `title`, `description`, `status`, `moderated_at`, `created_at`, `updated_at`, `category_id`, `created_by_id`, `moderated_by_id`) VALUES
(1, 'AI will replace software developers within 10 years', 'AI coding tools can automate significant parts of software development; some believe replacement is inevitable.', 'approved', NULL, '2026-03-26 13:04:16.176937', '2026-03-26 13:04:16.176937', 1, 2, NULL),
(2, 'Universal Basic Income is necessary for modern economies', 'Automation and labor market shifts suggest a need for a baseline income to maintain stability.', 'approved', NULL, '2026-03-26 13:04:31.268392', '2026-03-26 13:04:31.268392', 2, 2, NULL),
(3, 'Pending admin test 1774535067', 'Created to test approve endpoint', 'approved', '2026-03-26 14:24:38.671147', '2026-03-26 14:24:28.232857', '2026-03-26 14:24:28.232857', 1, 2, 46),
(4, 'Pending reject admin test 1774535089', 'Created to test reject endpoint', 'rejected', '2026-03-26 14:25:03.905822', '2026-03-26 14:24:50.063581', '2026-03-26 14:24:50.063581', 1, 2, 46);

-- --------------------------------------------------------

--
-- Table structure for table `debates_opinion`
--

CREATE TABLE `debates_opinion` (
  `id` bigint(20) NOT NULL,
  `stance` varchar(10) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `debate_id` bigint(20) NOT NULL,
  `parent_opinion_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `debates_opinion`
--

INSERT INTO `debates_opinion` (`id`, `stance`, `content`, `created_at`, `updated_at`, `author_id`, `debate_id`, `parent_opinion_id`) VALUES
(1, 'for', 'In many companies, AI already writes 40-60% of code. Over a decade, remaining work will increasingly be automated.', '2026-03-26 13:04:16.186309', '2026-03-26 13:04:16.186309', 2, 1, NULL),
(2, 'against', 'AI is a powerful tool, but it lacks business context and the ability to manage complex stakeholder trade-offs.', '2026-03-26 13:04:25.443413', '2026-03-26 13:04:25.443413', 2, 1, NULL),
(3, 'for', 'UBI reduces poverty and gives people security to adapt as jobs evolve.', '2026-03-26 13:04:31.273185', '2026-03-26 13:04:31.273185', 2, 2, NULL),
(4, 'against', 'UBI may be expensive and could weaken incentives to work without complementary policies.', '2026-03-26 13:04:37.322776', '2026-03-26 13:04:37.322776', 2, 2, NULL),
(5, 'for', 'Automated smoke test opinion.', '2026-03-26 13:47:50.806370', '2026-03-26 13:47:50.806370', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `debates_vote`
--

CREATE TABLE `debates_vote` (
  `id` bigint(20) NOT NULL,
  `value` smallint(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `opinion_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `debates_vote`
--

INSERT INTO `debates_vote` (`id`, `value`, `created_at`, `updated_at`, `opinion_id`, `user_id`) VALUES
(1, 1, '2026-03-26 13:04:16.819093', '2026-03-26 13:04:16.819093', 1, 3),
(2, 1, '2026-03-26 13:04:17.393161', '2026-03-26 13:04:17.393161', 1, 4),
(3, 1, '2026-03-26 13:04:18.011548', '2026-03-26 13:04:18.011548', 1, 5),
(4, 1, '2026-03-26 13:04:18.627100', '2026-03-26 13:04:18.627100', 1, 6),
(5, 1, '2026-03-26 13:04:19.237491', '2026-03-26 13:04:19.237491', 1, 7),
(6, 1, '2026-03-26 13:04:19.896617', '2026-03-26 13:04:19.896617', 1, 8),
(7, 1, '2026-03-26 13:04:20.511979', '2026-03-26 13:04:20.511979', 1, 9),
(8, 1, '2026-03-26 13:04:21.110505', '2026-03-26 13:04:21.110505', 1, 10),
(9, 1, '2026-03-26 13:04:21.744281', '2026-03-26 13:04:21.744281', 1, 11),
(10, 1, '2026-03-26 13:04:22.363185', '2026-03-26 13:04:22.363185', 1, 12),
(11, 1, '2026-03-26 13:04:22.979268', '2026-03-26 13:04:22.979268', 1, 13),
(12, 1, '2026-03-26 13:04:23.600617', '2026-03-26 13:04:23.600617', 1, 14),
(13, -1, '2026-03-26 13:04:24.199243', '2026-03-26 13:04:24.199243', 1, 15),
(14, -1, '2026-03-26 13:04:24.804186', '2026-03-26 13:04:24.804186', 1, 16),
(15, -1, '2026-03-26 13:04:25.434387', '2026-03-26 13:04:25.434387', 1, 17),
(16, 1, '2026-03-26 13:04:26.075589', '2026-03-26 13:04:26.075589', 2, 18),
(17, 1, '2026-03-26 13:04:26.701102', '2026-03-26 13:04:26.701102', 2, 19),
(18, 1, '2026-03-26 13:04:27.310224', '2026-03-26 13:04:27.310224', 2, 20),
(19, 1, '2026-03-26 13:04:27.920539', '2026-03-26 13:04:27.920539', 2, 21),
(20, 1, '2026-03-26 13:04:28.524277', '2026-03-26 13:04:28.524277', 2, 22),
(21, 1, '2026-03-26 13:04:29.142578', '2026-03-26 13:04:29.142578', 2, 23),
(22, 1, '2026-03-26 13:04:29.862893', '2026-03-26 13:04:29.862893', 2, 24),
(23, -1, '2026-03-26 13:04:30.632189', '2026-03-26 13:04:30.632189', 2, 25),
(24, -1, '2026-03-26 13:04:31.257597', '2026-03-26 13:04:31.257597', 2, 26),
(25, 1, '2026-03-26 13:04:31.886202', '2026-03-26 13:04:31.886202', 3, 27),
(26, 1, '2026-03-26 13:04:32.497408', '2026-03-26 13:04:32.497408', 3, 28),
(27, 1, '2026-03-26 13:04:33.073991', '2026-03-26 13:04:33.073991', 3, 29),
(28, 1, '2026-03-26 13:04:33.704043', '2026-03-26 13:04:33.704043', 3, 30),
(29, 1, '2026-03-26 13:04:34.307169', '2026-03-26 13:04:34.307169', 3, 31),
(30, 1, '2026-03-26 13:04:34.919432', '2026-03-26 13:04:34.919432', 3, 32),
(31, 1, '2026-03-26 13:04:35.544876', '2026-03-26 13:04:35.544876', 3, 33),
(32, 1, '2026-03-26 13:04:36.116766', '2026-03-26 13:04:36.116766', 3, 34),
(33, 1, '2026-03-26 13:04:36.738004', '2026-03-26 13:04:36.738004', 3, 35),
(34, -1, '2026-03-26 13:04:37.315077', '2026-03-26 13:04:37.315077', 3, 36),
(35, 1, '2026-03-26 13:04:37.947134', '2026-03-26 13:04:37.947134', 4, 37),
(36, 1, '2026-03-26 13:04:38.563742', '2026-03-26 13:04:38.563742', 4, 38),
(37, 1, '2026-03-26 13:04:39.145218', '2026-03-26 13:04:39.145218', 4, 39),
(38, 1, '2026-03-26 13:04:39.726648', '2026-03-26 13:04:39.726648', 4, 40),
(39, 1, '2026-03-26 13:04:40.303725', '2026-03-26 13:04:40.303725', 4, 41),
(40, -1, '2026-03-26 13:04:40.931810', '2026-03-26 13:04:40.931810', 4, 42),
(41, -1, '2026-03-26 13:04:41.554064', '2026-03-26 13:04:41.554064', 4, 43),
(42, -1, '2026-03-26 13:04:42.186572', '2026-03-26 13:04:42.186572', 4, 44),
(43, -1, '2026-03-26 13:04:42.830102', '2026-03-26 13:04:42.830102', 4, 45),
(44, 1, '2026-03-26 13:47:50.823725', '2026-03-26 13:47:50.823725', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'debates', 'category'),
(8, 'debates', 'debatetopic'),
(9, 'debates', 'opinion'),
(10, 'debates', 'vote'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-03-26 12:38:05.262454'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-03-26 12:38:05.480006'),
(3, 'auth', '0001_initial', '2026-03-26 12:38:05.795319'),
(4, 'auth', '0002_alter_permission_name_max_length', '2026-03-26 12:38:05.859305'),
(5, 'auth', '0003_alter_user_email_max_length', '2026-03-26 12:38:05.869350'),
(6, 'auth', '0004_alter_user_username_opts', '2026-03-26 12:38:05.877662'),
(7, 'auth', '0005_alter_user_last_login_null', '2026-03-26 12:38:05.889043'),
(8, 'auth', '0006_require_contenttypes_0002', '2026-03-26 12:38:05.892724'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2026-03-26 12:38:05.901620'),
(10, 'auth', '0008_alter_user_username_max_length', '2026-03-26 12:38:05.911114'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2026-03-26 12:38:05.920662'),
(12, 'auth', '0010_alter_group_name_max_length', '2026-03-26 12:38:05.934438'),
(13, 'auth', '0011_update_proxy_permissions', '2026-03-26 12:38:05.944548'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2026-03-26 12:38:05.952999'),
(15, 'accounts', '0001_initial', '2026-03-26 12:38:06.344430'),
(16, 'admin', '0001_initial', '2026-03-26 12:38:06.487638'),
(17, 'admin', '0002_logentry_remove_auto_add', '2026-03-26 12:38:06.504900'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-26 12:38:06.521349'),
(19, 'debates', '0001_initial', '2026-03-26 12:38:07.496301'),
(20, 'sessions', '0001_initial', '2026-03-26 12:38:07.540329');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `accounts_user_role_57e97df0` (`role`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `debates_category`
--
ALTER TABLE `debates_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `debates_cat_status_0057f2_idx` (`status`),
  ADD KEY `debates_category_moderated_by_id_46011fa8_fk_accounts_user_id` (`moderated_by_id`),
  ADD KEY `debates_category_suggested_by_id_6a1d2755_fk_accounts_user_id` (`suggested_by_id`),
  ADD KEY `debates_category_status_9c276504` (`status`);

--
-- Indexes for table `debates_debatetopic`
--
ALTER TABLE `debates_debatetopic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debates_deb_status_06eedb_idx` (`status`,`category_id`),
  ADD KEY `debates_debatetopic_category_id_a70f8904_fk_debates_category_id` (`category_id`),
  ADD KEY `debates_debatetopic_created_by_id_d2f98a0c_fk_accounts_user_id` (`created_by_id`),
  ADD KEY `debates_debatetopic_moderated_by_id_3be8d4da_fk_accounts_user_id` (`moderated_by_id`),
  ADD KEY `debates_debatetopic_status_946baaeb` (`status`);

--
-- Indexes for table `debates_opinion`
--
ALTER TABLE `debates_opinion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debates_opi_debate__aaf443_idx` (`debate_id`,`stance`),
  ADD KEY `debates_opinion_author_id_992b2e76_fk_accounts_user_id` (`author_id`),
  ADD KEY `debates_opinion_parent_opinion_id_f8227702_fk_debates_opinion_id` (`parent_opinion_id`),
  ADD KEY `debates_opinion_stance_86665810` (`stance`);

--
-- Indexes for table `debates_vote`
--
ALTER TABLE `debates_vote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_vote_per_user_per_opinion` (`user_id`,`opinion_id`),
  ADD KEY `debates_vot_user_id_a9a71c_idx` (`user_id`,`value`),
  ADD KEY `debates_vote_opinion_id_3e49ffb7_fk_debates_opinion_id` (`opinion_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `debates_category`
--
ALTER TABLE `debates_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `debates_debatetopic`
--
ALTER TABLE `debates_debatetopic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `debates_opinion`
--
ALTER TABLE `debates_opinion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `debates_vote`
--
ALTER TABLE `debates_vote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `debates_category`
--
ALTER TABLE `debates_category`
  ADD CONSTRAINT `debates_category_moderated_by_id_46011fa8_fk_accounts_user_id` FOREIGN KEY (`moderated_by_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `debates_category_suggested_by_id_6a1d2755_fk_accounts_user_id` FOREIGN KEY (`suggested_by_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `debates_debatetopic`
--
ALTER TABLE `debates_debatetopic`
  ADD CONSTRAINT `debates_debatetopic_category_id_a70f8904_fk_debates_category_id` FOREIGN KEY (`category_id`) REFERENCES `debates_category` (`id`),
  ADD CONSTRAINT `debates_debatetopic_created_by_id_d2f98a0c_fk_accounts_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `debates_debatetopic_moderated_by_id_3be8d4da_fk_accounts_user_id` FOREIGN KEY (`moderated_by_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `debates_opinion`
--
ALTER TABLE `debates_opinion`
  ADD CONSTRAINT `debates_opinion_author_id_992b2e76_fk_accounts_user_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `debates_opinion_debate_id_ab8f16f8_fk_debates_debatetopic_id` FOREIGN KEY (`debate_id`) REFERENCES `debates_debatetopic` (`id`),
  ADD CONSTRAINT `debates_opinion_parent_opinion_id_f8227702_fk_debates_opinion_id` FOREIGN KEY (`parent_opinion_id`) REFERENCES `debates_opinion` (`id`);

--
-- Constraints for table `debates_vote`
--
ALTER TABLE `debates_vote`
  ADD CONSTRAINT `debates_vote_opinion_id_3e49ffb7_fk_debates_opinion_id` FOREIGN KEY (`opinion_id`) REFERENCES `debates_opinion` (`id`),
  ADD CONSTRAINT `debates_vote_user_id_394cf43a_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
