-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Mar 2022 pada 06.38
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bisamasak`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Username` varchar(1000) NOT NULL,
  `Password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chef`
--

CREATE TABLE `chef` (
  `ChefID` int(11) NOT NULL,
  `Username` varchar(1000) NOT NULL,
  `Password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chefstory`
--

CREATE TABLE `chefstory` (
  `StoryID` int(11) NOT NULL,
  `ChefID` int(11) NOT NULL,
  `story` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `newsID` int(11) NOT NULL,
  `nwes` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resepchef`
--

CREATE TABLE `resepchef` (
  `ResepID` int(11) NOT NULL,
  `ChefID` int(11) NOT NULL,
  `Bahan` varchar(1000) NOT NULL,
  `Tutor` varchar(1000) NOT NULL,
  `Vidtutor` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resepuser`
--

CREATE TABLE `resepuser` (
  `ResepID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Bahan` varchar(1000) NOT NULL,
  `Tutor` varchar(1000) NOT NULL,
  `Vidtutor` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(1000) NOT NULL,
  `Password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `userstory`
--

CREATE TABLE `userstory` (
  `StoryID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `story` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indeks untuk tabel `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`ChefID`);

--
-- Indeks untuk tabel `chefstory`
--
ALTER TABLE `chefstory`
  ADD PRIMARY KEY (`StoryID`),
  ADD UNIQUE KEY `ChefID` (`ChefID`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`);

--
-- Indeks untuk tabel `resepchef`
--
ALTER TABLE `resepchef`
  ADD PRIMARY KEY (`ResepID`),
  ADD UNIQUE KEY `ChefID` (`ChefID`);

--
-- Indeks untuk tabel `resepuser`
--
ALTER TABLE `resepuser`
  ADD PRIMARY KEY (`ResepID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indeks untuk tabel `userstory`
--
ALTER TABLE `userstory`
  ADD PRIMARY KEY (`StoryID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `chefstory`
--
ALTER TABLE `chefstory`
  MODIFY `StoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resepchef`
--
ALTER TABLE `resepchef`
  MODIFY `ResepID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resepuser`
--
ALTER TABLE `resepuser`
  MODIFY `ResepID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `userstory`
--
ALTER TABLE `userstory`
  MODIFY `StoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`ChefID`) REFERENCES `resepchef` (`ChefID`) ON DELETE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `chefstory`
--
ALTER TABLE `chefstory`
  ADD CONSTRAINT `chefstory_ibfk_1` FOREIGN KEY (`ChefID`) REFERENCES `chef` (`ChefID`) ON DELETE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `resepuser` (`UserID`) ON DELETE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `userstory`
--
ALTER TABLE `userstory`
  ADD CONSTRAINT `userstory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
