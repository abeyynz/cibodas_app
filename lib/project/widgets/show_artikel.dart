import 'package:app_cibodas/model/artikel_model.dart';
import 'package:app_cibodas/model/destination_model.dart';
import 'package:app_cibodas/const.dart';
import 'package:flutter/material.dart';

class ShowArtikel extends StatelessWidget {
  final ArtikelModel artikel;
  const ShowArtikel({
    super.key,
    required this.artikel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  artikel.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 14,
                    ),
                    Text(
                      artikel.description,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow[800],
                    ),
                  ],
                )
              ],
            ),
          ),
          
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(artikel.image![0]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
