import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDDownloadCTA extends ConsumerWidget {
  const MDDownloadCTA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    final screenshots = [
      'lib/resources/images/dashboard_screen_1.jpeg',
      'lib/resources/images/sales_screen_1.jpeg',
      'lib/resources/images/inventory_screen_1.jpeg',
      'lib/resources/images/expenses_screen_1.jpeg',
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white,
            AppColors.accentOrange.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: Column(
            children: [
              // Title
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      language == 'sw'
                          ? 'Tayari Kuanza Kufuatilia Biashara Yako?'
                          : 'Ready to Start Tracking Your Business?',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 28 : 48,
                        color: AppColors.darkNavy,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      language == 'sw'
                          ? 'Pakua Mali Daftari leo na uanze kusimamia biashara yako kwa ujuzi'
                          : 'Download Mali Daftari today and start managing your business with intelligence',
                      style: AppTextStyles.bodyLarge(context).copyWith(
                        color: AppColors.textGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),

              // Screenshot Grid
              if (!responsive.isMobile)
                AnimatedFadeIn(
                  delay: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: screenshots
                          .asMap()
                          .entries
                          .map((entry) => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.sm,
                                ),
                                child: AnimatedFadeIn(
                                  delay: Duration(
                                      milliseconds: 100 * entry.key),
                                  child: _ScreenshotCard(
                                    screenshot: entry.value,
                                    index: entry.key,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),

              SizedBox(
                  height: responsive.isMobile ? AppSizes.xl : AppSizes.xl2),

              // Download Buttons
              AnimatedFadeIn(
                delay: Duration(
                    milliseconds: responsive.isMobile ? 200 : 600),
                child: Wrap(
                  spacing: AppSizes.md,
                  runSpacing: AppSizes.md,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildComingSoonButton(
                      context: context,
                      label: 'App Store',
                      icon: Icons.apple,
                      language: language,
                    ),
                    _buildComingSoonButton(
                      context: context,
                      label: 'Google Play',
                      icon: Icons.play_arrow,
                      language: language,
                    ),
                    //TODO: Enable when APK is ready for download
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.xl),

              // Feature Bullets
              AnimatedFadeIn(
                delay: Duration(
                    milliseconds: responsive.isMobile ? 400 : 800),
                child: Wrap(
                  spacing: AppSizes.xl,
                  runSpacing: AppSizes.md,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildFeatureBullet(
                      context,
                      Icons.check_circle_outline,
                      language == 'sw' ? 'Bure Kupakua' : 'Free to Download',
                    ),
                    _buildFeatureBullet(
                      context,
                      Icons.wifi_off,
                      language == 'sw'
                          ? 'Inafanya Kazi Bila Mtandao'
                          : 'Works Offline',
                    ),
                    _buildFeatureBullet(
                      context,
                      Icons.language,
                      language == 'sw'
                          ? 'Kiswahili & Kiingereza'
                          : 'Swahili & English',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComingSoonButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String language,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.xl,
        vertical: AppSizes.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        border: Border.all(
          color: AppColors.textGray.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: AppColors.textGray),
          const SizedBox(width: AppSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                language == 'sw' ? 'Inakuja Hivi Karibuni' : 'Coming Soon',
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: AppColors.textGray,
                  fontSize: 11,
                ),
              ),
              Text(
                label,
                style: AppTextStyles.buttonLarge(context).copyWith(
                  color: AppColors.textGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required String language,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentOrange,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.xl,
          vertical: AppSizes.lg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        ),
        elevation: 5,
        shadowColor: AppColors.accentOrange.withValues(alpha: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: AppSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                language == 'sw' ? 'Pakua Sasa' : 'Download Now',
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: AppColors.white,
                  fontSize: 11,
                ),
              ),
              Text(
                label,
                style: AppTextStyles.buttonLarge(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBullet(
      BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.accentOrange,
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          text,
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.darkNavy,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ScreenshotCard extends StatefulWidget {
  final String screenshot;
  final int index;

  const _ScreenshotCard({
    required this.screenshot,
    required this.index,
  });

  @override
  State<_ScreenshotCard> createState() => _ScreenshotCardState();
}

class _ScreenshotCardState extends State<_ScreenshotCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -10 : 0,
          0,
        ),
        child: Container(
          width: 150,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.accentOrange.withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.1),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            child: Image.asset(
              widget.screenshot,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.lightGray,
                  child: Center(
                    child: Icon(
                      Icons.phone_android,
                      size: 40,
                      color: AppColors.textGray,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}