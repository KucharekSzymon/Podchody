-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Czas generowania: 02 Sty 2022, 12:45
-- Wersja serwera: 5.7.36
-- Wersja PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `Podchody`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Codes`
--

CREATE TABLE `Codes` (
  `Code_ID` int(11) NOT NULL,
  `Game_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Game`
--

CREATE TABLE `Game` (
  `Game_ID` int(11) NOT NULL,
  `Name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Points`
--

CREATE TABLE `Points` (
  `Point_ID` int(11) NOT NULL,
  `Game_ID` int(11) NOT NULL,
  `Name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Altitude` double NOT NULL,
  `Longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Questions`
--

CREATE TABLE `Questions` (
  `Question_ID` int(11) NOT NULL,
  `Point_ID` int(11) NOT NULL,
  `Question` text COLLATE utf8_polish_ci NOT NULL,
  `Answer1` text COLLATE utf8_polish_ci,
  `Answer2` text COLLATE utf8_polish_ci,
  `Answer3` text COLLATE utf8_polish_ci,
  `Answer4` text COLLATE utf8_polish_ci,
  `Correct_Answer` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Test`
--

CREATE TABLE `Test` (
  `Test_ID` int(11) NOT NULL,
  `Name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Question_ID` int(11) DEFAULT NULL,
  `Treshhold` int(11) NOT NULL DEFAULT '75'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Test`
--

INSERT INTO `Test` (`Test_ID`, `Name`, `Question_ID`, `Treshhold`) VALUES
(1, 'Science Quiz', NULL, 75),
(2, 'Other', NULL, 50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `User_ID` int(11) NOT NULL,
  `Group_ID` int(11) DEFAULT NULL,
  `Username` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Users`
--

INSERT INTO `Users` (`User_ID`, `Group_ID`, `Username`) VALUES
(1, 1, 'Adam'),
(2, NULL, 'Ola');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Codes`
--
ALTER TABLE `Codes`
  ADD PRIMARY KEY (`Code_ID`);

--
-- Indeksy dla tabeli `Points`
--
ALTER TABLE `Points`
  ADD PRIMARY KEY (`Point_ID`);

--
-- Indeksy dla tabeli `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`Question_ID`);

--
-- Indeksy dla tabeli `Test`
--
ALTER TABLE `Test`
  ADD PRIMARY KEY (`Test_ID`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `Codes`
--
ALTER TABLE `Codes`
  MODIFY `Code_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Points`
--
ALTER TABLE `Points`
  MODIFY `Point_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Questions`
--
ALTER TABLE `Questions`
  MODIFY `Question_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Test`
--
ALTER TABLE `Test`
  MODIFY `Test_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
