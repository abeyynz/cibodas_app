import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class DetailRestaurant extends StatefulWidget {
  final RestaurantModel restaurant;

  const DetailRestaurant({super.key, required this.restaurant});

  @override
  State<DetailRestaurant> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  PageController pageController = PageController();
  int pageView = 0;

  @override
  void initState() {
    super.initState();
    // Memulai animasi autoplay untuk gambar
    Future.delayed(Duration.zero, () {
      if (widget.restaurant.image!.length > 1) {
        _autoScrollImages();
      }
    });
  }

  void _autoScrollImages() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (pageController.hasClients) {
        int nextPage = (pageView + 1) % widget.restaurant.image!.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          pageView = nextPage;
        });
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        backgroundColor: kButtonColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar dengan scroll horizontal
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        pageView = value;
                      });
                    },
                    children: List.generate(
                      widget.restaurant.image!.length,
                      (index) => Image.asset(
                        widget.restaurant.image![index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  if (widget.restaurant.image!.length > 1) // Indikator PageView
                    Positioned(
                      bottom: 10,
                      left: MediaQuery.of(context).size.width * 0.5 - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.restaurant.image!.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: pageView == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: pageView == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Nama tempat
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama destinasi
                  Text(
                    widget.restaurant.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  // Ikon lokasi dan teks lokasi
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.restaurant.location,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue, // Warna teks berbeda
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Deskripsi
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.restaurant.description,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              height: 1.5,
                            ),
                        ),
                        const SizedBox(height: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kontak Kami",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 20, color: Colors.black),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Jl. Kebun Raya Cibodas, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat, 43253",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.phone, size: 20, color: Colors.black),
                                SizedBox(width: 8),
                                Text(
                                  "(+62) 812-2466-7108",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.email, size: 20, color: Colors.black),
                                SizedBox(width: 8),
                                Text(
                                  "info@cibodas.id",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
