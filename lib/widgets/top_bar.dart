
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final bool showNotifications;
  final List birthdayUsers;
  final List anniversaryUsers;
  final VoidCallback onNotificationToggle;

  const TopBar({
    super.key,
    required this.showNotifications,
    required this.birthdayUsers,
    required this.anniversaryUsers,
    required this.onNotificationToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(
          icon: const Icon(Icons.calendar_today_outlined),
          onPressed: () async {
            // This widget is dumb in the topbar; actual date handling is in parent
            // We keep a placeholder action to avoid errors when tapped.
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
          },
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: onNotificationToggle,
            ),
            if (birthdayUsers.isNotEmpty || anniversaryUsers.isNotEmpty)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Text(
                    (birthdayUsers.length + anniversaryUsers.length).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.indigo,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ]),
    );
  }
}
