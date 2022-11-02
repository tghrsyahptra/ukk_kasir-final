<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author">
  <title>Login</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="css/animate.css" />
  <!-- Custom Stylesheet -->
  <link rel="stylesheet" href="css/login.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
  <!-- SWAL -->
  <div class="info-data" data-infodata="<?php if (isset($_SESSION['info'])) {
                                          echo $_SESSION['info'];
                                        }
                                        unset($_SESSION['info']); ?>"></div>
  <div class="container">
    <div class="login-box animated fadeInUp">
      <div class="box-header">
        <h2>Log In</h2>
      </div>
      <form action="proses.php" method="post">
        <label for="username">Username</label>
        <br />
        <input type="text" name="username">
        <br />
        <label for="password">Password</label>
        <br />
        <input type="password" name="password">
        <br />
        <button type="submit">Sign In</button>
      </form>
      <br />
    </div>
  </div>

  <script src="assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="js/sweetalert2.all.min.js"></script>
  <script src="js/style-sweetalert2.js"></script>
  <script src="js/style.js"></script>
  <script>
    $(document).ready(function() {
      $('#logo').addClass('animated fadeInDown');
      $('input:text:visible:first').focus();
    });
    $('#username').focus(function() {
      $('label[for="username"]').addClass('selected');
    });
    $('#username').blur(function() {
      $('label[for="username"]').removeClass('selected');
    });
    $('#password').focus(function() {
      $('label[for="password"]').addClass('selected');
    });
    $('#password').blur(function() {
      $('label[for="password"]').removeClass('selected');
    });
  </script>
</body>

</html>