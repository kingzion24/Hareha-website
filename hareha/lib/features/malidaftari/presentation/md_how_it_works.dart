import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDHowItWorks extends ConsumerWidget {
  const MDHowItWorks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    final steps = language == 'sw'
        ? [
            {
              'number': '1',
              'title': 'Ongeza Bidhaa',
              'description':
                  'Ingiza bidhaa zako na bei ya mzigo',
              'screenshot': 'lib/resources/images/inventory_screen_1.jpeg',
            },
            {
              'number': '2',
              'title': 'Rekodi Mauzo',
              'description':
                  'Rekodi mauzo kwa haraka na mizigo itasasishwa kiotomatiki',
              'screenshot': 'lib/resources/images/sales_screen_2.jpeg',
            },
            {
              'number': '3',
              'title': 'Tazama Maarifa',
              'description':
                  'Pata ripoti za papo hapo za faida na utendaji wa biashara',
              'screenshot': 'lib/resources/images/dashboard_screen_2.jpeg',
            },
          ]
        : [
            {
              'number': '1',
              'title': 'Add Products',
              'description': 'Input your products with buying and selling prices',
              'screenshot': 'lib/resources/images/inventory_screen_1.jpeg',
            },
            {
              'number': '2',
              'title': 'Record Sales',
              'description':
                  'Quick sale recording and automatic stock updates',
              'screenshot': 'lib/resources/images/sales_screen_2.jpeg',
            },
            {
              'number': '3',
              'title': 'View Insights',
              'description':
                  'Get instant reports on profit and business performance',
              'screenshot': 'lib/resources/images/dashboard_screen_1.jpeg',
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
                child: Column(
                  children: [
                    Text(
                      language == 'sw'
                          ? 'Jinsi Inavyofanya Kazi'
                          : 'How It Works',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 32 : 42,
                        color: AppColors.darkNavy,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      language == 'sw'
                          ? 'Anza kusimamia biashara yako katika hatua 3 rahisi'
                          : 'Start managing your business in 3 simple steps',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),

              // Steps
              ...steps.asMap().entries.map((entry) {
                final index = entry.key;
                final step = entry.value;
                return AnimatedFadeIn(
                  delay: Duration(milliseconds: 200 * index),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: index < steps.length - 1
                          ? (responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3)
                          : 0,
                    ),
                    child: _StepCard(
                      number: step['number'] as String,
                      title: step['title'] as String,
                      description: step['description'] as String,
                      screenshot: step['screenshot'] as String,
                      isEven: index % 2 == 0,
                      isMobile: responsive.isMobile,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepCard extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final String screenshot;
  final bool isEven;
  final bool isMobile;

  const _StepCard({
    required this.number,
    required this.title,
    required this.description,
    required this.screenshot,
    required this.isEven,
    required this.isMobile,
  });

  @override
  State<_StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<_StepCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isMobile) {
      return _buildMobileLayout();
    }

    return _buildDesktopLayout();
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildNumberBadge(),
        const SizedBox(height: AppSizes.lg),
        _buildScreenshot(),
        const SizedBox(height: AppSizes.lg),
        _buildContent(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    final screenshot = _buildScreenshot();
    final content = _buildContent();

    if (widget.isEven) {
      return Row(
        children: [
          _buildNumberBadge(),
          const SizedBox(width: AppSizes.xl),
          Expanded(flex: 4, child: content),
          const SizedBox(width: AppSizes.xl2),
          Expanded(flex: 3, child: screenshot),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 3, child: screenshot),
          const SizedBox(width: AppSizes.xl2),
          Expanded(flex: 4, child: content),
          const SizedBox(width: AppSizes.xl),
          _buildNumberBadge(),
        ],
      );
    }
  }

  Widget _buildNumberBadge() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accentOrange,
            AppColors.accentOrange.withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentOrange.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          widget.number,
          style: AppTextStyles.displayMedium(context).copyWith(
            fontSize: 32,
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildScreenshot() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: widget.isMobile ? 300 : 400,
            maxWidth: widget.isMobile ? 200 : 250,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.cyan.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: _isHovered ? 25 : 15,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            child: Image.asset(
              widget.screenshot,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.phone_android,
                      size: 60,
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

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: widget.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.h2(context).copyWith(
            color: AppColors.darkNavy,
            fontWeight: FontWeight.w700,
          ),
          textAlign: widget.isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: AppSizes.md),
        Text(
          widget.description,
          style: AppTextStyles.bodyLarge(context).copyWith(
            color: AppColors.textGray,
            height: 1.7,
          ),
          textAlign: widget.isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }
}