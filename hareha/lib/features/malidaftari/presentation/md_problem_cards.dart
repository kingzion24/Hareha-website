import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDProblemCards extends ConsumerWidget {
  const MDProblemCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    final problems = language == 'sw'
        ? [
            {
              'icon': Icons.psychology_outlined,
              'title': 'Vitabu vya Mkono Vinapoteza Wakati',
              'description':
                  'Acha kupoteza masaa ukiandika na kuhesabu kwa mkono',
            },
            {
              'icon': Icons.inventory_2_outlined,
              'title': 'Upotevu wa Mizigo',
              'description':
                  'Jua kwa usahihi una nini kwenye hifadhi kila wakati',
            },
            {
              'icon': Icons.monetization_on_outlined,
              'title': 'Faida Isiyowazi',
              'description': 'Ona faida yako halisi kila siku, bila kukisia',
            },
            {
              'icon': Icons.people_outline,
              'title': 'Kutoweza Kusimamia Wasaidizi',
              'description': 'Angalia mauzo ya duka lako kutoka nyumbani bila wasiwasi',
            },
          ]
        : [
            {
              'icon': Icons.psychology_outlined,
              'title': 'Manual Books Waste Time',
              'description':
                  'Stop wasting hours writing and calculating by hand',
            },
            {
              'icon': Icons.inventory_2_outlined,
              'title': 'Stock Loss from Poor Tracking',
              'description': 'Know exactly what you have in stock at all times',
            },
            {
              'icon': Icons.monetization_on_outlined,
              'title': 'Unclear Profit Picture',
              'description': 'See your real profit every day, no guesswork',
            },
            {
              'icon': Icons.people_outline,
              'title': 'Can\'t Monitor Your Assistants',
              'description': 'Check your shop sales from home without worry',
            },
          ];

    return Container(
      width: double.infinity,
      color: AppColors.white,
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
                      ? 'Matatizo Tunayoyasuluhisha'
                      : 'Problems We Solve',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 42,
                    color: AppColors.darkNavy,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                  height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),

              // Problem Cards Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.isMobile ? 1 : (responsive.isTablet ? 2 : 4),
                  crossAxisSpacing: AppSizes.xl,
                  mainAxisSpacing: AppSizes.xl,
                  // Changed from 1.0 to 0.85 to give more height for text
                  childAspectRatio: responsive.isMobile ? 2.5 : 0.85,
                ),
                itemCount: problems.length,
                itemBuilder: (context, index) {
                  return AnimatedFadeIn(
                    delay: Duration(milliseconds: 100 * index),
                    child: _ProblemCard(
                      icon: problems[index]['icon'] as IconData,
                      title: problems[index]['title'] as String,
                      description: problems[index]['description'] as String,
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

class _ProblemCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ProblemCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_ProblemCard> createState() => _ProblemCardState();
}

class _ProblemCardState extends State<_ProblemCard> {
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
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(
            color: _isHovered
                ? AppColors.accentOrange
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.accentOrange.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.accentOrange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: AppColors.accentOrange,
              ),
            ),

            const SizedBox(height: AppSizes.md),

            // Title - with flexible to allow proper sizing
            Flexible(
              child: Text(
                widget.title,
                style: AppTextStyles.h4(context).copyWith(
                  color: AppColors.darkNavy,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.visible,
              ),
            ),

            const SizedBox(height: AppSizes.sm),

            // Description - with flexible to allow proper sizing
            Flexible(
              child: Text(
                widget.description,
                style: AppTextStyles.bodyMedium(context).copyWith(
                  color: AppColors.textGray,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}