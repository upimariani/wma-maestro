<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Detail Transaksi Supplier</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Detail Transaksi Supplier</li>
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
									<strong>Admin, Inc.</strong><br>
									<?= $transaksi['transaksi']->alamat_pengiriman ?><br>

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
												<td>Rp. <?= number_format($value->harga_supplier)  ?></td>
												<td>Rp. <?= number_format($value->harga_supplier * $value->qty)  ?></td>
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
							<!-- accepted payments column -->
							<div class="col-6">


							</div>
							<!-- /.col -->
							<div class="col-6">
								<p class="lead">Amount Due <?= date('Y-m-d') ?></p>

								<div class="table-responsive">
									<table class="table">
										<tr>
											<th>Total:</th>
											<td>Rp. <?= number_format($transaksi['transaksi']->total_bayar)  ?></td>
										</tr>
									</table>
								</div>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- this row will not appear when printing -->
						<div class="row no-print">
							<div class="col-12">
								<button type="button" onclick="window.print()" class="btn btn-default mt-5"><i class="fas fa-print"></i> Print</button>

								<?php
								if ($transaksi['transaksi']->status_order == '9') {
								?>
									<a href="<?= base_url('Pimpinan/cDashboard/approve_pesanan/' . $transaksi['transaksi']->id_po_bb) ?>" class="mt-5 btn btn-warning"><i class="fas fa-pen-alt"></i> Approved Pesanan</a>

								<?php
								}
								?>
							</div>
						</div>
					</div>
					<!-- /.invoice -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>