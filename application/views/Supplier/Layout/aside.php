<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-success elevation-4">
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
				<a href="#" class="d-block">Supplier</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

				<li class="nav-item">
					<a href="<?= base_url('Supplier/cDashboard') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Supplier' && $this->uri->segment(2) == 'cDashboard') {
																							echo 'active';
																						}  ?>">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?= base_url('Supplier/cBarang') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Supplier' && $this->uri->segment(2) == 'cBarang') {
																						echo 'active';
																					}  ?>">
						<i class="nav-icon fas fa-user-tie"></i>
						<p>Data Barang</p>
					</a>
				</li>
				<?php
				$notif = $this->db->query("SELECT COUNT(id_po_bb) as jml FROM `po_bb` WHERE id_supplier='" . $this->session->userdata('id') . "' AND status_order='1'")->row();
				?>
				<li class="nav-item">
					<a href="<?= base_url('Supplier/cTransaksi') ?>" class="nav-link <?php if ($this->uri->segment(1) == 'Supplier' && $this->uri->segment(2) == 'cTransaksi') {
																							echo 'active';
																						}  ?>">
						<i class="nav-icon fas fa-shopping-cart"></i>
						<p>Pemesanan Barang <span class="badge badge-warning"><?= $notif->jml ?></span></p>
					</a>
				</li>

				<li class="nav-item">
					<a href="<?= base_url('cLoginSupplier/logout') ?>" class="nav-link">
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