<?php
  $judul = "Edit MENU";
  include "koneksi.php";
  include "header.php";
  include "sidebar.php";
  include "topbar.php";

  if (!isset($_SESSION['id_pegawai']))
{
	echo "<script>alert('silakan login terlebih dahulu');</script>";
	echo "<script>location = 'index.php';</script>";
	exit();
}

  if ($_SESSION["jabatan"] == "Kasir") {
    echo "<script>alert('Kasir tidak berhak mengakses halaman ini !!!');</script>";
    echo "<script>location = 'logout.php';</script>";
  }
  
  if ($_SESSION["jabatan"] == "Admin") {
    echo "<script>alert('Admin tidak berhak mengakses halaman ini !!!');</script>";
    echo "<script>location = 'logout.php';</script>";

  }

  $id_menu = $_GET['id_menu'];
  $sql            = "SELECT * FROM tbl_menu WHERE id_menu = '$id_menu'";
  $query          = mysqli_query($koneksi, $sql);
  $data           = mysqli_fetch_array($query);
  $id_jenis_menu  = $data['id_jenis_menu'];
  $img            = $data['img'];
  if($img==""){$img="no-logo.png";}
?>

<div class="container-fluid pt-3 pb-5 backGambar">
  <div class="row mb-3">
    <div class="col-xl-12">
      <h3 class="text-center text-uppercase">Edit Data Menu</h3>
      <hr class="hr">
    </div>
  </div>

  <div class="row ml-5">
    <div class="col-xl-5 table-responsive">
      <form action="menu-update.php" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id_menu" value="<?= $id_menu;?>">
        <input type="hidden" name="id_pegawai" value="<?= $id_pegawai;?>">
        <div class="input-group mb-1">
          <span class="input-group-text lebar" >Nama Menu</span>
          <input type="hidden" name="nama_menu1" value="<?= $data['nama_menu'];?>" >
          <input type="text" name="nama_menu" required autocomplete="off" class="form-control form-control-sm" placeholder="Input Nama Menu" value="<?= $data['nama_menu'];?>" >
        </div>
        <div class="input-group mb-1">
          <span class="input-group-text lebar" >Jenis Menu</span>
          <select name="id_jenis_menu" class="form-control form-control-sm" required>
            <?php
            $sql   = "SELECT * FROM tbl_jenis_menu";
            $query = mysqli_query($koneksi, $sql);
            while ($d = mysqli_fetch_array($query)){
              $id_jenis = $d['id_jenis_menu'];?>
              <option value="<?= $id_jenis; ?>" <?php if($id_jenis == $id_jenis_menu){echo 'selected="selected"';}?> ><?= $d['jenis_menu']; ?></option>
              <?php 
            }?>
          </select>
        </div>
        <div class="input-group mb-1">
          <span class="input-group-text lebar" >Harga</span>
          <input type="text" name="harga" required autocomplete="off" class="form-control form-control-sm text-right money angkaSemua" placeholder="Input Harga" value="<?= $data['harga'];?>">
        </div>

        <!-- Gambar -->
        <div class="input-group my-3">
          <span class="input-group-text lebar">Gambar</span>
          <img src="img/<?= $img; ?>" alt="Gambar" width="80" height="80">
        </div>

        <!-- Gambar -->
        <div class="input-group mb-1">
          <span class="input-group-text lebar">Photo</span>
          <input type="file" name="img" class="form-control form-control-sm" accept="image/*">
        </div>

        <div class="input-group my-3">
          <button type="submit" class="btn btn-success btn-sm">&nbsp;<i class="fas fa-save"></i>&nbsp;&nbsp;Update&nbsp;&nbsp;</button>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="menu.php" class="btn btn-sm btn-warning">&nbsp;<i class="fas fa-redo"></i> &nbsp;&nbsp;Cancel&nbsp;&nbsp;</a>
        </div>
      
      </form>
		</div>
	</div>
</div>

<?php include "footer.php"; ?>