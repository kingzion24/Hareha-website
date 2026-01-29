import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDFeaturesGrid extends ConsumerWidget {
  const MDFeaturesGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    final features = language == 'sw'
        ? [
            {
              'icon': Icons.point_of_sale,
              'title': 'Ufuatiliaji wa Mauzo',
              'description':
                  'Rekodi mauzo kwa haraka na upate ripoti za kila siku',
            },
            {
              'icon': Icons.inventory,
              'title': 'Usimamizi wa Hesabu',
              'description':
                  'Fuatilia mizigo yako na upate arifa za kupungua kwa hifadhi',
            },
            {
              'icon': Icons.attach_money,
              'title': 'Ufuatiliaji wa Gharama',
              'description':
                  'Rekodi gharama zote na uone faida yako halisi',
            },
            {
              'icon': Icons.analytics,
              'title': 'Ripoti za Biashara',
              'description':
                  'Pata maarifa ya kila siku, wiki na mwezi kuhusu biashara yako',
            },
            {
              'icon': Icons.language,
              'title': 'Lugha Nyingi',
              'description': 'Tumia programu kwa Kiswahili au Kiingereza',
            },
          ]
        : [
            {
              'icon': Icons.point_of_sale,
              'title': 'Sales Tracking',
              'description':
                  'Record sales quickly and get daily revenue reports',
            },
            {
              'icon': Icons.inventory,
              'title': 'Inventory Management',
              'description':
                  'Track your stock and get low inventory alerts',
            },
            {
              'icon': Icons.attach_money,
              'title': 'Expense Tracking',
              'description': 'Record all expenses and see your real profit',
            },
            {
              'icon': Icons.analytics,
              'title': 'Business Reports',
              'description':
                  'Get daily, weekly, and monthly insights on your business',
            },
            {
              'icon': Icons.language,
              'title': 'Multi-language Support',
              'description': 'Use the app in Swahili or English',
            },
            {
              'icon': Icons.people,
              'title': 'Team Management',
              'description': 'Manage your team effectively and monitor their performance',
            },

          ];

    return Container(
      width: double.infinity,
      color: AppColors.lightGray,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: Column(
            children: [
              // Section Title
              AnimatedFadeIn(
                child: Text(
                  language == 'sw'
                      ? 'Vipengele Muhimu'
                      : 'Key Features',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 42,
                    color: AppColors.darkNavy,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                  height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),

              // Features Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.isMobile
                      ? 1
                      : (responsive.isTablet ? 2 : 3),
                  crossAxisSpacing: AppSizes.xl,
                  mainAxisSpacing: AppSizes.xl,
                  childAspectRatio: responsive.isMobile ? 2.5 : 1.3,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return AnimatedFadeIn(
                    delay: Duration(milliseconds: 100 * index),
                    child: _FeatureCard(
                      icon: features[index]['icon'] as IconData,
                      title: features[index]['title'] as String,
                      description: features[index]['description'] as String,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppSizes.xl),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.cyan.withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.cyan.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: AppColors.cyan,
              ),
            ),

            const SizedBox(height: AppSizes.md),

            // Title
            Text(
              widget.title,
              style: AppTextStyles.h4(context).copyWith(
                color: AppColors.darkNavy,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.sm),

            // Description
            Text(
              widget.description,
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: AppColors.textGray,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}