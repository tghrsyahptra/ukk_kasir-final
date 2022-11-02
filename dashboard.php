<style>
  .display-5 {
    position: relative;
    color: black !important;
    font-weight: bold;
    margin-bottom: -5px;
    text-align: center;
  }

  p.lead {
    color: #000;
    font-size: 20px;
    text-align: center;
    font-weight: bold;
  }

</style>

<?php
// if(is_null($_SESSION['login'])){$_SESSION['login']="";}
// if($_SESSION['login']!='haRusLogin'){
//   echo "<h1 align='center'>ANDA BELUM LOGIN</h1>";
//   header("refresh:3;url=index.php");
//   exit();
// }
?>


<?php
$judul = "HOME";
include "koneksi.php";
include "header.php";
include "sidebar.php";
include "topbar.php";
$waktu = date('Y-m-d');
$id_pegawai = $_SESSION['id_pegawai'];


// Jumlah Karyawan
$jml = 0;
$query  = "SELECT count(id_pegawai) AS jml FROM tbl_pegawai";
$sql    = mysqli_query($koneksi, $query);
if (mysqli_num_rows($sql) > 0) {
  $data = mysqli_fetch_assoc($sql);
  $jml  = $data['jml'];
}

// Perempuan
$p = 0;
$query  = "SELECT count(id_pegawai) AS perempuan FROM tbl_pegawai WHERE jenis_kelamin = 'Perempuan'";
$sql    = mysqli_query($koneksi, $query);
if (mysqli_num_rows($sql) > 0) {
  $data = mysqli_fetch_assoc($sql);
  $p  = $data['perempuan'];
}

// Perempuan
$l = 0;
$query  = "SELECT count(id_pegawai) AS laki_laki FROM tbl_pegawai WHERE jenis_kelamin = 'Laki-laki'";
$sql    = mysqli_query($koneksi, $query);
if (mysqli_num_rows($sql) > 0) {
  $data = mysqli_fetch_assoc($sql);
  $l  = $data['laki_laki'];
}

// Total Pendapatan
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi";
$query = mysqli_query($koneksi, $sql);
$data  = mysqli_fetch_array($query);
$ttl   = $data['jml'];

// Total Pendapatan Bulan Ini
$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '$bln'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl     = $data['jml'];


$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '01'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl1     = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '02'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl2     = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '03'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl3     = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '04'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl4     = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '05'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl5    = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '06'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl6    = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '07'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl7    = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '08'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl8   = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '09'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl9    = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '10'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl10   = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '11'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl11   = $data['jml'];

$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '12'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bbl12    = $data['jml'];

// Total pendapatan harian 
$sql1   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE tgl_transaksi = '$waktu'";
$query1 = mysqli_query($koneksi, $sql1);
$data1  = mysqli_fetch_array($query1);
$hr     = $data1['jml'];

// Total Pendapatan Kasir
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE id_pegawai = '$id_pegawai'";
$query = mysqli_query($koneksi, $sql);
$data  = mysqli_fetch_array($query);
$ttlKsr = $data['jml'];

// bulanan
$bln = date("m");
$sql   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE MONTH(tgl_transaksi) = '$bln' AND id_pegawai = '$id_pegawai'";
$query   = mysqli_query($koneksi, $sql);
$data   = mysqli_fetch_array($query);
$bblKsr     = $data['jml'];

$sql1   = "SELECT sum(total_transaksi) as jml FROM tbl_transaksi WHERE tgl_transaksi = '$waktu' AND id_pegawai = '$id_pegawai'";
$query1 = mysqli_query($koneksi, $sql1);
$data1  = mysqli_fetch_array($query1);
$hrKsr  = $data1['jml'];

?>

<div class="container-fluid backGambar"">
  <!-- Page Heading -->
  <div class=" d-sm-flex align-items-center justify-content-between mb-3">
  <!-- <h1 class="h3 pt-5 text-dark">Dashboard</h1> -->
</div>

<!-- Content -->
<div class="col">
  <div class="container">
    <!-- Selamat Datang -->
    <div class="col">
      <h1 class="display-5">Selamat Datang <?= $nama_pegawai; ?></h1>
      <h1 class="display-5">Anda Login Sebagai <?= $jabatan; ?></h1>
      <p class="lead">Di Aplikasi Starpack</p>
      <hr class="my-3">
    </div>
    <!-- End Selamat Datang -->
  </div>
</div>



