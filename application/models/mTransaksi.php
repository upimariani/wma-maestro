<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mTransaksi extends CI_Model
{
	//admin
	public function transaksi_admin()
	{
		$this->db->select('*');
		$this->db->from('po_bb');
		$this->db->join('supplier', 'po_bb.id_supplier = supplier.id_supplier', 'left');
		return $this->db->get()->result();
	}
	public function bahanbaku($id)
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->where('id_supplier', $id);
		return $this->db->get()->result();
	}
	public function insert_po_bb($data)
	{
		$this->db->insert('po_bb', $data);
	}
	public function insert_pesanan($data)
	{
		$this->db->insert('po_dbb', $data);
	}

	public function detail_transaksi($id)
	{
		$data['transaksi'] = $this->db->query("SELECT * FROM `po_bb` WHERE id_po_bb='" . $id . "'")->row();
		$data['detail'] = $this->db->query("SELECT * FROM `po_bb` JOIN po_dbb ON po_bb.id_po_bb=po_dbb.id_po_bb JOIN jenis_barang ON po_dbb.id_jenis=jenis_barang.id_jenis WHERE po_bb.id_po_bb='" . $id . "'")->result();
		return $data;
	}
	public function bayar($id, $data)
	{
		$this->db->where('id_po_bb', $id);
		$this->db->update('po_bb', $data);
	}
}

/* End of file mTransaksi.php */
