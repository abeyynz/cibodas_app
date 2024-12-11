import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final List<String> notifications;

  const NotificationDialog({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
