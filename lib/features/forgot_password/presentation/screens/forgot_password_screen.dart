import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'SECURITY PROTOCOL',
          style: GoogleFonts.inter(
            color: AppColors.textMuted,
            fontSize: 12,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.lock_reset,
                      size: 56, color: AppColors.primary),
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Forgot\n',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        height: 1.3,
                      ),
                    ),
                    TextSpan(
                      text: 'Password?',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Enter your email address below. We'll\nsend a high-security recovery code to\nyour inbox.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'IDENTITY VERIFICATION',
                  style: GoogleFonts.inter(
                    color: AppColors.primary,
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: TextField(
                  controller: _emailController,
                  style: GoogleFonts.inter(color: AppColors.textPrimary),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'name@example.com',
                    hintStyle:
                        GoogleFonts.inter(color: AppColors.textMuted),
                    prefixIcon: const Icon(Icons.alternate_email,
                        color: AppColors.textMuted, size: 20),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Send Code',
                        style: GoogleFonts.inter(
                            color: AppColors.background,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}