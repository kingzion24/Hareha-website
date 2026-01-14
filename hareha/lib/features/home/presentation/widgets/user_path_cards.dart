import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class UserPathCards extends ConsumerWidget {
  const UserPathCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.verticalPadding,
          ),
          child: Column(
            children: [
              // Section Title
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      getLocalizedString(AppStrings.home, 'problemSectionTitle', language),
                      style: AppTextStyles.h1(context),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      getLocalizedString(AppStrings.home, 'problemSectionSubtitle', language),
                      style: AppTextStyles.h3(context).copyWith(
                        color: AppColors.cyan,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl : AppSizes.xl2),
              
              // Cards
              responsive.isMobile
                  ? Column(
                      children: [
                        AnimatedFadeIn(
                          child: _PathCard(
                            title: getLocalizedString(AppStrings.home, 'card1Title', language),
                            points: [
                              getLocalizedString(AppStrings.home, 'card1Point1', language),
                              getLocalizedString(AppStrings.home, 'card1Point2', language),
                              getLocalizedString(AppStrings.home, 'card1Point3', language),
                              getLocalizedString(AppStrings.home, 'card1Point4', language),
                            ],
                            buttonLabel: getLocalizedString(AppStrings.home, 'card1Button', language),
                            color: AppColors.cyan,
                            onTap: () {
                              // TODO: Navigate to Mali Daftari section
                            },
                          ),
                        ),
                        const SizedBox(height: AppSizes.lg),
                        AnimatedFadeIn(
                          delay: const Duration(milliseconds: 100),
                          child: _PathCard(
                            title: getLocalizedString(AppStrings.home, 'card2Title', language),
                            points: [
                              getLocalizedString(AppStrings.home, 'card2Point1', language),
                              getLocalizedString(AppStrings.home, 'card2Point2', language),
                              getLocalizedString(AppStrings.home, 'card2Point3', language),
                              getLocalizedString(AppStrings.home, 'card2Point4', language),
                            ],
                            buttonLabel: getLocalizedString(AppStrings.home, 'card2Button', language),
                            color: AppColors.accentPurple,
                            onTap: () {
                              // TODO: Navigate to Mali Akili section
                            },
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AnimatedFadeIn(
                            child: _PathCard(
                              title: getLocalizedString(AppStrings.home, 'card1Title', language),
                              points: [
                                getLocalizedString(AppStrings.home, 'card1Point1', language),
                                getLocalizedString(AppStrings.home, 'card1Point2', language),
                                getLocalizedString(AppStrings.home, 'card1Point3', language),
                                getLocalizedString(AppStrings.home, 'card1Point4', language),
                              ],
                              buttonLabel: getLocalizedString(AppStrings.home, 'card1Button', language),
                              color: AppColors.cyan,
                              onTap: () {
                                // TODO: Navigate to Mali Daftari section
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.xl),
                        Expanded(
                          child: AnimatedFadeIn(
                            delay: const Duration(milliseconds: 150),
                            child: _PathCard(
                              title: getLocalizedString(AppStrings.home, 'card2Title', language),
                              points: [
                                getLocalizedString(AppStrings.home, 'card2Point1', language),
                                getLocalizedString(AppStrings.home, 'card2Point2', language),
                                getLocalizedString(AppStrings.home, 'card2Point3', language),
                                getLocalizedString(AppStrings.home, 'card2Point4', language),
                              ],
                              buttonLabel: getLocalizedString(AppStrings.home, 'card2Button', language),
                              color: AppColors.accentPurple,
                              onTap: () {
                                // TODO: Navigate to Mali Akili section
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PathCard extends StatefulWidget {
  final String title;
  final List<String> points;
  final String buttonLabel;
  final Color color;
  final VoidCallback onTap;

  const _PathCard({
    required this.title,
    required this.points,
    required this.buttonLabel,
    required this.color,
    required this.onTap,
  });

  @override
  State<_PathCard> createState() => _PathCardState();
}

class _PathCardState extends State<_PathCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.xl),
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(AppSizes.radiusXl),
            border: Border.all(
              color: _isHovered ? widget.color : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(_isHovered ? 0.15 : 0.05),
                blurRadius: _isHovered ? 30 : 15,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.h3(context).copyWith(
                  height: 1.3,
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              ...widget.points.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        point,
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: AppColors.darkNavy,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: AppSizes.xl),
              ElevatedButton(
                onPressed: widget.onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                  foregroundColor: AppColors.white,
                  minimumSize: const Size(double.infinity, AppSizes.buttonHeightMd),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  widget.buttonLabel,
                  style: AppTextStyles.buttonMedium(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}