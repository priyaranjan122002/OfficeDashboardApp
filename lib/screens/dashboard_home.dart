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
      title: 'Dashboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const DashboardHome(),
    );
  }
}

// Dashboard Home Page
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
  ];

  final anniversaryUsers = [
    {'name': 'David', 'img': 'https://i.pravatar.cc/100?img=3'},
  ];

  final menuItems = [
    'Home',
    'Employees',
    'Attendance',
    'Summary',
    'Information',
    'Workplaces +',
    'Finance >',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _sidebarMenu(),
          Expanded(
            child: Column(
              children: [
                _topBar(context),
                if (showNotifications) _notificationsPanel(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SearchBarWidget(),
                        const SizedBox(height: 24),
                        const TopRatedProjectCard(),
                        const SizedBox(height: 32),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(flex: 6, child: ProjectList()),
                            SizedBox(width: 24),
                            Expanded(flex: 4, child: TopCreatorsTable()),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const PerformanceChart(),
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

  // Sidebar Menu
  Widget _sidebarMenu() {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 40),
          const ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=47'),
            ),
            title: Text(
              'Admin Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      color: selectedMenuIndex == index
                          ? Colors.indigo
                          : Colors.black87,
                      fontWeight: selectedMenuIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  selected: selectedMenuIndex == index,
                  selectedTileColor: Colors.indigo.shade50,
                  onTap: () => setState(() => selectedMenuIndex = index),
                );
              },
            ),
          ),
          const Divider(),
          const ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          const ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }

  // Top Bar
  Widget _topBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(
          icon: const Icon(Icons.calendar_today_outlined),
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) setState(() => selectedDate = picked);
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () => setState(() => showNotifications = !showNotifications),
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

  // Notifications Panel
  Widget _notificationsPanel() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.indigo),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(2, 4), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("🎂 Birthdays",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Today's: ${birthdayUsers.length}"),
          const SizedBox(height: 12),
          const Text("💐 Anniversaries",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Today's: ${anniversaryUsers.length}"),
        ],
      ),
    );
  }
}

// Placeholder Widgets for missing components
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class TopRatedProjectCard extends StatelessWidget {
  const TopRatedProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: const Text(
          'Top Rated Project',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
              5,
                  (index) => ListTile(
                leading: const Icon(Icons.folder),
                title: Text('Project ${index + 1}'),
              )),
        ),
      ),
    );
  }
}

class TopCreatorsTable extends StatelessWidget {
  const TopCreatorsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
              5,
                  (index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  NetworkImage('https://i.pravatar.cc/100?img=${index + 10}'),
                ),
                title: Text('Creator ${index + 1}'),
              )),
        ),
      ),
    );
  }
}

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: const Center(child: Text('Performance Chart Placeholder')),
      ),
    );
  }
}
