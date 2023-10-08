-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Okt 2023 pada 14.54
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wma-maestro`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `nama_barang` varchar(125) NOT NULL,
  `deskripsi` text NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `harga_supplier` varchar(20) DEFAULT NULL,
  `stok_supplier` int(11) DEFAULT NULL,
  `harga_gudang` varchar(20) DEFAULT NULL,
  `stok_gudang` int(11) DEFAULT NULL,
  `stok_minimal` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `id_kategori`, `id_supplier`, `nama_barang`, `deskripsi`, `satuan`, `harga_supplier`, `stok_supplier`, `harga_gudang`, `stok_gudang`, `stok_minimal`, `gambar`, `type`) VALUES
(1, 1, 1, 'HVS A4 1 Dus', 'Kertas HVS Multifungsi untuk memenuhi kebutuhan sekolah maupun kantor', 'dus', '205000', 1000, '205000', 1000, 30, 'hvs.jpg', 2),
(2, 1, 1, 'Art Carton 100 Pcs', 'Kertas berbahan karton untuk memenuhi kebutuhan produksi percetakan', 'pcs', '91000', 1000, '91000', 1000, 30, 'carton.jpeg', 2),
(3, 1, 1, 'Kertas Glossy 100 Pcs', 'Kertas berbahan glossy untuk memenuhi kebutuhan produksi percetakan', 'pcs', '62000', 1000, '62000', 1000, 30, 'glossy.jpg', 2),
(4, 2, 2, 'Hot Melt Glue 1 Kg', 'Bahan lem untuk percetakan', 'kg', '115000', 1000, '', 0, 30, 'hotglue.jpg', 2),
(5, 2, 2, 'Jelly Glue 1 Kg', 'Bahan lem untuk percetakan', 'kg', '100000', 1000, '', 0, 30, 'jellyglue.jpg', 2),
(6, 3, 2, 'Flexi 1 Roll', 'Bahan flexi yang lentur dan tidak mudah robek', 'roll', '137500', 1000, '', 0, 30, 'flexi.jpg', 2),
(7, 3, 2, 'Albatros 1 Roll', 'Bahan albatros yang halus serta mengkilap memberikan kesan yang bagus untuk banner indoor', 'roll', '323000', 1000, '', 0, 30, 'albatros.jpg', 2),
(8, 3, 2, 'Luster 1 Roll', 'Bahan luster yang memiliki daya tahan lama dan menghasilkan efek doff', 'roll', '445000', 1000, '', 0, 30, 'luster.jpg', 2),
(9, 4, 1, 'Dye Base 1 Dus', 'Tinta dye merupakan tinta yang paling sering digunakan untuk keperluan rumahan atau kantoran untuk mencetak sebuah dokumen', 'dus', '305000', 1000, '305000', 1000, 30, 'dye.jpeg', 2),
(10, 4, 1, 'Pigment 1 Dus', 'Tinta pigment biasa digunakan untuk mencetak dokumen penting seperti ijazah, sertifikat, dll.', 'dus', '325000', 1000, '325000', 1000, 30, 'pigment.jpg', 2),
(11, 4, 1, 'Solvent 1 Dus', 'Tinta solvent merupakan tinta yang kebanyakan dipakai untuk keperluan cetak banner', 'dus', '560000', 1000, '560000', 1000, 30, 'solvent.jpg', 2),
(12, 1, 0, 'Undangan', 'Cetak undangan pernikahan, khitanan, syukuran', 'pcs', NULL, NULL, '750', 1000, 0, 'undangan.jpg', 1),
(13, 1, 0, 'Buku Yasin', 'Cetak buku yasin', 'pcs', NULL, NULL, '6000', 1000, 0, 'yasin.jpg', 1),
(14, 1, 0, 'Brosur', 'Cetak brosur, iklan dan majalah', 'pcs', NULL, NULL, '1200', 10000, 0, 'brosur.jpg', 1),
(15, 1, 0, 'Banner', 'Cetak banner acara', 'meter', NULL, NULL, '25000', 10000, 0, 'banner.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Kertas'),
(2, 'Bahan Lem'),
(3, 'Bahan Banner'),
(4, 'Bahan Tinta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_barang`
--

