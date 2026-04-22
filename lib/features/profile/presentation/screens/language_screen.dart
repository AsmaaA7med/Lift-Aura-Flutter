import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selected = 'English (US)';

  @override
  Widget build(BuildContext context) {
    final options = ['English (US)', 'Arabic', 'French'];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textPrimary),
        title: const Text('App Language'),
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
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: options.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final item = options[index];
            final isSelected = item == selected;

            return GestureDetector(
              onTap: () {
                setState(() => selected = item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item selected')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}