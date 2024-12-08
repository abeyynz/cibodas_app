import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/artikel_model.dart';
import 'package:flutter/material.dart';

class DetailArtikel extends StatefulWidget {
  final ArtikelModel artikel;
  const DetailArtikel({super.key, required this.artikel});

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  PageController pageController = PageController();
  int pageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar dengan tombol kembali
            buildAppBar(),

            // Gambar artikel (dengan PageView jika ada lebih dari satu gambar)
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
                      widget.artikel.image!.length,
                      (index) => Image.asset(
                        widget.artikel.image![index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  if (widget.artikel.image!.length > 1) // Indikator PageView
                    Positioned(
                      bottom: 10,
                      left: MediaQuery.of(context).size.width * 0.5 - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.artikel.image!.length,
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

            // Judul artikel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.artikel.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Diposting: ${widget.artikel.postDate}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "${widget.artikel.readTime} menit",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Isi artikel (Deskripsi dengan TabBarView)
            Expanded(
              flex: 4,
              child: DefaultTabController(
                length: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background cerah
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  widget.artikel.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Detail Artikel",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
