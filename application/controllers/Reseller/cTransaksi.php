<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cTransaksi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mTransaksiReseller');
	}

	public function index()
	{
		$data = array(
			'transaksi' => $this->mTransaksiReseller->transaksi()
		);
		$this->load->view('Reseller/Layout/head');
		$this->load->view('Reseller/Layout/aside');
		$this->load->view('Reseller/vTransaksi', $data);
		$this->load->view('Reseller/Layout/footer');
	}
	public function detail_transaksi($id)
	{
		$data = array(
			'transaksi' => $this->mTransaksiReseller->detail_transaksi($id)
		);
		$this->load->view('Reseller/Layout/head');
		$this->load->view('Reseller/Layout/aside');
		$this->load->view('Reseller/vDetailTransaksi', $data);
		$this->load->view('Reseller/Layout/footer');
	}
	public function bayar($id)
	{
		$config['upload_path']          = './asset/pembayaran';
		$config['allowed_types']        = 'gif|jpg|png|jpeg';
		$config['max_size']             = 50000;

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('bayar')) {
			$data = array(
				'error' => $this->upload->display_errors(),
				'transaksi' => $this->mTransaksiReseller->detail_transaksi($id)
			);
			$this->load->view('Reseller/Layout/head');
			$this->load->view('Reseller/Layout/aside');
			$this->load->view('Reseller/vDetailTransaksi', $data);
			$this->load->view('Reseller/Layout/footer');
		} else {

			$upload_data =  $this->upload->data();
			$data = array(
				'bukti_bay_bar' => $upload_data['file_name'],
				'stat_bay_bar' => '1',
				'stat_order_bar' => '1'
			);
			$this->mTransaksiReseller->bayar($id, $data);
			$this->session->set_flashdata('success', 'Transaksi Berhasil Dikirim!!!');
			redirect('Reseller/cTransaksi', 'refresh');
		}
	}
	public function pesanan_diterima($id)
	{
		$data = array(
			'stat_order_bar' => '4'
		);
		$this->mTransaksiReseller->update_status($id, $data);
		$this->session->set_flashdata('success', 'Transaksi Berhasil Diterima!!');
		redirect('Reseller/cTransaksi', 'refresh');
	}
}

/* End of file cTransaksi.php */
