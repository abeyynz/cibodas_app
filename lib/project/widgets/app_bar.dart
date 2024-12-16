import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;
  final PreferredSizeWidget? bottom;
  
  const CustomAppBar({
    Key? key,
    required this.onNotificationTap,
    required this.onProfileTap, this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: onNotificationTap,
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onProfileTap,
          icon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    // Hitung tinggi AppBar dengan tambahan tinggi bottom
    final double height = kToolbarHeight + (bottom?.preferredSize.height ?? 0);
    return Size.fromHeight(height);
  }
}
