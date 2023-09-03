<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mPeramalan extends CI_Model
{
	public function barang()
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->join('kategori_barang', 'jenis_barang.id_kategori = kategori_barang.id_kategori', 'left');

		$this->db->where('type=2');
		return $this->db->get()->result();
	}
}

/* End of file mPeramalan.php */
