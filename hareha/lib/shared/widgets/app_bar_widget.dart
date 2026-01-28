import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/app_sizes.dart';
import '../../core/localization/l10n_provider.dart';
import '../../core/utils/responsive.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final currentRoute = GoRouterState.of(context).uri.path;
    final language = ref.watch(languageProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkNavy,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: AppSizes.sm,
          ),
          child: Row(
            children: [
              // Logo
              InkWell(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    Image.asset(
                      'lib/resources/images/image-removebg-preview(1).png',
                      height: 32,
                      width: 32,
                      color: AppColors.white,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.business_center,
                            color: AppColors.darkNavy,
                            size: 20,
                          ),
                        );
                      },
                    ),
                    if (!responsive.isMobile) ...[
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        'Hareha',
                        style: AppTextStyles.h4(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Navigation Links
              if (responsive.isDesktop) ...[
                _NavLink(
                  label: language == 'sw' ? 'Nyumbani' : 'Home',
                  isActive: currentRoute == '/',
                  onTap: () => context.go('/'),
                ),
                const SizedBox(width: AppSizes.xl),
                _NavLink(
                  label: language == 'sw' ? 'Kuhusu' : 'About Us',
                  isActive: currentRoute == '/about',
                  onTap: () => context.go('/about'),
                ),
                const SizedBox(width: AppSizes.xl),
                _NavLink(
                  label: 'Mali Daftari',
                  isActive: currentRoute == '/mali-daftari',
                  onTap: () => context.go('/mali-daftari'),
                ),
                const SizedBox(width: AppSizes.xl),
                _NavLink(
                  label: 'Mali Akili',
                  isActive: currentRoute == '/mali-akili',
                  onTap: () => context.go('/mali-akili'),
                ),
                const SizedBox(width: AppSizes.xl),
              ],
              
              // Language Switcher
              _LanguageSwitcher(),
              
              const SizedBox(width: AppSizes.md),
              
              // Contact Button
              if (responsive.isDesktop)
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.darkNavy,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.lg,
                      vertical: AppSizes.sm,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        language == 'sw' ? 'Wasiliana Sasa' : 'Contact Us Now',
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: AppColors.darkNavy,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(Icons.arrow_forward, size: 14),
                    ],
                  ),
                ),
              
              // Mobile Menu
              if (!responsive.isDesktop)
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.white),
                  onPressed: () => _showMobileMenu(context, ref, currentRoute),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context, WidgetRef ref, String currentRoute) {
    final language = ref.read(languageProvider);
    
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkNavy,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusXl)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSizes.md),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSizes.xl),
            _MobileNavLink(
              label: language == 'sw' ? 'Nyumbani' : 'Home',
              isActive: currentRoute == '/',
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            _MobileNavLink(
              label: language == 'sw' ? 'Kuhusu' : 'About Us',
              isActive: currentRoute == '/about',
              onTap: () {
                Navigator.pop(context);
                context.go('/about');
              },
            ),
            _MobileNavLink(
              label: 'Mali Daftari',
              isActive: currentRoute == '/mali-daftari',
              onTap: () {
                Navigator.pop(context);
                context.go('/mali-daftari');
              },
            ),
            _MobileNavLink(
              label: 'Mali Akili',
              isActive: currentRoute == '/mali-akili',
              onTap: () {
                Navigator.pop(context);
                context.go('/mali-akili');
              },
            ),
            const SizedBox(height: AppSizes.md),
            Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.go('/contact');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.darkNavy,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                  ),
                ),
                child: Text(
                  language == 'sw' ? 'Wasiliana' : 'Contact Us',
                  style: AppTextStyles.buttonMedium(context).copyWith(
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.md),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyles.bodySmall(context).copyWith(
          color: AppColors.white,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}

class _MobileNavLink extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _MobileNavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: AppTextStyles.bodyMedium(context).copyWith(
          color: AppColors.white,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      trailing: isActive ? const Icon(Icons.check, color: AppColors.cyan) : null,
      onTap: onTap,
    );
  }
}

class _LanguageSwitcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageButton(
            label: 'EN',
            isActive: language == 'en',
            onTap: () => ref.read(languageProvider.notifier).state = 'en',
          ),
          _LanguageButton(
            label: 'SW',
            isActive: language == 'sw',
            onTap: () => ref.read(languageProvider.notifier).state = 'sw',
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.sm,
          vertical: AppSizes.xs,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodySmall(context).copyWith(
            color: isActive ? AppColors.darkNavy : AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}