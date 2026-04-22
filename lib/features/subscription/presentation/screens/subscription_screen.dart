import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedPlan = 'PRO';

  void _selectPlan(String planName) {
    setState(() {
      selectedPlan = planName;
    });

    final message = planName == 'PRO'
        ? 'Pro plan selected'
        : planName == 'ELITE'
            ? 'Elite plan selected'
            : 'Free plan selected';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.surface2,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text('Lift Aura'),
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          children: [
            const Text(
              'Choose Your\nPlan',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Unlock the next generation of kinetic performance with AI-driven insights and adaptive programming.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: const [
                _TopMiniTag(label: 'Monthly'),
                SizedBox(width: 8),
                _TopMiniTag(label: 'AI Access'),
                SizedBox(width: 8),
                _TopMiniTag(label: 'Best Value', highlighted: true),
              ],
            ),

            const SizedBox(height: 20),

            _PlanCard(
              title: 'FREE',
              price: '\$0',
              period: '/mo',
              subtitle: 'Essential tracking for beginners',
              features: const [
                'Basic Workout Logger',
                'AI Recovery Snapshot',
                'Basic Exercise Library',
                'Limited Progress History',
              ],
              buttonText: 'Current Plan',
              isHighlighted: selectedPlan == 'FREE',
              buttonGradient: false,
              buttonColor: AppColors.surface2,
              accentColor: AppColors.border,
              onTap: () => _selectPlan('FREE'),
            ),

            const SizedBox(height: 16),

            _PlanCard(
              title: 'PRO',
              price: '\$12',
              period: '/mo',
              subtitle: 'The Lumina Luminary experience',
              features: const [
                'Advanced AI Insights',
                'Unlimited Workout Access',
                'Health Meta Visibility Sync',
                'Exclusive Community Access',
              ],
              buttonText: 'Upgrade to Pro',
              isHighlighted: selectedPlan == 'PRO',
              buttonGradient: true,
              accentColor: AppColors.primary,
              badge: 'MOST POPULAR',
              onTap: () => _selectPlan('PRO'),
            ),

            const SizedBox(height: 16),

            _PlanCard(
              title: 'ELITE',
              price: '\$29',
              period: '/mo',
              subtitle: 'Full-spectrum bio-kinetic control',
              features: const [
                '1-on-1 AI Meta-Season Coach',
                'Daily Adaptive Protocols',
                'Priority Support Access',
                'Early Feature Access',
              ],
              buttonText: 'Go Elite',
              isHighlighted: selectedPlan == 'ELITE',
              buttonGradient: false,
              buttonColor: const Color(0xFFF3C623),
              darkButtonText: true,
              accentColor: const Color(0xFFF3C623),
              onTap: () => _selectPlan('ELITE'),
            ),

            const SizedBox(height: 20),

            const _FeatureHighlightCard(),

            const SizedBox(height: 16),

            const Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    value: '50k+',
                    label: 'ACTIVE ATHLETES',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    value: '4.9/5',
                    label: 'APP STORE RATING',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const _FullWidthMetricCard(
              value: '85%',
              label: 'AVG RECOVERY BOOST',
            ),

            const SizedBox(height: 18),

            const Center(
              child: Text(
                'Payment processed securely. Cancel anytime from My Plan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PRIVACY',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(width: 18),
                Text(
                  'TERMS',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(width: 18),
                Text(
                  'SUPPORT',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TopMiniTag extends StatelessWidget {
  final String label;
  final bool highlighted;

  const _TopMiniTag({
    required this.label,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: highlighted ? AppColors.tertiary.withValues(alpha: 0.16) : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: highlighted ? AppColors.tertiary : AppColors.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: highlighted ? AppColors.tertiary : AppColors.textSecondary,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final String subtitle;
  final List<String> features;
  final String buttonText;
  final bool isHighlighted;
  final bool buttonGradient;
  final bool darkButtonText;
  final Color accentColor;
  final Color? buttonColor;
  final String? badge;
  final VoidCallback onTap;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.period,
    required this.subtitle,
    required this.features,
    required this.buttonText,
    required this.isHighlighted,
    required this.buttonGradient,
    required this.accentColor,
    required this.onTap,
    this.buttonColor,
    this.badge,
    this.darkButtonText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isHighlighted ? accentColor : AppColors.border,
          width: isHighlighted ? 2 : 1,
        ),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.15),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badge != null) ...[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge!,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              text: price,
              style: TextStyle(
                color: accentColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: period,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 14),
          ...features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 16,
                    color: accentColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      f,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                gradient: buttonGradient ? AppColors.primaryGradient : null,
                color: buttonGradient ? null : buttonColor ?? AppColors.surface2,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkButtonText ? Colors.black : Colors.white,
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

class _FeatureHighlightCard extends StatelessWidget {
  const _FeatureHighlightCard();

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
            'Kinetic Authority',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'The AI engine analyzes recovery, strain, nutrition, and performance signals to adapt your path in real time.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.auto_awesome, color: AppColors.primary, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Real-time AI recovery logic + adaptive progression',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String value;
  final String label;

  const _MetricCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 24,
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
      ),
    );
  }
}

class _FullWidthMetricCard extends StatelessWidget {
  final String value;
  final String label;

  const _FullWidthMetricCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 26,
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
      ),
    );
  }
}