import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/model/destination_model.dart';
import 'package:flutter/material.dart';

class DetailDestinasi extends StatefulWidget {
  final TravelDestination destination;
  const DetailDestinasi({super.key, required this.destination});

  @override
  State<DetailDestinasi> createState() => _DetailDestinasiState();
}

class _DetailDestinasiState extends State<DetailDestinasi> {
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
                            widget.destination.image!.length,
                            (index) => Image.asset(
                              fit: BoxFit.cover,
                              widget.destination.image![index],
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
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: const TabBar(
                      labelColor: kButtonColor,
                      labelStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      // unselectedLabelColor: kButtonColor,
                      // indicatorColor: dTextColor,
                      // dividerColor: Colors.transparent,
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
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.destination.description,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Kontak Kami",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
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
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 80,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(15),
          //         topRight: Radius.circular(15),
          //       ),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'Harga',
          //                 style: TextStyle(
          //                   fontSize: 15,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         TextButton(
          //           onPressed: () {},
          //           child: Container(
          //             padding: EdgeInsets.symmetric(
          //               horizontal: 15,
          //               vertical: 15,
          //             ),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15),
          //               color: kButtonColor,
          //             ),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.shopping_cart_outlined,
          //                   color: Colors.white,
          //                   size: 14,
          //                 ),
          //                 SizedBox(
          //                   width: 5,
          //                 ),
          //                 Text(
          //                   'Masukkan Keranjang',
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w600,
          //                     color: Colors.white,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
            "Detail Destinasi",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.all(5),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.black12),
        //   ),
        //   child: const Icon(
        //     Icons.bookmark_border_rounded,
        //     size: 30,
        //   ),
        // ),
      ],
    );
  }
}
