<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cTransaksi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mTransaksiReseller');
	}

	public function index()
	{
		$data = array(
			'transaksi' => $this->mTransaksiReseller->transaksi()
		);
		$this->load->view('Reseller/Layout/head');
		$this->load->view('Reseller/Layout/aside');
		$this->load->view('Reseller/vTransaksi', $data);
		$this->load->view('Reseller/Layout/footer');
	}
	public function detail_transaksi($id)
	{
		$data = array(
			'transaksi' => $this->mTransaksiReseller->detail_transaksi($id)
		);
		$this->load->view('Reseller/Layout/head');
		$this->load->view('Reseller/Layout/aside');
		$this->load->view('Reseller/vDetailTransaksi', $data);
		$this->load->view('Reseller/Layout/footer');
	}
	public function bayar($id)
	{
		$config['upload_path']          = './asset/pembayaran';
		$config['allowed_types']        = 'gif|jpg|png|jpeg';
		$config['max_size']             = 50000;

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('bayar')) {
			$data = array(
				'error' => $this->upload->display_errors(),
				'transaksi' => $this->mTransaksiReseller->detail_transaksi($id)
			);
			$this->load->view('Reseller/Layout/head');
			$this->load->view('Reseller/Layout/aside');
			$this->load->view('Reseller/vDetailTransaksi', $data);
			$this->load->view('Reseller/Layout/footer');
		} else {

			$upload_data =  $this->upload->data();
			$data = array(
				'bukti_bay_bar' => $upload_data['file_name'],
				'stat_bay_bar' => '1',
				'stat_order_bar' => '1'
			);
			$this->mTransaksiReseller->bayar($id, $data);
			$this->session->set_flashdata('success', 'Transaksi Berhasil Dikirim!!!');
			redirect('Reseller/cTransaksi', 'refresh');
		}
	}
	public function pesanan_diterima($id)
	{
		$data = array(
			'stat_order_bar' => '4'
		);
		$this->mTransaksiReseller->update_status($id, $data);
		$this->session->set_flashdata('success', 'Transaksi Berhasil Diterima!!');
		redirect('Reseller/cTransaksi', 'refresh');
	}
	public function cetak($id)
	{
		// memanggil library FPDF
		require('asset/fpdf/fpdf.php');

		// intance object dan memberikan pengaturan halaman PDF
		$pdf = new FPDF('P', 'mm', 'A4');
		$pdf->AddPage();

		$pdf->SetFont('Times', 'B', 14);

		$pdf->Cell(100, 40, 'INVOICE TRANSAKSI', 0, 0, 'C');

		$transaksi = $this->mTransaksiReseller->detail_transaksi($id);

		$pdf->SetFont('Times', 'B', 10);
		$pdf->Cell(20, 7, '', 0, 1);
		$pdf->Cell(130, 6, '', 0, 0, 'C');
		$pdf->Cell(40, 6, 'Id Transaksi : ' . $transaksi['transaksi']->id_po_bar, 0, 1);
		$pdf->Cell(130, 6, '', 0, 0, 'C');
		$pdf->Cell(40, 6, 'Tanggal Transaksi: ' . $transaksi['transaksi']->tgl_tran_bar, 0, 1);
		$pdf->Cell(130, 6, '', 0, 0, 'C');
		$pdf->Cell(40, 6, 'Atas Nama: ' . $transaksi['transaksi']->nama_reseller, 0, 1);


		$pdf->SetLineWidth(0);
		$pdf->Cell(10, 20, '', 0, 1);
		$pdf->SetFont('Times', 'B', 9);
		$pdf->Cell(40, 7, 'Nama Barang', 1, 0, 'C');
		$pdf->Cell(50, 7, 'Harga', 1, 0, 'C');
		$pdf->Cell(50, 7, '	Quantity', 1, 0, 'C');
		$pdf->Cell(40, 7, 'Subtotal', 1, 0, 'C');


		$pdf->Cell(10, 7, '', 0, 1);
		$pdf->SetFont('Times', '', 10);
		$no = 1;

		foreach ($transaksi['detail'] as $key => $value) {
			$pdf->Cell(40, 7, $value->nama_barang, 1, 0, 'C');
			$pdf->Cell(50, 7, 'Rp. ' . number_format($value->harga_gudang), 1, 0, 'C');
			$pdf->Cell(50, 7, $value->qty, 1, 0, 'C');
			$pdf->Cell(40, 7, 'Rp. ' . number_format($value->harga_gudang * $value->qty), 1, 1, 'C');
		}

		$pdf->SetFont('Times', 'B', 11);

		$pdf->Cell(140, 7, '	Total Pembayaran', 1, 0, 'C');
		$pdf->Cell(40, 7, 'Rp. ' . number_format($value->tot_bay_bar), 1, 0, 'C');

		$pdf->Output();
	}
}

/* End of file cTransaksi.php */
