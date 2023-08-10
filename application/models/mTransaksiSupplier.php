<?php
defined('BASEPATH') or exit('No direct script access allowed');

class mTransaksiSupplier extends CI_Model
{
	public function select()
	{
		return $this->db->query("SELECT * FROM `po_bb` WHERE id_supplier ='" . $this->session->userdata('id') . "'")->result();
	}
	public function update_status($id, $data)
	{
		$this->db->where('id_po_bb', $id);
		$this->db->update('po_bb', $data);
	}
}

/* End of file mTransaksiSupplier.php */
