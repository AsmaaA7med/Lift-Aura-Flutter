import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/custom_bottom_nav_bar.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/workout/presentation/screens/workout_screen.dart';
import '../features/nutrition/presentation/screens/nutrition_screen.dart';
import '../features/progress/presentation/screens/progress_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/ai_coach/presentation/screens/ai_coach_screen.dart';
class LiftAuraApp extends StatelessWidget {
  const LiftAuraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lift Aura',
      theme: AppTheme.darkTheme,
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

final List<Widget> _screens = const [
  HomeScreen(),
  WorkoutScreen(),
  NutritionScreen(),
  ProgressScreen(),
  ProfileScreen(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: SafeArea(
        top: false,
        child: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}