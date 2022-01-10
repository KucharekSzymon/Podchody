-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Czas generowania: 10 Sty 2022, 00:33
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
  `Name` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Game`
--

INSERT INTO `Game` (`Game_ID`, `Name`) VALUES
(1, 'Gra PWSZ'),
(2, 'Gra po Nysie'),
(4, 'test2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Points`
--

CREATE TABLE `Points` (
  `Point_ID` int(11) NOT NULL,
  `Game_ID` int(11) DEFAULT NULL,
  `Name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Altitude` double NOT NULL,
  `Longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Points`
--

INSERT INTO `Points` (`Point_ID`, `Game_ID`, `Name`, `Altitude`, `Longitude`) VALUES
(1, 2, 'PWSZ Nysa', 50.474281, 17.3368554),
(4, 1, 'ROLNIK Nysa', 50.4612734, 17.332085),
(5, NULL, 'Parys Gym Nysa', 50.4665892, 17.3398733);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Questions`
--

CREATE TABLE `Questions` (
  `Question_ID` int(11) NOT NULL,
  `Test_ID` int(11) DEFAULT NULL,
  `Question` text COLLATE utf8_polish_ci NOT NULL,
  `Answer1` text COLLATE utf8_polish_ci,
  `Answer2` text COLLATE utf8_polish_ci,
  `Answer3` text COLLATE utf8_polish_ci,
  `Answer4` text COLLATE utf8_polish_ci,
  `Correct_Answer` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Questions`
--

INSERT INTO `Questions` (`Question_ID`, `Test_ID`, `Question`, `Answer1`, `Answer2`, `Answer3`, `Answer4`, `Correct_Answer`) VALUES
(9, 1, 'How Apple phone is called', 'GTX', 'newPie', 'iPhone', 'Galaxy', '3'),
(10, 2, 'When Electron tube was invented?', '1883', '1991', '1920', '1900', '1'),
(11, 1, 'Who popularized AC electricity', 'Isaac Newton', 'Nicola Tesla', 'George Bush', 'Elon Musk', '2'),
(13, NULL, 'In which country is the silicon valley located?', 'Canada', 'England', 'USA', 'Autralia', '3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Test`
--

CREATE TABLE `Test` (
  `Test_ID` int(11) NOT NULL,
  `Name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Point_ID` int(11) DEFAULT NULL,
  `Treshhold` int(11) NOT NULL DEFAULT '75'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Test`
--

INSERT INTO `Test` (`Test_ID`, `Name`, `Point_ID`, `Treshhold`) VALUES
(1, 'Science Quiz', 1, 75),
(2, 'Other', 2, 68),
(11, 'Fitness test', 2, 80),
(12, 'Test', NULL, 12);

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
-- Indeksy dla tabeli `Game`
--
ALTER TABLE `Game`
  ADD PRIMARY KEY (`Game_ID`);

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
-- AUTO_INCREMENT dla tabeli `Game`
--
ALTER TABLE `Game`
  MODIFY `Game_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `Points`
--
ALTER TABLE `Points`
  MODIFY `Point_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `Questions`
--
ALTER TABLE `Questions`
  MODIFY `Question_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT dla tabeli `Test`
--
ALTER TABLE `Test`
  MODIFY `Test_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
