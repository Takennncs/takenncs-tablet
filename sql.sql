CREATE TABLE `drug_sales_leaderboard` (
  `id` int(11) NOT NULL,
  `identifier` varchar(64) NOT NULL,
  `playerName` varchar(50) NOT NULL,
  `points` int(11) DEFAULT 0,
  `soldItems` int(11) DEFAULT 0,
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
