<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cAnalisisDummy extends CI_Controller
{

	public function index()
	{
		echo 'Bismillah Metode WMA Data Dummy Try<br>';
		$data = $this->db->query("SELECT * FROM `data_dummy`")->result();
		foreach ($data as $key => $value) {
			echo $value->periode . ' | ' . $value->permintaan;
			echo '<br>';
		}
		echo '<hr>';

		$jumlah = 0;
		$data_limit = $this->db->query("SELECT * FROM `data_dummy` WHERE id_dummy >= 6")->result();
		foreach ($data_limit as $key => $value) {
			$data_sebelumnya = $this->db->query("SELECT * FROM `data_dummy` WHERE id_dummy < " . $value->id_dummy . " ORDER BY id_dummy DESC LIMIT 5")->result();
			$a = 1;
			foreach ($data_sebelumnya as $key => $item) {
				// echo $a++;
				$jumlah += ($item->permintaan * $a++);
			}
			echo $value->id_dummy . ' | ';
			echo $jumlah / 15;
			echo '<br>';
		}
	}
}

/* End of file cAnalisisDummy.php */
