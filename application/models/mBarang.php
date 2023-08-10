<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mBarang extends CI_Model
{
	public function insert($data)
	{
		$this->db->insert('jenis_barang', $data);
	}
	public function select()
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->join('kategori_barang', 'jenis_barang.id_kategori = kategori_barang.id_kategori', 'left');
		$this->db->where('type=1');
		return $this->db->get()->result();
	}
	public function edit($id)
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->where('id_jenis', $id);
		return $this->db->get()->row();
	}
	public function update($id, $data)
	{
		$this->db->where('id_jenis', $id);
		$this->db->update('jenis_barang', $data);
	}
	public function delete($id)
	{
		$this->db->where('id_jenis', $id);
		$this->db->delete('jenis_barang');
	}

	//supplier
	public function select_brngsupplier()
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->join('kategori_barang', 'jenis_barang.id_kategori = kategori_barang.id_kategori', 'left');
		$this->db->where('type=2');
		$this->db->where('id_supplier', $this->session->userdata('id'));
		return $this->db->get()->result();
	}
}

/* End of file mBarang.php */
