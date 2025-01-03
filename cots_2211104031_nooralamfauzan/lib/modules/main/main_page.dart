import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Find services, food, or places",
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Gopay Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rp 43.434",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "12 XP to your next treasure",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const Icon(Icons.qr_code, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _GopayIcon(
                        image: 'assets/img/go-pulsa.png', label: "Top Up"),
                    _GopayIcon(image: 'assets/img/Go-ride.png', label: "Pay"),
                    _GopayIcon(
                        image: 'assets/img/Go-send.png', label: "Explore"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Services Section
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _ServiceIcon(image: 'assets/img/Go-ride.png', label: "GoRide"),
              _ServiceIcon(image: 'assets/img/Go-car.png', label: "GoCar"),
              _ServiceIcon(image: 'assets/img/Go-food.png', label: "GoFood"),
              _ServiceIcon(image: 'assets/img/Go-send.png', label: "GoSend"),
              _ServiceIcon(image: 'assets/img/go-pulsa.png', label: "GoPulsa"),
              _ServiceIcon(image: 'assets/img/Go-mart.png', label: "GoMart"),
              _ServiceIcon(image: 'assets/img/Go-club.png', label: "GoClub"),
              _ServiceIcon(image: 'assets/img/lainnya.png', label: "More"),
            ],
          ),

          const SizedBox(height: 20),

          // Promos Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  8.0), // You can adjust the padding values here
              child: const Text(
                "Restos near me",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _PromoCard(
            imageUrl: 'assets/img/card-1.png',
            title: "Makin Seru",
            description: "Aktifkan sambungkan Gopay di Tokopedia",
          ),
          _PromoCard(
            imageUrl: 'assets/img/card-1.png',
            title: "Makin Seru",
            description: "Sambungkan akun ke Tokopedia, banyak untung!",
          ),
          _PromoCard(
            imageUrl: 'assets/img/card-1.png',
            title: "Bayar Apa Aja",
            description: "Lebih hemat pakai Gopay!",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Personal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
        ],
      ),
    );
  }
}

class _GopayIcon extends StatelessWidget {
  final String image;
  final String label;

  const _GopayIcon({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 40, width: 40), // Increased size
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final String image;
  final String label;

  const _ServiceIcon({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image, height: 40, width: 40), // Increased size
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const _PromoCard({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
