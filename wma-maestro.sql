-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2023 at 05:07 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

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
-- Table structure for table `data_dummy`
--

CREATE TABLE `data_dummy` (
  `id_dummy` int(11) NOT NULL,
  `periode` varchar(125) NOT NULL,
  `permintaan` int(11) NOT NULL,
  `forecast` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_dummy`
--

INSERT INTO `data_dummy` (`id_dummy`, `periode`, `permintaan`, `forecast`) VALUES
(1, 'November', 3250, 0),
(2, 'Desember', 3240, 0),
(3, 'Januari', 3250, 0),
(4, 'Februari', 3260, 0),
(5, 'Maret', 3260, 0),
(6, 'April', 3250, 0),
(7, 'Mei', 3260, 0),
(8, 'Juni', 3250, 0),
(9, 'Juli', 3120, 0),
(10, 'Agustus', 3019, 0),
(11, 'September', 3112, 0),
(12, 'Oktober', 3240, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `nama_barang` varchar(125) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga_supplier` varchar(20) DEFAULT NULL,
  `stok_supplier` int(11) DEFAULT NULL,
  `harga_gudang` varchar(20) DEFAULT NULL,
  `stok_gudang` int(11) DEFAULT NULL,
  `stok_minimal` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `id_kategori`, `id_supplier`, `nama_barang`, `deskripsi`, `harga_supplier`, `stok_supplier`, `harga_gudang`, `stok_gudang`, `stok_minimal`, `gambar`, `type`) VALUES
