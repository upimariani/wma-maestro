<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Dashboard Admin</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-6 col-6">
					<!-- small box -->
					<?php
					$user = $this->db->query("SELECT COUNT(id_user) as tot_user FROM `user`;")->row();
					$supplier = $this->db->query("SELECT COUNT(id_supplier) as tot_suplier FROM `supplier`;")->row();
					?>
					<div class="small-box bg-info">
						<div class="inner">
							<h3><?= $user->tot_user ?></h3>

							<p>Data User</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-6 col-6">
					<!-- small box -->
					<div class="small-box bg-success">
						<div class="inner">
							<h3><?= $supplier->tot_suplier ?><sup style="font-size: 20px"></sup></h3>

							<p>Data Supplier</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->


			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="card card-light">
						<div class="card-header">
							<h3 class="card-title">Laporan Transaksi Harian</h3>
						</div>
						<div class="card-body">
							<?php
							echo form_open('Pimpinan/cDashboard/lap_harian_transaksi') ?>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label>Tanggal</label>
										<select name="tanggal" class="form-control">
											<?php
											$mulai = 1;
											for ($i = $mulai; $i < $mulai + 31; $i++) {
												$sel = $i == date('Y') ? 'selected="selected"' : '';
												echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label>Bulan</label>
										<select name="bulan" class="form-control">
											<?php
											$mulai = 1;
											for ($i = $mulai; $i < $mulai + 12; $i++) {
												$sel = $i == date('Y') ? 'selected="selected"' : '';
												echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label>Tahun</label>
										<select name="tahun" class="form-control">
											<?php
											$mulai = date('Y') - 1;
											for ($i = $mulai; $i < $mulai + 10; $i++) {
												$sel = $i == date('Y') ? 'selected="selected"' : '';
												echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<button type="submit" class="btn btn-info mt-3"><i class="fa fa-print"></i> View Laporan</button>
									</div>
								</div>
							</div>
							<?php
							echo form_close() ?>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<div class="card card-light">
						<div class="card-header">
							<h3 class="card-title">Laporan Transaksi Bulanan</h3>
						</div>
						<div class="card-body">
							<?php
							echo form_open('Pimpinan/cDashboard/lap_bulanan_transaksi') ?>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Bulan</label>
										<select name="bulan" class="form-control">
											<?php
											$mulai = 1;
											for ($i = $mulai; $i < $mulai + 12; $i++) {
												$sel = $i == date('Y') ? 'selected="selected"' : '';
												echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Tahun</label>
										<select name="tahun" class="form-control">
											<?php
											$mulai = date('Y') - 1;
											for ($i = $mulai; $i < $mulai + 10; $i++) {
												$sel = $i == date('Y') ? 'selected="selected"' : '';
												echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<button type="submit" class="btn btn-info mt-3"><i class="fa fa-print"></i> View Laporan</button>
									</div>
								</div>
							</div>
							<?php
							echo form_close() ?>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<div class="card card-light">
						<div class="card-header">
							<h3 class="card-title">Laporan Transaksi Tahunan</h3>
						</div>
						<div class="card-body">
							<?php
							echo form_open('Pimpinan/cDashboard/lap_tahunan_transaksi') ?>
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label>Tahun</label>
										<select name="tahun" class="form-control">
											<?php
											$mulai = date('Y') - 1;
											for ($i = $mulai; $i < $mulai + 10; $i++) {
												$sel = $i == date('Y') ? 'selected="selected"' : '';
												echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<button type="submit" class="btn btn-info mt-3"><i class="fa fa-print"></i> View Laporan</button>
									</div>
								</div>
							</div>
							<?php
							echo form_close() ?>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<!-- Main row -->

			<!-- /.row (main row) -->
		</div><!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>