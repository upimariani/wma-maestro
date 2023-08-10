<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cSupplier extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mSupplier');
	}

	public function index()
	{
		$data = array(
			'supplier' => $this->mSupplier->select()
		);
		$this->load->view('Admin/Layout/head');
		$this->load->view('Admin/Layout/aside');
		$this->load->view('Admin/Supplier/vSupplier', $data);
		$this->load->view('Admin/Layout/footer');
	}
	public function create()
	{
		$this->form_validation->set_rules('nama', 'Nama Supplier', 'required');
		$this->form_validation->set_rules('no_hp', 'No Telepon', 'required');
		$this->form_validation->set_rules('alamat', 'Alamat', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');


		if ($this->form_validation->run() == FALSE) {
			$this->load->view('Admin/Layout/head');
			$this->load->view('Admin/Layout/aside');
			$this->load->view('Admin/Supplier/vCreateSupplier');
			$this->load->view('Admin/Layout/footer');
		} else {
			$data = array(
				'nama_supplier' => $this->input->post('nama'),
				'alamat' => $this->input->post('alamat'),
				'no_hp_supplier' => $this->input->post('no_hp'),
				'username_supp' => $this->input->post('username'),
				'pass_supp' => $this->input->post('password')
			);
			$this->mSupplier->insert($data);
			$this->session->set_flashdata('success', 'Data Supplier Berhasil Disimpan!');
			redirect('Admin/cSupplier', 'refresh');
		}
	}
	public function edit($id)
	{
		$this->form_validation->set_rules('nama', 'Nama Supplier', 'required');
		$this->form_validation->set_rules('no_hp', 'No Telepon', 'required');
		$this->form_validation->set_rules('alamat', 'Alamat', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');


		if ($this->form_validation->run() == FALSE) {
			$data = array(
				'supplier' => $this->mSupplier->edit($id)
			);
			$this->load->view('Admin/Layout/head');
			$this->load->view('Admin/Layout/aside');
			$this->load->view('Admin/Supplier/vUpdateSupplier', $data);
			$this->load->view('Admin/Layout/footer');
		} else {
			$data = array(
				'nama_supplier' => $this->input->post('nama'),
				'alamat' => $this->input->post('alamat'),
				'no_hp_supplier' => $this->input->post('no_hp'),
				'username_supp' => $this->input->post('username'),
				'pass_supp' => $this->input->post('password')
			);
			$this->mSupplier->update($id, $data);
			$this->session->set_flashdata('success', 'Data Supplier Berhasil Diperbaharui!');
			redirect('Admin/cSupplier', 'refresh');
		}
	}
	public function delete($id)
	{
		$this->mSupplier->delete($id);
		$this->session->set_flashdata('success', 'Data Supplier Berhasil Dihapus!');
		redirect('Admin/cSupplier', 'refresh');
	}
}

/* End of file cSupplier.php */
