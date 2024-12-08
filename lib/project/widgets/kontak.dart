import 'package:flutter/material.dart';

class KontakKami extends StatelessWidget {
final String kontak;
const KontakKami({super.key, required this.kontak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontak Kami"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Jl. Kebun Raya Cibodas, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat, 43253",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.phone, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "(+62) 812-2466-7108",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.email, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "info@cibodas.id",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
