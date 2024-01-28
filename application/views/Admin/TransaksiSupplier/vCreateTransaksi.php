<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Pesan Bahan Baku Supplier</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Pesan</li>
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

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="col-md-6">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Tambah Data Pesanan Bahan Baku</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form action="<?= base_url('Admin/cTransaksi/addtocart') ?>" method="POST" role="form">
							<div class="card-body">

								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<input type="hidden" name="id_supplier" value="<?= $id_supplier ?>">
											<label for="exampleInputEmail1">Bahan Baku</label>
											<select class="form-control" id="bb" name="bahanbaku" required>
												<option value="">---Pilih Bahan Baku---</option>
												<?php
												foreach ($bb as $key => $value) {
												?>
													<option data-rekomendasi="<?= $value->stok_minimal ?>" data-nama="<?= $value->nama_barang ?>" data-harga="<?= $value->harga_supplier ?>" data-stok="<?= $value->stok_supplier ?>" value="<?= $value->id_jenis ?>"><?= $value->nama_barang ?></option>
												<?php
												}
												?>

											</select>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label for="exampleInputEmail1">Nama Bahan Baku</label>
											<input type="text" name="nama" class="nama form-control" id="exampleInputEmail1" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="exampleInputPassword1">Harga Bahan Baku</label>
											<input type="number" name="harga" class="harga form-control" id="exampleInputPassword1" readonly>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="exampleInputEmail1">Stok Supplier</label>
											<input type="text" name="stok" class="stok form-control" id="exampleInputEmail1" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="exampleInputPassword1">Quantity Pesan</label>
											<input type="number" name="qty" class="rekomendasi form-control" id="exampleInputPassword1" required>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->

							<div class="card-footer">
								<button type="submit" class="btn btn-primary"><i class="fas fa-shopping-basket"></i>Add To Cart</button>
								<a href="<?= base_url('Admin/cTransaksi') ?>" class="btn btn-danger"><i class="fas fa-step-backward"></i> Kembali</a>
							</div>
						</form>
					</div>
					<!-- /.card -->
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Informasi Keranjang</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Nama</th>
										<th>Harga</th>
										<th>Quantity</th>
										<th>Subtotal</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$no = 1;
									foreach ($this->cart->contents() as $key => $value) {
									?>
										<tr>
											<td><?= $no++ ?>.</td>
											<td><?= $value['name'] ?></td>
											<td>Rp. <?= number_format($value['price'])  ?></td>
											<td><span class="badge bg-danger"><?= $value['qty'] ?></span></td>
											<td>Rp. <?= number_format($value['price'] * $value['qty'])  ?></td>
											<td><a href="<?= base_url('Admin/cTransaksi/hapus/' . $value['rowid'] . '/' . $id_supplier) ?>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>

										</tr>

									<?php
									}
									?>
									<form action="<?= base_url('Admin/cTransaksi/selesai') ?>" method="POST">
										<input type="hidden" name="id_supplier" value="<?= $id_supplier ?>">
										<tr>
											<td colspan="4">
												<label>Alamat Pengiriman</label>
												<textarea name="alamat" class="form-control" placeholder="Masukkan Alamat Pengiriman..."></textarea>
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td><button type="submit" class="btn btn-success btn-sm"><i class="fas fa-leaf"></i> Selesai</button></td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>Total: </td>
											<td><strong>Rp.<?= number_format($this->cart->total())  ?></strong></td>
										</tr>
									</form>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
				<!--/.col (right) -->
			</div>
			<!-- /.row -->
		</div><!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>