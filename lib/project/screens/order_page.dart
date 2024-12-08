import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/payment_method_model.dart';
import 'package:app_cibodas/model/ticket_model.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final TicketModel ticket; // Data tiket yang di-pass

  const OrderPage({super.key, required this.ticket});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int ticketCount = 1; // Jumlah tiket awal
  late int totalPrice;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.ticket.price; // Total harga berdasarkan harga tiket awal
  }

  // Fungsi untuk menambah tiket
  void _increaseTicketCount() {
    setState(() {
      ticketCount++;
      totalPrice = widget.ticket.price * ticketCount;
    });
  }

  // Fungsi untuk mengurangi tiket
  void _decreaseTicketCount() {
    if (ticketCount > 1) {
      setState(() {
        ticketCount--;
        totalPrice = widget.ticket.price * ticketCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF273228),
        title: const Text('Halaman Pemesanan'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Nama',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan nama Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kButtonColor), // Mengubah warna outline saat fokus
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
              ),
              const SizedBox(height: 24),

              // Info tiket
              const Text(
                'Pesanan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
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
                    // Nama dan harga tiket
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
                            'Rp ${widget.ticket.price}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: kButtonColor,
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

            // Kolom untuk jumlah tiket
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menjaga elemen-elemen berada di kiri dan kanan
              children: [
                const Text(
                  'Jumlah Tiket: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2), // Menambah padding
                  decoration: BoxDecoration(
                    color: kButtonBrightColor.withOpacity(0.7), // Latar belakang transparan dengan warna oranye
                    borderRadius: BorderRadius.circular(50), // Membuat sudut melengkung
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: _decreaseTicketCount,
                        icon: const Icon(Icons.remove, color: Colors.white),
                      ),
                      Text(
                        '$ticketCount',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: _increaseTicketCount,
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),


            const SizedBox(height: 16),

            // Bagian Total Harga
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: kButtonBrightColor.withOpacity(0.2),
                border: Border.all(color: kButtonBrightColor), // Garis tepi berwarna oranye
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Harga:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp${totalPrice.toStringAsFixed(2)}', // Menggunakan totalPrice untuk menampilkan harga
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
              // Metode pembayaran
              const Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              ...paymentMethods.map((method) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        method.image,
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        method.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Tambahkan aksi pembayaran
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
