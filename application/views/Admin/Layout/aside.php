<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-info elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link">
		<img src="<?= base_url('asset/AdminLTE/') ?>dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">CV. MAESTRO</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="<?= base_url('asset/AdminLTE/') ?>dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">Admin</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

				<li class="nav-item">
					<a href="<?= base_url('Admin/cDashboard') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cDashboard') {
																						echo 'active';
																					}  ?>">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('Admin/cUser') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cUser') {
																					echo 'active';
																				}  ?>">
						<i class="nav-icon fas fa-user-tie"></i>
						<p>Data User</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('Admin/cSupplier') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cSupplier') {
																						echo 'active';
																					}  ?>">
						<i class="nav-icon fas fa-users"></i>
						<p>Data Supplier</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('Admin/cKategori') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cKategori') {
																						echo 'active';
																					}  ?>">
						<i class="nav-icon fas fa-bars"></i>
						<p>Data Kategori Barang</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('Admin/cBarang') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cBarang') {
																					echo 'active';
																				}  ?>">
						<i class="nav-icon fas fa-book"></i>
						<p>Data Barang</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('Admin/cTransaksi') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cTransaksi') {
																						echo 'active';
																					}  ?>">
						<i class="nav-icon fas fa-truck-pickup"></i>
						<p>Pemesanan Bahan Baku</p>
					</a>
				</li>
				<?php
				$data = $this->db->query("SELECT COUNT(id_po_bar) as jml FROM `po_barang` WHERE stat_order_bar !='4'")->row();
				?>
				<li class="nav-item">
					<a href="<?= base_url('Admin/cTransaksiReseller') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Admin' && $this->uri->segment(2) == 'cTransaksiReseller') {
																								echo 'active';
																							}  ?>">
						<i class="nav-icon fas fa-truck-loading"></i>
						<p>Transaksi Reseller
							<?php
							if ($data->jml != '0') {
							?><span class="badge bg-warning"><?= $data->jml ?></span>
							<?php
							}
							?></p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('cLogin/logout') ?>" class="nav-link">
						<i class="nav-icon fas fa-sign-out-alt"></i>
						<p>SignOut</p>
					</a>
				</li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>