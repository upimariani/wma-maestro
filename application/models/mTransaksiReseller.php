<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mTransaksiReseller extends CI_Model
{
	public function transaksi()
	{
		$this->db->select('*');
		$this->db->from('po_barang');
		$this->db->join('reseller', 'po_barang.id_reseller = reseller.id_reseller', 'left');
		$this->db->where('po_barang.id_reseller', $this->session->userdata('id_reseller'));

		return $this->db->get()->result();
	}
	public function detail_transaksi($id)
	{
		$data['transaksi'] = $this->db->query("SELECT * FROM `po_barang` WHERE id_po_bar='" . $id . "'")->row();
		$data['detail'] = $this->db->query("SELECT * FROM `po_barang` JOIN po_dbarang ON po_barang.id_po_bar=po_dbarang.id_po_bar JOIN jenis_barang ON po_dbarang.id_jenis=jenis_barang.id_jenis WHERE po_barang.id_po_bar='" . $id . "'")->result();
		return $data;
	}
	public function bayar($id, $data)
	{
		$this->db->where('id_po_bar', $id);
		$this->db->update('po_barang', $data);
	}

	//admim
	public function transaksi_admin()
	{
		$this->db->select('*');
		$this->db->from('po_barang');
		$this->db->join('reseller', 'po_barang.id_reseller = reseller.id_reseller', 'left');
		return $this->db->get()->result();
	}
	public function update_status($id, $data)
	{
		$this->db->where('id_po_bar', $id);
		$this->db->update('po_barang', $data);
	}
}

/* End of file mTransaksiReseller.php */
