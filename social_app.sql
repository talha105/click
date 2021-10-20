-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2021 at 08:38 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `user_id`, `post_id`, `comment`, `is_deleted`, `created_at`) VALUES
(1, 2, 1, 'this is my first test comment', 0, '2021-06-04 12:09:49'),
(2, 2, 1, 'this is my 2nd comment on this post', 0, '2021-06-04 12:13:38'),
(3, 2, 1, 'test 3', 0, '2021-06-04 12:31:02'),
(4, 2, 3, 'asasasas', 0, '2021-06-04 12:40:23'),
(5, 2, 3, 'as dfdf fhghgh', 0, '2021-06-04 12:44:10'),
(6, 2, 3, 'asas', 0, '2021-06-04 12:47:11'),
(7, 2, 3, 'hello', 0, '2021-06-04 12:50:11'),
(8, 2, 3, 'asasas', 0, '2021-06-04 12:51:30'),
(9, 2, 3, 'asasas', 0, '2021-06-04 12:52:41'),
(10, 2, 3, 'asasasasas', 0, '2021-06-04 12:53:16'),
(11, 2, 3, 'as', 0, '2021-06-04 12:54:50'),
(12, 2, 3, 'asasaas', 0, '2021-06-04 12:55:42'),
(13, 2, 3, 'asas', 0, '2021-06-04 12:56:57'),
(14, 2, 1, 'hello this is my comment', 0, '2021-06-07 03:48:48'),
(15, 2, 1, 'hello', 0, '2021-06-07 03:51:44'),
(16, 2, 1, 'qwerty', 0, '2021-06-07 03:54:13'),
(17, 2, 1, 'working', 0, '2021-06-07 04:35:57'),
(18, 1, 3, 'kashif', 0, '2021-06-07 11:17:39'),
(19, 1, 1, 'second user', 0, '2021-06-07 11:41:02'),
(20, 1, 1, 'hello', 0, '2021-06-08 07:33:08'),
(21, 1, 1, 'd', 0, '2021-06-08 07:34:07'),
(22, 1, 3, 'qw', 0, '2021-06-08 07:37:50'),
(23, 1, 3, 'qe', 0, '2021-06-08 07:40:25'),
(24, 2, 1, 'gh', 0, '2021-06-08 07:45:03'),
(25, 2, 3, 'hello!', 0, '2021-06-08 07:45:25'),
(26, 2, 1, 'kj', 0, '2021-06-08 08:06:48'),
(27, 2, 2, 'hello', 0, '2021-06-09 03:26:34'),
(28, 1, 4, 'Hello how can we play this game?', 0, '2021-06-11 12:44:24'),
(29, 3, 4, 'hi there!', 0, '2021-06-11 12:48:21'),
(30, 3, 3, 'hi', 0, '2021-06-11 12:48:36'),
(31, 2, 4, 'hello', 0, '2021-06-14 11:20:57'),
(32, 2, 3, 'hi test', 0, '2021-06-16 04:18:48'),
(33, 2, 2, 'hi', 0, '2021-06-16 04:23:22'),
(34, 2, 1, 'hello bro ?', 0, '2021-06-16 05:49:57'),
(35, 3, 1, 'hi', 0, '2021-06-16 05:51:25'),
(36, 2, 1, 'hello tester', 0, '2021-06-16 05:56:47'),
(37, 3, 1, 'hi kashif', 0, '2021-06-16 05:58:22'),
(38, 2, 1, 'hi tester how are you?', 0, '2021-06-16 06:00:06'),
(39, 3, 1, 'i am good bro', 0, '2021-06-16 06:00:48'),
(40, 2, 1, 'what about you?', 0, '2021-06-16 06:01:05'),
(41, 3, 1, 'i am also good', 0, '2021-06-16 06:01:23'),
(42, 3, 2, 'ande wala burger', 0, '2021-06-16 06:33:39'),
(43, 2, 2, 'chahiye?', 0, '2021-06-16 06:34:10'),
(44, 3, 1, 'hello', 0, '2021-06-16 07:11:33'),
(45, 3, 2, 'chai ni hai', 0, '2021-06-16 07:12:36'),
(46, 2, 1, 'hi tester', 0, '2021-06-17 05:16:32'),
(47, 2, 4, 'hello', 0, '2021-06-17 10:04:05'),
(48, 2, 1, 'hi', 0, '2021-06-17 10:28:22'),
(49, 1, 1, 'hello kashif', 0, '2021-06-17 11:23:27'),
(50, 2, 3, 'h', 0, '2021-06-17 11:34:20'),
(51, 1, 3, 'as', 0, '2021-06-17 11:34:33'),
(52, 2, 4, 'hi', 0, '2021-06-21 07:22:07'),
(53, 2, 4, 'kashif here', 0, '2021-06-21 09:55:54'),
(54, 3, 4, 'umer here ', 0, '2021-06-21 09:56:07'),
(55, 3, 4, 'umer here ', 0, '2021-06-21 09:56:07'),
(56, 3, 4, 'umer here ', 0, '2021-06-21 09:56:08'),
(57, 2, 4, 'asasaaaaaaaaaaa asssssssssssssssss kkkkkkkkkkkkkkkkkkkkkkkas        jkkkkkkkkkkkkkkkkkk  ioooooooooooooooooooooooooos iooooooooooooooooooooooooas ooooooooooooooooooooo', 0, '2021-06-25 07:21:28'),
(58, 2, 1, 'test123', 0, '2021-06-25 11:01:06'),
(59, 2, 1, '', 0, '2021-06-25 11:01:06'),
(60, 5, 1, 'Testing post', 0, '2021-06-25 11:16:05'),
(61, 2, 2, 'hi-1', 0, '2021-09-20 04:23:56'),
(62, 2, 1, 'hi bro', 0, '2021-09-20 04:42:21'),
(63, 2, 1, 'hello', 0, '2021-09-20 04:45:09'),
(64, 2, 1, 'hiii', 0, '2021-09-22 09:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `group_msgs`
--

CREATE TABLE `group_msgs` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `msg` text NOT NULL,
  `is_deleted` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_msgs`
--

INSERT INTO `group_msgs` (`id`, `sender_id`, `image_url`, `msg`, `is_deleted`, `created_at`) VALUES
(1, 1, '', 'hello my first msg', 0, '2021-06-10 07:12:22'),
(2, 2, '', 'hello man how are you, what is happening bro', 0, '2021-06-10 07:56:20'),
(3, 2, '', 'how is goin on', 0, '2021-06-10 08:22:27'),
(4, 2, '', 'what happend ??', 0, '2021-06-10 08:23:56'),
(5, 2, '', 'are you there??', 0, '2021-06-10 08:25:05'),
(6, 2, '', '??', 0, '2021-06-10 08:28:24'),
(7, 2, '', 'reply?', 0, '2021-06-10 08:28:35'),
(8, 2, '', 'will you come', 0, '2021-06-10 08:29:52'),
(9, 2, '', 'today?', 0, '2021-06-10 08:29:59'),
(10, 2, '', '?', 0, '2021-06-10 08:33:30'),
(11, 2, '', 'kia hoa?', 0, '2021-06-10 08:33:34'),
(12, 2, '', 'are you there??', 0, '2021-06-10 08:39:41'),
(13, 1, '', 'hi', 0, '2021-06-10 08:43:03'),
(14, 2, '', 'hello', 0, '2021-06-10 08:46:23'),
(15, 1, '', '?', 0, '2021-06-10 08:47:56'),
(16, 2, '', 'received', 0, '2021-06-10 08:48:04'),
(17, 1, '', 'hi', 0, '2021-06-10 10:47:08'),
(18, 1, '', 'hello', 0, '2021-06-10 10:49:01'),
(19, 2, '', 'how are you', 0, '2021-06-10 10:49:18'),
(20, 1, '', 'qwerty', 0, '2021-06-10 10:55:39'),
(21, 1, '', 'a', 0, '2021-06-10 11:04:45'),
(22, 3, '', 'hello every one', 0, '2021-06-10 11:55:05'),
(23, 3, '', 'how are you all', 0, '2021-06-10 11:55:47'),
(26, 3, '', 'hello krypt', 0, '2021-06-10 11:56:49'),
(27, 2, '', 'you there', 0, '2021-06-11 03:23:44'),
(28, 3, '', 'hello kashif', 0, '2021-06-14 07:38:17'),
(29, 2, '', 'hello tester', 0, '2021-06-14 07:38:30'),
(30, 3, '', 'how are you today', 0, '2021-06-14 07:38:51'),
(31, 3, '', 'i am good', 0, '2021-06-14 07:39:03'),
(32, 1, '', 'hello test', 0, '2021-06-14 09:57:49'),
(33, 3, '', 'hello krypt', 0, '2021-06-14 09:58:12'),
(34, 2, '', 'hello', 0, '2021-06-14 11:32:21'),
(35, 2, '', 'hello tester', 0, '2021-06-14 11:49:50'),
(36, 3, '', 'hello', 0, '2021-06-14 11:50:58'),
(37, 2, '', 'how are you', 0, '2021-06-14 11:51:12'),
(38, 2, '', 'hello', 0, '2021-06-15 12:43:50'),
(39, 2, '', 'hello', 0, '2021-06-17 05:14:32'),
(40, 3, '', 'hi', 0, '2021-06-17 05:16:03'),
(41, 3, '', 'umer here', 0, '2021-06-21 09:53:27'),
(43, 2, '', 'hello kk', 0, '2021-06-25 11:01:53'),
(44, 5, '', 'social post', 0, '2021-06-25 11:16:26'),
(45, 2, '', 'hello talha', 0, '2021-06-28 04:21:56'),
(47, 2, '', 'changes done', 0, '2021-06-28 10:41:14'),
(48, 2, '', 'hello there all!', 0, '2021-07-06 04:25:15'),
(49, 2, '', 'sas', 0, '2021-09-16 04:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `user_id`, `post_id`, `created_at`) VALUES
(1, 1, 1, '2021-06-07 09:57:29'),
(3, 3, 1, '2021-06-07 10:11:20'),
(4, 6, 1, '2021-06-07 10:56:23'),
(7, 1, 2, '2021-06-07 11:16:55'),
(8, 1, 3, '2021-06-07 11:17:06'),
(9, 2, 2, '2021-06-07 12:00:38'),
(10, 2, 3, '2021-06-07 12:00:42'),
(18, 4, 2, '2021-08-10 07:45:58'),
(20, 4, 3, '2021-08-10 07:46:32'),
(21, 4, 4, '2021-08-10 07:46:36'),
(25, 2, 1, '2021-08-10 14:24:20'),
(26, 7, 1, '2021-08-26 04:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_deleted` smallint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `sender_id`, `title`, `image_url`, `is_deleted`, `created_at`) VALUES
(2, 2, 'test 2 title', 'controller/public/uploads/ZBrp3jaOwtneBayTym9grCeqhyoypdtVistockphoto-652832752-612x612.jpg', 0, '2021-06-01 05:01:28'),
(3, 2, 'test post 3 title', 'controller/public/uploads/TO92TE5Uh1Z489W49q5zSSaEUyKI88rmSign-Up-Page.png', 0, '2021-06-03 05:05:40'),
(4, 2, 'Play and win match', 'controller/public/uploads/icmdoPkEi6rMmzquFUaFuvs1LkVP0fjxpostImage.png', 0, '2021-06-11 11:37:48'),
(5, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/toRUczqpjLongdO97HYI3Y8kGLhpoyWnportrait-smiling-handsome-male-doctor-man_171337-5055.jpg', 0, '2021-09-15 09:41:31'),
(6, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/RTLkbeGbIyMAewVjsszZSsZIlONQUgNNMale-doctor-smiling-portrait-close-up-Med-Res-72991363.jpg', 0, '2021-09-15 09:41:39'),
(7, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name', 'controller/public/uploads/5VdEt5ZsJOycMKEKmgzKy4sNc0D5YBBzfile-20191203-66986-im7o5.jpg', 0, '2021-09-15 09:41:58'),
(8, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/Dl3E2HSN9UVJ4OGn4UXxTdRIQ1zD0554dr-mike-1-e1591905960819.jpg', 0, '2021-09-15 09:42:32'),
(9, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/S3zOwb2t8uLsbce9z9JOMZ0y9FpYhScYdr-k-subramaniuan-senior-consultant.jpg', 0, '2021-09-15 09:43:02'),
(10, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/zgSBaxvnCbdD4O7xrGvPkCYKT8yQsSO261232a09ddc32.jpg', 0, '2021-09-15 09:43:11'),
(11, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/xg3cMIfCqAsiiOPM6kl0BsV9hKTTALtHgam.jpg', 0, '2021-09-15 09:43:24'),
(12, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/DxPSvM1igb4Ov4l8ncveQLgheW9jewIcGettyImages-1075599562-1024x684.jpg', 0, '2021-09-15 09:43:34'),
(13, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/e4mLIffaQjb1h6Pf2TpQMCdoCLiSc459base url.png', 0, '2021-09-15 09:43:47'),
(14, 2, 'Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/QMWP76kX46xIsGerlPJexhVpaZwzaPn0scr.PNG', 0, '2021-09-15 09:44:37'),
(15, 2, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/DKBV1S7pJK5i2GLKAfJ6Yovt6IUu5P0rGettyImages-1075599562-1024x684.jpg', 0, '2021-09-15 09:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `post_views`
--

CREATE TABLE `post_views` (
  `view_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_views`
--

INSERT INTO `post_views` (`view_id`, `user_id`, `post_id`, `created_at`) VALUES
(1, 2, 1, '2021-06-07 12:22:58'),
(3, 2, 3, '2021-06-08 05:16:09'),
(4, 2, 2, '2021-06-08 05:16:44'),
(5, 1, 2, '2021-06-08 05:33:29'),
(6, 1, 3, '2021-06-08 05:33:29'),
(7, 1, 1, '2021-06-08 05:34:01'),
(8, 3, 1, '2021-06-10 11:54:50'),
(9, 3, 2, '2021-06-10 11:54:50'),
(10, 3, 3, '2021-06-10 11:54:50'),
(11, 2, 4, '2021-06-11 11:37:52'),
(12, 1, 4, '2021-06-11 12:43:39'),
(13, 3, 4, '2021-06-11 12:48:02'),
(14, 4, 1, '2021-06-22 04:13:51'),
(15, 4, 2, '2021-06-22 04:13:51'),
(16, 4, 3, '2021-06-22 04:13:51'),
(17, 4, 4, '2021-06-22 04:13:51'),
(18, 5, 1, '2021-06-25 11:15:30'),
(19, 5, 2, '2021-06-25 11:15:30'),
(20, 5, 3, '2021-06-25 11:15:30'),
(21, 5, 4, '2021-06-25 11:15:30'),
(22, 6, 1, '2021-08-10 14:33:41'),
(23, 6, 2, '2021-08-10 14:33:41'),
(24, 6, 3, '2021-08-10 14:33:41'),
(25, 6, 4, '2021-08-10 14:33:41'),
(26, 7, 1, '2021-08-26 04:31:38'),
(27, 7, 2, '2021-08-26 04:31:38'),
(28, 7, 3, '2021-08-26 04:31:38'),
(29, 7, 4, '2021-08-26 04:31:38'),
(30, 2, 5, '2021-09-15 09:41:32'),
(31, 2, 6, '2021-09-15 09:41:39'),
(32, 2, 7, '2021-09-15 09:41:58'),
(33, 2, 8, '2021-09-15 09:42:33'),
(34, 2, 9, '2021-09-15 09:43:03'),
(35, 2, 10, '2021-09-15 09:43:12'),
(36, 2, 11, '2021-09-15 09:43:24'),
(37, 2, 12, '2021-09-15 09:43:34'),
(38, 2, 13, '2021-09-15 09:43:47'),
(39, 2, 14, '2021-09-15 09:44:38'),
(40, 2, 15, '2021-09-15 09:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `user_id`, `session`, `created_at`) VALUES
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTYyMzkzMjUxNiwiZXhwIjoxNjIzOTM2MTE2fQ.3aD_UJItR4T47g-q_zWvl4XWpWO9eqOm6jxJMT9oVus', '2021-06-02 06:09:32'),
(2, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTYzMjkwNDk2NSwiZXhwIjoxNjMyOTA4NTY1fQ.wfpygx-OcGsQI6ZzW8LYZRrEfyUNb6dJ0j-3p7SXLOc', '2021-06-02 06:16:32'),
(3, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTYyNDI4MDcwMywiZXhwIjoxNjI0Mjg0MzAzfQ.ycIk3ZVMvmKf_tMw97AT-eGPLbp7gRqXqi-o_BiXvjM', '2021-06-10 11:54:50'),
(4, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTYzMTYxNTEwOCwiZXhwIjoxNjMxNjE4NzA4fQ.0W9S5tRJCvYZjmvLIueaQXDgL8iRjwA426LicjsXVMc', '2021-06-22 04:13:50'),
(5, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTYyODYwNTY5NywiZXhwIjoxNjI4NjA5Mjk3fQ.YiIwkip9mocPQdKW3Sgz37E5wHq1tVosI-tQVFtSEsQ', '2021-06-25 11:15:29'),
(6, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTYyODYwNjAyMCwiZXhwIjoxNjI4NjA5NjIwfQ.5mC4-X-ZPIUpB0EKTakkzJICdrvFPZ9s2zf9lCyhqhc', '2021-08-10 14:33:40'),
(7, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcsImlhdCI6MTYyOTk1MjI5OCwiZXhwIjoxNjI5OTU1ODk4fQ.6UaZISz1zdGi-Weg2ayjbPUknM1NbQ6FGEy09a-Nbg8', '2021-08-26 04:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `forgot_password_code` varchar(255) NOT NULL DEFAULT '',
  `login_type` varchar(20) NOT NULL DEFAULT 'Normal',
  `google_id` varchar(255) NOT NULL DEFAULT '',
  `user_roll` varchar(50) NOT NULL DEFAULT 'Client',
  `user_image` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `forgot_password_code`, `login_type`, `google_id`, `user_roll`, `user_image`, `created_at`) VALUES
(1, '1krypt', 'App', '1kryptapp@gmail.com', '', '72f432420a575ed063ccbc9eb6a1e053a609cb4a078fba6add670359575a45ac266a4f38274ffe2568f8e7ffda816951a990f2d45b0da289f0ce44aefb8939234eb13f303f63e15e7a76bb3f1a1bbc32f110b219d85208ed0215056a0fb739645419c60d871d4f347f594096', '', 'Google', '112337824501399925422', 'Client', 'controller/public/uploads/Ryy1aoDi3QBXcxYshYZ8xrDmzCnEd36XpostImage.png', '2021-06-02 06:09:00'),
(2, 'Phil Martenshereesas', 'Schwartzman kas', 'syed.kashif@binaryitsolution.com', '', '0e1eacfb043c0e94999a5227861ddc3831299f655341bb4e570398b72c1fad51125651a10aaf07d6a92d889bf62f6f0855113fb09e96b2d776658b30ec3ebb529b1ca97723f860ebdb5fecf0f235c078cffcfff5c703891462ac638b33ba4fd8784e59e197265ab195', '', 'Normal', '', 'SuperAdmin', 'controller/public/uploads/7LVp8Rb42UdCQmxdungHX8sr8ENclnOqphil photo.PNG', '2021-06-02 06:16:00'),
(3, 'test', 'tester', 'kashif@gmail.com', '', '0e1eacfb043c0e94999a5227861ddc3831299f655341bb4e570398b72c1fad51125651a10aaf07d6a92d889bf62f6f0855113fb09e96b2d776658b30ec3ebb529b1ca97723f860ebdb5fecf0f235c078cffcfff5c703891462ac638b33ba4fd8784e59e197265ab195', '', 'Normal', '', 'Client', 'controller\\public\\uploads\\8CYKkTR8UPqdQESUDKZrgdUxF7JuhGSSSign-Up-Page.png', '2021-06-10 11:45:38'),
(4, 'Binary', 'company', 'kashif11@yahoo.com', '', '72954b240d2e04a8482f59eb5c6995d311a05a47f3753ca18fc78a71ac89e3a58d1043393e9457c1d9339cad12021ca035a1aabef5e22ff6815109cefa66487a19d4d061aed2a273e9f620cc7ea1802ef81fe00d0bade8af1371abdb353ed11100cede5fdb307b9674', '', 'Normal', '', 'Admin', '', '2021-06-22 04:13:36'),
(5, 'Sumbla', 'Roy', 'sherlind37@gmail.com', '', 'e50068eadddaac7ebb8a3df2133c4a1e45f64e593f478c3d21f7ace6f40c7742c9a1de76e3a9cab4e4fc107fb5eb4695d07cacd5fc33c59425f1f7eab0765827c15c42611eb748c9b6592b90bd752e9f903fc61e8b1f206332f303ae76598394b7ed41e8788b30eaa1', '', 'Normal', '', 'Client', '', '2021-06-25 11:14:53'),
(6, 'Phil', 'schwartzman', 'phil.schwartzman1@gmail.com', '', '6ea611fe61888181bf5edda55d987e714e338414d0f92c421dea959acfef197151710e73fa6b1e3be28fe82a911b1fdb666135c96abfd6e7438efc7b65e9b49e77dba07755321dc06e82af83783432a8d86b02c0dec519723f79b22f613932cb16d1f127b64e9f1d518a', '', 'Normal', '', 'Client', '', '2021-08-10 14:33:29'),
(7, 'talha', 'shergil', 'talha@yahoo.com', '9203472743550', 'bfc9362df83b775de696a0367a72348d108f7555ba6b19e61412aa1254e4ea123558d849f297841bc60dc5c3bd1bee4e6656aee06781e700fb8524e29450de306d68f3ea0c4a5959fe7eda5be81c5325f139413675f4487466c704fb38b5d257888e1639eb79961d', '', 'Normal', '', 'Client', '', '2021-08-26 04:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `user_socket`
--

CREATE TABLE `user_socket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `socket_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `group_msgs`
--
ALTER TABLE `group_msgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_views`
--
ALTER TABLE `post_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_socket`
--
ALTER TABLE `user_socket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `group_msgs`
--
ALTER TABLE `group_msgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post_views`
--
ALTER TABLE `post_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_socket`
--
ALTER TABLE `user_socket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
