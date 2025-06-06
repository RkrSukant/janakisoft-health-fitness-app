import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/presentation/screens/workout_list_screen.dart';

@RoutePage()
class CommonHomeScreen extends StatefulWidget {
  const CommonHomeScreen({super.key});

  @override
  State<CommonHomeScreen> createState() => _CommonHomeScreenState();
}

class _CommonHomeScreenState extends State<CommonHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const WorkoutListScreen(),
    const ProfilePlaceholderScreen(), // To be replaced later
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Temporary placeholder for the profile screen
class ProfilePlaceholderScreen extends StatelessWidget {
  const ProfilePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profile screen coming soon!",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
