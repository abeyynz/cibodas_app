import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailPage extends StatelessWidget {
  final dynamic ticket; // Objek tiket
  final int ticketCount; // Jumlah tiket
  final int totalPrice; // Total harga
  final String userName; // Nama user
  final String paymentMethod; // Metode pembayaran

  const TicketDetailPage({
    super.key,
    required this.ticket,
    required this.ticketCount,
    required this.totalPrice,
    required this.userName,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tiket'),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF273228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Tiket
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(10)),
                    child: Image.asset(
                      ticket.imagePath, // Path gambar tiket
                      width: 180,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket.name, // Nama tiket
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Jumlah: $ticketCount"),
                          Text("Total: Rp$totalPrice"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Nama User
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nama:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  userName, // Nama user
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Metode Pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Metode Pembayaran:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  paymentMethod, // Metode pembayaran
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // QR Code
            Center(
  child: Column(
    children: [
      const Text(
        'QR Code',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      QrImageView(
        data: ' Jumlah: $ticketCount, Total: Rp$totalPrice, Nama: $userName, Metode: $paymentMethod',
        version: QrVersions.auto,
        size: 250.0,
        backgroundColor: Colors.white,
      ),
    ],
  ),
)

          ],
        ),
      ),
    );
  }
}
