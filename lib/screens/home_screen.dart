import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';
import 'create_task_screen.dart';
import 'calendar_screen.dart';
import 'projects_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_outlined, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text('Good morning Andre!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            const Text('21 Sept, 2023', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 24),

            const Text('Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(
              children: [
                SummaryCard(title: 'Assigned tasks', value: '21', color: const Color(0xFF6F4EFF)),
                const SizedBox(width: 12),
                SummaryCard(title: 'Completed tasks', value: '31', color: const Color(0xFF10B981)),
              ],
            ),
            const SizedBox(height: 28),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Today tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('Today', style: TextStyle(color: Color(0xFF6F4EFF))),
                      Icon(Icons.arrow_drop_down, color: Color(0xFF6F4EFF)),
                    ],
                  ),
                ),
              ],
            ),

            TextField(
              controller: _searchController,
              onChanged: provider.setSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),

            // Tabs exactly like screenshot
            Row(
              children: ['All tasks', 'In progress', 'Completed'].map((e) {
                final isAll = e == 'All tasks';
                final selected = provider.currentTab == (isAll ? 'All' : e);
                return Expanded(
                  child: GestureDetector(
                    onTap: () => provider.setTab(isAll ? 'All' : e),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected ? const Color(0xFF6F4EFF) : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: selected ? Colors.transparent : Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          e,
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: provider.filteredTasks.isEmpty
                  ? const Center(child: Text('No tasks found', style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      itemCount: provider.filteredTasks.length,
                      itemBuilder: (_, i) => TaskCard(task: provider.filteredTasks[i]),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6F4EFF),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateTaskScreen())),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF6F4EFF),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.folder_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: ''),
        ],
        onTap: (i) {
          if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => const CalendarScreen()));
          if (i == 2) Navigator.push(context, MaterialPageRoute(builder: (_) => const ProjectsScreen()));
          if (i == 3) Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        },
      ),
    );
  }
}