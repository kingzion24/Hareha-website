import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class FeaturesSection extends ConsumerWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      width: double.infinity,
      color: AppColors.lightGray,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.verticalPadding,
          ),
          child: Column(
            children: [
              AnimatedFadeIn(
                child: Text(
                  getLocalizedString(AppStrings.home, 'featuresTitle', language),
                  style: AppTextStyles.h1(context),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: responsive.isMobile ? AppSizes.xl : AppSizes.xl2),
              
              // Features Grid
              _buildFeaturesGrid(context, responsive, language),
              
              const SizedBox(height: AppSizes.xl2),
              
              // CTA
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      getLocalizedString(AppStrings.home, 'maliDaftariCTATitle', language),
                      style: AppTextStyles.h3(context).copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.xl),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.go('/mali-daftari');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cyan,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.isMobile ? AppSizes.xl : AppSizes.xl2,
                          vertical: AppSizes.md,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        getLocalizedString(AppStrings.home, 'maliDaftariCTAButton', language),
                        style: AppTextStyles.buttonLarge(context),
                      ),
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      getLocalizedString(AppStrings.home, 'maliDaftariCTAFooter', language),
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: AppColors.textGray,
                      ),
                      textAlign: TextAlign.center,
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

  Widget _buildFeaturesGrid(BuildContext context, Responsive responsive, String language) {
    final features = [
      _FeatureData(
        icon: Icons.point_of_sale,
        title: getLocalizedString(AppStrings.home, 'feature1Title', language),
        description: getLocalizedString(AppStrings.home, 'feature1Desc', language),
      ),
      _FeatureData(
        icon: Icons.inventory,
        title: getLocalizedString(AppStrings.home, 'feature2Title', language),
        description: getLocalizedString(AppStrings.home, 'feature2Desc', language),
      ),
      _FeatureData(
        icon: Icons.attach_money,
        title: getLocalizedString(AppStrings.home, 'feature3Title', language),
        description: getLocalizedString(AppStrings.home, 'feature3Desc', language),
      ),
      _FeatureData(
        icon: Icons.groups,
        title: getLocalizedString(AppStrings.home, 'feature4Title', language),
        description: getLocalizedString(AppStrings.home, 'feature4Desc', language),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: responsive.gridColumns(),
        crossAxisSpacing: AppSizes.lg,
        mainAxisSpacing: AppSizes.lg,
        childAspectRatio: responsive.isMobile ? 1.3 : 1.2,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        return AnimatedFadeIn(
          delay: Duration(milliseconds: 100 * index),
          child: _FeatureCard(
            icon: features[index].icon,
            title: features[index].title,
            description: features[index].description,
          ),
        );
      },
    );
  }
}

class _FeatureData {
  final IconData icon;
  final String title;
  final String description;

  _FeatureData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Icon(
              icon,
              size: 32,
              color: AppColors.cyan,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            title,
            style: AppTextStyles.h4(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            description,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: AppColors.textGray,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}