import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:math';
import '../../../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _fadeController;
  late Animation<double> _progressAnimation;
  late Animation<double> _fadeAnimation;

  int _percentage = 0;
  String _statusText = 'INITIALIZING_CORE';

  final List<String> _statusMessages = [
    'INITIALIZING_CORE',
    'LOADING_MODULES',
    'SYNCING_DATA',
    'PREPARING_AURA',
  ];

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    _fadeController.forward();

    _progressController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _progressController.addListener(() {
      setState(() {
        _percentage = (_progressAnimation.value * 100).toInt();
        int msgIndex =
            (_progressAnimation.value * (_statusMessages.length - 1)).toInt();
        _statusText =
            _statusMessages[msgIndex.clamp(0, _statusMessages.length - 1)];
      });
    });

    _progressController.forward();

    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.3),
            radius: 1.2,
            colors: [
              Color(0xFF1A1B35),
              Color(0xFF0A0A1A),
              Color(0xFF050508),
            ],
          ),
        ),
        child: Stack(
          children: [
            const StarField(),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.3),
                          blurRadius: 60,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: const _LogoWidget(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Lift',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: 'Aura',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ELEVATE YOUR AURA',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      letterSpacing: 4,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const Spacer(flex: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _statusText,
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                color: AppColors.textMuted,
                              ),
                            ),
                            Text(
                              '$_percentage%',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (context, child) {
                            return Container(
                              height: 3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.surface2,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: _progressAnimation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    gradient: AppColors.primaryGradient,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png', fit: BoxFit.cover);
  }
}

class StarField extends StatelessWidget {
  const StarField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size.infinite, painter: StarPainter());
  }
}

class StarPainter extends CustomPainter {
  final List<Offset> _stars = [];
  final Random _random = Random(42);

  StarPainter() {
    for (int i = 0; i < 60; i++) {
      _stars.add(Offset(_random.nextDouble(), _random.nextDouble()));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.3);
    for (final star in _stars) {
      canvas.drawCircle(
        Offset(star.dx * size.width, star.dy * size.height),
        _random.nextDouble() * 1.5 + 0.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}