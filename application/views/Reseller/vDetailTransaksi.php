<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Detail Transaksi</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Detail Transaksi</li>
					</ol>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="callout callout-info">
						<h5><i class="fas fa-info"></i> Note:</h5>
						This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
					</div>

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
					<!-- Main content -->
					<div class="invoice p-3 mb-3">
						<!-- title row -->
						<div class="row">
							<div class="col-12">
								<h4>
									<i class="fas fa-globe"></i> AdminLTE, Inc.
									<small class="float-right">Date: <?= date('Y-m-d') ?></small>
								</h4>
							</div>
							<!-- /.col -->
						</div>
						<!-- info row -->
						<div class="row invoice-info">
							<div class="col-sm-4 invoice-col">
								From
								<address>
									<strong>Reseller, Inc.</strong><br>
									<?= $transaksi['transaksi']->alamat_kirim_bar ?><br>

								</address>
							</div>
							<!-- /.col -->

							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- Table row -->
						<div class="row">
							<div class="col-12 table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>No.</th>
											<th>Qty</th>
											<th>Product</th>
											<th>Harga</th>
											<th>Subtotal</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$no = 1;
										foreach ($transaksi['detail'] as $key => $value) {
										?>
											<tr>
												<td><?= $no++ ?></td>
												<td><?= $value->qty ?></td>
												<td><?= $value->nama_barang ?></td>
												<td>Rp. <?= number_format($value->harga_gudang)  ?></td>
												<td>Rp. <?= number_format($value->harga_gudang * $value->qty)  ?></td>
											</tr>
										<?php
										}
										?>


									</tbody>
								</table>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<div class="row">
							<div class="col-6">
								<?php
								if ($transaksi['transaksi']->stat_bay_bar == '0') {
								?>
									<?php echo form_open_multipart('Reseller/cTransaksi/bayar/' . $transaksi['transaksi']->id_po_bar); ?>
									<label>Pembayaran</label>
									<input type="file" name="bayar" class="form-control">
									<button type="submit" class="btn btn-success mt-3"><i class="far fa-credit-card"></i> Submit
										Payment
									</button>
									</form>
								<?php
								} else {
								?>
									<img class="mb-5" style="width: 150px;" src="<?= base_url('asset/pembayaran/' . $transaksi['transaksi']->bukti_bay_bar)  ?>">
								<?php
								}
								?>
							</div>

							<!-- /.col -->
							<div class="col-6">
								<p class="lead">Amount Due <?= date('Y-m-d') ?></p>

								<div class="table-responsive">
									<table class="table">
										<tr>
											<th>Total:</th>
											<td>Rp. <?= number_format($transaksi['transaksi']->tot_bay_bar)  ?></td>
										</tr>
									</table>
								</div>
							</div>
							<!-- /.col -->
							<div class="row no-print">
								<div class="col-12">
									<a href="invoice-print.html" target="_blank" class="btn btn-default mt-5"><i class="fas fa-print"></i> Print</a>

									<?php
									if ($transaksi['transaksi']->stat_order_bar == '3') {
									?>
										<a href="<?= base_url('Reseller/cTransaksi/pesanan_diterima/' . $transaksi['transaksi']->id_po_bar) ?>" class="mt-5 btn btn-success"><i class="fas fa-pen-alt"></i> Pesanan Diterima</a>

									<?php
									}
									?>
								</div>
							</div>
							<!-- /.row -->


						</div>
						<!-- /.invoice -->
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>