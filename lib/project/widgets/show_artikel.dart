import 'package:app_cibodas/model/artikel_model.dart';
import 'package:flutter/material.dart';

class ShowArtikel extends StatelessWidget {
  final ArtikelModel artikel;
  const ShowArtikel({
    super.key,
    required this.artikel,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0), // Margin horizontal untuk title
                  child: Text(
                    artikel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0), // Margin horizontal untuk deskripsi
                  child: Text(
                    artikel.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
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
                image: AssetImage(artikel.image![0]),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
