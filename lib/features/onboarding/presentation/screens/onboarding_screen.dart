import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'badge': 'WELCOME',
      'title': 'Struggling to stay',
      'titleBlue': 'consistent?',
      'desc': 'We make fitness simple, smart and personal.',
    },
    {
      'badge': 'TRACK',
      'title': 'Monitor your',
      'titleBlue': 'progress daily',
      'desc': 'Stay on top of your fitness journey.',
    },
    {
      'badge': 'ACHIEVE',
      'title': 'Reach your',
      'titleBlue': 'peak performance',
      'desc': 'Set goals and crush them.',
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemCount: _pages.length,
        itemBuilder: (context, index) => _buildPage(_pages[index]),
      ),
    );
  }

  Widget _buildPage(Map<String, String> page) {
    return Stack(
      children: [
        Positioned.fill(
          child: Stack(
            children: [
              Image.asset('assets/images/man.png', fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.background,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Lift Aura",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary, // ← التغيير هنا
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surface2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    page['badge']!,
                    style: GoogleFonts.inter(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${page['title']}\n',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      TextSpan(
                        text: page['titleBlue'],
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  page['desc']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 4,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primary
                            : AppColors.surface2,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: _skip,
                      child: Text(
                        "Skip",
                        style: GoogleFonts.inter(
                            color: AppColors.textSecondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _currentPage == _pages.length - 1
                                ? "Get Started"
                                : "Next",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}