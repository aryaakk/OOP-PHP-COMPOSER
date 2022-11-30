-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2022 pada 03.41
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staditek2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `branch`
--

INSERT INTO `branch` (`id`, `name`, `location`, `open_hour`, `close_hour`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'ALFAMART', 'BINTARO ARCADE', '08:41:46', '23:41:46', '0909090909', '2022-11-28 06:41:46', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cashiers`
--

CREATE TABLE `cashiers` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('L','P') COLLATE utf8_unicode_ci DEFAULT 'L',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `cashiers`
--

INSERT INTO `cashiers` (`id`, `nik`, `name`, `gender`, `email`, `phone`, `password`) VALUES
(1, '0808080808080', 'ARYAK', 'L', 'arya@gmail.com', '09909090909', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stok` int(11) NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uom` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `goods`
--

INSERT INTO `goods` (`id`, `name`, `price`, `stok`, `brand`, `uom`) VALUES
(1, 'MAKANAN', 30000, 20, 'KHONG GUA', 'pcs');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_detail`
--

CREATE TABLE `trx_detail` (
  `id_dtl` int(11) NOT NULL,
  `hdr_id` int(11) NOT NULL,
  `id_goods` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `trx_detail`
--

INSERT INTO `trx_detail` (`id_dtl`, `hdr_id`, `id_goods`, `qty`, `created_at`, `updated_at`) VALUES
(11, 1, 1, 1, '2022-11-29 01:19:32', '2022-11-29 01:19:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_header`
--

CREATE TABLE `trx_header` (
  `id_hdr` int(11) NOT NULL,
  `info_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_prices` double NOT NULL,
  `total_paid` double NOT NULL,
  `charge` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `trx_header`
--

INSERT INTO `trx_header` (`id_hdr`, `info_id`, `branch_id`, `date`, `discount`, `total_prices`, `total_paid`, `charge`) VALUES
(1, 101, 1, '2022-11-28 09:35:37', NULL, 190000, 200000, 10000),
(2, 101, 1, '2022-11-29 03:10:02', NULL, 190000, 200000, 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_info`
--

CREATE TABLE `trx_info` (
  `id_info` int(11) NOT NULL,
  `branch_info` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cashier_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `trx_info`
--

INSERT INTO `trx_info` (`id_info`, `branch_info`, `cashier_name`, `is_active`, `created_at`, `updated_at`) VALUES
(101, 'BINTARO ARCADE 2', 'INDAH', 1, '2022-11-28 04:30:39', NULL),
(102, 'BINTARO ARCADE 2', 'DEDE', 1, '2022-11-28 01:54:57', NULL),
(103, 'BINTARO ARCADE 2', 'MAULANA', 1, '2022-11-28 01:54:57', NULL),
(104, 'BINTARO ARCADE 2', 'DINA', 1, '2022-11-28 01:54:57', NULL),
(105, 'BINTARO ARCADE 2', 'ARYAK', 1, '2022-11-28 01:54:57', NULL),
(106, 'BINTARO ARCADE 2', 'SISCA', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'BINTARO ARCADE 2', 'SISCA', 1, '2022-11-28 07:51:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cashiers`
--
ALTER TABLE `cashiers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trx_detail`
--
ALTER TABLE `trx_detail`
  ADD PRIMARY KEY (`id_dtl`),
  ADD KEY `hdr_fk` (`hdr_id`),
  ADD KEY `goods_fk` (`id_goods`);

--
-- Indeks untuk tabel `trx_header`
--
ALTER TABLE `trx_header`
  ADD PRIMARY KEY (`id_hdr`),
  ADD KEY `info_fk` (`info_id`),
  ADD KEY `branch_fk` (`branch_id`);

--
-- Indeks untuk tabel `trx_info`
--
ALTER TABLE `trx_info`
  ADD PRIMARY KEY (`id_info`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cashiers`
--
ALTER TABLE `cashiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `trx_detail`
--
ALTER TABLE `trx_detail`
  MODIFY `id_dtl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `trx_header`
--
ALTER TABLE `trx_header`
  MODIFY `id_hdr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `trx_info`
--
ALTER TABLE `trx_info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `trx_detail`
--
ALTER TABLE `trx_detail`
  ADD CONSTRAINT `goods_fk` FOREIGN KEY (`id_goods`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hdr_fk` FOREIGN KEY (`hdr_id`) REFERENCES `trx_header` (`id_hdr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `trx_header`
--
ALTER TABLE `trx_header`
  ADD CONSTRAINT `branch_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `info_fk` FOREIGN KEY (`info_id`) REFERENCES `trx_info` (`id_info`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
