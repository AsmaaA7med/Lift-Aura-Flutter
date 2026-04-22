import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../ai_coach/presentation/screens/ai_coach_screen.dart';
import '../../../nutrition/presentation/screens/nutrition_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../workout/presentation/screens/workout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showComingAction(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.surface2,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openWorkout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const WorkoutScreen(),
      ),
    );
  }

  void _openNutrition(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NutritionScreen(),
      ),
    );
  }

  void _openAiCoach(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AICoachScreen(),
      ),
    );
  }

  void _openProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.2,
          colors: const [
            Color(0xFF121B4A),
            AppColors.background,
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        children: [
          _HomeTopBar(
            onNotificationTap: () {
              _showComingAction(
                context,
                'Notifications screen is ready for backend integration.',
              );
            },
            onProfileTap: () {
              _openProfile(context);
            },
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _TopActionChip(
                label: 'Log Water',
                icon: Icons.local_drink_outlined,
                onTap: () {
                  _showComingAction(
                    context,
                    'Water logging is ready for backend integration.',
                  );
                },
              ),
              _TopActionChip(
                label: 'Log Meal',
                icon: Icons.restaurant_menu,
                onTap: () {
                  _openNutrition(context);
                },
              ),
              _TopActionChip(
                label: 'Log Workout',
                icon: Icons.fitness_center,
                onTap: () {
                  _openWorkout(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _openAiCoach(context);
            },
            child: const _InsightCard(),
          ),
          const SizedBox(height: 20),
          const Text(
            "TODAY'S SUMMARY",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'CALORIES',
                  value: '1,840',
                  unit: 'kcal',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'STEPS',
                  value: '8,432',
                  unit: '',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'HYDRATION',
                  value: '2.4',
                  unit: 'L',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'SLEEP',
                  value: '7h 20',
                  unit: 'm',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _WorkoutCard(
            onTap: () {
              _openWorkout(context);
            },
          ),
        ],
      ),
    );
  }
}

class _HomeTopBar extends StatelessWidget {
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;

  const _HomeTopBar({
    required this.onNotificationTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME BACK',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 10,
                  letterSpacing: 1.8,
                ),
              ),
              SizedBox(height: 6),
              SizedBox(
                height: 40,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Good Morning Ahmed',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onNotificationTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface2,
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class _TopActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _TopActionChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI INSIGHT',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 11,
              letterSpacing: 1.6,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your recovery score is 88%. Optimal time for Upper Body Power. You’ve been hitting sleep targets for 3 days straight!',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const _StatCard({
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: unit.isEmpty ? '' : ' $unit',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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

class _WorkoutCard extends StatelessWidget {
  final VoidCallback onTap;

  const _WorkoutCard({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RECOMMENDED SESSION',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 11,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'UPPER BODY DAY',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '45 MIN   •   320 KCAL',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'START WORKOUT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}