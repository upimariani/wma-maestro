<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cBarang extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mBarang');
		$this->load->model('mKategori');
	}

	public function index()
	{
		$data = array(
			'barang' => $this->mBarang->select_brngsupplier()
		);
		$this->load->view('Supplier/Layout/head');
		$this->load->view('Supplier/Layout/aside');
		$this->load->view('Supplier/Barang/vBarang', $data);
		$this->load->view('Supplier/Layout/footer');
	}
	public function create()
	{
		$this->form_validation->set_rules('kategori', 'Kategori Barang', 'required');
		$this->form_validation->set_rules('nama', 'Nama Barang', 'required');
		$this->form_validation->set_rules('harga', 'Harga Barang', 'required');
		$this->form_validation->set_rules('deskripsi', 'Deskripsi', 'required');
		$this->form_validation->set_rules('stok', 'Stok Barang', 'required');
		$this->form_validation->set_rules('satuan', 'Satuan Barang', 'required');



		if ($this->form_validation->run() == FALSE) {
			$data = array(
				'kategori' => $this->mKategori->select()
			);
			$this->load->view('Supplier/Layout/head');
			$this->load->view('Supplier/Layout/aside');
			$this->load->view('Supplier/Barang/vCreateBarang', $data);
			$this->load->view('Supplier/Layout/footer');
		} else {
			$config['upload_path']          = './asset/foto-produk';
			$config['allowed_types']        = 'gif|jpg|png|jpeg';
			$config['max_size']             = 500000;

			$this->load->library('upload', $config);
			if (!$this->upload->do_upload('gambar')) {
				$data = array(
					'error' => $this->upload->display_errors(),
					'kategori' => $this->mKategori->select()
				);
				$this->load->view('Supplier/Layout/head');
				$this->load->view('Supplier/Layout/aside');
				$this->load->view('Supplier/Barang/vCreateBarang', $data);
				$this->load->view('Supplier/Layout/footer');
			} else {
				$upload_data = $this->upload->data();
				$data = array(
					'id_kategori' => $this->input->post('kategori'),
					'id_supplier' => $this->session->userdata('id'),
					'nama_barang' => $this->input->post('nama'),
					'deskripsi' => $this->input->post('deskripsi'),
					'satuan' => $this->input->post('satuan'),
					'stok_supplier' => $this->input->post('stok'),
					'harga_supplier' => $this->input->post('harga'),
					'gambar' => $upload_data['file_name'],
					'type' => '2'
				);
				$this->mBarang->insert($data);
				$this->session->set_flashdata('success', 'Data Barang Berhasil Ditambahkan!!!');

				redirect('Supplier/cBarang', 'refresh');
			}
		}
	}
	public function update($id)
	{
		$this->form_validation->set_rules('nama', 'Nama produk', 'required');
		$this->form_validation->set_rules('deskripsi', 'Deskripsi', 'required');
		$this->form_validation->set_rules('harga', 'Harga produk', 'required');
		$this->form_validation->set_rules('stok', 'Stok produk', 'required');
		$this->form_validation->set_rules('satuan', 'Satuan Barang', 'required');


		if ($this->form_validation->run() == FALSE) {
			$data = array(
				'barang' => $this->mBarang->edit($id),
				'kategori' => $this->mKategori->select()
			);
			$this->load->view('Supplier/Layout/head');
			$this->load->view('Supplier/Layout/aside');
			$this->load->view('Supplier/Barang/vUpdateBarang', $data);
			$this->load->view('Supplier/Layout/footer');
		} else {
			$config['upload_path']          = './asset/foto-produk';
			$config['allowed_types']        = 'gif|jpg|png|jpeg';
			$config['max_size']             = 50000;

			$this->load->library('upload', $config);

			if (!$this->upload->do_upload('gambar')) {
				$data = array(
					'barang' => $this->mBarang->edit($id),
					'error' => $this->upload->display_errors(),
				);
				$this->load->view('Admin/Layout/head');
				$this->load->view('Admin/Layout/aside');
				$this->load->view('Admin/Barang/vUpdateBarang', $data);
				$this->load->view('Admin/Layout/footer');
			} else {

				$upload_data =  $this->upload->data();
				$data = array(
					'id_kategori' => $this->input->post('kategori'),
					'nama_barang' => $this->input->post('nama'),
					'deskripsi' => $this->input->post('deskripsi'),
					'stok_gudang' => $this->input->post('stok'),
					'harga_gudang' => $this->input->post('harga'),
					'satuan' => $this->input->post('satuan'),

					'gambar' => $upload_data['file_name'],
					'type' => '2'
				);
				$this->mBarang->update($id, $data);
				$this->session->set_flashdata('success', 'Data Barang Berhasil Diperbaharui!!!');
				redirect('Supplier/cBarang', 'refresh');
			}
			$data = array(
				'id_kategori' => $this->input->post('kategori'),
				'nama_barang' => $this->input->post('nama'),
				'deskripsi' => $this->input->post('deskripsi'),
				'stok_gudang' => $this->input->post('stok'),
				'harga_gudang' => $this->input->post('harga'),
				'satuan' => $this->input->post('satuan'),
				'type' => '2'
			);
			$this->mBarang->update($id, $data);
			$this->session->set_flashdata('success', 'Data Barang Berhasil Diperbaharui!!!');
			redirect('Supplier/cBarang', 'refresh');
		}
	}
	public function delete($id)
	{
		$this->mBarang->delete($id);
		$this->session->set_flashdata('success', 'Data Barang Berhasil Dihapus!!!');
		redirect('Supplier/cBarang', 'refresh');
	}
}

/* End of file cBarang.php */
