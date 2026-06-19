import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDHeroSection extends ConsumerStatefulWidget {
  const MDHeroSection({super.key});

  @override
  ConsumerState<MDHeroSection> createState() => _MDHeroSectionState();
}

class _MDHeroSectionState extends ConsumerState<MDHeroSection> {
  int _currentQuestionIndex = 0;
  Timer? _rotationTimer;
  Timer? _screenshotTimer;

  final List<String> _questionsEN = [
    'Running Your Shop in Your Head?',
    'Lost Track of What Sold Yesterday?',
    'Still Writing Everything in Notebooks?',
    'Want to Know Your Real Profit Today?',
  ];

  final List<String> _questionsSW = [
    'Unasimamia Duka na kumbukumbu tuu?',
    'Umesahau Uliuza Nini Jana?',
    'Bado Unaandika Kila Kitu Vitabuni?',
    'Unataka Kujua Faida Yako Halisi Leo?',
  ];

  final List<String> _screenshots = [
    'lib/resources/images/dashboard_screen_1.jpeg',
    'lib/resources/images/sales_screen_1.jpeg',
    'lib/resources/images/inventory_screen_1.jpeg',
  ];

  int _currentScreenshot = 0;

  @override
  void initState() {
    super.initState();
    
    // Rotate questions every 60 seconds
    _rotationTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
      if (mounted) {
        setState(() {
          _currentQuestionIndex = (_currentQuestionIndex + 1) % _questionsEN.length;
        });
      }
    });

    // Rotate screenshots every 20 seconds
    _screenshotTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      if (mounted) {
        setState(() {
          _currentScreenshot = (_currentScreenshot + 1) % _screenshots.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _rotationTimer?.cancel();
    _screenshotTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);
    final questions = language == 'sw' ? _questionsSW : _questionsEN;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: responsive.isMobile ? 700 : 800,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accentOrange.withValues(alpha: 0.1),
            AppColors.cyan.withValues(alpha: 0.1),
            AppColors.white,
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
          child: responsive.isMobile
              ? _buildMobileLayout(context, language, questions)
              : _buildDesktopLayout(context, language, questions),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
      BuildContext context, String language, List<String> questions) {
    return Column(
      children: [
        _buildTextContent(context, language, questions, true),
        const SizedBox(height: AppSizes.xl2),
        _buildScreenshotCarousel(context, true),
      ],
    );
  }

  Widget _buildDesktopLayout(
      BuildContext context, String language, List<String> questions) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: _buildTextContent(context, language, questions, false),
        ),
        const SizedBox(width: AppSizes.xl3),
        Expanded(
          flex: 5,
          child: _buildScreenshotCarousel(context, false),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, String language,
      List<String> questions, bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Mali Daftari Logo + Text
        AnimatedFadeIn(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/resources/images/mali_daftari_Logo.png',
                height: isMobile ? 50 : 60,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isMobile ? 50 : 60,
                    width: isMobile ? 50 : 60,
                    decoration: BoxDecoration(
                      color: AppColors.accentOrange.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Icon(
                      Icons.store,
                      color: AppColors.accentOrange,
                      size: isMobile ? 24 : 30,
                    ),
                  );
                },
              ),
              const SizedBox(width: AppSizes.md),
              Text(
                'Mali Daftari',
                style: AppTextStyles.h2(context).copyWith(
                  color: AppColors.darkNavy,
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSizes.xl2),

        // Animated Rotating Question - Simple CrossFade
        SizedBox(
          height: isMobile ? 120 : 150,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text(
              questions[_currentQuestionIndex],
              key: ValueKey<int>(_currentQuestionIndex),
              style: AppTextStyles.displayLarge(context).copyWith(
                color: AppColors.darkNavy,
                fontSize: isMobile ? 32 : 56,
                height: 1.1,
                fontWeight: FontWeight.w700,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
        ),

        const SizedBox(height: AppSizes.xl),

        // Subtitle
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 100),
          child: Text(
            language == 'sw'
                ? 'Mali Daftari inafuatilia mauzo, hesabu, na gharama - kiotomatiki'
                : 'Mali Daftari tracks sales, inventory, and expenses - automatically',
            style: AppTextStyles.h4(context).copyWith(
              color: AppColors.textGray,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),

        const SizedBox(height: AppSizes.xl2),

        // Download Buttons
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 400),
          child: Wrap(
            spacing: AppSizes.md,
            runSpacing: AppSizes.md,
            alignment:
                isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              // App Store - Coming Soon
              _buildComingSoonButton(
                label: 'App Store',
                icon: Icons.apple,
                language: language,
              ),
              // Play Store - Coming Soon
              _buildComingSoonButton(
                label: 'Google Play',
                icon: Icons.play_arrow,
                language: language,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScreenshotCarousel(BuildContext context, bool isMobile) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 300),
      child: Column(
        children: [
          // Main Screenshot Display
          Container(
            constraints: BoxConstraints(
              maxHeight: isMobile ? 400 : 500,
              maxWidth: isMobile ? 250 : 300,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentOrange.withValues(alpha: 0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  _screenshots[_currentScreenshot],
                  key: ValueKey<int>(_currentScreenshot),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius:
                            BorderRadius.circular(AppSizes.radiusXl),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.phone_android,
                          size: 80,
                          color: AppColors.textGray,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSizes.lg),

          // Carousel Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _screenshots.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _currentScreenshot = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentScreenshot == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentScreenshot == index
                        ? AppColors.accentOrange
                        : AppColors.textGray.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComingSoonButton({
    required String label,
    required IconData icon,
    required String language,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        border: Border.all(
          color: AppColors.textGray.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: AppColors.textGray),
          const SizedBox(width: AppSizes.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                language == 'sw' ? 'Inakuja Hivi Karibuni' : 'Coming Soon',
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: AppColors.textGray,
                  fontSize: 10,
                ),
              ),
              Text(
                label,
                style: AppTextStyles.buttonMedium(context).copyWith(
                  color: AppColors.textGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}