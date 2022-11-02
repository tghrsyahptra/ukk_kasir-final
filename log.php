<?php
  $judul = "PEGAWAI";
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

?>
<!-- SweetAlert2 -->
<div class="info-data" data-infodata="<?php if(isset($_SESSION['info'])){ 
  echo $_SESSION['info']; 
  } 
  unset($_SESSION['info']); ?>">
</div>

<div class="container-fluid pt-3 pb-5 backGambar">
  <div class="row">
    <div class="col-xl-12">
      <h3 class="text-center text-uppercase text-dark">Daftar Log Pegawai</h3>
      <hr class="hr">
    </div>
  </div>

  <div class="row ml-1 mt-2">
    <div class="col-xl-12 table-responsive">
      <table class="table table-bordered table-hover" id="log">
        <thead>
          <tr class="text-center">
            <th>No.</th>
            <th>Nama Pegawai</th>
            <th>Jabatan</th>
            <th>Aksi</th>
            <th>Tanggal</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $no = 1;
          $sql = "SELECT * FROM tbl_log ORDER BY id_log DESC";
          $query = mysqli_query($koneksi, $sql);
          while ($data = mysqli_fetch_array($query)) {
            $aksi = $data['aksi'];
            $id_pegawai   = $data['id_pegawai'];
            $nama_pegawai = $data['nama_pegawai'];
            $jbt          = $data['jabatan'];?>
            <tr>
              <td align="center" width="5%"><?= $no++; ?>.</td>
              <td width="22%"><?= $nama_pegawai; ?></td>
              <td><?= $jbt; ?></td>
              <td><?= $aksi; ?></td>
              <td align="center" width="18%"><?= $data['date']; ?></td>
            </tr>
          <?php
          } ?>
        </tbody>
      </table>
		</div>
	</div>
</div>

<?php include "footer.php"; ?>

<script>
	$(document).ready(function() {
		$('#log').dataTable();
	});
</script>