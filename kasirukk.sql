-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Nov 2022 pada 16.51
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasirukk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jenis_menu`
--

CREATE TABLE `tbl_jenis_menu` (
  `id_jenis_menu` int(11) NOT NULL,
  `jenis_menu` varchar(200) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jenis_menu`
--

INSERT INTO `tbl_jenis_menu` (`id_jenis_menu`, `jenis_menu`, `id_pegawai`) VALUES
(40, 'Makanan Utama', 1),
(41, 'Minuman', 1),
(42, 'Paket Hemat 1', 1),
(43, 'Paket Keluarga 1', 1),
(44, 'Paket Hemat 2', 1);

--
-- Trigger `tbl_jenis_menu`
--
DELIMITER $$
CREATE TRIGGER `tJenisMenuDelete` BEFORE DELETE ON `tbl_jenis_menu` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - Menghapus nama pegawai : ', old.jenis_menu ));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuTambah` AFTER INSERT ON `tbl_jenis_menu` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - menanbah jenis menu : ', new.jenis_menu));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuUpdate` BEFORE UPDATE ON `tbl_jenis_menu` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - mengubah jenis menu : ', old.jenis_menu, ' menjadi ', new.jenis_menu));

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aksi` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`id_log`, `id_pegawai`, `nama_pegawai`, `jabatan`, `aksi`, `date`) VALUES
(650, 2, 'Administrator', 'Admin', 'Transaksi detail - menjual Es Campur sebanyak 22 dengan harga Rp. 15000', '2022-05-10 14:42:08'),
(651, 2, 'Administrator', 'Admin', 'Transaksi detail - menjual Es Jeruk sebanyak 222 dengan harga Rp. 10000', '2022-05-10 14:42:32'),
(652, 2, 'Administrator', 'Admin', 'Transaksi detail - menjual Es Jeruk sebanyak 2 dengan harga Rp. 10000', '2022-05-10 14:42:45'),
(653, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Jeruk sebanyak 2 dengan harga Rp. 10000', '2022-05-11 12:34:13'),
(654, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Campur sebanyak 2 dengan harga Rp. 15000', '2022-05-11 12:34:35'),
(663, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Jeruk sebanyak 2 dengan harga Rp. 10000', '2022-05-12 10:30:16'),
(665, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tahu + Tempe  sebanyak 100 dengan harga Rp. 3000', '2022-05-12 10:51:57'),
(666, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Nasi Liwet sebanyak 1 dengan harga Rp. 25000', '2022-05-12 10:52:27'),
(667, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Nasi Liwet sebanyak 11 dengan harga Rp. 25000', '2022-05-12 10:52:55'),
(668, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 1 dengan harga Rp. 320000', '2022-05-12 10:53:30'),
(669, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Telor Dadar sebanyak 123 dengan harga Rp. 3500', '2022-05-12 10:54:27'),
(678, 19, 'Administrator', 'Admin', 'Pegawai - menanbah nama pegawai : Rusdi dan jabatan sebagai Manajer', '2022-05-13 01:00:36'),
(679, 20, 'Administrator', 'Admin', 'Pegawai - menanbah nama pegawai : Chantika dan jabatan sebagai Admin', '2022-05-13 01:01:23'),
(686, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Jeruk sebanyak 2 dengan harga Rp. 10000', '2022-05-13 01:57:33'),
(687, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Campur sebanyak 5 dengan harga Rp. 15000', '2022-05-13 02:05:14'),
(688, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 02:07:54'),
(689, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tahu + Tempe  sebanyak 2 dengan harga Rp. 3000', '2022-05-13 02:08:32'),
(690, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Campur sebanyak 31 dengan harga Rp. 15000', '2022-05-13 02:08:51'),
(691, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 02:10:19'),
(692, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 03:09:43'),
(693, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 03:15:00'),
(694, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 2 dengan harga Rp. 320000', '2022-05-13 03:15:33'),
(695, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Jeruk sebanyak 10 dengan harga Rp. 10000', '2022-05-13 03:15:39'),
(696, 21, 'Chantika', 'Admin', 'Pegawai - menanbah nama pegawai : Jamal dan jabatan sebagai Admin', '2022-05-13 03:30:34'),
(697, 21, 'Chantika', 'Admin', 'Pegawai - Mengubah nama pegawai : Jamal menjadi Jamal, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Pancur Batu menjadi Pancur Batu , telp : 08932434 menjadi 08932434', '2022-05-13 03:30:46'),
(698, 21, 'Chantika', 'Admin', 'Pegawai - Menghapus nama pegawai : Jamal', '2022-05-13 03:30:49'),
(699, 22, 'Chantika', 'Admin', 'Pegawai - menanbah nama pegawai : Jokowi dan jabatan sebagai Manajer', '2022-05-13 03:31:13'),
(700, 20, 'Chantika', 'Admin', 'Login : menambahkan username : presiden', '2022-05-13 03:32:16'),
(702, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Campur sebanyak 20 dengan harga Rp. 15000', '2022-05-13 06:29:22'),
(703, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Campur sebanyak 20 dengan harga Rp. 15000', '2022-05-13 06:29:46'),
(704, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 06:31:30'),
(705, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 06:32:13'),
(706, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Campur sebanyak 10 dengan harga Rp. 15000', '2022-05-13 06:43:24'),
(707, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 3 dengan harga Rp. 320000', '2022-05-13 06:43:54'),
(708, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 2 dengan harga Rp. 320000', '2022-05-13 06:50:50'),
(709, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 10 dengan harga Rp. 320000', '2022-05-13 06:51:28'),
(710, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tumpeng sebanyak 1 dengan harga Rp. 320000', '2022-05-13 07:06:51'),
(711, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Jeruk sebanyak 5 dengan harga Rp. 10000', '2022-05-13 07:09:33'),
(712, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Es Jeruk sebanyak 12 dengan harga Rp. 10000', '2022-05-13 07:10:45'),
(713, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Tahu + Tempe  sebanyak 10 dengan harga Rp. 3000', '2022-05-13 07:11:19'),
(715, 19, 'Rusdi', 'Manajer', 'Jenis menu - menanbah jenis menu : asd', '2022-05-13 07:19:11'),
(716, 19, 'Rusdi', 'Manajer', 'Nama menu - menanbah nama menu : sd, jenis menu : Makanan Utama dan harga : Rp. 22222', '2022-05-13 07:33:29'),
(717, 19, 'Rusdi', 'Manajer', 'Nama menu - Menghapus nama menu : sd', '2022-05-13 07:33:33'),
(718, 19, 'Rusdi', 'Manajer', 'Jenis menu - Menghapus nama pegawai : asd', '2022-05-13 07:33:43'),
(719, 1, NULL, NULL, 'Jenis menu - mengubah jenis menu : Paket Keluarga menjadi Paket Keluarga 1', '2022-05-13 07:33:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `id_pegawai`, `username`, `password`, `id_admin`) VALUES
(93, 1, 'manajer', '69b731ea8f289cf16a192ce78a37b4f0', 2),
(94, 2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2),
(113, 18, 'kasir', 'c7911af3adbd12a035b289556d96470a', 2),
(116, 20, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 2),
(117, 19, 'manajer2', '69b731ea8f289cf16a192ce78a37b4f0', 2),
(118, 22, 'presiden', 'f181d18dfb40c0d78e670eeb258aad29', 20);

--
-- Trigger `tbl_login`
--
DELIMITER $$
CREATE TRIGGER `tLoginHapus` BEFORE DELETE ON `tbl_login` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Login : menghapus username ', old.username));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginTambah` AFTER INSERT ON `tbl_login` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_admin;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_admin, nm_peg, jbt, CONCAT('Login : menambahkan username : ', new.username));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginUpdate` BEFORE UPDATE ON `tbl_login` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_admin, nm_peg, jbt, CONCAT('Login : merubah username : ', old.username, ' menjadi ', new.username));

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `id_jenis_menu` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `img` varchar(150) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `id_jenis_menu`, `harga`, `img`, `id_pegawai`) VALUES
(46, 'Nasi Liwet', 40, 25000, '13052022091405index.jpg', 19),
(47, 'Telor Dadar', 40, 3500, '27042022184012telur dadar1-min.jpg', 1),
(48, 'Es Jeruk', 41, 10000, '27042022184031es jeruk-min.jpg', 1),
(49, 'Es Campur', 41, 15000, '27042022184055Es-Campur1-min.jpg', 1),
(50, 'Tahu + Tempe ', 42, 3000, '27042022184131tahu-tempe1-min.jpg', 1),
(51, 'Tumpeng', 43, 320000, '12052022144243Screenshot (35).png', 1);

--
-- Trigger `tbl_menu`
--
DELIMITER $$
CREATE TRIGGER `tMenuDelete` BEFORE DELETE ON `tbl_menu` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - Menghapus nama menu : ', old.nama_menu ));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuTambah` AFTER INSERT ON `tbl_menu` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 DECLARE jm VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;

 SELECT jenis_menu INTO jm FROM tbl_jenis_menu WHERE id_jenis_menu = new.id_jenis_menu;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - menanbah nama menu : ', new.nama_menu, ', jenis menu : ', jm, ' dan harga : Rp. ', new.harga));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuUpdate` BEFORE UPDATE ON `tbl_menu` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 DECLARE jm VARCHAR(100);

 DECLARE jm1 VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;

 SELECT jenis_menu INTO jm FROM tbl_jenis_menu WHERE id_jenis_menu = new.id_jenis_menu;

  SELECT jenis_menu INTO jm1 FROM tbl_jenis_menu WHERE id_jenis_menu = old.id_jenis_menu;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - mengubah nama menu : ', old.nama_menu, ' menjadi ', new.nama_menu, ', jenis menu : ', jm1, ' menjadi ', jm, ' dan harga dari Rp. ', old.harga, ' menjadi Rp. ', new.harga));

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(100) NOT NULL,
  `jabatan` enum('Kasir','Manajer','Admin') NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id_pegawai`, `nama_pegawai`, `jenis_kelamin`, `alamat`, `telp`, `jabatan`, `photo`, `id_admin`) VALUES
(18, 'Edi Kribo', 'Laki-laki', 'Jl. Sunda No. 1', '081234', 'Kasir', '', 1),
(19, 'Rusdi', 'Laki-laki', 'Deli Tua', '089573372395', 'Manajer', '', 2),
(20, 'Chantika', 'Perempuan', 'Biru-Biru', '0895722794', 'Admin', '', 2),
(22, 'Jokowi', 'Laki-laki', 'Solo', '089342234324', 'Manajer', '13052022053113index.jpg', 20);

--
-- Trigger `tbl_pegawai`
--
DELIMITER $$
CREATE TRIGGER `tPegawaiHapus` BEFORE DELETE ON `tbl_pegawai` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - Menghapus nama pegawai : ', old.nama_pegawai ));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiTambah` AFTER INSERT ON `tbl_pegawai` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_admin;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - menanbah nama pegawai : ', new.nama_pegawai, ' dan jabatan sebagai ', new.jabatan));

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiUpdate` BEFORE UPDATE ON `tbl_pegawai` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - Mengubah nama pegawai : ', old.nama_pegawai, ' menjadi ', new.nama_pegawai, ', jenis kelamin : ', old.jenis_kelamin, ' menjadi ', new.jenis_kelamin,', alamat : ', old.alamat, ' menjadi ', new.alamat, ', telp : ', old.telp, ' menjadi ', new.telp ));

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `tgl_transaksi`, `no_transaksi`, `total_transaksi`, `no_meja`, `total_bayar`, `id_pegawai`) VALUES
(226, '2022-05-10', '20220510000000226', 480000, 21, 500000, 1),
(227, '2022-05-10', '20220510000000227', 330000, 2, 400000, 2),
(229, '2022-04-10', '20220410000000229', 20000, 2, 50000, 2),
(231, '2022-05-11', '20220511000000231', 30000, 2, 222222, 18),
(232, '2022-01-21', '20220121000000232', 70000, 2, 100000, 47),
(233, '2022-05-12', '20220512000000233', 120000, 2, 200000, 47),
(234, '2022-05-12', '20220512000000234', 20000, 2, 50000, 47),
(235, '2022-05-12', '20220512000000235', 20000, 2, 50000, 1),
(236, '2022-01-12', '20220112000000236', 120000, 12, 200000, 1),
(237, '2022-01-12', '20220112000000237', 20000, 2, 20000, 18),
(238, '2022-05-12', '20220512000000238', 1280000, 2, 1300000, 47),
(239, '2022-05-12', '20220512000000239', 300000, 1, 400000, 18),
(240, '2022-05-12', '20220512000000240', 25000, 2, 50000, 18),
(241, '2022-05-12', '20220512000000241', 275000, 1, 300000, 18),
(242, '2022-05-12', '20220512000000242', 320000, 1, 400000, 18),
(243, '2022-05-12', '20220512000000243', 430500, 12, 500000, 18),
(244, '2022-02-12', '20220212000000244', 30000, 1, 50000, 1),
(245, '2022-03-12', '20220312000000245', 640000, 2, 700000, 1),
(246, '2022-01-04', '20220104000000246', 960000, 2, 970000, 1),
(247, '2022-06-02', '20220602000000247', 525000, 2, 600000, 1),
(248, '2022-07-08', '20220708000000248', 960000, 33, 1000000, 1),
(249, '2022-05-13', '20220513000000249', 20000, 2, 0, 18),
(250, '2022-05-13', '20220513000000250', 75000, 5, 0, 18),
(251, '2022-05-13', '20220513000000251', 960000, 90, 1000000, 18),
(252, '2022-05-13', '20220513000000252', 6000, 3, 10000, 18),
(253, '2022-05-13', '20220513000000253', 465000, 2, 500000, 18),
(254, '2022-05-13', '20220513000000254', 960000, 2, 1000000, 18),
(255, '2022-01-13', '20220113000000255', 960000, 2, 1000000, 18),
(256, '2022-04-13', '20220413000000256', 960000, 10, 1000000, 18),
(257, '2022-05-13', '20220513000000257', 740000, 1, 8000000, 18),
(258, '2022-05-13', '20220513000000258', 300000, 2, 0, 18),
(259, '2022-05-13', '20220513000000259', 300000, 54, 0, 18),
(260, '2022-05-13', '20220513000000260', 960000, 3, 0, 18),
(261, '2022-05-13', '20220513000000261', 960000, 10, 0, 18),
(262, '2022-05-13', '20220513000000262', 150000, 2, 200000, 18),
(263, '2022-02-13', '20220213000000263', 960000, 2, 1000000, 18),
(264, '2022-08-13', '20220813000000264', 640000, 2, 700000, 18),
(265, '2022-08-13', '20220813000000265', 3200000, 10, 0, 18),
(266, '2022-05-13', '20220513000000266', 320000, 10, 0, 18),
(267, '2022-05-13', '20220513000000267', 50000, 12, 0, 18),
(268, '2022-05-13', '20220513000000268', 120000, 1, 0, 18),
(269, '2022-05-10', '20220510000000269', 30000, 2, 30000, 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`id_detail`, `no_transaksi`, `id_menu`, `qty`, `harga`, `id_pegawai`) VALUES
(306, '20220510000000226', 49, 12, 15000, 1),
(307, '20220510000000226', 46, 12, 25000, 1),
(308, '20220510000000227', 49, 22, 15000, 2),
(310, '20220410000000229', 48, 2, 10000, 2),
(312, '20220511000000231', 49, 2, 15000, 18),
(313, '20220121000000232', 47, 20, 3500, 47),
(314, '20220512000000233', 48, 12, 10000, 47),
(315, '20220512000000234', 48, 2, 10000, 47),
(316, '20220512000000235', 48, 2, 10000, 1),
(317, '20220112000000236', 48, 12, 10000, 1),
(318, '20220112000000237', 48, 2, 10000, 18),
(319, '20220512000000238', 51, 4, 320000, 47),
(320, '20220512000000239', 50, 100, 3000, 18),
(321, '20220512000000240', 46, 1, 25000, 18),
(322, '20220512000000241', 46, 11, 25000, 18),
(323, '20220512000000242', 51, 1, 320000, 18),
(324, '20220512000000243', 47, 123, 3500, 18),
(325, '20220212000000244', 48, 3, 10000, 1),
(326, '20220312000000245', 51, 2, 320000, 1),
(327, '20220104000000246', 51, 3, 320000, 1),
(328, '20220602000000247', 46, 21, 25000, 1),
(329, '20220708000000248', 51, 3, 320000, 1),
(330, '20220513000000249', 48, 2, 10000, 18),
(331, '20220513000000250', 49, 5, 15000, 18),
(332, '20220513000000251', 51, 3, 320000, 18),
(333, '20220513000000252', 50, 2, 3000, 18),
(334, '20220513000000253', 49, 31, 15000, 18),
(335, '20220513000000254', 51, 3, 320000, 18),
(336, '20220113000000255', 51, 3, 320000, 18),
(337, '20220413000000256', 51, 3, 320000, 18),
(338, '20220513000000257', 51, 2, 320000, 18),
(339, '20220513000000257', 48, 10, 10000, 18),
(340, '20220513000000258', 49, 20, 15000, 18),
(341, '20220513000000259', 49, 20, 15000, 18),
(342, '20220513000000260', 51, 3, 320000, 18),
(343, '20220513000000261', 51, 3, 320000, 18),
(344, '20220513000000262', 49, 10, 15000, 18),
(345, '20220213000000263', 51, 3, 320000, 18),
(346, '20220813000000264', 51, 2, 320000, 18),
(347, '20220813000000265', 51, 10, 320000, 18),
(348, '20220513000000266', 51, 1, 320000, 18),
(349, '20220513000000267', 48, 5, 10000, 18),
(350, '20220513000000268', 48, 12, 10000, 18),
(351, '20220510000000269', 50, 10, 3000, 18);

--
-- Trigger `tbl_transaksi_detail`
--
DELIMITER $$
CREATE TRIGGER `tTransaksiTambah` AFTER INSERT ON `tbl_transaksi_detail` FOR EACH ROW BEGIN

 DECLARE nm_peg VARCHAR(100);

 DECLARE jbt VARCHAR(100);

 DECLARE nmMenu VARCHAR(100);

 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;

 SELECT nama_menu INTO nmMenu FROM tbl_menu WHERE id_menu = new.id_menu;

 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Transaksi detail - menjual ', nmMenu, ' sebanyak ', new.qty, ' dengan harga Rp. ', new.harga));

END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  ADD PRIMARY KEY (`id_jenis_menu`),
  ADD UNIQUE KEY `jenis_menu` (`jenis_menu`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_jenis_menu_2` (`id_jenis_menu`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  MODIFY `id_jenis_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;

--
-- AUTO_INCREMENT untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD CONSTRAINT `tbl_transaksi_detail_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `tbl_transaksi` (`no_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
