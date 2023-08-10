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
		<button type="button" data-toggle="modal" data-target="#modal-default" class="btn btn-app">
			<i class="fas fa-plus"></i> Tambah Transaksi
		</button>
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
	<div class="modal fade" id="modal-default">
		<div class="modal-dialog">
			<form action="<?= base_url('Admin/cTransaksi/pesan_supplier') ?>" method="POST">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Pilih Supplier</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="col-lg-12">
							<div class="form-group">
								<label for="exampleInputEmail1">Supplier</label>
								<select class="form-control" name="supplier" required>
									<option value="">---Pilih Supplier---</option>
									<?php
									foreach ($supplier as $key => $value) {
									?>
										<option value="<?= $value->id_supplier ?>"><?= $value->nama_supplier ?></option>
									<?php
									}
									?>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Informasi Transaksi Supplier</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
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
												}
												?>
											</td>

											<td class="text-center"> <a href="<?= base_url('Admin/cTransaksi/detail_transaksi/' . $value->id_po_bb) ?>" class="btn btn-app">
													<i class="fas fa-info"></i> Detail Transaksi
												</a> </td>
										</tr>
									<?php
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
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>