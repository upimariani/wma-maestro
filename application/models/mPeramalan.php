<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mPeramalan extends CI_Model
{

	//data dummy
	public function barang()
	{
		$this->db->select('*');
		$this->db->from('jenis_barang');
		$this->db->join('kategori_barang', 'jenis_barang.id_kategori = kategori_barang.id_kategori', 'left');

		$this->db->where('type=2');
		return $this->db->get()->result();
	}

	public function periode($id_bb)
	{
		return $this->db->query("SELECT SUM(qty) as qty, po_dbb.id_jenis, MONTH(tgl_transaksi) as bulan, satuan FROM `po_bb` JOIN po_dbb ON po_bb.id_po_bb=po_dbb.id_po_dbb JOIN jenis_barang ON po_dbb.id_jenis=jenis_barang.id_jenis  WHERE po_dbb.id_jenis='" . $id_bb . "' GROUP BY po_dbb.id_jenis, MONTH(tgl_transaksi)")->result();
	}
}

/* End of file mPeramalan.php */
