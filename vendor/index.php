<?php
  include "../koneksi.php";
  
  if (!isset($_SESSION['id_pegawai'])) {
	echo "<script>alert('silakan login terlebih dahulu');</script>";
	echo "<script>location = '../index.php';</script>";
	exit();
}

  if ($_SESSION["jabatan"] == "Kasir") {
    echo "<script>alert('Anda tidak berhak mengakses halaman ini !!!');</script>";
    echo "<script>location = '../logout.php';</script>";
  }
  if ($_SESSION["jabatan"] == "Admin") {
    echo "<script>alert('Anda tidak berhak mengakses halaman ini !!!');</script>";
    echo "<script>location = '../logout.php';</script>";
  }
  if ($_SESSION["jabatan"] == "Kasir") {
    echo "<script>alert('Anda tidak berhak mengakses halaman ini !!!');</script>";
    echo "<script>location = '../logout.php';</script>";
  }

?>