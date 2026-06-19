import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class ServiceCardsSection extends ConsumerWidget {
  const ServiceCardsSection({super.key});

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
            vertical: responsive.isMobile ? AppSizes.xl4 : AppSizes.xl5,
          ),
          child: Column(
            children: [
              // Section Header with staggered animation
              AnimatedFadeIn(
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    Text(
                      language == 'sw'
                          ? 'Je, Hii ni Biashara Yako?'
                          : 'Does This Sound Like\nYour Business?',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 38 : 58,
                        color: AppColors.darkNavy,
                        height: 1.15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    Text(
                      language == 'sw'
                          ? 'Changamoto tofauti zinahitaji suluhisho tofauti. Tambua mahali ulipo.'
                          : 'Different challenges require different solutions. Identify where you are.',
                      style: AppTextStyles.bodyLarge(context).copyWith(
                        color: AppColors.textGray,
                        fontSize: responsive.isMobile ? 16 : 18,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl4),
              
              // Problem Scenario Cards with staggered entrance
              responsive.isMobile
                  ? Column(
                      children: [
                        AnimatedFadeIn(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 700),
                          slideDistance: 30,
                          child: _SelfDiagnosisCard(
                            iconColor: AppColors.accentOrange,
                            gradientColors: [
                              const Color(0xFFFFFAF5),
                              const Color(0xFFFFF5EB),
                            ],
                            headline: language == 'sw'
                                ? 'Simamia kwa Uhakika'
                                : 'Manage with Certainty',
                            painPoints: language == 'sw'
                                ? [
                                    _PainPoint(
                                      category: 'Kumbukumbu:',
                                      description: 'Kichwa kimejaa. Hukumbuki nani anadaiwa au nini kiliuzwa juzi.',
                                    ),
                                    _PainPoint(
                                      category: 'Usimamizi:',
                                      description: 'Ushirikina wa Hesabu. Daftari kupotea au kuharibika ni hofu ya kila siku.',
                                    ),
                                    _PainPoint(
                                      category: 'Uaminifu:',
                                      description: 'Wizi wa Siri. Huwezi kujua kilichotokea dukani ukiwa haupo.',
                                    ),
                                    _PainPoint(
                                      category: 'Ukuaji:',
                                      description: 'Giza la Maamuzi. Unataka kupanuka, lakini huna namba za uhakika.',
                                    ),
                                  ]
                                : [
                                    _PainPoint(
                                      category: 'Memory:',
                                      description: 'Head is full. Can\'t remember who owes what or what sold yesterday.',
                                    ),
                                    _PainPoint(
                                      category: 'Management:',
                                      description: 'Inventory Chaos. Fear of losing or damaging notebooks is daily.',
                                    ),
                                    _PainPoint(
                                      category: 'Trust:',
                                      description: 'Silent Theft. Can\'t know what happened at the shop when you\'re away.',
                                    ),
                                    _PainPoint(
                                      category: 'Growth:',
                                      description: 'Decision Darkness. Want to expand but have no reliable numbers.',
                                    ),
                                  ],
                            insight: language == 'sw'
                                ? 'Tatizo sio wewe—ni ukosefu wa miundombinu ya kimsingi ya kunasa data.'
                                : 'The problem isn\'t you—it\'s the lack of basic data capture infrastructure.',
                            solution: language == 'sw'
                                ? 'Mali Daftari ni mfumo mzima wa usimamizi: mauzo, hesabu, gharama, wafanyakazi—kila kitu kwa wakati halisi, kutoka simu yako.'
                                : 'Mali Daftari is a complete management system: sales, inventory, expenses, staff—everything in real-time, from your phone.',
                            ctaText: language == 'sw' ? 'Angalia Mali Daftari' : 'Explore Mali Daftari',
                            ctaColor: AppColors.accentOrange,
                            onTap: () {
                              context.go('/mali-daftari');
                            },
                          ),
                        ),
                        const SizedBox(height: AppSizes.xl2),
                        AnimatedFadeIn(
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 700),
                          slideDistance: 30,
                          child: _SelfDiagnosisCard(
                            iconColor: AppColors.cyan,
                            gradientColors: [
                              const Color(0xFFF5FBFF),
                              const Color(0xFFEBF7FC),
                            ],
                            headline: language == 'sw'
                                ? 'Geuza Data kuwa Pesa'
                                : 'Turn Data Into Money',
                            painPoints: language == 'sw'
                                ? [
                                    _PainPoint(
                                      category: 'Data Imelala:',
                                      description: 'Mlima wa Ripoti. Una rekodi za miaka, lakini hazikusaidii kuuza zaidi.',
                                    ),
                                    _PainPoint(
                                      category: 'Maamuzi:',
                                      description: 'Hisia vs. Ukweli. Unategemea "uzoefu" badala ya ukweli wa namba zako.',
                                    ),
                                    _PainPoint(
                                      category: 'Mienendo:',
                                      description: 'Mitego ya Misimu. Hujui bidhaa gani itahitajika sana mwezi ujao.',
                                    ),
                                    _PainPoint(
                                      category: 'Ushindani:',
                                      description: 'Uchovu wa Excel. Unatumia muda mwingi kwenye makaratasi kuliko mkakati.',
                                    ),
                                  ]
                                : [
                                    _PainPoint(
                                      category: 'Data Asleep:',
                                      description: 'Mountain of Reports. Years of records but they don\'t help you sell more.',
                                    ),
                                    _PainPoint(
                                      category: 'Decisions:',
                                      description: 'Gut vs. Truth. Relying on "experience" instead of your numbers\' reality.',
                                    ),
                                    _PainPoint(
                                      category: 'Patterns:',
                                      description: 'Seasonal Traps. Don\'t know which products will be in high demand next month.',
                                    ),
                                    _PainPoint(
                                      category: 'Competition:',
                                      description: 'Excel Fatigue. More time on spreadsheets than strategy.',
                                    ),
                                  ],
                            insight: language == 'sw'
                                ? 'Tatizo sio data—ni ukosefu wa ujuzi wa kuitumia kama silaha ya ushindani.'
                                : 'The problem isn\'t data—it\'s lacking the intelligence to use it as a competitive weapon.',
                            solution: language == 'sw'
                                ? 'Mali Akili ni timu yako ya AI: uchambuzi wa utabiri, mienendo, fursa—bila kuajiri wachambuzi wa data wenye bei ya juu.'
                                : 'Mali Akili is your AI team: predictive analytics, patterns, opportunities—without hiring expensive data analysts.',
                            ctaText: language == 'sw' ? 'Chunguza Mali Akili' : 'Explore Mali Akili',
                            ctaColor: AppColors.cyan,
                            onTap: () {
                              context.go('/mali-akili');
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
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 700),
                            slideDistance: 40,
                            child: _SelfDiagnosisCard(
                              iconColor: AppColors.accentOrange,
                              gradientColors: [
                                const Color(0xFFFFFAF5),
                                const Color(0xFFFFF5EB),
                              ],
                              headline: language == 'sw'
                                  ? 'Simamia kwa Uhakika'
                                  : 'Manage with Certainty',
                              painPoints: language == 'sw'
                                  ? [
                                      _PainPoint(
                                        category: 'Kumbukumbu:',
                                        description: 'Kichwa kimejaa. Hukumbuki nani anadaiwa au nini kiliuzwa juzi.',
                                      ),
                                      _PainPoint(
                                        category: 'Usimamizi:',
                                        description: 'Ushirikina wa Hesabu. Daftari kupotea au kuharibika ni hofu ya kila siku.',
                                      ),
                                      _PainPoint(
                                        category: 'Uaminifu:',
                                        description: 'Wizi wa Siri. Huwezi kujua kilichotokea dukani ukiwa haupo.',
                                      ),
                                      _PainPoint(
                                        category: 'Ukuaji:',
                                        description: 'Giza la Maamuzi. Unataka kupanuka, lakini huna namba za uhakika.',
                                      ),
                                    ]
                                  : [
                                      _PainPoint(
                                        category: 'Memory:',
                                        description: 'Head is full. Can\'t remember who owes what or what sold yesterday.',
                                      ),
                                      _PainPoint(
                                        category: 'Management:',
                                        description: 'Inventory Chaos. Fear of losing or damaging notebooks is daily.',
                                      ),
                                      _PainPoint(
                                        category: 'Trust:',
                                        description: 'Silent Theft. Can\'t know what happened at the shop when you\'re away.',
                                      ),
                                      _PainPoint(
                                        category: 'Growth:',
                                        description: 'Decision Darkness. Want to expand but have no reliable numbers.',
                                      ),
                                    ],
                              insight: language == 'sw'
                                  ? 'Tatizo sio wewe—ni ukosefu wa miundombinu ya kimsingi ya kunasa data.'
                                  : 'The problem isn\'t you—it\'s the lack of basic data capture infrastructure.',
                              solution: language == 'sw'
                                  ? 'Mali Daftari ni mfumo mzima wa usimamizi: mauzo, hesabu, gharama, wafanyakazi—kila kitu kwa wakati halisi, kutoka simu yako.'
                                  : 'Mali Daftari is a complete management system: sales, inventory, expenses, staff—everything in real-time, from your phone.',
                              ctaText: language == 'sw' ? 'Angalia Mali Daftari' : 'Explore Mali Daftari',
                              ctaColor: AppColors.accentOrange,
                              onTap: () {
                                context.go('/mali-daftari');
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.xl2),
                        Expanded(
                          child: AnimatedFadeIn(
                            delay: const Duration(milliseconds: 400),
                            duration: const Duration(milliseconds: 700),
                            slideDistance: 40,
                            child: _SelfDiagnosisCard(
                              iconColor: AppColors.cyan,
                              gradientColors: [
                                const Color(0xFFF5FBFF),
                                const Color(0xFFEBF7FC),
                              ],
                              headline: language == 'sw'
                                  ? 'Geuza Data kuwa Pesa'
                                  : 'Turn Data Into Money',
                              painPoints: language == 'sw'
                                  ? [
                                      _PainPoint(
                                        category: 'Data Imelala:',
                                        description: 'Mlima wa Ripoti. Una rekodi za miaka, lakini hazikusaidii kuuza zaidi.',
                                      ),
                                      _PainPoint(
                                        category: 'Maamuzi:',
                                        description: 'Hisia vs. Ukweli. Unategemea "uzoefu" badala ya ukweli wa namba zako.',
                                      ),
                                      _PainPoint(
                                        category: 'Mienendo:',
                                        description: 'Mitego ya Misimu. Hujui bidhaa gani itahitajika sana mwezi ujao.',
                                      ),
                                      _PainPoint(
                                        category: 'Ushindani:',
                                        description: 'Uchovu wa Excel. Unatumia muda mwingi kwenye makaratasi kuliko mkakati.',
                                      ),
                                    ]
                                  : [
                                      _PainPoint(
                                        category: 'Data Asleep:',
                                        description: 'Mountain of Reports. Years of records but they don\'t help you sell more.',
                                      ),
                                      _PainPoint(
                                        category: 'Decisions:',
                                        description: 'Gut vs. Truth. Relying on "experience" instead of your numbers\' reality.',
                                      ),
                                      _PainPoint(
                                        category: 'Patterns:',
                                        description: 'Seasonal Traps. Don\'t know which products will be in high demand next month.',
                                      ),
                                      _PainPoint(
                                        category: 'Competition:',
                                        description: 'Excel Fatigue. More time on spreadsheets than strategy.',
                                      ),
                                    ],
                              insight: language == 'sw'
                                  ? 'Tatizo sio data—ni ukosefu wa ujuzi wa kuitumia kama silaha ya ushindani.'
                                  : 'The problem isn\'t data—it\'s lacking the intelligence to use it as a competitive weapon.',
                              solution: language == 'sw'
                                  ? 'Mali Akili ni timu yako ya AI: uchambuzi wa utabiri, mienendo, fursa—bila kuajiri wachambuzi wa data wenye bei ya juu.'
                                  : 'Mali Akili is your AI team: predictive analytics, patterns, opportunities—without hiring expensive data analysts.',
                              ctaText: language == 'sw' ? 'Chunguza Mali Akili' : 'Explore Mali Akili',
                              ctaColor: AppColors.cyan,
                              onTap: () {
                                context.go('/mali-akili');
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

class _PainPoint {
  final String category;
  final String description;

  _PainPoint({
    required this.category,
    required this.description,
  });
}

class _SelfDiagnosisCard extends StatefulWidget {
  final Color iconColor;
  final List<Color> gradientColors;
  final String headline;
  final List<_PainPoint> painPoints;
  final String insight;
  final String solution;
  final String ctaText;
  final Color ctaColor;
  final VoidCallback onTap;

  const _SelfDiagnosisCard({
    required this.iconColor,
    required this.gradientColors,
    required this.headline,
    required this.painPoints,
    required this.insight,
    required this.solution,
    required this.ctaText,
    required this.ctaColor,
    required this.onTap,
  });

  @override
  State<_SelfDiagnosisCard> createState() => _SelfDiagnosisCardState();
}

class _SelfDiagnosisCardState extends State<_SelfDiagnosisCard> {
  bool _isHovered = false;
  bool _isCtaHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.gradientColors,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: _isHovered 
                ? widget.iconColor.withValues(alpha: 0.5) 
                : widget.iconColor.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.iconColor.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 40 : 20,
              offset: Offset(0, _isHovered ? 20 : 10),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.xl3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headline with improved typography
              Text(
                widget.headline,
                style: AppTextStyles.h1(context).copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                  height: 1.1,
                  letterSpacing: -0.8,
                ),
              ),
              
              const SizedBox(height: AppSizes.xl2),
              
              // Pain Points with refined styling
              ...widget.painPoints.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.lg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Decorative dot
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: widget.iconColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: point.category,
                              style: AppTextStyles.bodyMedium(context).copyWith(
                                color: widget.iconColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                height: 1.7,
                              ),
                            ),
                            TextSpan(
                              text: ' ${point.description}',
                              style: AppTextStyles.bodyMedium(context).copyWith(
                                color: AppColors.darkNavy.withValues(alpha: 0.85),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              
              const SizedBox(height: AppSizes.xl),
              
              // Insight box with enhanced styling
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.lg,
                  vertical: AppSizes.md,
                ),
                decoration: BoxDecoration(
                  color: widget.iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  border: Border.all(
                    color: widget.iconColor.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: widget.iconColor,
                      size: 18,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        widget.insight,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: AppColors.darkNavy,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.5,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: AppSizes.xl),
              
              // Solution with improved readability
              Text(
                widget.solution,
                style: AppTextStyles.bodyMedium(context).copyWith(
                  color: AppColors.darkNavy.withValues(alpha: 0.75),
                  height: 1.7,
                  fontSize: 15,
                ),
              ),
              
              const SizedBox(height: AppSizes.xl2),
              
              // Enhanced CTA Button
              MouseRegion(
                onEnter: (_) => setState(() => _isCtaHovered = true),
                onExit: (_) => setState(() => _isCtaHovered = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    boxShadow: _isCtaHovered
                        ? [
                            BoxShadow(
                              color: widget.ctaColor.withValues(alpha: 0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ]
                        : [],
                  ),
                  child: ElevatedButton(
                    onPressed: widget.onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.ctaColor,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.lg,
                        horizontal: AppSizes.xl,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.ctaText,
                          style: AppTextStyles.bodyLarge(context).copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(width: AppSizes.sm),
                        AnimatedSlide(
                          duration: const Duration(milliseconds: 200),
                          offset: Offset(_isCtaHovered ? 0.3 : 0, 0),
                          curve: Curves.easeOutCubic,
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}