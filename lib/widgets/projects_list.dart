
import 'package:flutter/material.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {'title': 'Alpha System', 'progress': '80%', 'img': 'https://i.pravatar.cc/60?img=12'},
      {'title': 'Beta Launch', 'progress': '65%', 'img': 'https://i.pravatar.cc/60?img=13'},
      {'title': 'Gamma Build', 'progress': '95%', 'img': 'https://i.pravatar.cc/60?img=14'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("📁 All Projects", style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 12),
        ...projects.map((p) => Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.indigo.shade800, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            CircleAvatar(backgroundImage: NetworkImage(p['img']!), radius: 24),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("Project #1", style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Text("See Project Details", style: TextStyle(color: Colors.amberAccent, fontSize: 12)),
            ])),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.white))
          ]),
        )).toList(),
      ]),
    );
  }
}
