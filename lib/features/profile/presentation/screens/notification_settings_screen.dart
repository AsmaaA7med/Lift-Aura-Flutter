import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool workoutReminders = true;
  bool mealReminders = true;
  bool aiInsights = true;
  bool progressAlerts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textPrimary),
        title: const Text('Notifications'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.35,
            colors: const [
              Color(0xFF101B55),
              AppColors.background,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _ToggleCard(
              title: 'Workout Reminders',
              subtitle: 'Daily reminders for training sessions',
              value: workoutReminders,
              onChanged: (v) => setState(() => workoutReminders = v),
            ),
            const SizedBox(height: 14),
            _ToggleCard(
              title: 'Meal Reminders',
              subtitle: 'Nutrition logging and meal plan nudges',
              value: mealReminders,
              onChanged: (v) => setState(() => mealReminders = v),
            ),
            const SizedBox(height: 14),
            _ToggleCard(
              title: 'AI Insights',
              subtitle: 'Recovery and performance recommendations',
              value: aiInsights,
              onChanged: (v) => setState(() => aiInsights = v),
            ),
            const SizedBox(height: 14),
            _ToggleCard(
              title: 'Progress Alerts',
              subtitle: 'Goal milestones and streak achievements',
              value: progressAlerts,
              onChanged: (v) => setState(() => progressAlerts = v),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}