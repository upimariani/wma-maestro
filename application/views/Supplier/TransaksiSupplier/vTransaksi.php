<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Transaksi Bahan Baku Supplier</h1>

				</div>

				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Transaksi</li>
					</ol>
				</div>

			</div>

		</div><!-- /.container-fluid -->

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

	</section>

	<!-- /.modal -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-12">
					<div class="card card-success card-tabs">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">Belum Bayar</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">Menunggu Konfirmasi</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill" href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false">Pesanan Diproses</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="custom-tabs-one-settings-tab" data-toggle="pill" href="#custom-tabs-one-settings" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">Pesanan Dikirim</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="custom-tabs-one-selesai-tab" data-toggle="pill" href="#custom-tabs-one-selesai" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">Pesanan Selesai</a>
								</li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">Informasi Transaksi Belum Bayar</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<table class="example1 table table-bordered table-striped">
												<thead>
													<tr>
														<th>No</th>
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
														if ($value->status_order == '0') {

													?>
															<tr>
																<td><?= $no++ ?></td>
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
																	}
																	?>
																</td>

																<td class="text-center"> <a href="<?= base_url('Supplier/cTransaksi/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
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
								</div>
								<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">Informasi Transaksi Menunggu Konfirmasi</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<table class="example1 table table-bordered table-striped">
												<thead>
													<tr>
														<th>No</th>
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
														if ($value->status_order == '1') {

													?>
															<tr>
																<td><?= $no++ ?></td>
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
																	}
																	?>
																</td>

																<td class="text-center"> <a href="<?= base_url('Supplier/cTransaksi/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
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
								</div>
								<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">Informasi Transaksi Diproses Supplier</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<table class="example1 table table-bordered table-striped">
												<thead>
													<tr>
														<th>No</th>
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
														if ($value->status_order == '2') {

													?>
															<tr>
																<td><?= $no++ ?></td>
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
																	}
																	?>
																</td>

																<td class="text-center"> <a href="<?= base_url('Supplier/cTransaksi/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
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
								</div>
								<div class="tab-pane fade" id="custom-tabs-one-settings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">Informasi Transaksi Dikirim Supplier </h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<table class="example1 table table-bordered table-striped">
												<thead>
													<tr>
														<th>No</th>
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
														if ($value->status_order == '3') {

													?>
															<tr>
																<td><?= $no++ ?></td>
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
																	}
																	?>
																</td>

																<td class="text-center"> <a href="<?= base_url('Supplier/cTransaksi/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
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
								</div>
								<div class="tab-pane fade" id="custom-tabs-one-selesai" role="tabpanel" aria-labelledby="custom-tabs-one-selesai-tab">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">Informasi Transaksi Supplier Selesai</h3>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<table class="example1 table table-bordered table-striped">
												<thead>
													<tr>
														<th>No</th>
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
														if ($value->status_order == '4') {

													?>
															<tr>
																<td><?= $no++ ?></td>
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
																	}
																	?>
																</td>

																<td class="text-center"> <a href="<?= base_url('Supplier/cTransaksi/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
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
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
				</div>

				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>