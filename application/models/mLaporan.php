<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mLaporan extends CI_Model
{


	//laporan transaksi

	public function lap_harian_transaksi($tanggal, $bulan, $tahun)
	{
		$this->db->select('*');
		$this->db->from('po_bb');
		$this->db->join('supplier', 'po_bb.id_supplier = supplier.id_supplier', 'left');
		$this->db->where('po_bb.status_order=4');
		$this->db->where('DAY(po_bb.tgl_transaksi)', $tanggal);
		$this->db->where('MONTH(po_bb.tgl_transaksi)', $bulan);
		$this->db->where('YEAR(po_bb.tgl_transaksi)', $tahun);
		return $this->db->get()->result();
	}
	public function lap_bulanan_transaksi($bulan, $tahun)
	{

		$this->db->select('*');
		$this->db->from('po_bb');
		$this->db->join('supplier', 'po_bb.id_supplier = supplier.id_supplier', 'left');
		$this->db->where('po_bb.status_order=4');
		$this->db->where('MONTH(po_bb.tgl_transaksi)', $bulan);
		$this->db->where('YEAR(po_bb.tgl_transaksi)', $tahun);
		return $this->db->get()->result();
	}
	public function lap_tahunan_transaksi($tahun)
	{
		$this->db->select('*');
		$this->db->from('po_bb');
		$this->db->join('supplier', 'po_bb.id_supplier = supplier.id_supplier', 'left');
		$this->db->where('po_bb.status_order=4');
		$this->db->where('YEAR(po_bb.tgl_transaksi)', $tahun);
		return $this->db->get()->result();
	}
}

/* End of file mLaporan.php */
