-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Apr 2021 pada 21.04
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundryapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `total_bayar` decimal(12,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `biaya_tambahan` decimal(12,2) NOT NULL,
  `diskon` decimal(12,2) NOT NULL,
  `pajak` decimal(12,2) NOT NULL,
  `total_bayar` decimal(12,2) NOT NULL,
  `status` enum('baru','proses','selesai','di ambil') NOT NULL,
  `dibayar` enum('bayar','belum di bayar') NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `id_user`, `id_outlet`, `id_member`, `biaya_tambahan`, `diskon`, `pajak`, `total_bayar`, `status`, `dibayar`, `batas_waktu`, `tgl_bayar`, `kode_invoice`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, '10000.00', '2000.00', '1000.00', '20000.00', 'di ambil', 'bayar', '2021-04-10 22:02:59', '2021-04-05 22:02:59', '21331fa', '2021-03-31 22:02:59', '2021-03-31 22:02:59'),
(3, 1, 2, 18, '10000.00', '1000.00', '1000.00', '200000.00', 'proses', 'belum di bayar', '2021-04-10 22:02:59', '2021-04-05 22:02:59', '2133-4-fa', '2021-04-06 23:51:29', '2021-04-06 23:51:29'),
(4, 1, 2, 2, '20000.00', '21.00', '21.00', '0.00', 'baru', 'belum di bayar', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '32131', '2021-04-06 13:02:32', '2021-04-06 13:02:32'),
(5, 1, 2, 2, '0.00', '0.00', '0.00', '0.00', 'baru', 'bayar', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '32131', '2021-04-06 13:06:39', '2021-04-06 13:06:39'),
(6, 1, 2, 18, '20000.00', '0.00', '0.00', '0.00', 'baru', 'bayar', '2021-04-07 01:33:00', '0000-00-00 00:00:00', '32131', '2021-04-06 13:34:06', '2021-04-06 13:34:06'),
(7, 1, 2, 18, '0.00', '0.00', '0.00', '0.00', 'baru', 'bayar', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1212', '2021-04-06 13:42:03', '2021-04-06 13:42:03'),
(8, 1, 2, 18, '20000.00', '5.00', '10.00', '0.00', 'baru', 'bayar', '0000-00-00 00:00:00', '2021-04-06 13:49:33', '325642', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `nama_member` varchar(225) NOT NULL,
  `alamat_member` varchar(225) NOT NULL,
  `jkl_member` enum('Perempuan','Laki-laki','','') NOT NULL,
  `tlp_member` varchar(225) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_member`
--

INSERT INTO `tb_member` (`id`, `nama_member`, `alamat_member`, `jkl_member`, `tlp_member`, `created_at`, `updated_at`) VALUES
(2, 'Atqa Munzir', 'Purizahara', 'Laki-laki', '0812-0000-xxxx', '2021-04-04 15:29:58', '2021-04-04 15:29:58'),
(18, 'Muhammad Safari Luthfi Siregar', 'jln Bunga Ncole XIV', 'Laki-laki', '0877-1204-4946', '2021-04-05 21:38:33', '2021-04-05 21:38:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` int(11) NOT NULL,
  `nama_outlet` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tlp` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_outlet`
--

INSERT INTO `tb_outlet` (`id`, `nama_outlet`, `alamat`, `tlp`) VALUES
(1, 'Safari-Johor', 'Medan Johor', '087712044946'),
(2, 'Safari-Tuntungan', 'Medan Tuntungan', '0812-1212-xxxx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis_paket` enum('Selimut','Kiloan','Jas','Dll') NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga_paket` decimal(12,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis_paket`, `nama_paket`, `harga_paket`, `created_at`, `updated_at`) VALUES
(1, 1, 'Selimut', 'selimut', '8000.00', '2021-04-07 00:20:25', '2021-04-07 00:20:25'),
(2, 2, 'Jas', 'Jas', '10000.00', '2021-04-07 01:44:11', '2021-04-07 01:44:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama_user` varchar(225) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `id_outlet` int(11) DEFAULT NULL,
  `role` enum('kasir','admin','owner') DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama_user`, `username`, `password`, `id_outlet`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Safari Luthfi Siregar', 'safari0216', '$argon2i$v=19$m=65536,t=4,p=1$NDBjdlVFUFhLbm5Od0cweQ$XEFxz00FdGInUwJIESpl4UHcdaYDN8EJ6viGrZudIqc', 2, 'admin', '2021-04-03 09:17:53', '2021-04-06 10:40:36'),
(2, 'test', 'test', 'test123', 2, 'kasir', '2021-04-06 19:36:18', '2021-04-06 19:36:18'),
(8, 'tes212', 'test', 'test23', 1, 'kasir', '2021-04-06 23:57:08', '2021-04-06 23:57:08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_member` (`id_member`);

--
-- Indeks untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
