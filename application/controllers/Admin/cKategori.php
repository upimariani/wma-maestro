<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cKategori extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mKategori');
	}


	public function index()
	{
		$data = array(
			'kategori' => $this->mKategori->select()
		);
		$this->load->view('Admin/Layout/head');
		$this->load->view('Admin/Layout/aside');
		$this->load->view('Admin/Kategori/vKategori', $data);
		$this->load->view('Admin/Layout/footer');
	}
	public function create()
	{
		$this->form_validation->set_rules('nama', 'Nama Kategori', 'required');


		if ($this->form_validation->run() == FALSE) {
			$this->load->view('Admin/Layout/head');
			$this->load->view('Admin/Layout/aside');
			$this->load->view('Admin/Kategori/vCreateKategori');
			$this->load->view('Admin/Layout/footer');
		} else {
			$data = array(
				'nama_kategori' => $this->input->post('nama')
			);
			$this->mKategori->insert($data);
			$this->session->set_flashdata('success', 'Data Kategori Berhasil Ditambahkan!');
			redirect('Admin/cKategori');
		}
	}
	public function edit($id)
	{
		$this->form_validation->set_rules('nama', 'Nama Kategori', 'required');


		if ($this->form_validation->run() == FALSE) {
			$data = array(
				'kategori' => $this->mKategori->edit($id)
			);
			$this->load->view('Admin/Layout/head');
			$this->load->view('Admin/Layout/aside');
			$this->load->view('Admin/Kategori/vUpdateKategori', $data);
			$this->load->view('Admin/Layout/footer');
		} else {
			$data = array(
				'nama_kategori' => $this->input->post('nama')
			);
			$this->mKategori->update($id, $data);
			$this->session->set_flashdata('success', 'Data Kategori Berhasil Diperbaharui!');
			redirect('Admin/cKategori');
		}
	}
	public function delete($id)
	{
		$this->mKategori->delete($id);
		$this->session->set_flashdata('success', 'Data Kategori Berhasil Dihapus!');
		redirect('Admin/cKategori');
	}
}

/* End of file cKategori.php */
