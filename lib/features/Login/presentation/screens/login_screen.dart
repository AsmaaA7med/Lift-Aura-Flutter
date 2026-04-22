import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios,
                            color: AppColors.textPrimary, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Lift Aura',
                        style: GoogleFonts.spaceGrotesk(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    _buildTab('Log In', true),
                    _buildTab('Register', false),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Welcome Back 👋',
                style: GoogleFonts.spaceGrotesk(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The Kinetic Luminary awaits your next\npeak performance session.',
                style: GoogleFonts.inter(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Text('EMAIL ADDRESS',
                  style: GoogleFonts.inter(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      letterSpacing: 1.5)),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                style: GoogleFonts.inter(color: AppColors.textPrimary),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'name@example.com',
                  hintStyle:
                      GoogleFonts.inter(color: AppColors.textMuted),
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: AppColors.textMuted),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('PASSWORD',
                      style: GoogleFonts.inter(
                          color: AppColors.textMuted,
                          fontSize: 11,
                          letterSpacing: 1.5)),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/forgot-password'),
                    child: Text('FORGOT PASSWORD?',
                        style: GoogleFonts.inter(
                            color: AppColors.primary,
                            fontSize: 11,
                            letterSpacing: 1)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: GoogleFonts.inter(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: '••••••••',
                  hintStyle:
                      GoogleFonts.inter(color: AppColors.textMuted),
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: AppColors.textMuted),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textMuted,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/profile-setup'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('LOG IN',
                        style: GoogleFonts.inter(
                            color: AppColors.background,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                      child: Divider(color: AppColors.border)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('AI IDENTITY BRIDGE',
                        style: GoogleFonts.inter(
                            color: AppColors.textMuted,
                            fontSize: 10,
                            letterSpacing: 1)),
                  ),
                  const Expanded(
                      child: Divider(color: AppColors.border)),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata,
                      color: AppColors.textPrimary, size: 24),
                  label: Text('Continue with Google',
                      style: GoogleFonts.inter(
                          color: AppColors.textPrimary, fontSize: 15)),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New to the platform? ',
                        style: GoogleFonts.inter(
                            color: AppColors.textSecondary, fontSize: 14)),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: Text('Register',
                          style: GoogleFonts.inter(
                              color: AppColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isLoginTab) {
    final isSelected = _isLogin == isLoginTab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isLoginTab) Navigator.pushNamed(context, '/register');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColors.primaryGradient : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: isSelected
                  ? AppColors.background
                  : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}