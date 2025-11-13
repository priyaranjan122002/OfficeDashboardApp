
import 'package:flutter/material.dart';

class TopCreatorsTable extends StatelessWidget {
  const TopCreatorsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      {'name': 'Aisha Khan', 'rating': '4.9', 'img': 'https://i.pravatar.cc/100?img=21'},
      {'name': 'Rajat Gupta', 'rating': '4.7', 'img': 'https://i.pravatar.cc/100?img=22'},
      {'name': 'Meera Joshi', 'rating': '4.8', 'img': 'https://i.pravatar.cc/100?img=23'},
      {'name': 'Neha Verma', 'rating': '4.6', 'img': 'https://i.pravatar.cc/100?img=24'},
    ];

    return Container(
      decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("👩‍🎨 Top Creators", style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 12),
        ...creators.map((c) => Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.blue.shade800, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            CircleAvatar(backgroundImage: NetworkImage(c['img']!), radius: 22),
            const SizedBox(width: 10),
            Expanded(flex: 3, child: Text(c['name']!, style: const TextStyle(color: Colors.white))),
            Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text("Artworks", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text("Digital UI Concepts", style: TextStyle(color: Colors.white, fontSize: 13)),
            ])),
            Expanded(flex: 1, child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const Text("Rating", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(c['rating']!, style: const TextStyle(color: Colors.white)),
              ])
            ])),
          ]),
        )).toList(),
      ]),
    );
  }
}
