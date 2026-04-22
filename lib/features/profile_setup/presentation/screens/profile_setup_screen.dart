import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  int _weight = 78;
  int _height = 182;
  int _age = 28;
  String _gender = 'M';
  String _selectedGoal = 'Build Muscle';
  String _activity = 'Active';

  final List<Map<String, dynamic>> _goals = [
    {
      'title': 'Build Muscle',
      'desc': 'Hypertrophy focused training for peak physique.',
      'icon': Icons.fitness_center,
    },
    {
      'title': 'Lose Weight',
      'desc': 'High intensity metabolic conditioning and fat loss.',
      'icon': Icons.local_fire_department,
    },
    {
      'title': 'Endurance',
      'desc': 'Optimize cardiovascular health and stamina.',
      'icon': Icons.speed,
    },
  ];

  final List<Map<String, String>> _activityLevels = [
    {"title": "Sedentary", "desc": "Office job, minimal exercise"},
    {"title": "Active", "desc": "Gym 3-5 days per week"},
    {"title": "Elite", "desc": "Daily training or physical labor"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Lift Aura',
            style: GoogleFonts.spaceGrotesk(
                color: AppColors.textPrimary, fontWeight: FontWeight.w700)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person,
                color: AppColors.textPrimary, size: 18),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Profile Setup',
                    style: GoogleFonts.spaceGrotesk(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
                Text('60%',
                    style: GoogleFonts.inter(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.6,
                minHeight: 6,
                backgroundColor: AppColors.surface2,
                valueColor:
                    const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
            const SizedBox(height: 28),
            _sectionTitle("PERSONAL INFO"),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _statCard("WEIGHT", _weight, "KG",
                        () => setState(() => _weight++),
                        () => setState(() => _weight--))),
                const SizedBox(width: 12),
                Expanded(
                    child: _statCard("HEIGHT", _height, "CM",
                        () => setState(() => _height++),
                        () => setState(() => _height--))),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: _statCard("AGE", _age, "YRS",
                        () => setState(() => _age++),
                        () => setState(() => _age--))),
                const SizedBox(width: 12),
                Expanded(child: _genderCard()),
              ],
            ),
            const SizedBox(height: 28),
            _sectionTitle("YOUR GOAL"),
            const SizedBox(height: 16),
            ..._goals.map((goal) {
              bool selected = _selectedGoal == goal["title"];
              return GestureDetector(
                onTap: () => setState(() => _selectedGoal = goal["title"]),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(goal["title"],
                                style: GoogleFonts.inter(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(goal["desc"],
                                style: GoogleFonts.inter(
                                    color: AppColors.textSecondary,
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                      Icon(goal["icon"],
                          color: selected
                              ? AppColors.primary
                              : AppColors.textMuted),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 28),
            _sectionTitle("ACTIVITY LEVEL"),
            const SizedBox(height: 16),
            ..._activityLevels.map((item) {
              bool selected = _activity == item["title"];
              return GestureDetector(
                onTap: () => setState(() => _activity = item["title"]!),
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item["title"]!,
                                style: GoogleFonts.inter(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(item["desc"]!,
                                style: GoogleFonts.inter(
                                    color: AppColors.textSecondary,
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: selected
                                  ? AppColors.primary
                                  : AppColors.border),
                        ),
                        child: selected
                            ? Container(
                                margin: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Let's Go",
                      style: GoogleFonts.inter(
                          color: AppColors.background,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Container(width: 3, height: 16, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(title,
            style: GoogleFonts.inter(
                color: AppColors.textMuted,
                letterSpacing: 2,
                fontSize: 12)),
      ],
    );
  }

  Widget _statCard(String title, int value, String unit,
      VoidCallback inc, VoidCallback dec) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.inter(
                  color: AppColors.textMuted, fontSize: 11)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("$value",
                  style: GoogleFonts.spaceGrotesk(
                      color: AppColors.textPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
              const SizedBox(width: 5),
              Text(unit,
                  style: GoogleFonts.inter(
                      color: AppColors.textSecondary)),
              const Spacer(),
              Column(
                children: [
                  GestureDetector(
                      onTap: inc,
                      child: const Icon(Icons.keyboard_arrow_up,
                          color: AppColors.primary)),
                  GestureDetector(
                      onTap: dec,
                      child: const Icon(Icons.keyboard_arrow_down,
                          color: AppColors.primary)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genderCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("GENDER",
              style: GoogleFonts.inter(
                  color: AppColors.textMuted, fontSize: 11)),
          const SizedBox(height: 10),
          Row(
            children: [
              _genderBtn("M"),
              const SizedBox(width: 8),
              _genderBtn("F"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genderBtn(String g) {
    bool selected = _gender == g;
    return GestureDetector(
      onTap: () => setState(() => _gender = g),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: selected ? AppColors.surface2 : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: selected ? AppColors.primary : AppColors.border),
        ),
        child: Center(
          child: Text(g,
              style: GoogleFonts.inter(
                  color: selected
                      ? AppColors.primary
                      : AppColors.textMuted,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}