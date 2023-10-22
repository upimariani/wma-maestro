<!-- Content wrapper -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Laporan Transaksi</h1>
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
	<section class="content">
		<div class="container-fluid">
			<!-- Small boxes (Stat box) -->

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
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Informasi Menunggu Konfirmasi Transaksi Bahan Baku</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<?php
							if ($this->session->userdata('success')) {
							?>
								<div class="callout callout-success">
									<h5>Sukses!</h5>
									<p><?= $this->session->userdata('success') ?></p>
								</div>
							<?php
							}
							?>
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>Nama Supplier</th>
										<th>Tanggal Transaksi</th>
										<th>Total Bayar</th>
										<th>Alamat Pengiriman</th>
										<th>Status Pesanan</th>
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$no = 1;
									foreach ($transaksi as $key => $value) {
										if ($value->status_order == '9') {

									?>
											<tr>
												<td><?= $no++ ?></td>
												<td><?= $value->nama_supplier ?></td>
												<td><?= $value->tgl_transaksi ?></td>
												<td>Rp. <?= number_format($value->total_bayar)  ?></td>
												<td><?= $value->alamat_pengiriman ?></td>
												<td><?php
													if ($value->status_order == '0') {
													?>
														<span class="badge badge-danger">Belum Bayar</span>
													<?php
													} else if ($value->status_order == '1') {
													?>
														<span class="badge badge-warning">Menunggu Konfirmasi</span>
													<?php
													} else if ($value->status_order == '2') {
													?>
														<span class="badge badge-info">Pesanan Diproses</span>
													<?php
													} else if ($value->status_order == '3') {
													?>
														<span class="badge badge-primary">Pesanan Dikirim</span>
													<?php
													} else if ($value->status_order == '4') {
													?>
														<span class="badge badge-success">Selesai</span>
													<?php
													} else {
													?>
														<span class="badge badge-success">Menungu Konfirmasi Pemilik</span>
													<?php
													}
													?>
												</td>

												<td class="text-center"> <a href="<?= base_url('Pimpinan/cDashboard/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
														<i class="fas fa-info"></i> Detail Transaksi
													</a> </td>
											</tr>
									<?php
										}
									}
									?>
								</tbody>
								<tfoot>

									<tr>
										<th>No</th>
										<th>Nama Supplier</th>
										<th>Tanggal Transaksi</th>
										<th>Total Bayar</th>
										<th>Alamat Pengiriman</th>
										<th>Status Pesanan</th>
										<th class="text-center">Action</th>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
		</div>
</div>