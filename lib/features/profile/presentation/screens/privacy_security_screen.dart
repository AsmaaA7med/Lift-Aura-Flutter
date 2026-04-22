import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

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
        title: const Text('Privacy & Security'),
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
            _OptionCard(
              title: 'Change Password',
              subtitle: 'Update your account password',
              onTap: () => _showInfo(
                context,
                'Password update is ready for backend integration.',
              ),
            ),
            const SizedBox(height: 14),
            _OptionCard(
              title: 'Two-Factor Authentication',
              subtitle: 'Extra security for your account',
              onTap: () => _showInfo(
                context,
                '2FA settings are ready for backend integration.',
              ),
            ),
            const SizedBox(height: 14),
            _OptionCard(
              title: 'Data Permissions',
              subtitle: 'Manage health and activity permissions',
              onTap: () => _showInfo(
                context,
                'Permissions settings are ready for backend integration.',
              ),
            ),
            const SizedBox(height: 14),
            _OptionCard(
              title: 'Delete Account',
              subtitle: 'Permanently remove your account',
              isDanger: true,
              onTap: () => _showInfo(
                context,
                'Account deletion flow is ready for backend integration.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDanger;

  const _OptionCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? AppColors.error : AppColors.textPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    style: TextStyle(
                      color: color,
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
              color: AppColors.textMuted,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}