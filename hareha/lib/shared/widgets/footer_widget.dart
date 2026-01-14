import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/app_sizes.dart';
import '../../core/localization/l10n_provider.dart';
import '../../core/utils/responsive.dart';

// Helper function for Coming Soon
void showComingSoon(BuildContext context, String language, String feature) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: AppColors.white,
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Text(
              language == 'sw' 
                  ? '$feature - Inakuja Hivi Karibuni!' 
                  : '$feature - Coming Soon!',
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.cyan,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      margin: const EdgeInsets.all(AppSizes.lg),
    ),
  );
}

class FooterWidget extends ConsumerWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.footerGradient,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding,
        vertical: AppSizes.xl3,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          child: Column(
            children: [
              // Top Links Section
              responsive.isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductSection(context, language),
                        const SizedBox(height: AppSizes.xl),
                        _buildResourcesSection(context, language),
                        const SizedBox(height: AppSizes.xl),
                        _buildSupportSection(context, language),
                        const SizedBox(height: AppSizes.xl),
                        _buildSocialSection(context, language),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildProductSection(context, language),
                        ),
                        const SizedBox(width: AppSizes.xl2),
                        Expanded(
                          child: _buildResourcesSection(context, language),
                        ),
                        const SizedBox(width: AppSizes.xl2),
                        Expanded(
                          child: _buildSupportSection(context, language),
                        ),
                        const SizedBox(width: AppSizes.xl2),
                        Expanded(
                          child: _buildSocialSection(context, language),
                        ),
                      ],
                    ),
              
              const SizedBox(height: AppSizes.xl3),
              
              // HUGE Logo Section
              _buildHugeLogo(context, responsive),
              
              const SizedBox(height: AppSizes.xl2),
              
              // Bottom Row
              responsive.isMobile
                  ? Column(
                      children: [
                        Text(
                          '© Hareha ${DateTime.now().year}',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            color: AppColors.textGray,
                          ),
                        ),
                        const SizedBox(height: AppSizes.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _FooterBottomLink(
                              label: language == 'sw' ? 'Sera ya Faragha' : 'Privacy Policy',
                              onTap: () => showComingSoon(context, language, language == 'sw' ? 'Sera ya Faragha' : 'Privacy Policy'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                              child: Text('•', style: TextStyle(color: AppColors.textGray)),
                            ),
                            _FooterBottomLink(
                              label: language == 'sw' ? 'Masharti' : 'Terms Conditions',
                              onTap: () => showComingSoon(context, language, language == 'sw' ? 'Masharti' : 'Terms Conditions'),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '© Hareha ${DateTime.now().year}',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            color: AppColors.textGray,
                          ),
                        ),
                        Row(
                          children: [
                            _FooterBottomLink(
                              label: language == 'sw' ? 'Sera ya Faragha' : 'Privacy Policy',
                              onTap: () => showComingSoon(context, language, language == 'sw' ? 'Sera ya Faragha' : 'Privacy Policy'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                              child: Text('•', style: TextStyle(color: AppColors.textGray)),
                            ),
                            _FooterBottomLink(
                              label: language == 'sw' ? 'Masharti' : 'Terms Conditions',
                              onTap: () => showComingSoon(context, language, language == 'sw' ? 'Masharti' : 'Terms Conditions'),
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection(BuildContext context, String language) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language == 'sw' ? 'Bidhaa' : 'Product',
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSizes.md),
        _FooterLink(
          label: 'Mali Daftari',
          onTap: () => showComingSoon(context, language, 'Mali Daftari'),
        ),
        _FooterLink(
          label: language == 'sw' ? 'Ushauri wa Biashara' : 'Business Consultation',
          onTap: () => context.go('/mali-akili'),
        ),
        _FooterLink(
          label: language == 'sw' ? 'Bei' : 'Pricing',
          onTap: () => showComingSoon(context, language, language == 'sw' ? 'Bei' : 'Pricing'),
        ),
      ],
    );
  }

  Widget _buildResourcesSection(BuildContext context, String language) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language == 'sw' ? 'Rasilimali' : 'Resources',
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSizes.md),
        _FooterLink(
          label: language == 'sw' ? 'Blogi' : 'Blog',
          onTap: () => showComingSoon(context, language, language == 'sw' ? 'Blogi' : 'Blog'),
        ),
        _FooterLink(
          label: language == 'sw' ? 'Mafanikio' : 'Case Study',
          onTap: () => showComingSoon(context, language, language == 'sw' ? 'Mafanikio' : 'Case Study'),
        ),
        _FooterLink(
          label: language == 'sw' ? 'Mawasiliano ya API' : 'API Documentation',
          onTap: () => showComingSoon(context, language, language == 'sw' ? 'Mawasiliano ya API' : 'API Documentation'),
        ),
      ],
    );
  }

  Widget _buildSupportSection(BuildContext context, String language) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language == 'sw' ? 'Msaada' : 'Support',
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSizes.md),
        _FooterLink(
          label: language == 'sw' ? 'Kituo cha Msaada' : 'Help Center',
          onTap: () => showComingSoon(context, language, language == 'sw' ? 'Kituo cha Msaada' : 'Help Center'),
        ),
        _FooterLink(
          label: 'FAQs',
          onTap: () => context.go('/contact'),
        ),
        _FooterLink(
          label: language == 'sw' ? 'Wasiliana' : 'Contact',
          onTap: () => context.go('/contact'),
        ),
        _FooterLink(
          label: language == 'sw' ? 'Maoni' : 'Feedback',
          onTap: () => showComingSoon(context, language, language == 'sw' ? 'Maoni' : 'Feedback'),
        ),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context, String language) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language == 'sw' ? 'Mitandao ya Kijamii' : 'Social Media',
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSizes.md),
        _SocialButton(
          label: 'X',
          icon: Icons.close,
          onTap: () => showComingSoon(context, language, 'X (Twitter)'),
        ),
        const SizedBox(height: AppSizes.xs),
        _SocialButton(
          label: 'LinkedIn',
          icon: Icons.business,
          onTap: () => showComingSoon(context, language, 'LinkedIn'),
        ),
        const SizedBox(height: AppSizes.xs),
        _SocialButton(
          label: 'Facebook',
          icon: Icons.facebook,
          onTap: () => showComingSoon(context, language, 'Facebook'),
        ),
      ],
    );
  }

  Widget _buildHugeLogo(BuildContext context, Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl4),
      child: Column(
        children: [
          // Logo Icon
          Image.asset(
            'lib/resources/images/image-removebg-preview(1).png',
            height: responsive.isMobile ? 80 : 120,
            width: responsive.isMobile ? 80 : 120,
            color: AppColors.white,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: responsive.isMobile ? 80 : 120,
                height: responsive.isMobile ? 80 : 120,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Icon(
                  Icons.business_center,
                  color: AppColors.white,
                  size: responsive.isMobile ? 40 : 60,
                ),
              );
            },
          ),
          const SizedBox(height: AppSizes.lg),
          // HUGE Text Logo
          Text(
            'Hareha',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: responsive.isMobile ? 72 : 120,
              fontWeight: FontWeight.w900,
              color: AppColors.white,
              letterSpacing: -3,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
        child: Text(
          label,
          style: AppTextStyles.bodySmall(context).copyWith(
            color: AppColors.textGray,
          ),
        ),
      ),
    );
  }
}

class _FooterBottomLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterBottomLink({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyles.bodySmall(context).copyWith(
          color: AppColors.textGray,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(
            color: AppColors.white.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.white, size: 16),
            const SizedBox(width: AppSizes.xs),
            Text(
              label,
              style: AppTextStyles.bodySmall(context).copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}