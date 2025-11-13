
import 'package:flutter/material.dart';

class NotificationsPanel extends StatelessWidget {
  final List birthdayUsers;
  final List anniversaryUsers;

  const NotificationsPanel({
    super.key,
    required this.birthdayUsers,
    required this.anniversaryUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigoAccent),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("🎂 Birthdays",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Today's: \${birthdayUsers.length}"),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: birthdayUsers.map<Widget>((u) {
            return Chip(
              avatar: CircleAvatar(backgroundImage: NetworkImage(u['img'])),
              label: Text(u['name']),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Text("Send Birthday Wishes"),
        ),
        const Divider(height: 28, thickness: 1),
        const Text("💐 Anniversaries",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Today's: \${anniversaryUsers.length}"),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: anniversaryUsers.map<Widget>((u) {
            return Chip(
              avatar: CircleAvatar(backgroundImage: NetworkImage(u['img'])),
              label: Text(u['name']),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Text("Send Anniversary Wishes"),
        ),
      ]),
    );
  }
}
