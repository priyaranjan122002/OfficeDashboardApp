import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Top Rated Project Demo',
      home: const Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(child: DashboardHome()),
      ),
    );
  }
}

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          TopRatedProjectCard(),
        ],
      ),
    );
  }
}

class Shape3D extends StatelessWidget {
  final Color color;
  final BoxShape shape;
  final double size;

  const Shape3D({
    super.key,
    required this.color,
    required this.shape,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: shape,
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(3, 3),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.white24,
            offset: Offset(-3, -3),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}

class TopRatedProjectCard extends StatelessWidget {
  const TopRatedProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(6, 6),
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "⭐ Top Rated Project",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Smart Inventory Management (Team Alpha • 4.9)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Shape3D(color: Colors.yellow, shape: BoxShape.circle),
              SizedBox(width: 12),
              Shape3D(color: Colors.green, shape: BoxShape.rectangle),
              SizedBox(width: 12),
              Shape3D(color: Colors.blue, shape: BoxShape.rectangle),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Learn More"),
          ),
        ],
      ),
    );
  }
}
