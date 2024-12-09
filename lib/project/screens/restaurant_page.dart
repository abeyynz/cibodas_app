import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/detail_restaurant.dart';
import 'package:app_cibodas/project/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:app_cibodas/model/restaurant_model.dart';  // Pastikan ini sudah benar

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});
  
  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
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
  
  List<RestaurantModel> filteredRestaurants = [];

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
              color: Colors.white, // Ganti dengan logika warna jika diperlukan
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
      // Tambahkan tombol pencarian di bagian atas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: buildSearchButton(),
            ),
            // Menampilkan grid restoran
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: filteredRestaurants.length,  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dua kolom per baris
                    mainAxisSpacing: 10, // Spasi antar baris
                    crossAxisSpacing: 10, // Spasi antar kolom
                    childAspectRatio: 0.9, // Mengatur ukuran item agar lebih tinggi
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailRestaurant(restaurant: filteredRestaurants[index]),
                          ),
                        );// Menambahkan aksi ketika restoran dipilih
                      },
                      child: Card(
                        elevation: 4,
                        color: kButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                               child: Image.asset(
                                filteredRestaurants[index].image != null &&
                                        filteredRestaurants[index]
                                            .image!
                                            .isNotEmpty
                                    ? filteredRestaurants[index].image![0]
                                    : "assets/default_image.jpg",
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                filteredRestaurants[index].name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
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
            ),

            // Menu navigasi di bawah halaman
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
                    },
                    child: Icon(
                      icons[index],
                      size: 32,
                      color: selectedPage == index
                          ? Colors.orange // Warna aktif
                          : Colors.white.withOpacity(0.4), // Warna tidak aktif
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void filterRestaurants(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRestaurants = restaurant;
      } else {
        filteredRestaurants = restaurant.where((resto) {
          return resto.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
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

// Widget buildSearchButton() {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//     decoration: BoxDecoration(
//       color: kButtonColor,
//       borderRadius: BorderRadius.circular(20),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.8),
//           spreadRadius: 2,
//           blurRadius: 10,
//           offset: const Offset(0, 5),
//         ),
//       ],
//     ),
//     child: const TextField(
//       decoration: InputDecoration(
//         hintText: 'cari restaurant...',
//         hintStyle: TextStyle(
//           color: Colors.white54,
//           fontSize: 18,
//         ),
//         prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.symmetric(vertical: 12),
//       ),
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 18,
//       ),
//     ),
//   );
// }
