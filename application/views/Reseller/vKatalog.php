<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Katalog Barang</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Katalog</li>
					</ol>
				</div>
			</div>
			<?php
			if ($this->session->userdata('success')) {
			?>
				<div class="callout callout-success">
					<h5>Sukses!</h5>
					<p><?= $this->session->userdata('success') ?> <?= $this->session->userdata('username') ?></p>
				</div>
			<?php
			}
			?>
		</div><!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="card card-solid">
			<div class="card-body pb-0">
				<?php
				$qty = 0;
				foreach ($this->cart->contents() as $key => $value) {
					$qty += $value['qty'];
				}
				if ($qty != '0') {
				?>
					<div class="row">
						<div class="col-md-12">
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
													<td><a href="<?= base_url('Reseller/cKatalog/delete/' . $value['rowid']) ?>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>

												</tr>

											<?php
											}
											?>
											<form action="<?= base_url('Reseller/cKatalog/selesai') ?>" method="POST">
												<tr>
													<td colspan="4">
														<label>Alamat Pengiriman</label>
														<textarea name="alamat" class="form-control" placeholder="Masukkan Alamat Pengiriman..."></textarea>
													</td>
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
					</div>
				<?php
				}
				?>

				<div class="row d-flex align-items-stretch">

					<?php
					foreach ($katalog as $key => $value) {
					?>
						<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
							<div class="card bg-light">
								<div class="card-header text-muted border-bottom-0">
									<?= $value->nama_kategori ?>
								</div>
								<div class="card-body pt-0">
									<div class="row">
										<div class="col-7">
											<h2 class="lead"><b><?= $value->nama_barang ?></b></h2>
											<p class="text-muted text-sm"><b>About: </b> <?= $value->deskripsi ?> </p>
											<ul class="ml-4 mb-0 fa-ul text-muted">
												<li class="small"><span class="fa-li"><i class="fas fa-lg fa-tag"></i></span> Rp. <?= number_format($value->harga_gudang) ?></li>

											</ul>
										</div>
										<div class="col-5 text-center">
											<img src="<?= base_url('asset/foto-produk/' . $value->gambar) ?>" alt="" class="img-circle img-fluid">
										</div>
									</div>
								</div>
								<form action="<?= base_url('Reseller/cKatalog/add_to_cart/' . $value->id_jenis) ?>" method="POST">
									<div class="card-footer">
										<div class="text-right">
											<div class="row">
												<div class="col-lg-6"><input type="number" min="1" name="qty" placeholder="Masukkan Quantity Pemesanan" class="form-control" required></div>
												<div class="col-lg-6">
													<button type="submit" class="btn btn-sm btn-success btn-block">
														<i class="fas fa-shopping-cart"></i> Add To Cart
													</button>
												</div>
											</div>


										</div>
									</div>
								</form>
							</div>
						</div>
					<?php
					}
					?>


				</div>
			</div>
			<!-- /.card-body -->

			<!-- /.card-footer -->
		</div>
		<!-- /.card -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->