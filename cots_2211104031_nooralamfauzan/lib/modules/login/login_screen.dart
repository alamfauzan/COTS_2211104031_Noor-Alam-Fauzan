import 'package:cots_2211104031_nooralamfauzan/design_system/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(
              'assets/img/gojeklogo.png', // Ganti dengan path logo Gojek Anda
              height: 30,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {
              // Tambahkan aksi untuk ikon bantuan
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Bantuan tidak tersedia saat ini")),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Masukkan nomor ponsel yang terdaftar untuk masuk",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nomor Ponsel *",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "+62",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      VerticalDivider(thickness: 1, color: Colors.grey),
                    ],
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 60, maxHeight: 20),
                hintText: "81234567890",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Silakan hubungi layanan pelanggan")),
                );
              },
              child: const Text(
                "Nomor bermasalah?",
                style: TextStyle(color: Colors.green),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Ganti Mainpage dengan halaman utama aplikasi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Scaffold(body: Center(child: Text("Main Page")))),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greyMedium,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                "Lanjutkan",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
