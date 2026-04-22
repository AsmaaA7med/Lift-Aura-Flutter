import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'add_goal_screen.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int selectedRangeIndex = 1;

  final List<String> ranges = ['DAY', 'WEEK', 'MONTH'];

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );
  }

  void _openAddGoal() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddGoalScreen(),
      ),
    );
  }

  void _showGeneticBreakdownInfo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Genetic breakdown is ready for premium backend integration.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 110),
            children: [
              _ProgressTopBar(onProfileTap: _openProfile),
              const SizedBox(height: 22),
              const Text(
                'PERFORMANCE\nMETRICS',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: List.generate(ranges.length, (index) {
                    final isSelected = selectedRangeIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRangeIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          decoration: BoxDecoration(
                            gradient: isSelected ? AppColors.primaryGradient : null,
                            color: isSelected ? null : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            ranges[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.textPrimary
                                  : AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 18),

              const Row(
                children: [
                  Expanded(
                    child: _MiniMetricCard(
                      title: 'WEIGHT',
                      value: '78.4',
                      unit: 'KG',
                      subtitle: '↓ 1.2kg this week',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MiniMetricCard(
                      title: 'BMI INDEX',
                      value: '23.4',
                      unit: '',
                      subtitle: 'HEALTHY RANGE',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const _WeightTrendCard(),
              const SizedBox(height: 16),
              _VelocityScanCard(
                onTap: _showGeneticBreakdownInfo,
              ),
              const SizedBox(height: 22),

              Row(
                children: [
                  const Text(
                    'MY TRAJECTORY',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _openAddGoal,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                        color: AppColors.surface,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              const _TrajectoryItem(
                title: 'Lose 5kg Fat',
                subtitle: 'TARGET: NOV 15',
                valueText: '3.8 / 5kg',
                progress: 0.76,
                icon: Icons.track_changes,
                accentColor: AppColors.primary,
              ),
              const SizedBox(height: 12),
              const _TrajectoryItem(
                title: 'Daily Steps',
                subtitle: 'AVERAGE STREAK: 12 DAYS',
                valueText: '8,420 / 10k',
                progress: 0.84,
                icon: Icons.directions_walk,
                accentColor: AppColors.tertiary,
              ),
              const SizedBox(height: 12),
              const _TrajectoryItem(
                title: 'Hydration Goal',
                subtitle: 'DAILY INTAKE',
                valueText: '1.6 / 3L',
                progress: 0.53,
                icon: Icons.water_drop_outlined,
                accentColor: Color(0xFF7DA5FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressTopBar extends StatelessWidget {
  final VoidCallback onProfileTap;

  const _ProgressTopBar({
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.primary,
          size: 18,
        ),
        const SizedBox(width: 8),
        const Text(
          'Lift Aura',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
              color: AppColors.surface2,
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.primary,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class _MiniMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String subtitle;

  const _MiniMetricCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.subtitle,
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
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: unit.isEmpty ? '' : ' $unit',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              color: title == 'BMI INDEX'
                  ? AppColors.tertiary
                  : AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeightTrendCard extends StatelessWidget {
  const _WeightTrendCard();

  @override
  Widget build(BuildContext context) {
    const values = [28.0, 29.0, 27.0, 24.0, 36.0, 45.0, 42.0];
    const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    const maxValue = 50.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'WEIGHT TREND',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Text(
                'Last 7 Days',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(values.length, (index) {
                final height = (values[index] / maxValue) * 110;
                final isHighlighted = index >= 3;
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 22,
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: isHighlighted
                              ? AppColors.primaryGradient
                              : const LinearGradient(
                                  colors: [
                                    Color(0xFF2B2F55),
                                    Color(0xFF39406F),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        labels[index],
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _VelocityScanCard extends StatelessWidget {
  final VoidCallback onTap;

  const _VelocityScanCard({
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
          Row(
            children: [
              const Text(
                'AI VELOCITY SCAN',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.3,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'PRO+',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Based on your 12% increase in training volume this week, your metabolic baseline has shifted. We recommend increasing protein intake by 15g to maintain lean muscle mass while hitting your weight goal.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.55,
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
                'FULL GENETIC BREAKDOWN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrajectoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String valueText;
  final double progress;
  final IconData icon;
  final Color accentColor;

  const _TrajectoryItem({
    required this.title,
    required this.subtitle,
    required this.valueText,
    required this.progress,
    required this.icon,
    required this.accentColor,
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
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor.withValues(alpha: 0.14),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 10,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                valueText,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: const Color(0xFF272B4C),
              valueColor: AlwaysStoppedAnimation<Color>(accentColor),
            ),
          ),
        ],
      ),
    );
  }
}