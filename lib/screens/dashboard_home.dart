
import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/notifications_panel.dart';
import '../widgets/search_bar.dart';
import '../widgets/top_rated_card.dart';
import '../widgets/projects_list.dart';
import '../widgets/top_creators.dart';
import '../widgets/performance_chart.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int selectedMenuIndex = 0;
  bool showNotifications = false;
  DateTime selectedDate = DateTime.now();

  final birthdayUsers = [
    {'name': 'Alice', 'img': 'https://i.pravatar.cc/100?img=1'},
    {'name': 'Bob', 'img': 'https://i.pravatar.cc/100?img=2'},
    {'name': 'Charlie', 'img': 'https://i.pravatar.cc/100?img=3'},
  ];

  final anniversaryUsers = [
    {'name': 'David', 'img': 'https://i.pravatar.cc/100?img=4'},
    {'name': 'Eva', 'img': 'https://i.pravatar.cc/100?img=5'},
  ];

  final menuItems = [
    'Home',
    'Employees',
    'Attendance',
    'Summary',
    'Information',
    'Workplaces +',
    'AdStack >',
    'Finance >',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 220,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=47'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Admin Login',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      final isSelected = selectedMenuIndex == index;

                      return ListTile(
                        title: Text(item, style: const TextStyle(fontSize: 16)),
                        selected: isSelected,
                        selectedTileColor: Colors.indigo.shade50,
                        onTap: () {
                          setState(() {
                            selectedMenuIndex = index;
                            showNotifications = false;
                          });
                        },
                      );
                    },
                  ),
                ),

                const Divider(height: 1),

                ListTile(leading: const Icon(Icons.settings), title: const Text("Settings")),
                ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout", style: TextStyle(color: Colors.red))),
              ],
            ),
          ),

          Expanded(
            child: Column(
              children: [
                TopBar(
                  showNotifications: showNotifications,
                  birthdayUsers: birthdayUsers,
                  anniversaryUsers: anniversaryUsers,
                  onNotificationToggle: () {
                    setState(() => showNotifications = !showNotifications);
                  },
                ),

                if (showNotifications)
                  NotificationsPanel(birthdayUsers: birthdayUsers, anniversaryUsers: anniversaryUsers),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SearchBarWidget(),
                        SizedBox(height: 24),
                        TopRatedProjectCard(),
                        SizedBox(height: 32),
                        ProjectsList(),
                        SizedBox(height: 32),
                        TopCreatorsTable(),
                        SizedBox(height: 32),
                        PerformanceChart(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
