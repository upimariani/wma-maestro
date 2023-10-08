<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>REGISTER RESELLER</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Font Awesome -->
	<link rel="stylesheet" href="<?= base_url('asset/AdminLTE/') ?>/plugins/fontawesome-free/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- icheck bootstrap -->
	<link rel="stylesheet" href="<?= base_url('asset/AdminLTE/') ?>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?= base_url('asset/AdminLTE/') ?>/dist/css/adminlte.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<img style="width: 200px; " src="<?= base_url('asset/logo.png') ?>"><br>
			<a href="../../index2.html"><b>REGISTER</b>RESELLER</a>
		</div>

		<?php if ($this->session->userdata('success')) {
		?>
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<h5><i class="icon fas fa-check"></i> Alert!</h5>
				<?= $this->session->userdata('success') ?>
			</div>
		<?php
		} ?>
		<?php if ($this->session->userdata('error')) {
		?>
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<h5><i class="icon fas fa-ban"></i> Alert!</h5>
				<?= $this->session->userdata('error') ?>
			</div>
		<?php
		} ?>


		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form action="<?= base_url('cLoginReseller/register') ?>" method="post">


					<?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
					<div class="input-group mb-3">
						<input type="text" name="nama" value="<?= set_value('nama') ?>" class="form-control" placeholder="Masukkan Nama Reseller">
						<div class="input-group-append">
							<div class="input-group-text">
								<!-- <span class="fas fa-user"></span> -->
							</div>
						</div>
					</div>
					<?= form_error('alamat', '<small class="text-danger pl-3">', '</small>'); ?>
					<div class="input-group mb-3">
						<input type="text" name="alamat" value="<?= set_value('alamat') ?>" class="form-control" placeholder="Masukkan Alamat">
						<div class="input-group-append">
							<div class="input-group-text">
								<!-- <span class="fas fa-user"></span> -->
							</div>
						</div>
					</div>

					<?= form_error('no_hp', '<small class="text-danger pl-3">', '</small>'); ?>
					<div class="input-group mb-3">
						<input type="number" name="no_hp" value="<?= set_value('no_hp') ?>" class="form-control" placeholder="Masukkan No Telepon">
						<div class="input-group-append">
							<div class="input-group-text">
								<!-- <span class="fas fa-user"></span> -->
							</div>
						</div>
					</div>
					<?= form_error('jk', '<small class="text-danger pl-3">', '</small>'); ?>
					<div class="input-group mb-3">
						<select name="jk" class="form-control">
							<option value="">---Pilih Jenis Kelamin---</option>
							<option value="Perempuan">Perempuan</option>
							<option value="Laki - Laki">Laki - Laki</option>
						</select>
						<div class="input-group-append">
							<div class="input-group-text">
								<!-- <span class="fas fa-user"></span> -->
							</div>
						</div>
					</div>
					<?= form_error('username', '<small class="text-danger pl-3">', '</small>'); ?>
					<div class="input-group mb-3">
						<input type="text" name="username" value="<?= set_value('username') ?>" class="form-control" placeholder="Masukkan Username">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<?= form_error('password', '<small class="text-danger pl-3">', '</small>'); ?>
					<div class="input-group mb-3">
						<input type="text" name="password" class="form-control" placeholder="Masukkan Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-key"></span>
							</div>
						</div>
					</div>

					<div class="row ">
						<!-- /.col -->
						<div class="col-12 mt-5">
							<button type="submit" class="btn btn-primary btn-block">Sign In</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<div class="social-auth-links text-center mb-3">
					<p>- OR -</p>

					<a href="<?= base_url('cLoginReseller/register') ?>" class="btn btn-block btn-danger">
						Register Reseller
					</a>
				</div>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="<?= base_url('asset/AdminLTE/') ?>plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<?= base_url('asset/AdminLTE/') ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<?= base_url('asset/AdminLTE/') ?>dist/js/adminlte.min.js"></script>
	<script>
		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 3000)
	</script>
</body>

</html>