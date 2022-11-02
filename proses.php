<?php 
session_start();
include "koneksi.php";
$username = mysqli_escape_string($koneksi, $_POST['username']);
$password = md5(mysqli_escape_string($koneksi, $_POST['password']));

$sql = "SELECT b.id_pegawai, b.nama_pegawai, b.jabatan, b.jenis_kelamin, b.photo FROM tbl_login a INNER JOIN tbl_pegawai b ON a.id_pegawai = b.id_pegawai WHERE a.username = '$username' AND a.password = '$password'";
$query = mysqli_query($koneksi, $sql);
if (mysqli_num_rows($query)>0){
	$data 	      = mysqli_fetch_array($query);
  $id_pegawai   = $data['id_pegawai'];
  $nama_pegawai = $data['nama_pegawai'];
  $jabatan      = $data['jabatan'];
  $jenis_kelamin= $data['jenis_kelamin'];
 
  $photo        = $data['photo'];
  // Jika tidak ada gambar
  if($photo==""){
    if($jenis_kelamin=="Laki-laki"){
      $photo = "male.png"; 
    }else{
      $photo = "female.png"; 
    }
  }

  // Membuat session
  $_SESSION['id_pegawai']   = $id_pegawai;
	$_SESSION['nama_pegawai'] = $nama_pegawai;
	$_SESSION['jabatan']      = $jabatan;
	$_SESSION['photo']        = $photo;
	header("location:dashboard.php");
}else{
  $_SESSION['info'] = 'Salah';
  header("location:index.php");
}
