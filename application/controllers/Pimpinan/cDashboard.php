<?php
defined('BASEPATH') or exit('No direct script access allowed');

class cDashboard extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('mLaporan');
	}

	public function index()
	{
		$this->load->view('Pimpinan/Layout/head');
		$this->load->view('Pimpinan/Layout/aside');
		$this->load->view('Pimpinan/vDashboard');
		$this->load->view('Pimpinan/Layout/footer');
	}
	public function lap_harian_transaksi()
	{
		$tanggal = $this->input->post('tanggal');
		$bulan = $this->input->post('bulan');
		$tahun = $this->input->post('tahun');

		// memanggil library FPDF
		require('asset/fpdf/fpdf.php');

		// intance object dan memberikan pengaturan halaman PDF
		$pdf = new FPDF('P', 'mm', 'A4');
		$pdf->AddPage();

		$pdf->SetFont('Times', 'B', 14);

		$pdf->Cell(200, 40, 'LAPORAN TRANSAKSI HARIAN', 0, 0, 'C');
		$pdf->SetLineWidth(0);
		$pdf->Cell(10, 30, '', 0, 1);
		$pdf->SetFont('Times', 'B', 9);
		$pdf->Cell(30, 7, 'Id Transaksi', 1, 0, 'C');
		$pdf->Cell(50, 7, 'Tanggal Transaksi', 1, 0, 'C');
		$pdf->Cell(50, 7, '	Atas Nama', 1, 0, 'C');
		$pdf->Cell(40, 7, 'Total Bayar', 1, 0, 'C');


		$pdf->Cell(10, 7, '', 0, 1);
		$pdf->SetFont('Times', '', 10);
		$no = 1;


		$data = $this->mLaporan->lap_harian_transaksi($tanggal, $bulan, $tahun);
		foreach ($data as $key => $value) {


			$pdf->Cell(30, 6, $value->id_po_bb, 1, 0, 'C');
			$pdf->Cell(50, 6, $value->tgl_transaksi, 1, 0);
			$pdf->Cell(50, 6, $value->nama_supplier, 1, 0);
			$pdf->Cell(40, 6, 'Rp.' . number_format($value->total_bayar), 1, 1);
		}
		$pdf->Output();

		// $data = array(
		// 	'tanggal' => $tanggal,
		// 	'bulan' => $bulan,
		// 	'tahun' => $tahun,
		// 	'laporan' => $this->mLaporan->lap_harian_transaksi($tanggal, $bulan, $tahun)
		// );
		// $this->load->view('Pemilik/Layouts/head');
		// $this->load->view('Pemilik/LaporanTransaksi/harian', $data);
		// $this->load->view('Pemilik/Layouts/footer');
	}
	public function lap_bulanan_transaksi()
	{
		$bulan = $this->input->post('bulan');
		$tahun = $this->input->post('tahun');

		// memanggil library FPDF
		require('asset/fpdf/fpdf.php');

		// intance object dan memberikan pengaturan halaman PDF
		$pdf = new FPDF('P', 'mm', 'A4');
		$pdf->AddPage();

		$pdf->SetFont('Times', 'B', 14);

		$pdf->Cell(200, 40, 'LAPORAN TRANSAKSI BULANAN', 0, 0, 'C');
		$pdf->SetLineWidth(0);
		$pdf->Cell(10, 30, '', 0, 1);
		$pdf->SetFont('Times', 'B', 9);
		$pdf->Cell(30, 7, 'Id Transaksi', 1, 0, 'C');
		$pdf->Cell(50, 7, 'Tanggal Transaksi', 1, 0, 'C');
		$pdf->Cell(50, 7, '	Atas Nama', 1, 0, 'C');
		$pdf->Cell(40, 7, 'Total Bayar', 1, 0, 'C');


		$pdf->Cell(10, 7, '', 0, 1);
		$pdf->SetFont('Times', '', 10);
		$no = 1;


		$data = $this->mLaporan->lap_bulanan_transaksi($bulan, $tahun);
		foreach ($data as $key => $value) {


			$pdf->Cell(30, 6, $value->id_po_bb, 1, 0, 'C');
			$pdf->Cell(50, 6, $value->tgl_transaksi, 1, 0);
			$pdf->Cell(50, 6, $value->nama_supplier, 1, 0);
			$pdf->Cell(40, 6, 'Rp.' . number_format($value->total_bayar), 1, 1);
		}
		$pdf->Output();

		// $data = array(
		// 	'bulan' => $bulan,
		// 	'tahun' => $tahun,
		// 	'laporan' => $this->mLaporan->lap_bulanan_transaksi($bulan, $tahun)
		// );
		// $this->load->view('Pemilik/Layouts/head');
		// $this->load->view('Pemilik/LaporanTransaksi/bulanan', $data);
		// $this->load->view('Pemilik/Layouts/footer');
	}
	public function lap_tahunan_transaksi()
	{
		$tahun = $this->input->post('tahun');

		// memanggil library FPDF
		require('asset/fpdf/fpdf.php');

		// intance object dan memberikan pengaturan halaman PDF
		$pdf = new FPDF('P', 'mm', 'A4');
		$pdf->AddPage();

		$pdf->SetFont('Times', 'B', 14);

		$pdf->Cell(200, 40, 'LAPORAN TRANSAKSI TAHUNAN', 0, 0, 'C');
		$pdf->SetLineWidth(0);
		$pdf->Cell(10, 30, '', 0, 1);
		$pdf->SetFont('Times', 'B', 9);
		$pdf->Cell(30, 7, 'Id Transaksi', 1, 0, 'C');
		$pdf->Cell(50, 7, 'Tanggal Transaksi', 1, 0, 'C');
		$pdf->Cell(50, 7, '	Atas Nama', 1, 0, 'C');
		$pdf->Cell(40, 7, 'Total Bayar', 1, 0, 'C');


		$pdf->Cell(10, 7, '', 0, 1);
		$pdf->SetFont('Times', '', 10);
		$no = 1;


		$data = $this->mLaporan->lap_tahunan_transaksi($tahun);
		foreach ($data as $key => $value) {


			$pdf->Cell(30, 6, $value->id_po_bb, 1, 0, 'C');
			$pdf->Cell(50, 6, $value->tgl_transaksi, 1, 0);
			$pdf->Cell(50, 6, $value->nama_supplier, 1, 0);
			$pdf->Cell(40, 6, 'Rp.' . number_format($value->total_bayar), 1, 1);
		}
		$pdf->Output();

		// $data = array(
		// 	'tahun' => $tahun,
		// 	'laporan' => $this->mLaporan->lap_tahunan_transaksi($tahun)
		// );
		// $this->load->view('Pemilik/Layouts/head');
		// $this->load->view('Pemilik/LaporanTransaksi/tahunan', $data);
		// $this->load->view('Pemilik/Layouts/footer');
	}
}

/* End of file cDashboard.php */
