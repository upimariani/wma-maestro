<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cTransaksiReseller extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('mTransaksiReseller');
	}
	public function index()
	{
		$data = array(
			'transaksi' => $this->mTransaksiReseller->transaksi_admin()
		);
		$this->load->view('Admin/Layout/head');
		$this->load->view('Admin/Layout/aside');
		$this->load->view('Admin/TransaksiReseller/vTransaksi', $data);
		$this->load->view('Admin/Layout/footer');
	}
	public function detail_transaksi($id)
	{
		$data = array(
			'transaksi' => $this->mTransaksiReseller->detail_transaksi($id)
		);
		$this->load->view('Admin/Layout/head');
		$this->load->view('Admin/Layout/aside');
		$this->load->view('Admin/TransaksiReseller/vDetailReseller', $data);
		$this->load->view('Admin/Layout/footer');
	}
	public function konfirmasi($id)
	{
		$data = array(
			'stat_order_bar' => '2'
		);
		$this->mTransaksiReseller->update_status($id, $data);
		$this->session->set_flashdata('success', 'Transaksi Berhasil Dikonfirmasi!!');
		redirect('Admin/cTransaksiReseller/detail_transaksi/' . $id);
	}
	public function kirim($id)
	{
		$data = array(
			'stat_order_bar' => '3'
		);
		$this->mTransaksiReseller->update_status($id, $data);
		$this->session->set_flashdata('success', 'Transaksi Berhasil Dikirim!!');
		redirect('Admin/cTransaksiReseller/detail_transaksi/' . $id);
	}
}

/* End of file cTransaksiReseller.php */
