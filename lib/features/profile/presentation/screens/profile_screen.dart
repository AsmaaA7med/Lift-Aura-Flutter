import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../subscription/presentation/screens/subscription_screen.dart';
import 'appearance_screen.dart';
import 'edit_profile_screen.dart';
import 'language_screen.dart';
import 'notification_settings_screen.dart';
import 'privacy_security_screen.dart';
import 'support_center_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(color: AppColors.textPrimary),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(color: AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logout flow is ready for backend/auth integration.'),
                  ),
                );
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
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
              const _ProfileTopBar(),
              const SizedBox(height: 18),
              _ProfileHeaderCard(
                onEditTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const _InfoSectionCard(),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SubscriptionScreen(),
                    ),
                  );
                },
                child: const _PlanSectionCard(),
              ),
              const SizedBox(height: 16),
              _SettingsSectionCard(
                onNotificationsTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationSettingsScreen(),
                    ),
                  );
                },
                onPrivacyTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PrivacySecurityScreen(),
                    ),
                  );
                },
                onAppearanceTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AppearanceScreen(),
                    ),
                  );
                },
                onLanguageTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LanguageScreen(),
                    ),
                  );
                },
                onSupportTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SupportCenterScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              _LogoutButton(
                onTap: () => _showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar();

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
        Container(
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
      ],
    );
  }
}

class _ProfileHeaderCard extends StatelessWidget {
  final VoidCallback onEditTap;

  const _ProfileHeaderCard({
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                  color: AppColors.surface2,
                ),
                child: const Icon(
                  Icons.person,
                  size: 42,
                  color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: onEditTap,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.primaryGradient,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Ahmed Khaled',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Elite Member since Jan 2024',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              Expanded(
                child: _ProfileStatItem(
                  value: '142',
                  label: 'WORKOUTS',
                ),
              ),
              Expanded(
                child: _ProfileStatItem(
                  value: '28',
                  label: 'GOALS ACTIVE',
                ),
              ),
              Expanded(
                child: _ProfileStatItem(
                  value: '12',
                  label: 'AI STREAK',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileStatItem extends StatelessWidget {
  final String value;
  final String label;

  const _ProfileStatItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 10,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}

class _InfoSectionCard extends StatelessWidget {
  const _InfoSectionCard();

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
          _SectionTitle(
            icon: Icons.badge_outlined,
            title: 'Personal Info',
          ),
          SizedBox(height: 14),
          _InfoRow(label: 'EMAIL ADDRESS', value: 'ahmed@gmail.com'),
          SizedBox(height: 12),
          _InfoRow(label: 'PHONE', value: '0122 887 7445'),
        ],
      ),
    );
  }
}

class _PlanSectionCard extends StatelessWidget {
  const _PlanSectionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  icon: Icons.workspace_premium_outlined,
                  title: 'My Plan',
                ),
                SizedBox(height: 14),
                Text(
                  'CURRENT SUBSCRIPTION',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Aura Pro Unlimited',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Renewal date: Oct 12, 2024',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.14),
            ),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSectionCard extends StatelessWidget {
  final VoidCallback onNotificationsTap;
  final VoidCallback onPrivacyTap;
  final VoidCallback onAppearanceTap;
  final VoidCallback onLanguageTap;
  final VoidCallback onSupportTap;

  const _SettingsSectionCard({
    required this.onNotificationsTap,
    required this.onPrivacyTap,
    required this.onAppearanceTap,
    required this.onLanguageTap,
    required this.onSupportTap,
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
          const _SectionTitle(
            icon: Icons.settings_outlined,
            title: 'Settings',
          ),
          const SizedBox(height: 14),
          _SettingRow(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            trailing: '',
            onTap: onNotificationsTap,
          ),
          const SizedBox(height: 14),
          _SettingRow(
            icon: Icons.lock_outline_rounded,
            title: 'Privacy & Security',
            trailing: '',
            onTap: onPrivacyTap,
          ),
          const SizedBox(height: 14),
          _SettingRow(
            icon: Icons.dark_mode_outlined,
            title: 'Appearance',
            trailing: 'Dark',
            onTap: onAppearanceTap,
          ),
          const SizedBox(height: 14),
          _SettingRow(
            icon: Icons.language_rounded,
            title: 'App Language',
            trailing: 'English (US)',
            onTap: onLanguageTap,
          ),
          const SizedBox(height: 14),
          _SettingRow(
            icon: Icons.help_outline_rounded,
            title: 'Support Center',
            trailing: '',
            onTap: onSupportTap,
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.textSecondary,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
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
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;
  final VoidCallback onTap;

  const _SettingRow({
    required this.icon,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.textSecondary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (trailing.isNotEmpty)
            Text(
              trailing,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({
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
          color: const Color(0x22FF5F5F),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0x55FF5F5F)),
        ),
        child: const Text(
          'LOG OUT',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.error,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}