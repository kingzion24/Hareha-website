import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDAISection extends ConsumerWidget {
  const MDAISection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accentPurple.withValues(alpha: 0.05),
            AppColors.cyan.withValues(alpha: 0.05),
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
          child: _buildAIScreenshot(context, true),
        ),
        const SizedBox(height: AppSizes.xl2),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 200),
          child: _buildAIContent(context, language, true),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, String language) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: AnimatedFadeIn(
            child: _buildAIScreenshot(context, false),
          ),
        ),
        const SizedBox(width: AppSizes.xl3),
        Expanded(
          flex: 6,
          child: AnimatedFadeIn(
            delay: const Duration(milliseconds: 200),
            child: _buildAIContent(context, language, false),
          ),
        ),
      ],
    );
  }

  Widget _buildAIScreenshot(BuildContext context, bool isMobile) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: isMobile ? 500 : 700,  // Increased from 500 to 700
        maxWidth: isMobile ? 350 : 500,   // Increased from 350 to 500
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentPurple.withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        child: Image.asset(
          'lib/resources/images/ai_chat_screen.png',
          fit: BoxFit.contain,  // Changed from cover to contain to show full image
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 80,
                      color: AppColors.accentPurple,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      'AI Chat Interface',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
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

  Widget _buildAIContent(BuildContext context, String language, bool isMobile) {
    final benefits = language == 'sw'
        ? [
            {
              'icon': Icons.translate,
              'text': 'Inafanya kazi kwa Kiswahili na Kiingereza',
            },
            {
              'icon': Icons.help_outline,
              'text': 'Jibu maswali kuhusu biashara yako',
            },
            {
              'icon': Icons.insights,
              'text': 'Pata maarifa ya mauzo na mwenendo',
            },
            {
              'icon': Icons.lightbulb_outline,
              'text': 'Mapendekezo mahiri ya kibiashara',
            },
          ]
        : [
            {
              'icon': Icons.translate,
              'text': 'Works in Swahili & English',
            },
            {
              'icon': Icons.help_outline,
              'text': 'Answers business questions',
            },
            {
              'icon': Icons.insights,
              'text': 'Provides sales insights and trends',
            },
            {
              'icon': Icons.lightbulb_outline,
              'text': 'Provide business suggestions',
            },
          ];

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.accentPurple.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            border: Border.all(
              color: AppColors.accentPurple.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome,
                size: 16,
                color: AppColors.accentPurple,
              ),
              const SizedBox(width: AppSizes.xs),
              Text(
                language == 'sw' ? 'AI Msaidizi' : 'AI Assistant',
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: AppColors.accentPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSizes.xl),

        // Title
        Text(
          language == 'sw'
              ? 'Pata Majibu Kwa Lugha Yako'
              : 'Get Answers in Your Language',
          style: AppTextStyles.displayMedium(context).copyWith(
            fontSize: isMobile ? 28 : 42,
            color: AppColors.darkNavy,
            height: 1.2,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),

        const SizedBox(height: AppSizes.lg),

        // Description
        Text(
          language == 'sw'
              ? 'Uliza maswali kuhusu biashara yako kwa Kiswahili au Kiingereza. AI ya Mali Daftari inakusaidia kuelewa mwenendo wa mauzo, kusimamia mizigo, na kufanya maamuzi bora.'
              : 'Ask questions about your business in Swahili or English. Mali Daftari\'s AI helps you understand sales trends, manage inventory, and make better decisions.',
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.textGray,
            height: 1.7,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),

        const SizedBox(height: AppSizes.xl2),

        // Benefits List
        ...benefits.map((benefit) => Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.md),
              child: Row(
                mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSizes.xs),
                    decoration: BoxDecoration(
                      color: AppColors.accentPurple.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Icon(
                      benefit['icon'] as IconData,
                      size: 20,
                      color: AppColors.accentPurple,
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Flexible(
                    child: Text(
                      benefit['text'] as String,
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.darkNavy,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}