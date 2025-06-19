-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Loomise aeg: Juuni 20, 2025 kell 12:33 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `devserver`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `drug_sales_leaderboard`
--

CREATE TABLE `drug_sales_leaderboard` (
  `id` int(11) NOT NULL,
  `identifier` varchar(64) NOT NULL,
  `playerName` varchar(50) NOT NULL,
  `points` int(11) DEFAULT 0,
  `soldItems` int(11) DEFAULT 0,
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `drug_sales_leaderboard`
--

INSERT INTO `drug_sales_leaderboard` (`id`, `identifier`, `playerName`, `points`, `soldItems`, `lastUpdated`) VALUES
(2, '304', 'takenncs', 999999999, 1, '2025-06-19 02:47:33'),
(3, '9504', 'ASD', 550, 11, '2025-06-19 22:31:36');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `drug_sales_leaderboard`
--
ALTER TABLE `drug_sales_leaderboard`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `drug_sales_leaderboard`
--
ALTER TABLE `drug_sales_leaderboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
