import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class StrategicPartnerSection extends ConsumerWidget {
  const StrategicPartnerSection({super.key});

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
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: Column(
            children: [
              // Title & Body Content
              AnimatedFadeIn(
                child: Column(
                  children: [
                    // Main Title
                    Text(
                      language == 'sw' 
                          ? 'Data Sio Chaguo. Ni Miundombinu.'
                          : 'Data Isn\'t Optional.\nIt\'s Infrastructure.',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 32 : 48,
                        height: 1.2,
                        color: AppColors.darkNavy,
                      ),
                      textAlign: responsive.isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    
                    const SizedBox(height: AppSizes.xl),
                    
                    // Body Paragraph
                    Text(
                      language == 'sw'
                          ? 'Biashara za Kitanzania zinafanya maamuzi gizani. Biashara zisizo ndogo na za kati zinafuatilia kila kitu kupitia kumbukumbu na kwenye madaftari, hesabu ya bidhaa inapotea, gharama zinatabaki kwenye risiti na risiti hupotea. Ukuaji unahitaji kujibu maswali kama: Bidhaa zipi zinazalisha faida sana? Mzigo gani umebaki store ? Unatumia kiasi gani kwa kweli kila mwezi? Kwa makampuni makubwa:  data ipo nyingi inakaa bila kutumika . Mifumo haionekani. Maarifa yamezikwa. Bila wachambuzi, data hiyo haina faida yoyote. Matokeo ni sawa kwa njia zote mbili: maamuzi muhimu yanayofanywa kwa matumaini badala ya ushahidi.'
                          : 'Tanzanian businesses are making decisions in the dark. Informal businesses track everything through memory and notebooks—sales blur together, inventory counts disappear, expenses scatter across random papers. Growth requires answering questions you can\'t: Which products profit? What do you really spend monthly? Established companies have the opposite problem: years of data sitting unused in spreadsheets. Patterns unseen. Insights buried. Without analysts, that data might as well not exist. Same result either way: critical decisions made on hope rather than evidence.',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
                        height: 1.7,
                        fontSize: responsive.isMobile ? 14 : 16,
                      ),
                      textAlign: responsive.isMobile ? TextAlign.center : TextAlign.left,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),
              
              // Impact Stats with Animation - Wrapped in LayoutBuilder for reliable detection
              LayoutBuilder(
                builder: (context, constraints) {
                  return responsive.isMobile
                      ? Column(
                          children: [
                            _AnimatedImpactStatCard(
                              key: const ValueKey('stat1'),
                              value: '23',
                              suffix: '%',
                              label: language == 'sw' 
                                  ? 'Ongezeko la wastani la mapato kwa SMEs zinazotekeleza miundombinu ya data ya mfumo ikiwa ni kunakili shughuli za kila siku au kuchambua mwenendo wa kihistoria' 
                                  : 'Average revenue increase for SMEs implementing systematic data infrastructure whether capturing daily operations or analyzing historical trends',
                              delay: const Duration(milliseconds: 0),
                            ),
                            const SizedBox(height: AppSizes.xl),
                            _AnimatedImpactStatCard(
                              key: const ValueKey('stat2'),
                              value: '40',
                              suffix: '%',
                              label: language == 'sw'
                                  ? 'Kupungua kwa gharama za uendeshaji kupitia ufanya maamuzi kulingana na data na maarifa ya utabiri'
                                  : 'Reduction in operational costs and inefficiencies through data-driven decision-making and predictive insights',
                              delay: const Duration(milliseconds: 200),
                            ),
                            const SizedBox(height: AppSizes.xl),
                            _AnimatedImpactStatCard(
                              key: const ValueKey('stat3'),
                              value: '5',
                              suffix: 'x',
                              label: language == 'sw'
                                  ? 'Maamuzi ya haraka ya kimkakati wakati biashara zina miundombinu ya data ya kuaminika inayolingana na mahitaji yao'
                                  : 'Faster strategic decisions when businesses have reliable data infrastructure matched to their needs',
                              delay: const Duration(milliseconds: 400),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _AnimatedImpactStatCard(
                                key: const ValueKey('stat1'),
                                value: '23',
                                suffix: '%',
                                label: language == 'sw'
                                    ? 'Ongezeko la wastani la mapato kwa SMEs zinazotekeleza miundombinu ya data ya mfumo—ikiwa ni kunakili shughuli za kila siku au kuchambua mwenendo wa kihistoria'
                                    : 'Average revenue increase for SMEs implementing systematic data infrastructure—whether capturing daily operations or analyzing historical trends',
                                delay: const Duration(milliseconds: 0),
                              ),
                            ),
                            const SizedBox(width: AppSizes.xl2),
                            Expanded(
                              child: _AnimatedImpactStatCard(
                                key: const ValueKey('stat2'),
                                value: '40',
                                suffix: '%',
                                label: language == 'sw'
                                    ? 'Kupungua kwa gharama za uendeshaji na kutoelewana kupitia ufanya maamuzi kulingana na data na maarifa ya utabiri'
                                    : 'Reduction in operational costs and inefficiencies through data-driven decision-making and predictive insights',
                                delay: const Duration(milliseconds: 200),
                              ),
                            ),
                            const SizedBox(width: AppSizes.xl2),
                            Expanded(
                              child: _AnimatedImpactStatCard(
                                key: const ValueKey('stat3'),
                                value: '5',
                                suffix: 'x',
                                label: language == 'sw'
                                    ? 'Maamuzi ya haraka ya kimkakati wakati biashara zina miundombinu ya data ya kuaminika inayolingana na mahitaji yao'
                                    : 'Faster strategic decisions when businesses have reliable data infrastructure matched to their needs',
                                delay: const Duration(milliseconds: 400),
                              ),
                            ),
                          ],
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

class _AnimatedImpactStatCard extends StatefulWidget {
  final String value;
  final String suffix;
  final String label;
  final Duration delay;

  const _AnimatedImpactStatCard({
    super.key,
    required this.value,
    required this.suffix,
    required this.label,
    required this.delay,
  });

  @override
  State<_AnimatedImpactStatCard> createState() => _AnimatedImpactStatCardState();
}

class _AnimatedImpactStatCardState extends State<_AnimatedImpactStatCard> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;
  ScrollPosition? _scrollPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    final targetValue = double.tryParse(widget.value) ?? 0;
    
    _animation = Tween<double>(
      begin: 0,
      end: targetValue,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Schedule initial visibility check after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _attachScrollListener();
      _checkVisibility();
    });
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _attachScrollListener() {
    final scrollable = Scrollable.maybeOf(context);
    if (scrollable != null) {
      _scrollPosition = scrollable.position;
      _scrollPosition!.addListener(_onScroll);
    }
  }

  void _onScroll() {
    _checkVisibility();
  }

  void _checkVisibility() {
    if (!mounted) return;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.attached) return;

    try {
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;
      final screenHeight = MediaQuery.of(context).size.height;

      // Widget is visible if any part is within viewport
      final isCurrentlyVisible = position.dy + size.height > 0 && 
                                  position.dy < screenHeight * 0.85;

      if (isCurrentlyVisible && !_isVisible) {
        setState(() {
          _isVisible = true;
        });
        
        // Start animation with delay
        _controller.reset();
        Future.delayed(widget.delay, () {
          if (mounted && _isVisible) {
            _controller.forward();
          }
        });
      } else if (!isCurrentlyVisible && _isVisible) {
        setState(() {
          _isVisible = false;
        });
        // Reset for next time
        _controller.reset();
      }
    } catch (e) {
      // Ignore errors during layout
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final currentValue = _animation.value;
            String displayValue;
            
            if (widget.suffix == 'x') {
              displayValue = currentValue.toInt().toString();
            } else {
              displayValue = currentValue.toInt().toString();
            }

            return Text(
              '$displayValue${widget.suffix}',
              style: AppTextStyles.displayLarge(context).copyWith(
                fontSize: 56,
                fontWeight: FontWeight.w700,
                color: AppColors.darkNavy,
              ),
            );
          },
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          widget.label,
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: AppColors.textGray,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}