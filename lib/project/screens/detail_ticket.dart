import 'package:flutter/material.dart';

class TicketDetailPage extends StatefulWidget {
  final List<Map<String, dynamic>>? ticket; // Ubah tipe menjadi Map untuk mencocokkan penggunaannya
  const TicketDetailPage({super.key, this.ticket});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  @override
  Widget build(BuildContext context) {
    final ticket = widget.ticket; // Ambil referensi ke widget.ticket

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF273228),
        title: const Text("Detail Tiket"),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ticket == null || ticket.isEmpty
          ? Center(child: const Text('Data tiket tidak tersedia.')) // Tampilkan pesan jika tiket null
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar tiket
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      ticket![0]['imagePath'], // Gambar tiket
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Informasi tiket
                  Text(
                    ticket![0]['name'],
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ticket![0]['description'],
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Divider(height: 32, thickness: 1, color: Colors.grey),
                  // Harga dan metode pembayaran
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Harga",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp${ticket![0]['price']}/orang",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Metode Pembayaran",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ticket![0]['paymentMethod'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // QR Code
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Scan Pembayaran",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/qris.png', // Gambar QR Code statis
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Tip: Perlihatkan scan kepada loket pembayaran",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Informasi kontak
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "KONTAK KAMI",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Alamat: Jl. Kebun Raya Cibodas, Sukaresmi, Kab. Cianjur",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Telepon: (+62) 263-512233",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Email: info@cibodas.id",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
