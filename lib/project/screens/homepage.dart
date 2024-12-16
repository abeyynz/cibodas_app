import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/artikel_model.dart';
import 'package:app_cibodas/model/destination_model.dart';
import 'package:app_cibodas/model/fasilitas_model.dart';
import 'package:app_cibodas/project/screens/all_destinations_page.dart';
import 'package:app_cibodas/project/screens/all_facilities_page.dart';
import 'package:app_cibodas/project/screens/detail_artikel.dart';
import 'package:app_cibodas/project/screens/detail_destination.dart';
import 'package:app_cibodas/project/screens/detail_fasilitas.dart';
import 'package:app_cibodas/project/screens/help_center_page.dart';
import 'package:app_cibodas/project/screens/restaurant_page.dart';
import 'package:app_cibodas/project/screens/ticket_page.dart';
import 'package:app_cibodas/project/widgets/app_bar.dart';
import 'package:app_cibodas/project/widgets/fasilitas.dart';
import 'package:app_cibodas/project/widgets/nav_bar.dart';
import 'package:app_cibodas/project/widgets/popular_destination.dart';
import 'package:app_cibodas/project/widgets/show_artikel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  bool isNotificationClicked = false;
  List<String> notifications = [
    'Notifikasi 1',
    'Notifikasi 2',
    'Notifikasi 3',
    'Notifikasi 4',
    // Add more notifications here
  ];

  List<TravelDestination> popular = listDestination
      .where((element) => element.category == 'popular')
      .toList();

  List<FasilitasModel> fasilitas = listFasility
      .where((element) => element.category == 'fasilitas')
      .toList();

  List<ArtikelModel> artikel= listArtikel
      .where((element) => element.category == 'artikel')
      .toList();

  List<IconData> icons = [
    Icons.home,
    Icons.restaurant_menu,
    Icons.local_activity,
    Icons.support_agent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onNotificationTap: () {
          setState(() {
            isNotificationClicked = !isNotificationClicked;
          });
          _showNotifications(context);
        },
        onProfileTap: () {
          _showProfileDialog(context);
        },
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/peta.png',
                      width: 300,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Destinasi Cibodas',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AllDestinationsPage(destinations: popular),
                                ),
                              );
                            },
                            child: const Text(
                              'Lihat Semua',
                              style: TextStyle(
                                fontSize: 13,
                                color: kButtonBrightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: List.generate(
                          popular.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetailDestinasi(destination: popular[index]),
                                  ),
                                );
                              },
                              child: PopularDestination(destination: popular[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Fasilitas Cibodas',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AllFacilitiesPage(fasilitas: fasilitas),
                                ),
                              );
                            },
                            child: const Text(
                              'Lihat Semua',
                              style: TextStyle(
                                fontSize: 13,
                                color: kButtonBrightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: List.generate(
                          popular.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetailFasilitas(fasilitas: fasilitas[index]),
                                  ),
                                );
                              },
                              child: FasilityDestination(destination: fasilitas[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Artikel Untuk Kamu',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: List.generate(
                        artikel.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailArtikel(
                                      artikel: artikel[index]),
                                ),
                              );
                            },
                            child: ShowArtikel(
                                artikel: artikel[index]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedPage: selectedPage,
        onItemTapped: (index) {
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
      ),
    );
  }

  // Function to show notifications
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
  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Nama: John Doe'),
              SizedBox(height: 8),
              Text('Nomor HP: 081234567890'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Tambahkan logika logout di sini jika diperlukan
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

Widget buildAppBar() {
  return Container(
    height: 80,
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: buildSearchButton(),
      ),
    )),
  );
}

Widget buildSearchButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: kButtonColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: const TextField(
      decoration: InputDecoration(
        hintText: 'cari destinasi...',
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 18,
        ),
        prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 12),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}
