import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/ticket_model.dart';
import 'package:app_cibodas/project/screens/help_center_page.dart';
import 'package:app_cibodas/project/screens/homepage.dart';
import 'package:app_cibodas/project/screens/order_page.dart';
import 'package:app_cibodas/project/screens/restaurant_page.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  final List<Map<String, dynamic>>? purchasedTickets;
  const TicketPage({super.key, this.purchasedTickets});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  int selectedPage = 2;
  bool isNotificationClicked = false;
  late TabController _tabController;
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
  final List<Map<String, dynamic>> savedTickets = [];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); 
    if (widget.purchasedTickets != null) {
      savedTickets.addAll(widget.purchasedTickets!);
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
            icon: Icon(
              Icons.notifications,
              color: isNotificationClicked
                  ? const Color(0xFFCC7F3F)
                  : Colors.white,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          indicatorWeight: 3.0,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.local_activity), text: 'Tiket'),
            Tab(icon: Icon(Icons.save_alt), text: 'Simpan'),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Tiket
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderPage(ticket: ticket),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Stack(
                      alignment: Alignment
                          .bottomLeft, // Pastikan posisi di bagian bawah gambar
                      children: [
                        // Gambar Tiket
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            ticket.imagePath,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Informasi Tiket (di bagian bawah gambar)
                        Positioned(
                          bottom: 0, // Posisi di bagian bawah gambar
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                            ),
                            child: Text(
                              '${ticket.name}\n${ticket.description}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Tab Simpan
          Padding(
            padding: const EdgeInsets.all(10),
            child: savedTickets.isNotEmpty
                ? ListView.builder(
                    itemCount: savedTickets.length,
                    itemBuilder: (context, index) {
                      final ticket = savedTickets[index];
                      final ticketObj = ticket['ticket'];  // Dapatkan objek tiket
                      return Card(
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
                                ticketObj.imagePath,  // Akses imagePath dari objek tiket
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
                                      ticketObj.name,  // Akses nama tiket dari objek tiket
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Jumlah: ${ticket['ticketCount']}"),
                                    Text("Total: Rp${ticket['totalPrice']}"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Belum ada tiket tersimpan.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
          ),
        ],
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
                    ? iconColor // Warna aktif
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