(2, 2, 2, 'Art Paper', 'Kertas Gambar Sketsa Ukuran A5. Isi 100 lembar', '54000', 120, NULL, NULL, 0, 'paper-3204064_1280.jpg', 2),
(3, 2, 2, 'Matte Paper', 'Kertas Origami. Ukuran A3. Isi 50 lembar', '21000', 120, NULL, NULL, 0, 'origami-210037_1280.jpg', 2),
(4, 2, 2, 'Art Carton', 'Kertas karton satuan', '5000', 200, NULL, NULL, 0, 'christmas-3005798_1280.jpg', 2),
(5, 2, 2, 'NCR', 'Kertas NCR', '6000', 8, NULL, NULL, 0, 'paper-1074131_1280.jpg', 2),
(6, 2, 2, 'Foil', 'Kertas Foil', '56000', 122, NULL, NULL, 0, 'paper-1074131_12801.jpg', 2),
(7, 2, 2, 'Ivory', 'Kertas Ivory per Lembar', '15000', 154, NULL, NULL, 0, 'paper-1074131_12802.jpg', 2),
(8, 2, 2, 'Duplex', 'Kertas Duplex', '10000', 132, NULL, 10, 0, 'paper-1074131_12803.jpg', 2),
(9, 2, 2, 'Kalkir', 'Kertas Kalkir', '12000', 111, NULL, NULL, 0, 'paper-1074131_12804.jpg', 2),
(10, 2, 2, 'Mika', 'Mika', '3000', 89, NULL, NULL, 0, 'paper-1074131_12805.jpg', 2),
(11, 3, 2, 'Hot Melt Glue', 'Lem', '23000', 129, NULL, NULL, 0, 'paper-1074131_12806.jpg', 2),
(12, 3, 2, 'Jelly Glue', 'Lem Kertas', '31000', 34, NULL, NULL, 0, 'paper-1074131_12807.jpg', 2),
(13, 2, 0, 'Undangan', 'Undangan pernikahan, sunatan, dll', NULL, NULL, '1000', 2000, 0, 'paper-1074131_12808.jpg', 1),
(14, 2, 0, 'Buku Yasinan', 'Buku Yasian tipe A23', NULL, NULL, '20000', 200, 0, 'paper-1074131_12809.jpg', 1),
(15, 2, 0, 'Brosur', 'Brosur pemilihan, broseur makanan, dll', NULL, NULL, '1500', 345, 0, 'paper-1074131_128010.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Kertas'),
(3, 'Bahan Lem'),
(4, 'Bahan Banner'),
(5, 'Bahan Stempel'),
(6, 'Bahan Tinta'),
(7, 'Bahan Lain - Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `po_barang`
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
-- Dumping data for table `po_barang`
--

INSERT INTO `po_barang` (`id_po_bar`, `id_reseller`, `tgl_tran_bar`, `tot_bay_bar`, `stat_bay_bar`, `bukti_bay_bar`, `stat_order_bar`, `alamat_kirim_bar`) VALUES
(1, 1, '2023-09-03', '41500', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-1.jpg', 4, 'Jln. Siliwangi');

-- --------------------------------------------------------

--
-- Table structure for table `po_bb`
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
-- Dumping data for table `po_bb`
--

INSERT INTO `po_bb` (`id_po_bb`, `id_user`, `id_supplier`, `tgl_transaksi`, `total_bayar`, `stat_bayar`, `bukti_bayar`, `status_order`, `alamat_pengiriman`) VALUES
(1, 1, 2, '2023-08-10', '80000', 1, 'sd1.jpeg', 4, 'Toko Kuningan');

-- --------------------------------------------------------

--
-- Table structure for table `po_dbarang`
--

CREATE TABLE `po_dbarang` (
  `id_po_dbar` int(11) NOT NULL,
  `id_po_bar` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_dbarang`
--

INSERT INTO `po_dbarang` (`id_po_dbar`, `id_po_bar`, `id_jenis`, `qty`) VALUES
(1, 1, 15, 1),
(2, 1, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `po_dbb`
--

CREATE TABLE `po_dbb` (
  `id_po_dbb` int(11) NOT NULL,
  `id_po_bb` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_dbb`
--

INSERT INTO `po_dbb` (`id_po_dbb`, `id_po_bb`, `id_jenis`, `qty`) VALUES
(1, 1, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `reseller`
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
-- Dumping data for table `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `nama_reseller`, `alamat_reseller`, `no_hp_reseller`, `jk`, `username_reseller`, `password_reseller`) VALUES
(1, 'Reseller 1', 'Kuningan, Jawa Barat', '089987656543', 'Perempuan', 'reseller1', 'reseller1');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
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
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_hp_supplier`, `username_supp`, `pass_supp`) VALUES
(2, 'supplier', 'Kuningan, Jawa Barat', '089987656543', 'supplier', 'supplier');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat_user`, `no_hp_user`, `username`, `password`, `level_user`) VALUES
(1, 'Admin', 'Kuningan', '089987654543', 'admin', 'admin', 1),
(3, 'Pimpinan', 'Kuningan, Jawa Barat', '089987654543', 'pimpinan', 'pimpinan', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_dummy`
--
ALTER TABLE `data_dummy`
  ADD PRIMARY KEY (`id_dummy`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `po_barang`
--
ALTER TABLE `po_barang`
  ADD PRIMARY KEY (`id_po_bar`);

--
-- Indexes for table `po_bb`
--
ALTER TABLE `po_bb`
  ADD PRIMARY KEY (`id_po_bb`);

--
-- Indexes for table `po_dbarang`
--
ALTER TABLE `po_dbarang`
  ADD PRIMARY KEY (`id_po_dbar`);

--
-- Indexes for table `po_dbb`
--
ALTER TABLE `po_dbb`
  ADD PRIMARY KEY (`id_po_dbb`);

--
-- Indexes for table `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_dummy`
--
ALTER TABLE `data_dummy`
  MODIFY `id_dummy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `po_barang`
--
ALTER TABLE `po_barang`
  MODIFY `id_po_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `po_bb`
--
ALTER TABLE `po_bb`
  MODIFY `id_po_bb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `po_dbarang`
--
ALTER TABLE `po_dbarang`
  MODIFY `id_po_dbar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `po_dbb`
--
ALTER TABLE `po_dbb`
  MODIFY `id_po_dbb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
