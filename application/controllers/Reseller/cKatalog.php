<?php

defined('BASEPATH') or exit('No direct script access allowed');

class cKatalog extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mKatalog');
	}

	public function index()
	{
		$data = array(
			'katalog' => $this->mKatalog->katalog_produk()
		);
		$this->load->view('Reseller/Layout/head');
		$this->load->view('Reseller/Layout/aside');
		$this->load->view('Reseller/vKatalog', $data);
		$this->load->view('Reseller/Layout/footer');
	}
	public function add_to_cart($id)
	{
		$barang = $this->mKatalog->get_barang($id);
		$data = array(
			'id' => $barang->id_jenis,
			'name' =>  $barang->nama_barang,
			'price' =>  $barang->harga_gudang,
			'qty' => '1',
			'stok' =>  $barang->stok_gudang,
		);
		$this->cart->insert($data);
		$this->session->set_flashdata('success', 'Bahan Baku Berhasil Masuk Keranjang!');
		redirect('Reseller/cKatalog');
	}
	public function delete($id)
	{
		$this->cart->remove($id);
		$this->session->set_flashdata('success', 'Data Barang Berhasil Dihapus!');
		redirect('Reseller/cKatalog');
	}
	public function selesai()
	{
		$data = array(
			'id_reseller' => $this->session->userdata('id_reseller'),
			'tgl_tran_bar' => date('Y-m-d'),
			'tot_bay_bar' => $this->cart->total(),
			'stat_bay_bar' => '0',
			'bukti_bay_bar' => '0',
			'stat_order_bar' => '0',
			'alamat_kirim_bar' => $this->input->post('alamat')
		);
		$this->mKatalog->po_barang($data);

		$id_po_dbar = $this->db->query("SELECT MAX(id_po_bar) as id_po_bar FROM `po_barang`")->row();

		foreach ($this->cart->contents() as $key => $value) {
			$pesanan = array(
				'id_po_bar' => $id_po_dbar->id_po_bar,
				'id_jenis' => $value['id'],
				'qty' => $value['qty']
			);
			$this->mKatalog->po_dbar($pesanan);
		}
		$this->cart->destroy();
		$this->session->set_flashdata('success', 'Transaksi berhasil Dikirim!');
		redirect('Reseller/cTransaksi');
	}
}

/* End of file cKatalog.php */
