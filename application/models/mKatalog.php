<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mKatalog extends CI_Model
{
	public function katalog_produk()
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->join('kategori_barang', 'jenis_barang.id_kategori = kategori_barang.id_kategori', 'left');
		$this->db->where('type=1');
		return $this->db->get()->result();
	}
	public function get_barang($id)
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->where('id_jenis', $id);
		return $this->db->get()->row();
	}
	public function po_barang($data)
	{
		$this->db->insert('po_barang', $data);
	}
	public function po_dbar($data)
	{
		$this->db->insert('po_dbarang', $data);
	}
}

/* End of file mKatalog.php */
