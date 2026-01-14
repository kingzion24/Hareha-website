import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class CTASection extends ConsumerWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      width: double.infinity,
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
          child: AnimatedFadeIn(
            child: Column(
              children: [
                Text(
                  language == 'sw'
                      ? 'Tayari Kujenga Biashara yako Pamoja'
                      : 'Let\'s Build The\nFuture Together',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    color: AppColors.white,
                    fontSize: responsive.isMobile ? 36 : 56,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.xl2),
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.darkNavy,
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.isMobile ? AppSizes.xl : AppSizes.xl2,
                      vertical: AppSizes.lg,
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
                        language == 'sw' ? 'Wasiliana Nasi' : 'Get In Touch',
                        style: AppTextStyles.buttonLarge(context).copyWith(
                          color: AppColors.darkNavy,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.darkNavy,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}