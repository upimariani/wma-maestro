<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cLoginReseller extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->ci = &get_instance();
		$this->load->model('mLogin');
	}


	public function index()
	{
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');
		if ($this->form_validation->run() == FALSE) {

			$this->load->view('vLoginReseller');
		} else {
			$username = $this->input->post('username');
			$password = $this->input->post('password');
			$login = $this->mLogin->auth_reseller($username, $password);
			if ($login) {
				$username = $login->nama_reseller;
				$id = $login->id_reseller;


				$array = array(
					'id_reseller' => $id
				);

				$this->session->set_userdata($array);


				$this->ci->session->set_userdata('username', $username);
				$this->session->set_flashdata('success', 'Selamat Datang, ');

				redirect(base_url('Reseller/cKatalog'));
			} else {
				$this->session->set_flashdata('error', 'Username dan Password Salah!!!');
				redirect('cLoginReseller');
			}
		}
	}
	public function register()
	{
		$this->form_validation->set_rules('nama', 'Nama', 'required');
		$this->form_validation->set_rules('alamat', 'Alamat', 'required');
		$this->form_validation->set_rules('no_hp', 'No Telepon', 'required');
		$this->form_validation->set_rules('jk', 'Jenis Kelamin', 'required');
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');
		if ($this->form_validation->run() == FALSE) {
			$this->load->view('vRegisterReseller');
		} else {
			$data = array(
				'nama_reseller' => $this->input->post('nama'),
				'alamat_reseller' => $this->input->post('alamat'),
				'no_hp_reseller' => $this->input->post('no_hp'),
				'jk' => $this->input->post('jk'),
				'username_reseller' => $this->input->post('username'),
				'password_reseller' => $this->input->post('password')
			);
			$this->mLogin->registerreseller($data);
			$this->session->set_flashdata('success', 'Reseller Berhasil Registrasi!');
			redirect('cLoginReseller');
		}
	}
	public function logout()
	{
		$this->cart->destroy();
		$this->ci->session->unset_userdata('id_reseller');
		$this->session->set_flashdata('success', 'Anda Berhasil LogOut!');
		redirect('cLoginReseller');
	}
}

/* End of file cLoginReseller.php */
