<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cPeramalan extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mPeramalan');
	}

	public function index()
	{
		$data = array(
			'barang' => $this->mPeramalan->barang()
		);
		$this->load->view('Pimpinan/Layout/head');
		$this->load->view('Pimpinan/Layout/aside');
		$this->load->view('Pimpinan/vPeramalan', $data);
		$this->load->view('Pimpinan/Layout/footer');
	}
	public function detail_peramalan($id_bb)
	{
		$data = array(
			'periode' => $this->mPeramalan->periode($id_bb)
		);
		$this->load->view('Pimpinan/Layout/head');
		$this->load->view('Pimpinan/Layout/aside');
		$this->load->view('Pimpinan/vDetailPeramalan', $data);
		$this->load->view('Pimpinan/Layout/footer');
	}
}

/* End of file cPeramalan.php */
