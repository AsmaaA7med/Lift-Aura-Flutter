import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'program_details_screen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int selectedTabIndex = 0;
  int selectedFilterIndex = 1;
  String searchQuery = '';

  final List<String> tabs = ['Programs', 'Active', 'History'];
  final List<String> filters = ['All', 'Strength', 'Hypertrophy', 'Endurance'];

  final List<_WorkoutProgram> programs = const [
    _WorkoutProgram(
      protocol: 'PROTOCOL 01',
      level: 'INTERMEDIATE',
      title: 'Titan Strength',
      duration: '8 WEEKS',
      frequency: '4X / WK',
      accentColor: AppColors.primary,
      buttonText: 'Start Program',
      isPrimaryButton: true,
      category: 'Strength',
    ),
    _WorkoutProgram(
      protocol: 'PROTOCOL 02',
      level: 'BEGINNER',
      title: 'Foundation Core',
      duration: '4 WEEKS',
      frequency: '3X / WK',
      accentColor: AppColors.tertiary,
      buttonText: 'Start Program',
      isPrimaryButton: false,
      category: 'Hypertrophy',
    ),
    _WorkoutProgram(
      protocol: 'PROTOCOL 03',
      level: 'ADVANCED',
      title: 'Olympic Engine',
      duration: '12 WEEKS',
      frequency: '6X / WK',
      accentColor: Color(0xFF6F8BFF),
      buttonText: 'Start Program',
      isPrimaryButton: false,
      category: 'Endurance',
    ),
  ];

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );
  }

  void _openProgramDetails(_WorkoutProgram program) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProgramDetailsScreen(
          title: program.title,
          level: program.level,
          duration: program.duration,
          frequency: program.frequency,
        ),
      ),
    );
  }

  List<_WorkoutProgram> get filteredPrograms {
    List<_WorkoutProgram> result = programs;

    final selectedFilter = filters[selectedFilterIndex];
    if (selectedFilter != 'All') {
      result = result.where((p) => p.category == selectedFilter).toList();
    }

    if (searchQuery.trim().isNotEmpty) {
      final q = searchQuery.toLowerCase();
      result = result.where((p) {
        return p.title.toLowerCase().contains(q) ||
            p.level.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q);
      }).toList();
    }

    return result;
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
              _WorkoutTopBar(onProfileTap: _openProfile),
              const SizedBox(height: 20),
              const Text(
                'Forge Your Path',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Select a high-performance protocol designed for your specific biomechanics.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 22),

              Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedTabIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(right: index == tabs.length - 1 ? 0 : 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tabs[index],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            height: 3,
                            width: 46,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 18),

              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.textMuted, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        style: const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          hintText: 'Search elite protocols...',
                          hintStyle: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final isSelected = selectedFilterIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilterIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          gradient: isSelected ? AppColors.primaryGradient : null,
                          color: isSelected ? null : AppColors.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : AppColors.border,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          filters[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              if (selectedTabIndex == 0) ...[
                if (filteredPrograms.isEmpty)
                  const _StateCard(
                    title: 'No Matching Programs',
                    subtitle: 'Try a different search or filter.',
                  )
                else
                  ...filteredPrograms.map(
                    (program) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _ProgramCard(
                        program: program,
                        onTap: () => _openProgramDetails(program),
                      ),
                    ),
                  ),
              ] else if (selectedTabIndex == 1) ...[
                const _StateCard(
                  title: 'Active Programs',
                  subtitle: 'No active workout programs yet. Start one to track your progress here.',
                ),
              ] else ...[
                const _StateCard(
                  title: 'Workout History',
                  subtitle: 'Your completed protocols and workout history will appear here.',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkoutTopBar extends StatelessWidget {
  final VoidCallback onProfileTap;

  const _WorkoutTopBar({
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

class _ProgramCard extends StatelessWidget {
  final _WorkoutProgram program;
  final VoidCallback onTap;

  const _ProgramCard({
    required this.program,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: program.accentColor.withValues(alpha: 0.08),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                program.protocol,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 10,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: program.accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  program.level,
                  style: TextStyle(
                    color: program.accentColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            program.title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _InfoColumn(
                  label: 'DURATION',
                  value: program.duration,
                ),
              ),
              Expanded(
                child: _InfoColumn(
                  label: 'FREQUENCY',
                  value: program.frequency,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                gradient: program.isPrimaryButton ? AppColors.primaryGradient : null,
                color: program.isPrimaryButton ? null : AppColors.surface2,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                program.buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 10,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _StateCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StateCard({
    required this.title,
    required this.subtitle,
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
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(
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

class _WorkoutProgram {
  final String protocol;
  final String level;
  final String title;
  final String duration;
  final String frequency;
  final Color accentColor;
  final String buttonText;
  final bool isPrimaryButton;
  final String category;

  const _WorkoutProgram({
    required this.protocol,
    required this.level,
    required this.title,
    required this.duration,
    required this.frequency,
    required this.accentColor,
    required this.buttonText,
    required this.isPrimaryButton,
    required this.category,
  });
}