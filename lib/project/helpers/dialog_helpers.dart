import 'package:flutter/material.dart';

class DialogHelpers {
  static void showNotifications(BuildContext context, List<String> notifications) {
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

  static void showProfileDialog(BuildContext context, String name, String phoneNumber, VoidCallback onLogout) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: $name'),
              const SizedBox(height: 8),
              Text('Nomor HP: $phoneNumber'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tutup'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                onLogout(); // Panggil logika logout
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
