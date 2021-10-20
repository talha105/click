-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2021 at 05:01 AM
-- Server version: 10.3.31-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webprojectmockup_social_app`
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
(61, 2, 1, '\\', 0, '2021-09-13 05:04:42'),
(62, 2, 1, '\\\\;', 0, '2021-09-13 05:04:51'),
(63, 2, 1, 'We have been witnessing tremendous growth in the software industry over the past 25 years. Software applications have proliferated from the original data processing and scientific computing domains into our daily lives in such a way that we do not realize that some kind of software executes when we do even something ordinary, such as making a phone call, starting a car, turning on a microwave oven, and making a debit card payment. The processes for producing software must meet two broad challenges. First, the processes must produce low-cost software in a short time so that corporations can stay competitive. Second, the processes must produce usable, dependable, and safe software; these attributes are commonly known as quality attributes. Software quality impacts a number of important factors in our daily lives, such as economy, personal and national security, health, and safety. Twenty-five years ago, testing accounted for about 50% of the total time and more than 50% of the total money expended in a software development project—and, the same is still true today. Those days the software industry was a much smaller one, and academia offered a single, comprehensive course entitled Software Engineering to educate undergraduate students in the nuts and bolts of software development. Although software testing has been a part of the classical software engineering literature for decades, the subject is seldom incorporated into the mainstream undergraduate curriculum. A few universities have started offering an option in software engineering comprising three specialized courses, namely, Requirements Specification, Software Design, and Testing and Quality Assurance. In addition, some universities have introduced full undergraduate and graduate degree programs in software engineering. Considering the impact of software quality, or the lack thereof, we observe that software testing education has not received its due place. Ideally, research should lead to the development of tools and methodologies to produce low-cost, high-quality software, and students should be educated in the testing fundamentals. In other words, software testing research should not be solely academic in nature but must strive to be practical for industry consumers. However, in practice, there xvii xviii PREFACE is a large gap between the testing skills needed in the industry and what are taught and researched in the universities. Our goal is to provide the students and the teachers with a set of well-rounded educational materials covering the fundamental developments in testing theory and common testing practices in the industry. We intend to provide the students with the “big picture” of testing and quality assurance, because software quality concepts are quite broad. There are different kinds of software systems with their own intricate characteristics. We have not tried to specifically address their testing challenges. Instead, we have presented testing theory and practice as broad stepping stones which will enable the students to understand and develop testing practices for more complex systems. We decided to write this book based on our teaching and industrial experiences in software testing and quality assurance. For the past 15 years, Sagar has been teaching software engineering and software testing on a regular basis, whereas Piyu has been performing hands-on testing and managing test groups for testing routers, switches, wireless data networks, storage networks, and intrusion prevention appliances. Our experiences have helped us in selecting and structuring the contents of this book to make it suitable as a textbook', 0, '2021-09-13 06:11:25'),
(64, 2, 15, 'nice  post', 0, '2021-09-15 11:07:03'),
(65, 4, 15, 'nice', 0, '2021-09-15 11:07:14'),
(66, 2, 15, 'theek', 0, '2021-09-15 11:07:21'),
(67, 4, 15, 'abcd', 0, '2021-09-15 11:07:48'),
(68, 2, 15, 'efg', 0, '2021-09-15 11:07:57'),
(69, 4, 15, 'helo', 0, '2021-09-15 11:11:04'),
(70, 2, 15, 'hi\\', 0, '2021-09-15 11:11:10'),
(71, 2, 15, 'abc', 0, '2021-09-16 10:24:31'),
(72, 2, 4, 'hello', 0, '2021-09-16 10:25:14'),
(73, 2, 4, 'xyz', 0, '2021-09-16 10:26:10'),
(74, 2, 12, 'fdd', 0, '2021-09-16 11:04:01'),
(75, 3, 11, 'hi', 0, '2021-09-17 05:59:55'),
(76, 3, 2, 'hello', 0, '2021-09-17 06:00:57'),
(77, 4, 3, 'hi', 0, '2021-09-17 09:17:58'),
(78, 4, 12, 'hello schwartz', 0, '2021-09-20 05:26:18'),
(79, 2, 3, 'new comment', 0, '2021-09-22 04:19:34'),
(80, 3, 3, 'new comment test', 0, '2021-09-22 04:24:13'),
(81, 3, 19, 'hi! man', 0, '2021-09-22 06:51:06'),
(82, 3, 15, 'hmm', 0, '2021-09-22 06:57:18'),
(83, 2, 19, 'hey man', 0, '2021-09-22 06:59:05'),
(84, 2, 1, 'hi', 0, '2021-09-22 07:13:09'),
(85, 2, 15, 'hi', 0, '2021-09-22 07:13:32'),
(86, 2, 15, 'hii1', 0, '2021-09-22 09:19:51'),
(87, 2, 19, 'rain', 0, '2021-09-23 11:17:21'),
(88, 2, 19, 'rain', 0, '2021-09-23 11:17:38'),
(89, 2, 15, 'hee rain', 0, '2021-09-23 11:18:26'),
(90, 2, 12, 'dfs', 0, '2021-09-24 04:12:08'),
(91, 2, 11, 'gdfs', 0, '2021-09-24 04:12:15');

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
(49, 2, '', '[', 0, '2021-09-13 05:05:49'),
(50, 7, '', 'hello', 0, '2021-09-13 05:26:58'),
(51, 2, '', 'The domain of possible inputs of a program is too large to be completely used in testing a system. There are both valid inputs and invalid inputs. The program may have a large number of states. There may be timing constraints on the inputs, that is, an input may be valid at a certain time and invalid at other times. An input value which is valid but is not properly timed is called an inopportune input. The input domain of a system can be very large to be completely used in testing a program. • The design issues may be too complex to completely test. The design may have included implicit design decisions and assumptions. For example, a programmer may use a global va', 0, '2021-09-13 08:38:00'),
(52, 4, '', 'hi', 0, '2021-09-14 10:36:05'),
(53, 4, '', 'SAs', 0, '2021-09-14 10:36:34'),
(54, 4, '', 'The domain of possible inputs of a program is too large to be completely used in testing a system. There are both valid inputs and invalid inputs. The program may have a large number of states. There may be timing constraints on the inputs, that is, an input may be valid at a certain time and invalid at other times. An input value which is valid but is not properly timed is called an inopportune input. The input domain of a system can be very large to be completely used in testing a program. • The design issues may be too complex to completely test. The design may have included implicit design decisions and assumptions. For example, a programmer may use a global va', 0, '2021-09-15 06:01:38'),
(55, 4, '', 'hello', 0, '2021-09-15 10:34:10'),
(56, 4, '', 'hiiii', 0, '2021-09-15 10:34:28'),
(57, 2, '', 'hi binary', 0, '2021-09-15 10:34:46'),
(58, 4, '', 'hello', 0, '2021-09-15 10:35:11'),
(59, 2, '', 'hi', 0, '2021-09-15 10:36:04'),
(60, 2, '', '??', 0, '2021-09-15 10:36:41'),
(61, 2, '', 'hi', 0, '2021-09-15 10:40:48'),
(62, 4, '', 'hello there', 0, '2021-09-15 10:43:18'),
(63, 4, '', 'abc', 0, '2021-09-15 10:46:26'),
(64, 4, '', 'efg', 0, '2021-09-15 10:49:55'),
(65, 4, '', 'a', 0, '2021-09-15 10:50:27'),
(66, 4, '', 'a', 0, '2021-09-15 10:51:03'),
(67, 4, '', 'b', 0, '2021-09-15 10:56:41'),
(68, 4, '', 'c', 0, '2021-09-15 11:00:33'),
(69, 2, '', 'hello shair', 0, '2021-09-15 11:05:00'),
(70, 2, '', 'hi', 0, '2021-09-15 11:09:10'),
(71, 4, '', 'frgtjh', 0, '2021-09-15 11:10:38'),
(72, 2, '', 'asasasa', 0, '2021-09-15 11:10:46'),
(73, 4, '', 'okay', 0, '2021-09-16 07:13:02'),
(74, 4, '', 'a', 0, '2021-09-16 07:17:09'),
(75, 4, '', 'a', 0, '2021-09-16 07:18:43'),
(76, 4, '', 'sa', 0, '2021-09-16 07:20:50'),
(77, 4, '', 'sas', 0, '2021-09-16 07:29:17'),
(78, 2, '', 'Hello', 0, '2021-09-16 10:52:51'),
(79, 2, '', 'SDAF', 0, '2021-09-16 12:41:30'),
(80, 2, '', 'Early websites had only text, and soon after, images. Web browser plug ins were then used to add audio, video, and interactivity (such as for a rich web application that mirrors the complexity of a desktop application like a word processor). Examples of such plug-ins are Microsoft Silverlight, Adobe Flash, Adobe Shockwave, and applets written in Java. HTML 5 includes provisions for audio and video without plugins.', 0, '2021-09-16 12:42:14');

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
(18, 4, 2, '2021-08-10 07:45:58'),
(20, 4, 3, '2021-08-10 07:46:32'),
(26, 4, 4, '2021-08-24 09:39:25'),
(27, 2, 4, '2021-09-13 03:31:31'),
(29, 2, 1, '2021-09-13 05:09:50'),
(30, 4, 15, '2021-09-15 10:24:50'),
(31, 4, 12, '2021-09-15 10:24:58'),
(33, 2, 7, '2021-09-16 10:36:06'),
(34, 8, 14, '2021-09-16 11:02:33'),
(35, 2, 12, '2021-09-16 11:04:04'),
(36, 3, 17, '2021-09-17 05:59:00'),
(37, 3, 11, '2021-09-17 05:59:21');

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
(1, 2, 'Test title', 'controller/public/uploads/cPDJhzJdw76lgEtZ4EFrF5BbrMnvYPKuimage-analysis.png', 0, '2021-05-04 04:54:40'),
(2, 2, 'test 2 title', 'controller/public/uploads/ZBrp3jaOwtneBayTym9grCeqhyoypdtVistockphoto-652832752-612x612.jpg', 0, '2021-06-01 05:01:28'),
(3, 2, 'test post 3 title', 'controller/public/uploads/TO92TE5Uh1Z489W49q5zSSaEUyKI88rmSign-Up-Page.png', 0, '2021-06-03 05:05:40'),
(4, 2, 'Play and win match', 'controller/public/uploads/icmdoPkEi6rMmzquFUaFuvs1LkVP0fjxpostImage.png', 0, '2021-06-11 11:37:48'),
(5, 2, 'A quality movement started in Japan during the 1940s and the 1950s by William Edwards Deming, Joseph M. Juran, William Edwards Deming, Joseph M. Juran,oseph M. Juran, William Edwards Deming', 'controller/public/uploads/7Gis5fQZVCAXqG5bSlrFZf6HFvGOKrRB9.jpg', 0, '2021-09-13 09:04:54'),
(7, 2, 'ghdjdn', 'controller/public/uploads/jZL4sy76sAKmJQiGxn4Cwf5uXNvf7yCR8.jpg', 0, '2021-09-13 09:29:02'),
(9, 2, 'test32', 'controller/public/uploads/ADqaqEH6BBGKrYy0H060A5jD3nv1syVR6.jpg', 0, '2021-09-13 09:29:26'),
(10, 2, 'test65', 'controller/public/uploads/fp9om6l4ea6sWAoQ3B5K6YTrAao4iiDf2.jpg', 0, '2021-09-13 09:29:36'),
(11, 2, 'testad32', 'controller/public/uploads/I0vv8fbEe2Y1594jjgT3z4dsxjr9YnyE14.jpeg', 0, '2021-09-13 09:29:54'),
(12, 8, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/IwSr477DRypfZnHyHhmYlsTftMvq3XGfimg3.jpg', 0, '2021-09-14 05:22:58'),
(14, 4, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/pi69KAJJlncH92x190J6TNEOfBLEBhPYdr-mike-1-e1591905960819.jpg', 0, '2021-09-15 09:42:17'),
(15, 4, 'to roll off the tongue: to be easy to say Alejandra is such a beautiful name. It really rolls off the tongue. on a role: to have good momentum We finally won one game,', 'controller/public/uploads/5YlT7zJ14GcCgkvOGZDzy0v8ValjUwAA61232a09ddc32.jpg', 0, '2021-09-15 09:42:31'),
(16, 8, 'view post carefully', 'controller/public/uploads/2TPvR2PGE0yw26KOG8L6RqIDqT75usAiimg1.jpg', 0, '2021-09-16 11:10:48'),
(17, 2, 'Multimedia and interactive content', 'controller/public/uploads/MG685XxNdLeUuEhFJUCO19MnAuZzyUufimg2.jpg', 0, '2021-09-16 11:18:47'),
(18, 2, 'A Web project involves many aspects, including programming[1] and the accompanying software development, Web business, Web server', 'controller/public/uploads/hWuHs39bGlHRg4BsWEnMUEFXeDBy14Lpimg4.jfif', 0, '2021-09-17 05:54:02'),
(19, 2, 'Portable Document Format (PDF), standardized as ISO 32000, is a file format developed by Adobe in 1992 to present documents, including text formatting and images, in a manner independent of applicatio', 'controller/public/uploads/Nj2EThHiPLMfF1fJIHIxsi5dX1nH7Knx11.jpg', 0, '2021-09-22 06:07:55');

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
(26, 7, 1, '2021-09-13 04:28:18'),
(27, 7, 2, '2021-09-13 04:28:18'),
(28, 7, 3, '2021-09-13 04:28:18'),
(29, 7, 4, '2021-09-13 04:28:18'),
(30, 2, 5, '2021-09-13 09:05:06'),
(31, 5, 5, '2021-09-13 18:31:19'),
(32, 5, 7, '2021-09-13 18:31:19'),
(33, 5, 8, '2021-09-13 18:31:19'),
(34, 5, 9, '2021-09-13 18:31:19'),
(35, 5, 10, '2021-09-13 18:31:19'),
(36, 5, 11, '2021-09-13 18:31:19'),
(37, 4, 5, '2021-09-14 03:47:19'),
(38, 4, 7, '2021-09-14 03:47:19'),
(39, 4, 8, '2021-09-14 03:47:19'),
(40, 4, 9, '2021-09-14 03:47:19'),
(41, 4, 10, '2021-09-14 03:47:19'),
(42, 4, 11, '2021-09-14 03:47:19'),
(43, 2, 7, '2021-09-14 04:09:09'),
(44, 2, 8, '2021-09-14 04:09:09'),
(45, 2, 9, '2021-09-14 04:09:09'),
(46, 2, 10, '2021-09-14 04:09:09'),
(47, 2, 11, '2021-09-14 04:09:09'),
(48, 8, 1, '2021-09-14 05:09:50'),
(49, 8, 2, '2021-09-14 05:09:50'),
(50, 8, 3, '2021-09-14 05:09:50'),
(51, 8, 4, '2021-09-14 05:09:50'),
(52, 8, 5, '2021-09-14 05:09:50'),
(53, 8, 7, '2021-09-14 05:09:50'),
(54, 8, 8, '2021-09-14 05:09:50'),
(55, 8, 9, '2021-09-14 05:09:50'),
(56, 8, 10, '2021-09-14 05:09:50'),
(57, 8, 11, '2021-09-14 05:09:50'),
(58, 8, 12, '2021-09-14 05:25:28'),
(59, 4, 12, '2021-09-14 09:45:11'),
(60, 2, 12, '2021-09-14 11:17:42'),
(61, 4, 13, '2021-09-15 09:41:37'),
(62, 4, 14, '2021-09-15 09:42:18'),
(63, 4, 15, '2021-09-15 09:42:32'),
(64, 2, 15, '2021-09-15 10:28:14'),
(65, 2, 14, '2021-09-15 10:28:14'),
(66, 8, 15, '2021-09-16 11:02:19'),
(67, 8, 14, '2021-09-16 11:02:19'),
(68, 8, 16, '2021-09-16 11:10:49'),
(69, 2, 17, '2021-09-16 11:18:48'),
(70, 2, 16, '2021-09-16 11:18:48'),
(71, 8, 17, '2021-09-16 11:26:55'),
(72, 3, 17, '2021-09-17 04:26:52'),
(73, 3, 16, '2021-09-17 04:26:52'),
(74, 3, 15, '2021-09-17 04:26:52'),
(75, 3, 14, '2021-09-17 04:26:52'),
(76, 3, 12, '2021-09-17 04:26:52'),
(77, 3, 11, '2021-09-17 04:26:52'),
(78, 3, 10, '2021-09-17 04:26:52'),
(79, 3, 9, '2021-09-17 04:26:52'),
(80, 3, 8, '2021-09-17 04:26:52'),
(81, 3, 7, '2021-09-17 04:26:52'),
(82, 2, 18, '2021-09-17 05:54:03'),
(83, 3, 18, '2021-09-17 05:58:52'),
(84, 3, 5, '2021-09-17 06:00:42'),
(85, 4, 18, '2021-09-17 09:17:01'),
(86, 4, 17, '2021-09-17 09:17:01'),
(87, 4, 16, '2021-09-17 09:17:01'),
(88, 8, 18, '2021-09-17 10:22:18'),
(89, 9, 18, '2021-09-21 10:52:25'),
(90, 9, 17, '2021-09-21 10:52:25'),
(91, 9, 16, '2021-09-21 10:52:25'),
(92, 9, 15, '2021-09-21 10:52:25'),
(93, 9, 14, '2021-09-21 10:52:25'),
(94, 9, 12, '2021-09-21 10:52:25'),
(95, 9, 11, '2021-09-21 10:52:25'),
(96, 9, 10, '2021-09-21 10:52:25'),
(97, 9, 9, '2021-09-21 10:52:25'),
(98, 9, 7, '2021-09-21 10:52:25'),
(99, 10, 18, '2021-09-21 10:55:33'),
(100, 10, 17, '2021-09-21 10:55:33'),
(101, 10, 16, '2021-09-21 10:55:33'),
(102, 10, 15, '2021-09-21 10:55:33'),
(103, 10, 14, '2021-09-21 10:55:33'),
(104, 10, 12, '2021-09-21 10:55:33'),
(105, 10, 11, '2021-09-21 10:55:33'),
(106, 10, 10, '2021-09-21 10:55:33'),
(107, 10, 9, '2021-09-21 10:55:33'),
(108, 10, 7, '2021-09-21 10:55:33'),
(109, 13, 18, '2021-09-21 11:01:50'),
(110, 13, 17, '2021-09-21 11:01:50'),
(111, 13, 16, '2021-09-21 11:01:50'),
(112, 13, 15, '2021-09-21 11:01:50'),
(113, 13, 14, '2021-09-21 11:01:50'),
(114, 13, 12, '2021-09-21 11:01:50'),
(115, 13, 11, '2021-09-21 11:01:50'),
(116, 13, 10, '2021-09-21 11:01:50'),
(117, 13, 9, '2021-09-21 11:01:50'),
(118, 13, 7, '2021-09-21 11:01:50'),
(119, 2, 19, '2021-09-22 06:07:56'),
(120, 3, 19, '2021-09-22 06:49:23'),
(121, 4, 19, '2021-09-29 09:25:14'),
(122, 5, 19, '2021-09-30 15:22:06'),
(123, 5, 18, '2021-09-30 15:22:06'),
(124, 5, 17, '2021-09-30 15:22:06'),
(125, 5, 16, '2021-09-30 15:22:06'),
(126, 5, 15, '2021-09-30 15:22:06'),
(127, 5, 14, '2021-09-30 15:22:06'),
(128, 5, 12, '2021-09-30 15:22:06');

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
(2, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTYzNDAzMzYzNiwiZXhwIjoxNjM0MDM3MjM2fQ.XR0aDT_L1wunZe4pHtjDk35TzverNMA6d3DSsrvb7Qs', '2021-06-02 06:16:32'),
(3, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTYzMjI5MzM2MiwiZXhwIjoxNjMyMjk2OTYyfQ.eKzoOjDWyfFm0UYLKyI0b7dOfzpmL4AQShewo0DhNKI', '2021-06-10 11:54:50'),
(4, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTYzMzAxNjEzNSwiZXhwIjoxNjMzMDE5NzM1fQ.tncvJBvnfPzq1gFdnNgii8aOHrYpuMbDxmJ-pPVeaQg', '2021-06-22 04:13:50'),
(5, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTYzMzAxNTMyNiwiZXhwIjoxNjMzMDE4OTI2fQ.hrQ8aaYgvQ1GB-RWGTkHSoTyq7bezwUoudAU4o5Fnrw', '2021-06-25 11:15:29'),
(6, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTYyODYwNjAyMCwiZXhwIjoxNjI4NjA5NjIwfQ.5mC4-X-ZPIUpB0EKTakkzJICdrvFPZ9s2zf9lCyhqhc', '2021-08-10 14:33:40'),
(7, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcsImlhdCI6MTYzMTUxMDcwMCwiZXhwIjoxNjMxNTE0MzAwfQ.413X5tEjtr-9StAVhh76-byHJy8bG2cH08EgrLJ8t1Y', '2021-09-13 04:28:17'),
(8, 8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgsImlhdCI6MTYzMTg3NDEzNywiZXhwIjoxNjMxODc3NzM3fQ.rMb6ZegEl6ByLUKmIlN8bdYJSFPS7DFIdKW3J-XHQAU', '2021-09-14 05:09:49'),
(9, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjksImlhdCI6MTYzMjIyMTU0NCwiZXhwIjoxNjMyMjI1MTQ0fQ._aj98ttoIzRHG6FMeUEySn3uCOk8WdO8TN6TWnsJYzM', '2021-09-21 10:52:24'),
(10, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEwLCJpYXQiOjE2MzIyMjE3MzEsImV4cCI6MTYzMjIyNTMzMX0.YS2RZE05L61nFDvwldPQMDVQ2WaTRWd5f3cdURka8mI', '2021-09-21 10:55:31'),
(11, 13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEzLCJpYXQiOjE2MzIyMjIxMDgsImV4cCI6MTYzMjIyNTcwOH0.7fbdl4mo6vwx0_nBZpQNJfgQMRkFz8uIgevO505AqCo', '2021-09-21 11:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
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

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `forgot_password_code`, `login_type`, `google_id`, `user_roll`, `user_image`, `created_at`) VALUES
(1, '1krypt', 'App', '1kryptapp@gmail.com', '72f432420a575ed063ccbc9eb6a1e053a609cb4a078fba6add670359575a45ac266a4f38274ffe2568f8e7ffda816951a990f2d45b0da289f0ce44aefb8939234eb13f303f63e15e7a76bb3f1a1bbc32f110b219d85208ed0215056a0fb739645419c60d871d4f347f594096', '', 'Google', '112337824501399925422', 'Client', 'controller/public/uploads/Ryy1aoDi3QBXcxYshYZ8xrDmzCnEd36XpostImage.png', '2021-06-02 06:09:00'),
(2, 'Schwartz Portable Document For', '!@#$%^&*()_+\"L:}{P:/**/', 'syed.kashif@binaryitsolution.com', '0e1eacfb043c0e94999a5227861ddc3831299f655341bb4e570398b72c1fad51125651a10aaf07d6a92d889bf62f6f0855113fb09e96b2d776658b30ec3ebb529b1ca97723f860ebdb5fecf0f235c078cffcfff5c703891462ac638b33ba4fd8784e59e197265ab195', '', 'Normal', '', 'SuperAdmin', 'controller/public/uploads/7LVp8Rb42UdCQmxdungHX8sr8ENclnOqphil photo.PNG', '2021-06-02 06:16:00'),
(3, 'test', 'tester', 'kashif@gmail.com', '0e1eacfb043c0e94999a5227861ddc3831299f655341bb4e570398b72c1fad51125651a10aaf07d6a92d889bf62f6f0855113fb09e96b2d776658b30ec3ebb529b1ca97723f860ebdb5fecf0f235c078cffcfff5c703891462ac638b33ba4fd8784e59e197265ab195', '', 'Normal', '', 'Client', 'controller\\public\\uploads\\8CYKkTR8UPqdQESUDKZrgdUxF7JuhGSSSign-Up-Page.png', '2021-06-10 11:45:38'),
(4, 'Binary', 'company', 'kashif11@yahoo.com', '72954b240d2e04a8482f59eb5c6995d311a05a47f3753ca18fc78a71ac89e3a58d1043393e9457c1d9339cad12021ca035a1aabef5e22ff6815109cefa66487a19d4d061aed2a273e9f620cc7ea1802ef81fe00d0bade8af1371abdb353ed11100cede5fdb307b9674', '', 'Normal', '', 'Admin', '', '2021-06-22 04:13:36'),
(5, 'Sumbla', 'Roy', 'sherlind37@gmail.com', 'e50068eadddaac7ebb8a3df2133c4a1e45f64e593f478c3d21f7ace6f40c7742c9a1de76e3a9cab4e4fc107fb5eb4695d07cacd5fc33c59425f1f7eab0765827c15c42611eb748c9b6592b90bd752e9f903fc61e8b1f206332f303ae76598394b7ed41e8788b30eaa1', '', 'Normal', '', 'Client', '', '2021-06-25 11:14:53'),
(6, 'Phil', 'schwartzman', 'phil.schwartzman1@gmail.com', '6ea611fe61888181bf5edda55d987e714e338414d0f92c421dea959acfef197151710e73fa6b1e3be28fe82a911b1fdb666135c96abfd6e7438efc7b65e9b49e77dba07755321dc06e82af83783432a8d86b02c0dec519723f79b22f613932cb16d1f127b64e9f1d518a', '', 'Normal', '', 'Client', '', '2021-08-10 14:33:29'),
(7, 'Muhammad', 'Mairaj', 'muhammad.mairaj@binaryitsolution.com', '024dd6d4e632bd323348adbe509750872c0e4d151f0bae03737ed1571559b0916a93c2c1165454f89d8d87bf69f5095c7dd658f96dadf3563312ad4d7ccd6747fd401fc7e9f7f766e0d99e006d048599850422b7881d6f3a558d167111488c97e6b2861ba84a7d7b6b93d916', '', 'Google', '107950364496015643823', 'Client', '', '2021-09-13 04:10:15'),
(8, 'Mairaj Early websites had only', 'Arif Early websites had only t', 'mairajarif33@gmail.com', 'e4f5bf44e29037a7f07542e72f123d5518bb023a51fce30731dd906b4b6628bb6ac48ea58724f440bedec438da48ba3d44bf8267c1149c2e8e1a35ffb3d5a80bd72e186d5a9d8abb973d45c10817da066ea46313af0b56598e80704dc9c2c663bdcbbfd252d7227de945dca5', '', 'Google', '118391292544701866741', 'Admin', '', '2021-09-14 05:09:34'),
(13, 'Shair', 'Mohammed', 'shair.mohammed@binaryitsolution.com', 'febb1c25787cc9bcb820d436a419916cbf1a6c08e4c58371ba91f4adccec489d83b002b931cc1430a90ea1f13991163e49684aee618452a0c0098402385620021e9a2ce7bf6eaabe2aaadb1b9043e6389890d5c759b6588299f5f8e012ef888587a5f434bc17829ed14a678a', '', 'Google', '116012567621197148963', 'Client', '', '2021-09-21 11:01:48');

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
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `group_msgs`
--
ALTER TABLE `group_msgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `post_views`
--
ALTER TABLE `post_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_socket`
--
ALTER TABLE `user_socket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
