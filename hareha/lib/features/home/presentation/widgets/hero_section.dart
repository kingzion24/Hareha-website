import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class HeroSection extends ConsumerWidget {
  final GlobalKey showcaseKey;
  
  const HeroSection({
    super.key,
    required this.showcaseKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: responsive.isMobile ? 600 : 700,
      ),
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: responsive.isMobile
              ? _buildMobileLayout(context, language)
              : _buildDesktopLayout(context, language),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, String language) {
    return Column(
      children: [
        AnimatedFadeIn(
          child: _buildTextContent(context, language, true),
        ),
        const SizedBox(height: AppSizes.xl),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 300),
          child: _buildImageContent(context),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, String language) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: AnimatedFadeIn(
            child: _buildTextContent(context, language, false),
          ),
        ),
        const SizedBox(width: AppSizes.xl3),
        Expanded(
          flex: 5,
          child: AnimatedFadeIn(
            delay: const Duration(milliseconds: 300),
            child: _buildImageContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, String language, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Chip Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            language == 'sw' 
                ? 'Suluhisho Mahiri za Data kwa Biashara za Tanzania' 
                : 'Data Solutions for Tanzanian Businesses',
            style: AppTextStyles.bodySmall(context).copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        
        const SizedBox(height: AppSizes.xl2),
        
        // Main Title
        Text(
          language == 'sw'
              ? 'Suluhisho Mahiri \nZinazoendeshwa na Data\nKukuza Biashara Yako'
              : 'Smart Data-Driven\nSolutions to Grow\nYour Business',
          style: AppTextStyles.displayLarge(context).copyWith(
            color: AppColors.white,
            fontSize: isMobile ? 36 : 56,
            height: 1.1,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
          ),
        ),
        
        const SizedBox(height: AppSizes.xl2),
        
        // Description Box
        Container
        (
          padding: const EdgeInsets.all(AppSizes.xl),
          decoration: BoxDecoration(
            color: AppColors.cyan.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          ),
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text
              (
                language == 'sw'
                    ? 'Gundua suluhisho zinazoongozwa na data, zilizoundwa kuinua biashara yako kufikia viwango vipya na kuchochea ukuaji endelevu katika mazingira ya ushindani ya leo.'
                    : "Discover data-driven solutions designed to elevate your business to new heights and drive sustainable growth in today's competitive landscape.",
                style: AppTextStyles.bodyMedium(context).copyWith(
                  color: AppColors.white,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              
              // Button and Avatars Row
              Wrap(
                spacing: AppSizes.md,
                runSpacing: AppSizes.sm,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (showcaseKey.currentContext != null) {
                        Scrollable.ensureVisible(
                          showcaseKey.currentContext!,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.darkNavy,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.lg,
                        vertical: AppSizes.md,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      language == 'sw' ? 'Jua Zaidi' : 'Explore More',
                      style: AppTextStyles.buttonMedium(context).copyWith(
                        color: AppColors.darkNavy,
                      ),
                    ),
                  ),
                  
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Stack(
                          children: [
                            _buildAvatar(0),
                            Positioned(left: 20, child: _buildAvatar(1)),
                            Positioned(left: 40, child: _buildAvatar(2)),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        '+50 More',
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
        minHeight: 300,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        child: Image.asset(
          'lib/resources/images/heroimage.png',
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(AppSizes.radiusXl),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.analytics,
                      size: 80,
                      color: AppColors.white.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      'Hero Image',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAvatar(int index) {
    final colors = [
      AppColors.cyan,
      AppColors.brightBlue,
      AppColors.accentPurple,
    ];
    
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: colors[index % colors.length],
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.darkNavy,
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.person,
        color: AppColors.white,
        size: 16,
      ),
    );
  }
}