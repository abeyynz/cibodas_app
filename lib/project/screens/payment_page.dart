import 'package:app_cibodas/project/screens/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/payment_method_model.dart';
import 'package:app_cibodas/model/ticket_model.dart';

class PaymentPage extends StatefulWidget {
  final PaymentMethod selectedMethod;
  final TicketModel ticket;
  final int ticketCount;
  final int totalPrice;
  final String userName;

  const PaymentPage({
    super.key,
    required this.selectedMethod,
    required this.ticket,
    required this.ticketCount,
    required this.totalPrice,
    required this.userName,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isAgreed = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF273228),
        title: const Text('Konfirmasi Pembayaran'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Metode Pembayaran
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(
                    16), // Memberikan padding pada card agar lebih besar
                child: Row(
                  children: [
                    // Gambar metode pembayaran
                    Image.asset(
                      widget.selectedMethod.image,
                      width: 60, // Memperbesar gambar agar proporsional
                      height: 60,
                    ),
                    const SizedBox(width: 16), // Memberikan jarak antar elemen
                    // Nama metode pembayaran
                    Expanded(
                      child: Text(
                        widget.selectedMethod.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Tombol Ganti
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor, // Warna latar tombol
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8), // Ukuran tombol lebih proporsional
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Membulatkan sudut tombol
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Ganti Metode Pembayaran"),
                            content: const Text("Anda yakin ingin mengganti metode pembayaran?"),
                            actions: [
                              TextButton(
                                child: const Text("Tidak"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: const Text("Ya"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context); // Kembali ke OrderPage
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Ganti',
                        style: TextStyle(
                          color: Colors.orange, // Warna teks tombol
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card Tiket
            // Card Metode Pembayaran (Disesuaikan)
            Card(
              elevation: 4, // Memberikan bayangan agar konsisten dengan desain
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Gambar tiket
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      widget.ticket.imagePath,
                      width: 180,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Nama tiket dan jumlah
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ticket.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Jumlah: ${widget.ticketCount}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Rincian Pesanan
            const Text(
              'Rincian Pesanan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama: ${widget.userName}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.ticket.name} (x${widget.ticketCount})',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Rp${widget.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kButtonColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Warna latar belakang container
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, -2), // Bayangan ke atas
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAgreed = !isAgreed;
                    });
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isAgreed ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    child: isAgreed
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Saya telah membaca dan menyetujui syarat dan ketentuan.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // Membuat tombol sepanjang layar
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // Misalnya onPressed ada di halaman pembayaran
                onPressed: isAgreed
                    ? () {
                        // Simpan data tiket yang telah dibayar
                        final newTicket = {
                          'ticket': widget.ticket,
                          'ticketCount': widget.ticketCount,
                          'totalPrice': widget.totalPrice,
                          'userName': widget.userName,
                        };

                        // Tampilkan pesan sukses dan navigasi kembali ke TicketPage
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Anda berhasil membayar!'),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // Navigasi ke halaman TicketPage dengan data tiket yang dibeli
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TicketPage(
                              purchasedTickets: [newTicket], // Kirim tiket baru
                            ),
                          ),
                        );
                      }
                    : null,

                child: const Text(
                  'Bayar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange, // Warna teks tombol bayar
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
