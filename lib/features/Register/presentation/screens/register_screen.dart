import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                      Text('Lift Aura',
                          style: GoogleFonts.spaceGrotesk(
                              color: AppColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
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
              Text('Create Account 🚀',
                  style: GoogleFonts.spaceGrotesk(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('Start your fitness journey and\nelevate your aura today.',
                  style: GoogleFonts.inter(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.5)),
              const SizedBox(height: 32),
              _buildLabel('FULL NAME'),
              const SizedBox(height: 8),
              _buildTextField(
                  controller: _nameController,
                  hint: 'John Doe',
                  icon: Icons.person_outline),
              const SizedBox(height: 20),
              _buildLabel('EMAIL ADDRESS'),
              const SizedBox(height: 8),
              _buildTextField(
                  controller: _emailController,
                  hint: 'name@example.com',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              _buildLabel('PASSWORD'),
              const SizedBox(height: 8),
              _buildPasswordField(
                controller: _passwordController,
                obscure: _obscurePassword,
                onToggle: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
              const SizedBox(height: 20),
              _buildLabel('CONFIRM PASSWORD'),
              const SizedBox(height: 8),
              _buildPasswordField(
                controller: _confirmPasswordController,
                obscure: _obscureConfirmPassword,
                onToggle: () => setState(
                    () => _obscureConfirmPassword = !_obscureConfirmPassword),
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
                        Navigator.pushReplacementNamed(context, '/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('CREATE ACCOUNT',
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
                  const Expanded(child: Divider(color: AppColors.border)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('OR',
                        style: GoogleFonts.inter(
                            color: AppColors.textMuted,
                            fontSize: 12,
                            letterSpacing: 1)),
                  ),
                  const Expanded(child: Divider(color: AppColors.border)),
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
                    Text('Already have an account? ',
                        style: GoogleFonts.inter(
                            color: AppColors.textSecondary, fontSize: 14)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text('Log In',
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

  Widget _buildLabel(String text) {
    return Text(text,
        style: GoogleFonts.inter(
            color: AppColors.textMuted, fontSize: 11, letterSpacing: 1.5));
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      style: GoogleFonts.inter(color: AppColors.textPrimary),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: AppColors.textMuted),
        prefixIcon: Icon(icon, color: AppColors.textMuted),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: GoogleFonts.inter(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: '••••••••',
        hintStyle: GoogleFonts.inter(color: AppColors.textMuted),
        prefixIcon:
            const Icon(Icons.lock_outline, color: AppColors.textMuted),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: AppColors.textMuted,
          ),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isLoginTab) {
    final isSelected = !isLoginTab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (isLoginTab) Navigator.pop(context);
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