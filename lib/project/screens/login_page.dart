import 'package:app_cibodas/const.dart';
import 'package:app_cibodas/project/screens/homepage.dart';
import 'package:app_cibodas/project/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi untuk login dan memvalidasi data dari SharedPreferences
  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();

    // Ambil data dari SharedPreferences
    final savedPhone = prefs.getString('phone');
    final savedPassword = prefs.getString('password');

    if (_phoneController.text == savedPhone &&
        _passwordController.text == savedPassword) {
      // Simpan nama dan nomor HP pengguna
      await prefs.setString('name', 'Tria'); // Ganti dengan nama sesuai kebutuhan
      await prefs.setString('phoneNumber', _phoneController.text);

      // Jika login berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Berhasil!')),
      );

      // Navigasi ke HomePage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Gagal. Periksa kembali data Anda.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 175),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kButtonBrightColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/logokecil.png',
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Masuk ke Akun Anda",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildTextField(
                      controller: _phoneController,
                      label: "Nomor Telepon",
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _passwordController,
                      label: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _login, // Panggil fungsi _login
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Belum punya akun? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.orange,
      style: const TextStyle(
        color: Colors.white, // Mengubah warna teks menjadi putih
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.orange),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
         
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
    );
  }
}
