import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/artikel_model.dart';
import 'package:app_cibodas/model/destination_model.dart';
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
      body: Column(
        children: [
          buildAppBar(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 5),
                        blurRadius: 7,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
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
                              fit: BoxFit.cover,
                              widget.artikel.image![index],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(),
                            GestureDetector(
                              child: Container(
                                height: 75,
                                width: 75,
                                margin: const EdgeInsets.only(
                                    right: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:
                                        widget.artikel.image!.length - 1 !=
                                                pageView
                                            ? AssetImage(
                                                widget.artikel
                                                    .image![pageView + 1],
                                              )
                                            : AssetImage(
                                                widget.artikel.image![0],
                                              ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.7),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        widget.artikel.image!.length,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            if (pageController.hasClients) {
                                              pageController.animateToPage(
                                                  index,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeInOut);
                                            }
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            height: 4,
                                            width: 17,
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                              color: pageView == index
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.artikel.title,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            // Row(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.end,
                                            //   children: [
                                            //     const Icon(
                                            //       Icons.location_on_outlined,
                                            //       color: Colors.white,
                                            //       size: 18,
                                            //     ),
                                            //     const SizedBox(
                                            //       width: 5,
                                            //     ),
                                            //     // Text(
                                            //     //   widget.artikel.description,
                                            //     //   style: const TextStyle(
                                            //     //     fontSize: 13,
                                            //     //     color: Colors.white,
                                            //     //     fontWeight: FontWeight.w500,
                                            //     //   ),
                                            //     // ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: const TabBar(
                      labelColor: dTextColor,
                      labelStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      unselectedLabelColor: Colors.black,
                      indicatorColor: dTextColor,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          text: 'Deskripsi',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4, // Lebar gambar
                                height: 150, // Atur tinggi gambar
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(widget.artikel.image![0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10), // Jarak antara gambar dan teks
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    widget.artikel.description,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      height: 1.5,
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

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5)),
        ],
      ),
      child: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: detailAppBar(),
        ),
      )),
    );
  }

  Widget detailAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          child: Text(
            "Detail Artikel",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
