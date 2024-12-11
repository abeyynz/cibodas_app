import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/help_center_page.dart';
import 'package:app_cibodas/project/screens/detail_restaurant.dart';
import 'package:app_cibodas/project/screens/homepage.dart';
import 'package:app_cibodas/project/screens/ticket_page.dart';
import 'package:app_cibodas/project/widgets/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:app_cibodas/model/restaurant_model.dart';  // Pastikan ini sudah benar

class RestaurantPage extends StatefulWidget {
  // final List<RestaurantModel> restaurant;
  const RestaurantPage({super.key});
  
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  String searchQuery = "";
  late List<RestaurantModel> filteredRestaurants;
  int selectedPage = 1;
  bool isNotificationClicked = false;
  TextEditingController searchController = TextEditingController();
  List<String> notifications = [
    'Notifikasi 1',
    'Notifikasi 2',
    'Notifikasi 3',
    'Notifikasi 4',
  ];

  List<RestaurantModel> restaurant= listRestaurant
      .where((element) => element.category == 'restaurant')
      .toList();

  List<IconData> icons = [
    Icons.home,
    Icons.restaurant_menu,  
    Icons.local_activity,
    Icons.support_agent,
  ];

  
  @override
  void initState() {
    super.initState();
    filteredRestaurants = restaurant; // Tampilkan semua restoran awalnya
  }

  void _filterRestaurants(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredRestaurants = restaurant
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(searchQuery))
          .toList();
    });
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
              color: Colors.white, // Ganti dengan logika warna jika diperlukan
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: <Widget>[
          // Search Bar with green style
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
              child: TextField(
                onChanged: _filterRestaurants,
                decoration: const InputDecoration(
                  hintText: 'Cari Restaurant...',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          // Grid of Destinations
          Expanded(
            child: filteredRestaurants.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: filteredRestaurants.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Dua kolom per baris
                      mainAxisSpacing: 10, // Jarak antar baris
                      crossAxisSpacing: 10, // Jarak antar kolom
                      childAspectRatio: 0.95, // Proporsi tinggi item
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailRestaurant(
                                  restaurant: filteredRestaurants[index]),
                            ),
                          );
                        },
                        child: Restaurant(
                          restaurant: filteredRestaurants[index],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Restaurant tidak ditemukan.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            decoration: const BoxDecoration(
              color: Color(0xFF273228), // Gunakan warna yang sama dengan AppBar
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
                    }
                    else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RestaurantPage(),
                        ),
                      );
                    }
                    else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TicketPage(),
                        ),
                      );
                    }
                    else if (index == 3) {
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
        ],
      ),
    );
  }
  // void filterRestaurants(String query) {
  //   setState(() {
  //     if (query.isEmpty) {
  //       filteredRestaurants = restaurant;
  //     } else {
  //       filteredRestaurants = restaurant.where((resto) {
  //         return resto.name.toLowerCase().contains(query.toLowerCase());
  //       }).toList();
  //     }
  //   });
  // }
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


