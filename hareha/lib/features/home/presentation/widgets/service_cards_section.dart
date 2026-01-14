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
      color: AppColors.cardLight, // Subtle background to differentiate from previous section
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: Column(
            children: [
              // Section Header
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      language == 'sw'
                          ? 'Ni Changamoto Gani ya Biashara Inayofanana na Yako?'
                          : 'Which Business Challenge\nSounds Like Yours?',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 32 : 48,
                        color: AppColors.darkNavy,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      language == 'sw'
                          ? 'Tumebuni suluhisho sambamba kwa sababu tunajua biashara tofauti zinakabiliwa na changamoto tofauti kabisa.'
                          : 'We\'ve built parallel solutions because different businesses\nface fundamentally different challenges.',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
                        fontSize: responsive.isMobile ? 14 : 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),
              
              // Problem Scenario Cards
              responsive.isMobile
                  ? Column(
                      children: [
                        _ProblemScenarioCard(
                          icon: Icons.inventory_2_outlined,
                          iconColor: const Color.fromARGB(255, 148, 238, 201),
                          headline: language == 'sw'
                              ? 'Unasimamia Kila Kitu Kichwani Mwako'
                              : 'You\'re Managing Everything\nin Your Head',
                          problems: language == 'sw'
                              ? [
                                  'Huwezi kukumbuka kwa usahihi uliuza nini Jumanne iliyopita, kwa hivyo huna uhakika wa kitu gani cha kurejesha',
                                  'Hesabu yako inaishi katika kumbukumbu yako, na unaogopa wakati huwezi kukumbuka kama uliagiza zaidi ya kitu fulani',
                                  'Unaandika gharama katika vitabu tofauti, kwenye karatasi, kwenye simu yako—na kurekebisha ni kaburi',
                                  'Unaamini wafanyakazi wako lakini huna njia ya kufuatilia kilichotokea wakati hukuwepo',
                                  'Unataka kukua, labda kuongeza eneo la pili, lakini huna nambari za kuaminika za kujenga maamuzi'
                                ]
                              : [
                                  'You can\'t remember exactly what you sold last Tuesday, so you\'re not sure what to restock',
                                  'Your inventory lives in your memory, and you panic when you can\'t recall if you ordered more of something',
                                  'You write expenses in different notebooks, on papers, on your phone—and reconciling is a nightmare',
                                  'You trust your employees but have no way to track what actually happened when you weren\'t there',
                                  'You want to grow, maybe add a second location, but you don\'t have reliable numbers to base decisions on'
                                ],
                          insight: language == 'sw'
                              ? 'Tatizo si kwamba wewe ni mdanganyifu. Ni kwamba unaendesha biashara bila miundombinu ya kimsingi ya kunakili kinachoendelea kila siku.'
                              : 'The problem isn\'t that you\'re disorganized. It\'s that you\'re running a business without the basic infrastructure to capture what\'s happening daily.',
                          solution: language == 'sw'
                              ? 'Mali Daftari inakupa miundombinu hiyo. Imeundwa kwa biashara kama yako—ambapo mmiliki anafanya kila kitu na anahitaji mfumo unaonakili mauzo, hesabu, gharama, na shughuli za wafanyakazi kwa wakati halisi, bila kuongeza ugumu.'
                              : 'Mali Daftari gives you that infrastructure. It\'s built for businesses like yours—where the owner is doing everything and needs a system that captures sales, inventory, expenses, and staff activity in real-time, without adding complexity.',
                          ctaText: language == 'sw' ? 'Angalia Jinsi Mali Daftari Inavyofanya Kazi' : 'See How Mali Daftari Works',
                          ctaColor: AppColors.accentOrange,
                          onTap: () {
                            // TODO: Navigate to Mali Daftari page
                          },
                        ),
                        const SizedBox(height: AppSizes.xl2),
                        _ProblemScenarioCard(
                          icon: Icons.insights_outlined,
                          iconColor: AppColors.cyan,
                          headline: language == 'sw'
                              ? 'Una Data, Lakini Sio Maarifa'
                              : 'You Have the Data,\nBut Not the Insights',
                          problems: language == 'sw'
                              ? [
                                  'Umekuwa katika biashara kwa miaka na una rekodi—ripoti za mauzo, data za wateja, historia ya muamala—lakini inakaa tu... iko hapo',
                                  'Unafanya maamuzi kulingana na hisia na uzoefu kwa sababu kutoa maarifa kutoka kwa data yako kunahisi kulemewa',
                                  'Unajua kuna mifumo katika biashara yako (mwenendo wa msimu, tabia za wateja, utendaji wa bidhaa) lakini huwezi kuwaona wazi',
                                  'Huna mchambuzi wa data aliyejitolea au timu ya BI, na kuajiri mmoja haupo katika bajeti',
                                  'Umejaribu dashibodi za Excel au zana za kimsingi, lakini hupati ujuzi wa utabiri unaohitaji kubaki na ushindani'
                                ]
                              : [
                                  'You\'ve been in business for years and have records—sales reports, customer data, transaction history—but it\'s just... sitting there',
                                  'You make decisions based on gut feel and experience because extracting insights from your data feels overwhelming',
                                  'You know there are patterns in your business (seasonal trends, customer behaviors, product performance) but you can\'t see them clearly',
                                  'You don\'t have a dedicated data analyst or BI team, and hiring one isn\'t in the budget',
                                  'You\'ve tried Excel dashboards or basic tools, but you\'re not getting the predictive intelligence you need to stay competitive'
                                ],
                          insight: language == 'sw'
                              ? 'Tatizo si ukosefu wa data. Ni kwamba hujaomba kujifunza kwa mashine na uchambuzi ili kubadilisha data hiyo kuwa faida ya kimkakati.'
                              : 'The problem isn\'t lack of data. It\'s that you\'re not applying machine learning and analytics to turn that data into strategic advantage.',
                          solution: language == 'sw'
                              ? 'Mali Akili imeundwa kwa hasa hii: biashara zilizoimarishwa zenye data zinazohitaji ujuzi. Tunachukua data yako iliyopo na kutumia kujifunza kwa mashine kukupa uchambuzi wa utabiri, utambuzi wa mwenendo, na mapendekezo ya kimkakati—bila kuhitaji timu yako ya sayansi ya data.'
                              : 'Mali Akili is built for exactly this: established businesses with data who need intelligence. We take your existing data and apply machine learning to give you predictive analytics, trend identification, and strategic recommendations—without needing your own data science team.',
                          ctaText: language == 'sw' ? 'Chunguza Mali Akili' : 'Explore Mali Akili',
                          ctaColor: AppColors.cyan,
                          onTap: () {
                            context.go('/mali-akili');
                          },
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ProblemScenarioCard(
                            icon: Icons.inventory_2_outlined,
                            iconColor: AppColors.accentOrange,
                            headline: language == 'sw'
                                ? 'Unasimamia Kila Kitu Kichwani Mwako'
                                : 'You\'re Managing Everything\nin Your Head',
                            problems: language == 'sw'
                                ? [
                                    'Huwezi kukumbuka kwa usahihi uliuza nini Jumanne iliyopita, kwa hivyo huna uhakika wa kitu gani cha kurejesha',
                                    'Hesabu yako inaishi katika kumbukumbu yako, na unaogopa wakati huwezi kukumbuka kama uliagiza zaidi ya kitu fulani',
                                    'Unaandika gharama katika vitabu tofauti, kwenye karatasi, kwenye simu yako—na kurekebisha ni kaburi',
                                    'Unaamini wafanyakazi wako lakini huna njia ya kufuatilia kilichotokea wakati hukuwepo',
                                    'Unataka kukua, labda kuongeza eneo la pili, lakini huna nambari za kuaminika za kujenga maamuzi'
                                  ]
                                : [
                                    'You can\'t remember exactly what you sold last Tuesday, so you\'re not sure what to restock',
                                    'Your inventory lives in your memory, and you panic when you can\'t recall if you ordered more of something',
                                    'You write expenses in different notebooks, on papers, on your phone—and reconciling is a nightmare',
                                    'You trust your employees but have no way to track what actually happened when you weren\'t there',
                                    'You want to grow, maybe add a second location, but you don\'t have reliable numbers to base decisions on'
                                  ],
                            insight: language == 'sw'
                                ? 'Tatizo si kwamba wewe ni mdanganyifu. Ni kwamba unaendesha biashara bila miundombinu ya kimsingi ya kunakili kinachoendelea kila siku.'
                                : 'The problem isn\'t that you\'re disorganized. It\'s that you\'re running a business without the basic infrastructure to capture what\'s happening daily.',
                            solution: language == 'sw'
                                ? 'Mali Daftari inakupa miundombinu hiyo. Imeundwa kwa biashara kama yako—ambapo mmiliki anafanya kila kitu na anahitaji mfumo unaonakili mauzo, hesabu, gharama, na shughuli za wafanyakazi kwa wakati halisi, bila kuongeza ugumu.'
                                : 'Mali Daftari gives you that infrastructure. It\'s built for businesses like yours—where the owner is doing everything and needs a system that captures sales, inventory, expenses, and staff activity in real-time, without adding complexity.',
                            ctaText: language == 'sw' ? 'Angalia Jinsi Mali Daftari Inavyofanya Kazi' : 'See How Mali Daftari Works',
                            ctaColor: AppColors.accentOrange,
                            onTap: () {
                              // TODO: Navigate to Mali Daftari page
                            },
                          ),
                        ),
                        const SizedBox(width: AppSizes.xl2),
                        Expanded(
                          child: _ProblemScenarioCard(
                            icon: Icons.insights_outlined,
                            iconColor: AppColors.cyan,
                            headline: language == 'sw'
                                ? 'Una Data, Lakini Sio Maarifa'
                                : 'You Have the Data,\nBut Not the Insights',
                            problems: language == 'sw'
                                ? [
                                    'Umekuwa katika biashara kwa miaka na una rekodi—ripoti za mauzo, data za wateja, historia ya muamala—lakini inakaa tu... iko hapo',
                                    'Unafanya maamuzi kulingana na hisia na uzoefu kwa sababu kutoa maarifa kutoka kwa data yako kunahisi kulemewa',
                                    'Unajua kuna mifumo katika biashara yako (mwenendo wa msimu, tabia za wateja, utendaji wa bidhaa) lakini huwezi kuwaona wazi',
                                    'Huna mchambuzi wa data aliyejitolea au timu ya BI, na kuajiri mmoja haupo katika bajeti',
                                    'Umejaribu dashibodi za Excel au zana za kimsingi, lakini hupati ujuzi wa utabiri unaohitaji kubaki na ushindani'
                                  ]
                                : [
                                    'You\'ve been in business for years and have records—sales reports, customer data, transaction history—but it\'s just... sitting there',
                                    'You make decisions based on gut feel and experience because extracting insights from your data feels overwhelming',
                                    'You know there are patterns in your business (seasonal trends, customer behaviors, product performance) but you can\'t see them clearly',
                                    'You don\'t have a dedicated data analyst or BI team, and hiring one isn\'t in the budget',
                                    'You\'ve tried Excel dashboards or basic tools, but you\'re not getting the predictive intelligence you need to stay competitive'
                                  ],
                            insight: language == 'sw'
                                ? 'Tatizo si ukosefu wa data. Ni kwamba hakuna teknolojia za uchambuzi ili kubadilisha data hiyo kuwa faida ya kimkakati.'
                                : 'The problem isn\'t lack of data. It\'s that you\'re not applying machine learning and analytics to turn that data into strategic advantage.',
                            solution: language == 'sw'
                                ? 'Mali Akili imeundwa kwa hasa hii: biashara zilizoimarishwa zenye data zinazohitaji ujuzi. Tunachukua data yako iliyopo na kutumia kujifunza kwa mashine kukupa uchambuzi wa utabiri, utambuzi wa mwenendo, na mapendekezo ya kimkakati—bila kuhitaji timu yako ya sayansi ya data.'
                                : 'Mali Akili is built for exactly this: established businesses with data who need intelligence. We take your existing data and apply machine learning to give you predictive analytics, trend identification, and strategic recommendations—without needing your own data science team.',
                            ctaText: language == 'sw' ? 'Chunguza Mali Akili' : 'Explore Mali Akili',
                            ctaColor: AppColors.cyan,
                            onTap: () {
                              // TODO: Navigate to Mali Akili page
                            },
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

class _ProblemScenarioCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String headline;
  final List<String> problems;
  final String insight;
  final String solution;
  final String ctaText;
  final Color ctaColor;
  final VoidCallback onTap;

  const _ProblemScenarioCard({
    required this.icon,
    required this.iconColor,
    required this.headline,
    required this.problems,
    required this.insight,
    required this.solution,
    required this.ctaText,
    required this.ctaColor,
    required this.onTap,
  });

  @override
  State<_ProblemScenarioCard> createState() => _ProblemScenarioCardState();
}

class _ProblemScenarioCardState extends State<_ProblemScenarioCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(
            color: _isHovered 
                ? widget.iconColor.withOpacity(0.3) 
                : AppColors.lightGray,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.iconColor.withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 30 : 15,
              offset: Offset(0, _isHovered ? 12 : 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.xl2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 32,
                ),
              ),
              
              const SizedBox(height: AppSizes.xl),
              
              // Headline
              Text(
                widget.headline,
                style: AppTextStyles.h2(context).copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                  height: 1.2,
                ),
              ),
              
              const SizedBox(height: AppSizes.lg),
              
              // Problems List
              Text(
                'Do these sound familiar?',
                style: AppTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkNavy,
                ),
              ),
              
              const SizedBox(height: AppSizes.md),
              
              ...widget.problems.map((problem) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: widget.iconColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        problem,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: AppColors.textGray,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
              
              const SizedBox(height: AppSizes.lg),
              
              // Insight
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: widget.iconColor.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  widget.insight,
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: AppColors.darkNavy,
                    fontWeight: FontWeight.w500,
                    height: 1.6,
                  ),
                ),
              ),
              
              const SizedBox(height: AppSizes.lg),
              
              // Solution
              Text(
                widget.solution,
                style: AppTextStyles.bodyMedium(context).copyWith(
                  color: AppColors.textGray,
                  height: 1.7,
                ),
              ),
              
              const SizedBox(height: AppSizes.xl),
              
              // CTA Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.ctaColor,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.md,
                      horizontal: AppSizes.lg,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.ctaText,
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(
                        Icons.arrow_forward,
                        size: 18,
                      ),
                    ],
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