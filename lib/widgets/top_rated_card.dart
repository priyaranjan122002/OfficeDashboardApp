
import 'package:flutter/material.dart';

class TopRatedProjectCard extends StatelessWidget {
  const TopRatedProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF001F3F), Color(0xFFFF7A00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(6, 6), blurRadius: 18),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white24,
                boxShadow: const [
                  BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(5,5))
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white24,
                boxShadow: const [
                  BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(5,5))
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("⭐ Top Rated Project", style: TextStyle(color: Colors.white, fontSize: 22)),
              const SizedBox(height: 8),
              const Text("Smart Inventory Management (Team Alpha • 4.9)", style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 16),
              Row(
                children: const [
                  _Shape3D(color: Colors.yellow, shape: BoxShape.circle),
                  SizedBox(width: 10),
                  _Shape3D(color: Colors.green, shape: BoxShape.rectangle),
                  SizedBox(width: 10),
                  _Shape3D(color: Colors.blue, shape: BoxShape.rectangle),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFFFF7A00),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Learn More"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// helper shape widget
class _Shape3D extends StatelessWidget {
  final Color color;
  final BoxShape shape;
  const _Shape3D({required this.color, required this.shape});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(3, 4))
        ],
      ),
    );
  }
}
