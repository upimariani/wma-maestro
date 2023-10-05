<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Detail Peramalan Per Periode</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Detail Peramalan</li>
					</ol>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Informasi Peramalan Barang</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="width: 10px">#</th>
										<th>Periode</th>
										<th>Permintaan</th>
										<th style="width: 40px">Forecast</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$no = 1;
									foreach ($periode as $key => $value) {
									?>
										<tr>
											<td><?= $no++ ?>.</td>
											<td><?php
												if ($value->bulan == '1') {
													echo 'Januari ';
												} else if ($value->bulan == '2') {
													echo 'Februari ';
												} else if ($value->bulan == '3') {
													echo 'Maret ';
												} else if ($value->bulan == '4') {
													echo 'April ';
												} else if ($value->bulan == '5') {
													echo 'Mei ';
												} else if ($value->bulan == '6') {
													echo 'Juni ';
												} else if ($value->bulan == '7') {
													echo 'Juli ';
												} else if ($value->bulan == '8') {
													echo 'Agustus ';
												} else if ($value->bulan == '9') {
													echo 'September ';
												} else if ($value->bulan == '10') {
													echo 'Oktober ';
												} else if ($value->bulan == '11') {
													echo 'November ';
												} else if ($value->bulan == '12') {
													echo 'Desember ';
												}
												?></td>
											<td><?= $value->qty ?> <?= $value->satuan ?></td>
											<?php
											$forecast = $this->db->query("SELECT SUM(qty) as qty, id_jenis, MONTH(tgl_transaksi) as bulan FROM `po_bb` JOIN po_dbb ON po_bb.id_po_bb=po_dbb.id_po_dbb WHERE id_jenis='$value->id_jenis' AND MONTH(tgl_transaksi) < '$value->bulan' GROUP BY id_jenis, MONTH(tgl_transaksi) ORDER BY MONTH(tgl_transaksi) DESC LIMIT 3")->result();
											$hasil = 0;
											$bobot = 3;
											foreach ($forecast as $key => $item) {
												$hasil += (($item->qty * $bobot--) / 6);
											}
											if ($value->bulan > 3) {
											?>
												<td><span class="badge bg-danger"><?= round($hasil) ?> <?= $value->satuan ?></span></td>
											<?php
											}
											?>

										</tr>
									<?php
									}
									?>

								</tbody>
							</table>
						</div>
						<!-- /.card-body -->

					</div>
					<!-- /.card -->
				</div>
			</div>
			<!-- /.row -->
		</div><!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>