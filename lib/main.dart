import 'package:app_cibodas/project/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class BelajarNavBar extends StatefulWidget {
  const BelajarNavBar({super.key});

  @override
  _BelajarNavBarState createState() => _BelajarNavBarState();
}

class _BelajarNavBarState extends State<BelajarNavBar> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CIBODAS KEBUN RAYA',
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF273228), // Dark green color from the image
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.notifications,
              color: Color(0xFFCC7F3F), // Orange color for the icon
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("Tab Index yang aktif : $_selectedNavbar",
            style: const TextStyle(fontSize: 16)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF273228), // Dark green 
        type: BottomNavigationBarType.fixed, 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Color(0xFFCC7F3F), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu), 
            label: 'Kuliner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity), 
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent), 
            label: 'Bantuan',
          ),
        ],
        currentIndex: 0, 
        selectedItemColor: const Color(0xFFCC7F3F), // Orange for the selected item
        unselectedItemColor: Colors.white, // White for unselected items
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}