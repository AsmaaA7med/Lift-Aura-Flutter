import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'add_food_screen.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  bool isFoodLogSelected = true;

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );
  }

  void _openAddFood() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddFoodScreen(),
      ),
    );
  }

  void _showRegenerateInfo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Meal plan regeneration is ready for AI/backend integration.'),
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
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 110),
                children: [
                  _TopBar(onProfileTap: _openProfile),
                  const SizedBox(height: 18),
                  _TabsSection(
                    isFoodLogSelected: isFoodLogSelected,
                    onFoodLogTap: () {
                      setState(() {
                        isFoodLogSelected = true;
                      });
                    },
                    onMealPlanTap: () {
                      setState(() {
                        isFoodLogSelected = false;
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  if (isFoodLogSelected) ...const [
                    _CaloriesCard(),
                    SizedBox(height: 14),
                    _InsightCard(),
                    SizedBox(height: 22),
                    _MealSection(
                      title: 'BREAKFAST',
                      kcal: '428 kcal',
                      meals: [
                        _MealItemData(
                          title: 'Avocado Toast & Eggs',
                          subtitle: '2 slices, 2 large eggs',
                          calories: '310',
                          emoji: '🥑',
                        ),
                        _MealItemData(
                          title: 'Black Coffee',
                          subtitle: 'Large • no sugar',
                          calories: '8',
                          emoji: '☕',
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    _MealSection(
                      title: 'LUNCH',
                      kcal: '850 kcal',
                      meals: [
                        _MealItemData(
                          title: 'Grilled Chicken & Quinoa Bowl',
                          subtitle: 'Large portion, double protein',
                          calories: '680',
                          emoji: '🥗',
                        ),
                      ],
                    ),
                  ] else ...[
                    const _MealPlanHeaderCard(),
                    const SizedBox(height: 16),
                    const _MealPlanDayCard(
                      title: 'BREAKFAST',
                      mealName: 'Protein Oats Bowl',
                      description: 'Oats, whey protein, banana, peanut butter',
                      calories: '520 kcal',
                    ),
                    const SizedBox(height: 14),
                    const _MealPlanDayCard(
                      title: 'LUNCH',
                      mealName: 'Chicken Rice Power Bowl',
                      description: 'Grilled chicken, brown rice, veggies',
                      calories: '710 kcal',
                    ),
                    const SizedBox(height: 14),
                    const _MealPlanDayCard(
                      title: 'DINNER',
                      mealName: 'Salmon & Sweet Potato',
                      description: 'Salmon fillet, sweet potato, greens',
                      calories: '640 kcal',
                    ),
                    const SizedBox(height: 18),
                    _GeneratePlanButton(
                      onTap: _showRegenerateInfo,
                    ),
                  ],
                ],
              ),
              if (isFoodLogSelected)
                _AddButton(
                  onTap: _openAddFood,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onProfileTap;

  const _TopBar({
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

class _TabsSection extends StatelessWidget {
  final bool isFoodLogSelected;
  final VoidCallback onFoodLogTap;
  final VoidCallback onMealPlanTap;

  const _TabsSection({
    required this.isFoodLogSelected,
    required this.onFoodLogTap,
    required this.onMealPlanTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onFoodLogTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient:
                      isFoodLogSelected ? AppColors.primaryGradient : null,
                  color: isFoodLogSelected ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Food Log',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isFoodLogSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onMealPlanTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient:
                      !isFoodLogSelected ? AppColors.primaryGradient : null,
                  color: !isFoodLogSelected ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Meal Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !isFoodLogSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CaloriesCard extends StatelessWidget {
  const _CaloriesCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
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
                'CALORIES REMAINING',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 10,
                  letterSpacing: 1.5,
                ),
              ),
              Spacer(),
              Text(
                '2,100 / 2,500 kcal',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              text: '400',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 42,
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: ' kcal',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 8,
              child: Row(
                children: const [
                  Expanded(
                    flex: 33,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    flex: 42,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.secondary),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.tertiary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MacroItem(
                dotColor: AppColors.primary,
                label: 'PROTEIN',
                value: '165 g',
              ),
              _MacroItem(
                dotColor: AppColors.secondary,
                label: 'CARBS',
                value: '210 g',
              ),
              _MacroItem(
                dotColor: AppColors.tertiary,
                label: 'FATS',
                value: '58 g',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroItem extends StatelessWidget {
  final Color dotColor;
  final String label;
  final String value;

  const _MacroItem({
    required this.dotColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
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
            'LUMINA INSIGHT',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '"You’re 20g short of your protein goal for quick recovery. Consider a casein shake before bed to optimize muscle synthesis."',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _MealSection extends StatelessWidget {
  final String title;
  final String kcal;
  final List<_MealItemData> meals;

  const _MealSection({
    required this.title,
    required this.kcal,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Text(
              kcal,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...meals.map(
          (meal) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _MealCard(data: meal),
          ),
        ),
        const SizedBox(height: 2),
        const _AddFoodText(),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  final _MealItemData data;

  const _MealCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.surface2,
            ),
            child: Center(
              child: Text(
                data.emoji,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            data.calories,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddFoodText extends StatelessWidget {
  const _AddFoodText();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 8),
        Icon(Icons.add, color: AppColors.primary, size: 18),
        SizedBox(width: 6),
        Text(
          'ADD FOOD',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _MealPlanHeaderCard extends StatelessWidget {
  const _MealPlanHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TODAY’S MEAL PLAN',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your meal plan is tailored for muscle gain with balanced protein, carbs, and fats.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _MealPlanDayCard extends StatelessWidget {
  final String title;
  final String mealName;
  final String description;
  final String calories;

  const _MealPlanDayCard({
    required this.title,
    required this.mealName,
    required this.description,
    required this.calories,
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
              color: AppColors.primary,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            mealName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            calories,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _GeneratePlanButton extends StatelessWidget {
  final VoidCallback onTap;

  const _GeneratePlanButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text(
          'REGENERATE PLAN',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 22,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 58,
          height: 58,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: Color(0x3300D4FF),
                blurRadius: 18,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.textPrimary,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _MealItemData {
  final String title;
  final String subtitle;
  final String calories;
  final String emoji;

  const _MealItemData({
    required this.title,
    required this.subtitle,
    required this.calories,
    required this.emoji,
  });
}