CREATE TABLE `po_barang` (
  `id_po_bar` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `tgl_tran_bar` varchar(20) NOT NULL,
  `tot_bay_bar` varchar(20) NOT NULL,
  `stat_bay_bar` int(11) NOT NULL,
  `bukti_bay_bar` text NOT NULL,
  `stat_order_bar` int(11) NOT NULL,
  `alamat_kirim_bar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_barang`
--

INSERT INTO `po_barang` (`id_po_bar`, `id_reseller`, `tgl_tran_bar`, `tot_bay_bar`, `stat_bay_bar`, `bukti_bay_bar`, `stat_order_bar`, `alamat_kirim_bar`) VALUES
(1, 1, '2023-09-16', '10000', 0, '0', 0, 'Kuningan, Jawa Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_bb`
--

CREATE TABLE `po_bb` (
  `id_po_bb` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `tgl_transaksi` varchar(15) NOT NULL,
  `total_bayar` varchar(15) NOT NULL,
  `stat_bayar` int(11) NOT NULL,
  `bukti_bayar` text NOT NULL,
  `status_order` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_bb`
--

INSERT INTO `po_bb` (`id_po_bb`, `id_user`, `id_supplier`, `tgl_transaksi`, `total_bayar`, `stat_bayar`, `bukti_bayar`, `status_order`, `alamat_pengiriman`) VALUES
(1, 1, 1, '2022-01-01', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(2, 1, 1, '2022-01-02', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(3, 1, 2, '2022-01-03', '22250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(4, 1, 1, '2022-01-04', '16250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(5, 1, 1, '2022-01-05', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(6, 1, 1, '2022-01-06', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(7, 1, 2, '2022-01-07', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(8, 1, 2, '2022-01-08', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(9, 1, 2, '2022-01-09', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(10, 1, 1, '2022-01-10', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(11, 1, 2, '2022-01-11', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(12, 1, 1, '2022-01-12', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(13, 1, 1, '2022-01-13', '14000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(14, 1, 2, '2022-01-14', '2875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(15, 1, 2, '2022-01-15', '2875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(16, 1, 1, '2022-01-16', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(17, 1, 2, '2022-01-17', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(18, 1, 1, '2022-01-18', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(19, 1, 2, '2022-01-19', '8900000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(20, 1, 1, '2022-01-20', '11200000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(21, 1, 1, '2022-01-21', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(22, 1, 2, '2022-01-22', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(23, 1, 1, '2022-01-23', '14000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(24, 1, 1, '2022-01-24', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(25, 1, 1, '2022-01-25', '1365000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(26, 1, 2, '2022-01-26', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(27, 1, 1, '2022-01-27', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(28, 1, 2, '2022-01-28', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(29, 1, 1, '2022-01-29', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(30, 1, 1, '2022-01-30', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(31, 1, 1, '2022-01-31', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(32, 1, 2, '2022-02-01', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(33, 1, 2, '2022-02-02', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(34, 1, 1, '2022-02-03', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(35, 1, 1, '2022-02-04', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(36, 1, 1, '2022-02-05', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(37, 1, 2, '2022-02-06', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(38, 1, 1, '2022-02-07', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(39, 1, 2, '2022-02-08', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(40, 1, 2, '2022-02-09', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(41, 1, 2, '2022-02-10', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(42, 1, 2, '2022-02-11', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(43, 1, 1, '2022-02-12', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(44, 1, 1, '2022-02-13', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(45, 1, 1, '2022-02-14', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(46, 1, 2, '2022-02-15', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(47, 1, 1, '2022-02-16', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(48, 1, 1, '2022-02-17', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(49, 1, 1, '2022-02-18', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(50, 1, 2, '2022-02-19', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(51, 1, 1, '2022-02-20', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(52, 1, 1, '2022-02-21', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(53, 1, 2, '2022-02-22', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(54, 1, 1, '2022-02-23', '11200000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(55, 1, 2, '2022-02-24', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(56, 1, 2, '2022-02-25', '3000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(57, 1, 2, '2022-02-26', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(58, 1, 1, '2022-02-27', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(59, 1, 2, '2022-02-28', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(60, 1, 2, '2022-03-01', '1615000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(61, 1, 2, '2022-03-02', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(62, 1, 1, '2022-03-03', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(63, 1, 1, '2022-03-04', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(64, 1, 1, '2022-03-05', '5600000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(65, 1, 1, '2022-03-06', '1365000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(66, 1, 2, '2022-03-07', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(67, 1, 2, '2022-03-08', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(68, 1, 2, '2022-03-09', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(69, 1, 2, '2022-03-10', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(70, 1, 1, '2022-03-11', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(71, 1, 1, '2022-03-12', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(72, 1, 1, '2022-03-13', '11200000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(73, 1, 1, '2022-03-14', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(74, 1, 2, '2022-03-15', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(75, 1, 1, '2022-03-16', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(76, 1, 1, '2022-03-17', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(77, 1, 1, '2022-03-18', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(78, 1, 1, '2022-03-19', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(79, 1, 1, '2022-03-20', '6500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(80, 1, 1, '2022-03-21', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(81, 1, 1, '2022-03-22', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(82, 1, 1, '2022-03-23', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(83, 1, 1, '2022-03-24', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(84, 1, 1, '2022-03-25', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(85, 1, 2, '2022-03-26', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(86, 1, 2, '2022-03-27', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(87, 1, 1, '2022-03-28', '5600000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(88, 1, 1, '2022-03-29', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(89, 1, 2, '2022-03-30', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(90, 1, 2, '2022-03-31', '3437500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(91, 1, 2, '2022-04-01', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(92, 1, 2, '2022-04-02', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(93, 1, 2, '2022-04-03', '2500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(94, 1, 2, '2022-04-04', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(95, 1, 2, '2022-04-05', '11125000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(96, 1, 2, '2022-04-06', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(97, 1, 2, '2022-04-07', '8900000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(98, 1, 1, '2022-04-08', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(99, 1, 2, '2022-04-09', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(100, 1, 1, '2022-04-10', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(101, 1, 2, '2022-04-11', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(102, 1, 2, '2022-04-12', '8900000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(103, 1, 1, '2022-04-13', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(104, 1, 1, '2022-04-14', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(105, 1, 2, '2022-04-15', '2875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(106, 1, 1, '2022-04-16', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(107, 1, 2, '2022-04-17', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(108, 1, 1, '2022-04-18', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(109, 1, 1, '2022-04-19', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(110, 1, 2, '2022-04-20', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(111, 1, 1, '2022-04-21', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(112, 1, 1, '2022-04-22', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(113, 1, 2, '2022-04-23', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(114, 1, 1, '2022-04-24', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(115, 1, 1, '2022-04-25', '6500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(116, 1, 1, '2022-04-26', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(117, 1, 1, '2022-04-27', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(118, 1, 1, '2022-04-28', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(119, 1, 2, '2022-04-29', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(120, 1, 2, '2022-04-30', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(121, 1, 1, '2022-05-01', '6500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(122, 1, 1, '2022-05-02', '11200000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(123, 1, 1, '2022-05-03', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(124, 1, 1, '2022-05-04', '11200000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(125, 1, 2, '2022-05-05', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(126, 1, 2, '2022-05-06', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(127, 1, 2, '2022-05-07', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(128, 1, 1, '2022-05-08', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(129, 1, 1, '2022-05-09', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(130, 1, 1, '2022-05-10', '6500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(131, 1, 1, '2022-05-11', '5600000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(132, 1, 2, '2022-05-12', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(133, 1, 2, '2022-05-13', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(134, 1, 1, '2022-05-14', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(135, 1, 2, '2022-05-15', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(136, 1, 1, '2022-05-16', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(137, 1, 1, '2022-05-17', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(138, 1, 1, '2022-05-18', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(139, 1, 2, '2022-05-19', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(140, 1, 1, '2022-05-20', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(141, 1, 2, '2022-05-21', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(142, 1, 2, '2022-05-22', '2500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(143, 1, 1, '2022-05-23', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(144, 1, 2, '2022-05-24', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(145, 1, 1, '2022-05-25', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(146, 1, 2, '2022-05-26', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(147, 1, 2, '2022-05-27', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(148, 1, 2, '2022-05-28', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(149, 1, 2, '2022-05-29', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(150, 1, 1, '2022-05-30', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(151, 1, 1, '2022-05-31', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(152, 1, 1, '2022-06-01', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(153, 1, 1, '2022-06-02', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(154, 1, 1, '2022-06-03', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(155, 1, 1, '2022-06-04', '1625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(156, 1, 2, '2022-06-05', '575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(157, 1, 1, '2022-06-06', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(158, 1, 2, '2022-06-07', '2875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(159, 1, 2, '2022-06-08', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(160, 1, 2, '2022-06-09', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(161, 1, 2, '2022-06-10', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(162, 1, 2, '2022-06-11', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(163, 1, 1, '2022-06-12', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(164, 1, 2, '2022-06-13', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(165, 1, 2, '2022-06-14', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(166, 1, 1, '2022-06-15', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(167, 1, 1, '2022-06-16', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(168, 1, 2, '2022-06-17', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(169, 1, 1, '2022-06-18', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(170, 1, 2, '2022-06-19', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(171, 1, 2, '2022-06-20', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(172, 1, 1, '2022-06-21', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(173, 1, 1, '2022-06-22', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(174, 1, 1, '2022-06-23', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(175, 1, 2, '2022-06-24', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(176, 1, 1, '2022-06-25', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(177, 1, 1, '2022-06-26', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(178, 1, 1, '2022-06-27', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(179, 1, 2, '2022-06-28', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(180, 1, 2, '2022-06-29', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(181, 1, 2, '2022-06-30', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(182, 1, 1, '2022-07-01', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(183, 1, 1, '2022-07-02', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(184, 1, 1, '2022-07-03', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(185, 1, 1, '2022-07-04', '1025000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(186, 1, 1, '2022-07-05', '15250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(187, 1, 2, '2022-07-06', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(188, 1, 1, '2022-07-07', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(189, 1, 2, '2022-07-08', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(190, 1, 2, '2022-07-09', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(191, 1, 1, '2022-07-10', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(192, 1, 1, '2022-07-11', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(193, 1, 1, '2022-07-12', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(194, 1, 1, '2022-07-13', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(195, 1, 1, '2022-07-14', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(196, 1, 2, '2022-07-15', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(197, 1, 2, '2022-07-16', '2875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(198, 1, 2, '2022-07-17', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(199, 1, 2, '2022-07-18', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(200, 1, 2, '2022-07-19', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(201, 1, 2, '2022-07-20', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(202, 1, 1, '2022-07-21', '6500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(203, 1, 2, '2022-07-22', '8900000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(204, 1, 1, '2022-07-23', '205000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(205, 1, 1, '2022-07-24', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(206, 1, 1, '2022-07-25', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(207, 1, 1, '2022-07-26', '1365000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(208, 1, 2, '2022-07-27', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(209, 1, 1, '2022-07-28', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(210, 1, 2, '2022-07-29', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(211, 1, 1, '2022-07-30', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(212, 1, 2, '2022-07-31', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(213, 1, 2, '2022-08-01', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(214, 1, 2, '2022-08-02', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(215, 1, 1, '2022-08-03', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(216, 1, 1, '2022-08-04', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(217, 1, 1, '2022-08-05', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(218, 1, 2, '2022-08-06', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(219, 1, 1, '2022-08-07', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(220, 1, 2, '2022-08-08', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(221, 1, 1, '2022-08-09', '1550000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(222, 1, 1, '2022-08-10', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(223, 1, 2, '2022-08-11', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(224, 1, 1, '2022-08-12', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(225, 1, 1, '2022-08-13', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(226, 1, 2, '2022-08-14', '2500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(227, 1, 2, '2022-08-15', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(228, 1, 2, '2022-08-16', '6460000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(229, 1, 2, '2022-08-17', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(230, 1, 1, '2022-08-18', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(231, 1, 2, '2022-08-19', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(232, 1, 2, '2022-08-20', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(233, 1, 1, '2022-08-21', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(234, 1, 2, '2022-08-22', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(235, 1, 1, '2022-08-23', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(236, 1, 1, '2022-08-24', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(237, 1, 1, '2022-08-25', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(238, 1, 1, '2022-08-26', '1860000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(239, 1, 2, '2022-08-27', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(240, 1, 1, '2022-08-28', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(241, 1, 1, '2022-08-29', '5600000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(242, 1, 2, '2022-08-30', '687500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(243, 1, 1, '2022-08-31', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(244, 1, 2, '2022-09-01', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(245, 1, 2, '2022-09-02', '2500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(246, 1, 1, '2022-09-03', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(247, 1, 2, '2022-09-04', '4845000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(248, 1, 2, '2022-09-05', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(249, 1, 1, '2022-09-06', '5600000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(250, 1, 2, '2022-09-07', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(251, 1, 1, '2022-09-08', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(252, 1, 2, '2022-09-09', '2500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(253, 1, 2, '2022-09-10', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(254, 1, 1, '2022-09-11', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(255, 1, 1, '2022-09-12', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(256, 1, 2, '2022-09-13', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(257, 1, 1, '2022-09-14', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(258, 1, 2, '2022-09-15', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(259, 1, 1, '2022-09-16', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(260, 1, 2, '2022-09-17', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(261, 1, 2, '2022-09-18', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(262, 1, 1, '2022-09-19', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(263, 1, 2, '2022-09-20', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(264, 1, 1, '2022-09-21', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(265, 1, 1, '2022-09-22', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(266, 1, 2, '2022-09-23', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(267, 1, 1, '2022-09-24', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(268, 1, 1, '2022-09-25', '5600000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(269, 1, 2, '2022-09-26', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(270, 1, 1, '2022-09-27', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(271, 1, 1, '2022-09-28', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(272, 1, 2, '2022-09-29', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(273, 1, 1, '2022-09-30', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(274, 1, 2, '2022-10-01', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(275, 1, 1, '2022-10-02', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(276, 1, 2, '2022-10-03', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(277, 1, 2, '2022-10-04', '2875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(278, 1, 1, '2022-10-05', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(279, 1, 2, '2022-10-06', '8900000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(280, 1, 2, '2022-10-07', '3437500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(281, 1, 1, '2022-10-08', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(282, 1, 2, '2022-10-09', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(283, 1, 1, '2022-10-10', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(284, 1, 1, '2022-10-11', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(285, 1, 2, '2022-10-12', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(286, 1, 2, '2022-10-13', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(287, 1, 2, '2022-10-14', '11125000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(288, 1, 1, '2022-10-15', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(289, 1, 2, '2022-10-16', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(290, 1, 1, '2022-10-17', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(291, 1, 2, '2022-10-18', '3437500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(292, 1, 1, '2022-10-19', '6100000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(293, 1, 2, '2022-10-20', '2500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(294, 1, 1, '2022-10-21', '7625000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(295, 1, 1, '2022-10-22', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(296, 1, 1, '2022-10-23', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(297, 1, 1, '2022-10-24', '6500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(298, 1, 1, '2022-10-25', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(299, 1, 1, '2022-10-26', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(300, 1, 2, '2022-10-27', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(301, 1, 2, '2022-10-28', '6675000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(302, 1, 2, '2022-10-29', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(303, 1, 2, '2022-10-30', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(304, 1, 2, '2022-10-31', '8900000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(305, 1, 1, '2022-11-01', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(306, 1, 1, '2022-11-02', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(307, 1, 1, '2022-11-03', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(308, 1, 2, '2022-11-04', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(309, 1, 2, '2022-11-05', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(310, 1, 1, '2022-11-06', '410000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(311, 1, 2, '2022-11-07', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(312, 1, 2, '2022-11-08', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(313, 1, 1, '2022-11-09', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(314, 1, 2, '2022-11-10', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(315, 1, 1, '2022-11-11', '4575000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(316, 1, 2, '2022-11-12', '2000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(317, 1, 2, '2022-11-13', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(318, 1, 2, '2022-11-14', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(319, 1, 2, '2022-11-15', '8075000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(320, 1, 1, '2022-11-16', '8125000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(321, 1, 1, '2022-11-17', '1820000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(322, 1, 1, '2022-11-18', '11200000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(323, 1, 2, '2022-11-19', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(324, 1, 1, '2022-11-20', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(325, 1, 1, '2022-11-21', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(326, 1, 1, '2022-11-22', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(327, 1, 2, '2022-11-23', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(328, 1, 1, '2022-11-24', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(329, 1, 1, '2022-11-25', '1365000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(330, 1, 1, '2022-11-26', '307500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(331, 1, 2, '2022-11-27', '1500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(332, 1, 1, '2022-11-28', '2275000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(333, 1, 1, '2022-11-29', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(334, 1, 2, '2022-11-30', '1375000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(335, 1, 1, '2022-12-01', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(336, 1, 1, '2022-12-02', '3250000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(337, 1, 2, '2022-12-03', '500000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(338, 1, 2, '2022-12-04', '687500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(339, 1, 2, '2022-12-05', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(340, 1, 2, '2022-12-06', '11125000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(341, 1, 2, '2022-12-07', '2062500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(342, 1, 1, '2022-12-08', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(343, 1, 1, '2022-12-09', '1365000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(344, 1, 2, '2022-12-10', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(345, 1, 1, '2022-12-11', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(346, 1, 1, '2022-12-12', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(347, 1, 2, '2022-12-13', '1000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(348, 1, 1, '2022-12-14', '1240000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(349, 1, 2, '2022-12-15', '1150000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(350, 1, 2, '2022-12-16', '4450000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(351, 1, 2, '2022-12-17', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(352, 1, 1, '2022-12-18', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(353, 1, 1, '2022-12-19', '4875000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(354, 1, 1, '2022-12-20', '8400000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(355, 1, 1, '2022-12-21', '910000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(356, 1, 2, '2022-12-22', '2300000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(357, 1, 2, '2022-12-23', '2750000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta');
INSERT INTO `po_bb` (`id_po_bb`, `id_user`, `id_supplier`, `tgl_transaksi`, `total_bayar`, `stat_bayar`, `bukti_bayar`, `status_order`, `alamat_pengiriman`) VALUES
(358, 1, 1, '2022-12-24', '14000000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(359, 1, 1, '2022-12-25', '620000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(360, 1, 1, '2022-12-26', '3050000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(361, 1, 2, '2022-12-27', '1725000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(362, 1, 2, '2022-12-28', '3230000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(363, 1, 1, '2022-12-29', '930000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta'),
(364, 1, 1, '2022-12-30', '512500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_dbarang`
--

CREATE TABLE `po_dbarang` (
  `id_po_dbar` int(11) NOT NULL,
  `id_po_bar` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_dbarang`
--

INSERT INTO `po_dbarang` (`id_po_dbar`, `id_po_bar`, `id_jenis`, `qty`) VALUES
(1, 1, 12, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_dbb`
--

CREATE TABLE `po_dbb` (
  `id_po_dbb` int(11) NOT NULL,
  `id_po_bb` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_dbb`
--

INSERT INTO `po_dbb` (`id_po_dbb`, `id_po_bb`, `id_jenis`, `qty`) VALUES
(1, 1, 11, 15),
(2, 2, 3, 10),
(3, 3, 8, 50),
(4, 4, 10, 50),
(5, 5, 1, 10),
(6, 6, 2, 10),
(7, 7, 6, 10),
(8, 8, 7, 25),
(9, 9, 6, 15),
(10, 10, 11, 15),
(11, 11, 4, 20),
(12, 12, 2, 25),
(13, 13, 11, 25),
(14, 14, 4, 25),
(15, 15, 4, 25),
(16, 16, 1, 15),
(17, 17, 5, 15),
(18, 18, 10, 15),
(19, 19, 8, 20),
(20, 20, 11, 20),
(21, 21, 9, 20),
(22, 22, 8, 10),
(23, 23, 11, 25),
(24, 24, 9, 15),
(25, 25, 2, 15),
(26, 26, 5, 15),
(27, 27, 11, 15),
(28, 28, 4, 10),
(29, 29, 10, 15),
(30, 30, 11, 15),
(31, 31, 9, 15),
(32, 32, 6, 20),
(33, 33, 4, 20),
(34, 34, 3, 20),
(35, 35, 2, 10),
(36, 36, 2, 10),
(37, 37, 4, 15),
(38, 38, 3, 20),
(39, 39, 7, 25),
(40, 40, 7, 15),
(41, 41, 7, 20),
(42, 42, 7, 20),
(43, 43, 3, 25),
(44, 44, 2, 25),
(45, 45, 1, 10),
(46, 46, 5, 20),
(47, 47, 1, 15),
(48, 48, 9, 15),
(49, 49, 1, 20),
(50, 50, 6, 15),
(51, 51, 1, 15),
(52, 52, 2, 20),
(53, 53, 4, 15),
(54, 54, 11, 20),
(55, 55, 5, 10),
(56, 56, 5, 30),
(57, 57, 6, 10),
(58, 58, 3, 10),
(59, 59, 6, 10),
(60, 60, 7, 5),
(61, 61, 7, 25),
(62, 62, 3, 10),
(63, 63, 9, 25),
(64, 64, 11, 10),
(65, 65, 2, 15),
(66, 66, 6, 15),
(67, 67, 8, 10),
(68, 68, 5, 10),
(69, 69, 6, 20),
(70, 70, 3, 25),
(71, 71, 2, 20),
(72, 72, 11, 20),
(73, 73, 3, 15),
(74, 74, 4, 15),
(75, 75, 11, 15),
(76, 76, 2, 10),
(77, 77, 1, 20),
(78, 78, 10, 10),
(79, 79, 10, 20),
(80, 80, 2, 20),
(81, 81, 3, 10),
(82, 82, 10, 10),
(83, 83, 11, 15),
(84, 84, 9, 15),
(85, 85, 5, 20),
(86, 86, 6, 10),
(87, 87, 11, 10),
(88, 88, 3, 25),
(89, 89, 7, 15),
(90, 90, 6, 25),
(91, 91, 5, 10),
(92, 92, 7, 20),
(93, 93, 5, 25),
(94, 94, 4, 20),
(95, 95, 8, 25),
(96, 96, 4, 15),
(97, 97, 8, 20),
(98, 98, 3, 25),
(99, 99, 5, 10),
(100, 100, 3, 10),
(101, 101, 6, 20),
(102, 102, 8, 20),
(103, 103, 9, 25),
(104, 104, 3, 25),
(105, 105, 4, 25),
(106, 106, 9, 15),
(107, 107, 6, 20),
(108, 108, 9, 20),
(109, 109, 3, 25),
(110, 110, 4, 20),
(111, 111, 2, 25),
(112, 112, 9, 25),
(113, 113, 5, 15),
(114, 114, 1, 10),
(115, 115, 10, 20),
(116, 116, 3, 20),
(117, 117, 1, 10),
(118, 118, 9, 10),
(119, 119, 4, 15),
(120, 120, 5, 20),
(121, 121, 10, 20),
(122, 122, 11, 20),
(123, 123, 9, 10),
(124, 124, 11, 20),
(125, 125, 5, 10),
(126, 126, 8, 15),
(127, 127, 6, 10),
(128, 128, 9, 20),
(129, 129, 3, 15),
(130, 130, 10, 20),
(131, 131, 11, 10),
(132, 132, 5, 15),
(133, 133, 6, 15),
(134, 134, 9, 20),
(135, 135, 8, 10),
(136, 136, 3, 10),
(137, 137, 9, 25),
(138, 138, 9, 25),
(139, 139, 7, 20),
(140, 140, 9, 20),
(141, 141, 5, 10),
(142, 142, 5, 25),
(143, 143, 9, 15),
(144, 144, 6, 10),
(145, 145, 11, 15),
(146, 146, 8, 10),
(147, 147, 4, 15),
(148, 148, 7, 15),
(149, 149, 6, 15),
(150, 150, 2, 25),
(151, 151, 3, 15),
(152, 152, 3, 10),
(153, 153, 3, 10),
(154, 154, 1, 10),
(155, 155, 10, 5),
(156, 156, 4, 5),
(157, 157, 1, 20),
(158, 158, 4, 25),
(159, 159, 5, 15),
(160, 160, 6, 20),
(161, 161, 4, 15),
(162, 162, 7, 10),
(163, 163, 3, 25),
(164, 164, 7, 25),
(165, 165, 6, 10),
(166, 166, 3, 20),
(167, 167, 3, 10),
(168, 168, 4, 10),
(169, 169, 3, 10),
(170, 170, 8, 15),
(171, 171, 8, 15),
(172, 172, 10, 15),
(173, 173, 1, 10),
(174, 174, 1, 20),
(175, 175, 5, 20),
(176, 176, 9, 25),
(177, 177, 1, 10),
(178, 178, 1, 10),
(179, 179, 5, 15),
(180, 180, 7, 10),
(181, 181, 7, 15),
(182, 182, 2, 25),
(183, 183, 1, 15),
(184, 184, 2, 10),
(185, 185, 1, 50),
(186, 186, 9, 50),
(187, 187, 7, 10),
(188, 188, 10, 10),
(189, 189, 8, 10),
(190, 190, 7, 25),
(191, 191, 1, 15),
(192, 192, 1, 15),
(193, 193, 3, 20),
(194, 194, 9, 25),
(195, 195, 1, 25),
(196, 196, 7, 25),
(197, 197, 4, 25),
(198, 198, 6, 15),
(199, 199, 8, 15),
(200, 200, 6, 15),
(201, 201, 5, 20),
(202, 202, 10, 20),
(203, 203, 8, 20),
(204, 204, 1, 10),
(205, 205, 2, 25),
(206, 206, 11, 15),
(207, 207, 2, 15),
(208, 208, 7, 15),
(209, 209, 9, 15),
(210, 210, 6, 10),
(211, 211, 10, 15),
(212, 212, 8, 15),
(213, 213, 7, 15),
(214, 214, 7, 20),
(215, 215, 2, 20),
(216, 216, 2, 20),
(217, 217, 9, 10),
(218, 218, 4, 10),
(219, 219, 11, 15),
(220, 220, 6, 20),
(221, 221, 3, 25),
(222, 222, 10, 15),
(223, 223, 7, 20),
(224, 224, 1, 20),
(225, 225, 1, 25),
(226, 226, 5, 25),
(227, 227, 8, 10),
(228, 228, 7, 20),
(229, 229, 7, 15),
(230, 230, 10, 15),
(231, 231, 4, 20),
(232, 232, 7, 15),
(233, 233, 11, 15),
(234, 234, 6, 20),
(235, 235, 11, 15),
(236, 236, 9, 20),
(237, 237, 2, 10),
(238, 238, 3, 30),
(239, 239, 4, 10),
(240, 240, 10, 10),
(241, 241, 11, 10),
(242, 242, 6, 5),
(243, 243, 1, 25),
(244, 244, 7, 10),
(245, 245, 5, 25),
(246, 246, 10, 10),
(247, 247, 7, 15),
(248, 248, 8, 15),
(249, 249, 11, 10),
(250, 250, 4, 10),
(251, 251, 1, 20),
(252, 252, 5, 25),
(253, 253, 4, 20),
(254, 254, 1, 20),
(255, 255, 11, 15),
(256, 256, 5, 15),
(257, 257, 3, 15),
(258, 258, 7, 10),
(259, 259, 2, 20),
(260, 260, 6, 10),
(261, 261, 5, 20),
(262, 262, 9, 20),
(263, 263, 4, 10),
(264, 264, 9, 10),
(265, 265, 1, 15),
(266, 266, 4, 15),
(267, 267, 1, 20),
(268, 268, 11, 10),
(269, 269, 6, 10),
(270, 270, 1, 25),
(271, 271, 1, 15),
(272, 272, 7, 25),
(273, 273, 9, 10),
(274, 274, 6, 20),
(275, 275, 9, 25),
(276, 276, 4, 20),
(277, 277, 4, 25),
(278, 278, 9, 15),
(279, 279, 8, 20),
(280, 280, 6, 25),
(281, 281, 9, 10),
(282, 282, 7, 10),
(283, 283, 9, 20),
(284, 284, 9, 20),
(285, 285, 7, 25),
(286, 286, 7, 25),
(287, 287, 8, 25),
(288, 288, 11, 15),
(289, 289, 4, 20),
(290, 290, 3, 20),
(291, 291, 6, 25),
(292, 292, 9, 20),
(293, 293, 5, 25),
(294, 294, 9, 25),
(295, 295, 3, 15),
(296, 296, 3, 10),
(297, 297, 10, 20),
(298, 298, 3, 20),
(299, 299, 10, 10),
(300, 300, 5, 10),
(301, 301, 8, 15),
(302, 302, 4, 20),
(303, 303, 4, 20),
(304, 304, 8, 20),
(305, 305, 2, 10),
(306, 306, 1, 20),
(307, 307, 2, 10),
(308, 308, 4, 15),
(309, 309, 4, 10),
(310, 310, 1, 20),
(311, 311, 6, 15),
(312, 312, 5, 20),
(313, 313, 2, 10),
(314, 314, 5, 15),
(315, 315, 9, 15),
(316, 316, 5, 20),
(317, 317, 7, 10),
(318, 318, 5, 10),
(319, 319, 7, 25),
(320, 320, 10, 25),
(321, 321, 2, 20),
(322, 322, 11, 20),
(323, 323, 6, 10),
(324, 324, 2, 25),
(325, 325, 3, 15),
(326, 326, 9, 10),
(327, 327, 6, 15),
(328, 328, 2, 10),
(329, 329, 2, 15),
(330, 330, 1, 15),
(331, 331, 5, 15),
(332, 332, 2, 25),
(333, 333, 3, 15),
(334, 334, 6, 10),
(335, 335, 3, 10),
(336, 336, 10, 10),
(337, 337, 5, 5),
(338, 338, 6, 5),
(339, 339, 6, 20),
(340, 340, 8, 25),
(341, 341, 6, 15),
(342, 342, 3, 20),
(343, 343, 2, 15),
(344, 344, 7, 10),
(345, 345, 1, 25),
(346, 346, 1, 25),
(347, 347, 5, 10),
(348, 348, 3, 20),
(349, 349, 4, 10),
(350, 350, 8, 10),
(351, 351, 7, 10),
(352, 352, 11, 15),
(353, 353, 10, 15),
(354, 354, 11, 15),
(355, 355, 2, 10),
(356, 356, 4, 20),
(357, 357, 6, 20),
(358, 358, 11, 25),
(359, 359, 3, 10),
(360, 360, 9, 10),
(361, 361, 4, 15),
(362, 362, 7, 10),
(363, 363, 3, 15),
(364, 364, 1, 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reseller`
--

CREATE TABLE `reseller` (
  `id_reseller` int(11) NOT NULL,
  `nama_reseller` varchar(125) NOT NULL,
  `alamat_reseller` text NOT NULL,
  `no_hp_reseller` varchar(15) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `username_reseller` varchar(50) NOT NULL,
  `password_reseller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `nama_reseller`, `alamat_reseller`, `no_hp_reseller`, `jk`, `username_reseller`, `password_reseller`) VALUES
(1, 'Reseller 1', 'Kuningan, Jawa Barat', '089987656543', 'Perempuan', 'reseller1', 'reseller1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(125) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp_supplier` varchar(15) NOT NULL,
  `username_supp` varchar(20) NOT NULL,
  `pass_supp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_hp_supplier`, `username_supp`, `pass_supp`) VALUES
(1, 'Grafika', 'Jakarta', '089987345162', 'grafika1', 'grafika1'),
(2, 'Max Pro', 'Jakarta', '08991227005', 'maxpro1', 'maxpro1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(125) NOT NULL,
  `alamat_user` text NOT NULL,
  `no_hp_user` varchar(15) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(125) NOT NULL,
  `level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat_user`, `no_hp_user`, `username`, `password`, `level_user`) VALUES
(1, 'Admin', 'Kuningan', '089987654543', 'admin', 'admin', 1),
(3, 'Pimpinan', 'Kuningan, Jawa Barat', '089987654543', 'pimpinan', 'pimpinan', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `po_barang`
--
ALTER TABLE `po_barang`
  ADD PRIMARY KEY (`id_po_bar`);

--
-- Indeks untuk tabel `po_bb`
--
ALTER TABLE `po_bb`
  ADD PRIMARY KEY (`id_po_bb`);

--
-- Indeks untuk tabel `po_dbarang`
--
ALTER TABLE `po_dbarang`
  ADD PRIMARY KEY (`id_po_dbar`);

--
-- Indeks untuk tabel `po_dbb`
--
ALTER TABLE `po_dbb`
  ADD PRIMARY KEY (`id_po_dbb`);

--
-- Indeks untuk tabel `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `po_barang`
--
ALTER TABLE `po_barang`
  MODIFY `id_po_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `po_bb`
--
ALTER TABLE `po_bb`
  MODIFY `id_po_bb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=875;

--
-- AUTO_INCREMENT untuk tabel `po_dbarang`
--
ALTER TABLE `po_dbarang`
  MODIFY `id_po_dbar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `po_dbb`
--
ALTER TABLE `po_dbb`
  MODIFY `id_po_dbb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT untuk tabel `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