<?php
if ($jabatan == "Manajer") { ?>
  <div class="row">
    <!-- Jumlah Karyawan -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-primary text-uppercase mb-1">
                Total Karyawan</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800"><?= number_format($jml); ?> Orang</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-users fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Perempuan -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-success text-uppercase mb-1">
                Perempuan</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800"><?= number_format($p); ?> Orang</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-female fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Laki-laki -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-info text-uppercase mb-1">Laki-laki
              </div>
              <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><?= number_format($l); ?> Orang</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-male fa-2x text-gray-300"></i>
            </div>
            <!-- <div class="progress-bar bg-info" role="progressbar"
                style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                aria-valuemax="100"></div> -->
          </div>
        </div>
      </div>
    </div>
    <!-- Total Pendapatan -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-danger text-uppercase mb-1">
                Ttl Penerimaan</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">Rp <?= number_format($ttl); ?> </div>
            </div>
            <div class="col-auto">
              <i class="fa fa-gift fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <div class="row">


    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-danger text-uppercase mb-1">
                Ttl Pendapatan Bulan Ini</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">Rp <?= number_format($bbl); ?> </div>
            </div>
            <div class="col-auto">
              <i class="fa fa-gift fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Penerimaan Hari ini -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-warning text-uppercase mb-1">Hari ini
              </div>
              <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Rp <?= number_format($hr); ?></div>
            </div>
            <div class="col-auto">
              <i class="fa fa-credit-card fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">PENDAPATAN TIAP BULAN</h6>
  </div>
  <div class="card-body">
    <div class="chart-area">
      <canvas id="myAreaChart"></canvas>
    </div>
  </div>
</div>

<?php
}
?>

<?php
if ($jabatan == "Kasir") { ?>
  <div class="row mt-5 pl-5 pt-3">
    <!-- Total Pendapatan Kasir-->
    <!-- Ttl Pendapatan Bulan Ini -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-danger text-uppercase mb-1">
                Ttl Pendapatan Bulan Ini</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">Rp <?= number_format($bblKsr); ?> </div>
            </div>
            <div class="col-auto">
              <i class="fa fa-gift fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Penerimaan Hari ini -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="font-weight-bold text-warning text-uppercase mb-1">Hari ini
              </div>
              <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Rp <?= number_format($hrKsr); ?></div>
            </div>
            <div class="col-auto">
              <i class="fa fa-credit-card fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<?php
}
?>

<script type="text/javascript" src="chartjs/Chart.js"></script>
<div style="width: 800px;margin: 0px auto;">
  <canvas id="myChart"></canvas>
</div>
<script>
  // Set new default font family and font color to mimic Bootstrap's default styling
  (Chart.defaults.global.defaultFontFamily = 'Nunito'), '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
  Chart.defaults.global.defaultFontColor = '#858796';

  function number_format(number, decimals, dec_point, thousands_sep) {
    // *     example: number_format(1234.56, 2, ',', ' ');
    // *     return: '1 234,56'
    number = (number + '').replace(',', '').replace(' ', '');
    var n = !isFinite(+number) ? 0 : +number,
      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
      sep = typeof thousands_sep === 'undefined' ? ',' : thousands_sep,
      dec = typeof dec_point === 'undefined' ? '.' : dec_point,
      s = '',
      toFixedFix = function(n, prec) {
        var k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
      };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
      s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
      s[1] = s[1] || '';
      s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
  }

  // Area Chart Example
  var ctx = document.getElementById('myAreaChart');
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
      datasets: [{
        label: 'Earnings',
        lineTension: 0.3,
        backgroundColor: 'rgba(78, 115, 223, 0.05)',
        borderColor: 'rgba(78, 115, 223, 1)',
        pointRadius: 3,
        pointBackgroundColor: 'rgba(78, 115, 223, 1)',
        pointBorderColor: 'rgba(78, 115, 223, 1)',
        pointHoverRadius: 3,
        pointHoverBackgroundColor: 'rgba(78, 115, 223, 1)',
        pointHoverBorderColor: 'rgba(78, 115, 223, 1)',
        pointHitRadius: 10,
        pointBorderWidth: 2,
        data: [

          <?= $bbl1 ?>,
          <?= $bbl2 ?>,
          <?= $bbl3 ?>,
          <?= $bbl4 ?>,
          <?= $bbl5 ?>,
          <?= $bbl6 ?>,
          <?= $bbl7 ?>,
          <?= $bbl8 ?>,
          <?= $bbl9 ?>,
          <?= $bbl10 ?>,
          <?= $bbl11 ?>,
          <?= $bbl12 ?>


        ],

      }, ],
    },
    options: {
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 25,
          top: 25,
          bottom: 0,
        },
      },
      scales: {
        xAxes: [{
          time: {
            unit: 'date',
          },
          gridLines: {
            display: false,
            drawBorder: false,
          },
          ticks: {
            maxTicksLimit: 7,
          },
        }, ],
        yAxes: [{
          ticks: {
            maxTicksLimit: 5,
            padding: 10,
            // Include a dollar sign in the ticks
            callback: function(value, index, values) {
              return '$' + number_format(value);
            },
          },
          gridLines: {
            color: 'rgb(234, 236, 244)',
            zeroLineColor: 'rgb(234, 236, 244)',
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2],
          },
        }, ],
      },
      legend: {
        display: false,
      },
      tooltips: {
        backgroundColor: 'rgb(255,255,255)',
        bodyFontColor: '#858796',
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        intersect: false,
        mode: 'index',
        caretPadding: 10,
        callbacks: {
          label: function(tooltipItem, chart) {
            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
            return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
          },
        },
      },
    },
  });
</script>
<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<!-- <script src="js/demo/chart-area-demo.js"></script> -->
</div>
<?php include "footer.php"; ?>