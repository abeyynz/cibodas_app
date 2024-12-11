import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/homepage.dart';
import 'package:app_cibodas/project/screens/restaurant_page.dart';
import 'package:app_cibodas/project/screens/ticket_page.dart';
import 'package:flutter/material.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  int selectedPage = 3;
  bool isNotificationClicked = false;
  List<String> notifications = [
    'Notifikasi 1',
    'Notifikasi 2',
    'Notifikasi 3',
    'Notifikasi 4',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.restaurant_menu,
    Icons.local_activity,
    Icons.support_agent,
  ];

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> faqs = [
    {
      'question': 'Bagaimana cara membeli tiket?',
      'answer':
          'Untuk membeli tiket, pilih tiket yang diinginkan dan ikuti langkah-langkah pembayarannya.',
    },
    {
      'question': 'Kenapa pembayaran saya gagal?',
      'answer':
          'Jika pembayaran gagal, pastikan saldo cukup dan jaringan internet stabil.',
    },
    {
      'question': 'Bagaimana cara mengubah pemesanan?',
      'answer':
          'Untuk mengubah pemesanan, silakan hubungi customer service kami.',
    },
  ];

  List<Map<String, String>> filteredFaqs = [];

  @override
  void initState() {
    super.initState();
    filteredFaqs = faqs;
  }

  // Fungsi untuk mencari FAQ
  void _filterFAQs() {
    setState(() {
      filteredFaqs = faqs
          .where((faq) => faq['question']!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  // Fungsi untuk mengirim masalah
  void _sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      // Kirim pesan ke server atau lakukan aksi sesuai kebutuhan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pesan Anda telah dikirim!')),
      );
      _messageController.clear(); // Kosongkan textfield setelah pengiriman
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 1.0),
          child: Image.asset(
            'assets/logo.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: const Color(0xFF273228),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isNotificationClicked = !isNotificationClicked;
              });
              _showNotifications(context);
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bar pencarian FAQ
            TextField(
              controller: _searchController,
              onChanged: (value) => _filterFAQs(),
              decoration: InputDecoration(
                labelText: 'Cari masalah...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kButtonColor, // Warna border saat fokus
                    width: 2, // Lebar border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kButtonColor, // Warna border saat TextField fokus
                    width: 2, // Lebar border
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color:
                        Colors.grey, // Warna border saat TextField tidak fokus
                    width: 2, // Lebar border
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Daftar FAQ dengan dropdown
            Expanded(
              child: ListView.builder(
                itemCount: filteredFaqs.length,
                itemBuilder: (context, index) {
                  final faq = filteredFaqs[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16), // Jarak antar item
                    decoration: BoxDecoration(
                      color: kButtonBrightColor, // Latar belakang
                      borderRadius: BorderRadius.circular(
                          12), // Border radius untuk sisi-sisi
                    ),
                    child: ExpansionTile(
                      title: Text(
                        faq['question']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      collapsedIconColor: Colors.orange,
                      iconColor: Colors.orange,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            faq['answer']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Form kirim pesan
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Warna latar belakang form
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tidak menemukan masalah Anda? Kirimkan pesan:',
                      style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _messageController,
                    maxLines: 4, // Menambah tinggi TextField
                    decoration: InputDecoration(
                      hintText: 'Ketik masalah atau pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: kButtonColor, // Warna border saat fokus
                          width: 2, // Lebar border
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color:
                              kButtonColor, // Warna border saat TextField fokus
                          width: 2, // Lebar border
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Tombol di sebelah kanan
                    children: [
                      ElevatedButton(
                        onPressed: _sendMessage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              kButtonColor, // Warna background hijau
                          foregroundColor: Colors.orange, // Warna teks oranye
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Kirim'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: const BoxDecoration(
          color: Color(0xFF273228),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = index;
                });
                // Navigasi berdasarkan ikon yang dipilih
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RestaurantPage(),
                    ),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TicketPage(),
                    ),
                  );
                } else if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HelpCenterPage(),
                    ),
                  );
                }
              },
              child: Icon(
                icons[index],
                size: 32,
                color: selectedPage == index
                    ? iconColor// Warna aktif
                    : Colors.white.withOpacity(0.4), // Warna tidak aktif
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifikasi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              notifications.length,
              (index) => ListTile(
                title: Text(notifications[index]),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
