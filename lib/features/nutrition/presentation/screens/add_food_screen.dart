import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AddFoodScreen extends StatelessWidget {
  const AddFoodScreen({super.key});

  void _showInfo(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textPrimary),
        title: const Text('Add Food'),
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
            _ActionCard(
              title: 'Search Food',
              subtitle: 'Search the nutrition database',
              icon: Icons.search_rounded,
              onTap: () => _showInfo(
                context,
                'Food search is ready for backend integration.',
              ),
            ),
            const SizedBox(height: 14),
            _ActionCard(
              title: 'Scan Barcode',
              subtitle: 'Scan packaged food instantly',
              icon: Icons.qr_code_scanner_rounded,
              onTap: () => _showInfo(
                context,
                'Barcode scanning is ready for backend integration.',
              ),
            ),
            const SizedBox(height: 14),
            _ActionCard(
              title: 'Manual Entry',
              subtitle: 'Add custom meal details manually',
              icon: Icons.edit_note_rounded,
              onTap: () => _showInfo(
                context,
                'Manual food entry is ready for backend integration.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
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
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}