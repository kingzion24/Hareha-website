import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bar_widget.dart';
import '../../../shared/widgets/footer_widget.dart';
import '../../../shared/widgets/animated_fade_in.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/localization/l10n_provider.dart';
import '../../../core/utils/responsive.dart';

class MaliAkiliPage extends ConsumerWidget {
  const MaliAkiliPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(language: language),
            _WhatWeDoSection(language: language),
            _HowYouAccessSection(language: language),
            _ServicesSection(language: language),
            _IndustriesSection(language: language),
            _BenefitsSection(language: language),
            _CTASection(language: language),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

// Hero Section
class _HeroSection extends StatelessWidget {
  final String language;

  const _HeroSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: AnimatedFadeIn(
            child: Column(
              children: [
                // Mali Akili Logo
                Image.asset(
                  'lib/resources/images/mali_akili_logo.png',
                  height: responsive.isMobile ? 60 : 80,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: responsive.isMobile ? 60 : 80,
                      padding: const EdgeInsets.all(AppSizes.md),
                      child: Text(
                        'MALI AKILI',
                        style: AppTextStyles.h2(context).copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSizes.xl),
                Text(
                  'Mali Akili',
                  style: AppTextStyles.displayLarge(context).copyWith(
                    color: AppColors.white,
                    fontSize: responsive.isMobile ? 48 : 72,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.lg),
                Container(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Text(
                    language == 'sw'
                        ? 'Jukwaa kamili la uchambuzi kwa biashara zilizoimarishwa za Kitanzania, makampuni makubwa, na NGOs ambazo tayari zina data lakini hazina ujuzi wa kutoa thamani ya kimkakati kutoka kwake.'
                        : 'A comprehensive analytics platform for established Tanzanian businesses, corporations, and NGOs that already have data but lack the expertise to extract strategic value from it.',
                    style: AppTextStyles.bodyLarge(context).copyWith(
                      color: AppColors.white.withOpacity(0.95),
                      height: 1.7,
                      fontSize: responsive.isMobile ? 16 : 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// What We Do Section
class _WhatWeDoSection extends StatelessWidget {
  final String language;

  const _WhatWeDoSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

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
          child: AnimatedFadeIn(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language == 'sw' ? 'TUNACHOFANYA' : 'WHAT WE DO',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    letterSpacing: 2.0,
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSizes.md),
                Text(
                  language == 'sw' 
                      ? 'Tunabadilisha Data Yako Kuwa Faida ya Ushindani' 
                      : 'We Transform Your Data Into Competitive Advantage',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 48,
                    color: AppColors.darkNavy,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: AppSizes.xl),
                Text(
                  language == 'sw'
                      ? 'Tunaungana moja kwa moja na vyanzo vyako vya data vilivyopo—mifumo ya mauzo, hifadhidata za wateja, rekodi za uendeshaji, ripoti za kifedha—na tunatumia kujifunza kwa mashine wa hali ya juu kugundua maarifa yaliyofichwa. Algoriti zetu zinabainisha mifumo ya mauzo ambayo hujawahi kuiona, kutabiri tabia za wateja kwa usahihi, kutabiri mahitaji ya msimu, kugundua kutoelewana kwa uendeshaji kinachokugharimu pesa, na kuonyesha fursa za kimkakati zilizozikwa katika data yako ya kihistoria.'
                      : 'We connect directly to your existing data sources—sales systems, customer databases, operational records, financial reports—and apply advanced machine learning to uncover hidden insights. Our algorithms identify sales patterns you\'ve never noticed, predict customer behaviors with precision, forecast demand seasonally, detect operational inefficiencies costing you money, and surface strategic opportunities buried in your historical data.',
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.textGray,
                    height: 1.8,
                    fontSize: responsive.isMobile ? 16 : 18,
                  ),
                ),
                const SizedBox(height: AppSizes.xl),
                _buildFeatureGrid(context, responsive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context, Responsive responsive) {
    final features = [
      _FeatureData(
        icon: Icons.analytics_outlined,
        title: language == 'sw' ? 'Mifumo Iliyofichwa' : 'Hidden Patterns',
        description: language == 'sw' 
            ? 'Gundua mifumo ya mauzo na tabia za wateja ambayo hujawahi kuiona'
            : 'Discover sales patterns and customer behaviors you\'ve never noticed',
        color: AppColors.cyan,
      ),
      _FeatureData(
        icon: Icons.trending_up,
        title: language == 'sw' ? 'Utabiri wa Usahihi' : 'Precise Predictions',
        description: language == 'sw'
            ? 'Tabiri mahitaji ya msimu na tabia za wateja kwa usahihi'
            : 'Forecast seasonal demand and customer behaviors with precision',
        color: AppColors.accentPurple,
      ),
      _FeatureData(
        icon: Icons.warning_amber_outlined,
        title: language == 'sw' ? 'Gundua Kutoelewana' : 'Detect Inefficiencies',
        description: language == 'sw'
            ? 'Tambua matatizo ya uendeshaji yanayokugharimu pesa'
            : 'Identify operational problems costing you money',
        color: AppColors.accentOrange,
      ),
      _FeatureData(
        icon: Icons.lightbulb_outline,
        title: language == 'sw' ? 'Fursa za Kimkakati' : 'Strategic Opportunities',
        description: language == 'sw'
            ? 'Onyesha fursa zilizozikwa katika data yako ya kihistoria'
            : 'Surface opportunities buried in your historical data',
        color: AppColors.accentGreen,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: responsive.isMobile ? 1 : (responsive.isTablet ? 2 : 4),
        crossAxisSpacing: AppSizes.lg,
        mainAxisSpacing: AppSizes.lg,
        childAspectRatio: responsive.isMobile ? 1.2 : 0.9,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        return _FeatureCard(
          icon: features[index].icon,
          title: features[index].title,
          description: features[index].description,
          color: features[index].color,
        );
      },
    );
  }
}

class _FeatureData {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  _FeatureData({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            title,
            style: AppTextStyles.h4(context).copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.darkNavy,
            ),
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            description,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: AppColors.textGray,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// How You Access Section
class _HowYouAccessSection extends StatelessWidget {
  final String language;

  const _HowYouAccessSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.footerGradient,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: AnimatedFadeIn(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language == 'sw' ? 'JINSI UNAVYOIFIKIA' : 'HOW YOU ACCESS IT',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    letterSpacing: 2.0,
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSizes.md),
                Text(
                  language == 'sw' 
                      ? 'Rahisi, Yenye Nguvu, na Bila Ujuzi wa Kiufundi' 
                      : 'Simple, Powerful, and No Technical Expertise Required',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 48,
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: AppSizes.xl),
                Text(
                  language == 'sw'
                      ? 'Kupitia dashibodi rahisi zinazoweka wazi biashara yako kwa wakati halisi, ripoti za kiotomatiki zinazozieleza matokeo kwa lugha rahisi, na chatbot ya AI inayozungumza Kiswahili na Kiingereza inayojibu maswali yako ya kimkakati mara moja—hakuna ujuzi wa kiufundi unaohitajika. Badala ya kuajiri wanasayansi wa data wa bei ya juu au kujenga miundombinu changamano, unapata uchambuzi wa kiwango cha kampuni kubwa kama huduma iliyosimamiwa kabisa, iliyoundwa hasa kwa ukweli wa soko la Afrika Mashariki na kutolewa kwa sehemu ndogo ya gharama za kawaida za BI.'
                      : 'Through intuitive dashboards that visualize your business in real-time, automated reports that explain findings in plain language, and an AI chatbot fluent in Swahili and English that answers your strategic questions instantly—no technical expertise required. Instead of hiring expensive data scientists or building complex infrastructure, you get enterprise-grade analytics as a fully-managed service, designed specifically for East African market realities and delivered at a fraction of traditional BI costs.',
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.white.withOpacity(0.95),
                    height: 1.8,
                    fontSize: responsive.isMobile ? 16 : 18,
                  ),
                ),
                const SizedBox(height: AppSizes.xl2),
                _buildAccessMethodsGrid(context, responsive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccessMethodsGrid(BuildContext context, Responsive responsive) {
    final methods = [
      _AccessMethodData(
        icon: Icons.dashboard_outlined,
        title: language == 'sw' ? 'Dashibodi za Wakati Halisi' : 'Real-Time Dashboards',
        description: language == 'sw'
            ? 'Weka wazi biashara yako kwa wakati halisi na dashibodi rahisi za kuona'
            : 'Visualize your business in real-time with intuitive, easy-to-understand dashboards',
      ),
      _AccessMethodData(
        icon: Icons.description_outlined,
        title: language == 'sw' ? 'Ripoti za Kiotomatiki' : 'Automated Reports',
        description: language == 'sw'
            ? 'Pata ripoti zinazozieleza matokeo kwa lugha rahisi, bila msimbo'
            : 'Get reports that explain findings in plain language, no technical jargon',
      ),
      _AccessMethodData(
        icon: Icons.chat_bubble_outline,
        title: language == 'sw' ? 'AI Chatbot (Kiswahili/Kiingereza)' : 'AI Chatbot (Swahili/English)',
        description: language == 'sw'
            ? 'Uliza maswali ya kimkakati na upate majibu mara moja kwa lugha yako'
            : 'Ask strategic questions and get instant answers in your language',
      ),
    ];

    return responsive.isMobile
        ? Column(
            children: methods.map((method) => Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.lg),
              child: _AccessMethodCard(
                icon: method.icon,
                title: method.title,
                description: method.description,
              ),
            )).toList(),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: methods.map((method) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                child: _AccessMethodCard(
                  icon: method.icon,
                  title: method.title,
                  description: method.description,
                ),
              ),
            )).toList(),
          );
  }
}

class _AccessMethodData {
  final IconData icon;
  final String title;
  final String description;

  _AccessMethodData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _AccessMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AccessMethodCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: AppColors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Icon(
              icon,
              color: AppColors.cyan,
              size: 32,
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            title,
            style: AppTextStyles.h4(context).copyWith(
              color: AppColors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            description,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: AppColors.white.withOpacity(0.8),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Services Section (Keep existing but simplified)
class _ServicesSection extends StatelessWidget {
  final String language;

  const _ServicesSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    final services = [
      _ServiceData(
        title: 'Mali Akili Uchambuzi',
        subtitle: language == 'sw' ? 'Uchambuzi wa Data' : 'Data Analytics',
        description: language == 'sw'
            ? 'Dashibodi za utendaji, viashiria muhimu, uchambuzi wa mwenendo, na muhtasari wa shughuli'
            : 'Performance dashboards, key metrics, trend analysis, and operational summaries',
        color: AppColors.cyan,
      ),
      _ServiceData(
        title: 'Mali Akili Utabiri',
        subtitle: language == 'sw' ? 'Utabiri wa Mashine' : 'Machine Learning Predictions',
        description: language == 'sw'
            ? 'Utabiri wa mauzo, utabiri wa mahitaji, kugundua hatari, na ishara za mapema'
            : 'Sales forecasting, demand prediction, risk detection, and early warnings',
        color: AppColors.accentPurple,
      ),
      _ServiceData(
        title: 'Mali Akili Msaidizi',
        subtitle: language == 'sw' ? 'Wasaidizi wa AI' : 'AI Assistants',
        description: language == 'sw'
            ? 'Chatbots za huduma, wasaidizi wa biashara, maswali ya lugha asilia, msaada wa Kiswahili/Kiingereza'
            : 'Service chatbots, business assistants, natural language queries, Swahili/English support',
        color: AppColors.accentOrange,
      ),
      _ServiceData(
        title: 'Mali Akili Ushauri',
        subtitle: language == 'sw' ? 'Mapendekezo ya Kimkakati' : 'Strategic Recommendations',
        description: language == 'sw'
            ? 'Mapendekezo ya biashara, kuboresha shughuli, mwongozo wa hatua, na msaada wa maamuzi'
            : 'Business recommendations, operations optimization, action guidance, and decision support',
        color: AppColors.accentGreen,
      ),
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
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      language == 'sw' ? 'HUDUMA ZETU' : 'OUR SERVICES',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 32 : 48,
                        color: AppColors.darkNavy,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: Text(
                        language == 'sw'
                            ? 'Huduma za kina za uchambuzi wa data zilizoundwa kwa mahitaji yako'
                            : 'Comprehensive data analytics services tailored to your needs',
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: AppColors.textGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.xl2),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.isMobile ? 1 : (responsive.isTablet ? 2 : 4),
                  crossAxisSpacing: AppSizes.lg,
                  mainAxisSpacing: AppSizes.lg,
                  childAspectRatio: responsive.isMobile ? 1.1 : 0.85,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return AnimatedFadeIn(
                    delay: Duration(milliseconds: 100 * index),
                    child: _ServiceCard(
                      title: services[index].title,
                      subtitle: services[index].subtitle,
                      description: services[index].description,
                      color: services[index].color,
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

class _ServiceData {
  final String title;
  final String subtitle;
  final String description;
  final Color color;

  _ServiceData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
  });
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color color;

  const _ServiceCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.lg),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(
              color: _isHovered ? widget.color : AppColors.lightGray,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.color.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xs,
                ),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                ),
                child: Text(
                  widget.title,
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.md),
              Text(
                widget.subtitle,
                style: AppTextStyles.h4(context).copyWith(
                  fontSize: 18,
                  color: AppColors.darkNavy,
                ),
              ),
              const SizedBox(height: AppSizes.sm),
              Expanded(
                child: Text(
                  widget.description,
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: AppColors.textGray,
                    height: 1.6,
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

// Industries Section (Keep existing)
class _IndustriesSection extends StatelessWidget {
  final String language;

  const _IndustriesSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Container(
      width: double.infinity,
      color: AppColors.mediumGray,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5,
          ),
          child: Column(
            children: [
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      language == 'sw' ? 'Viwanda Tunavyohudumia' : 'Industries We Serve',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        color: AppColors.darkNavy,
                        fontSize: responsive.isMobile ? 36 : 48,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: Text(
                        language == 'sw'
                            ? 'Tunatoa huduma za kina za uchambuzi wa data kwa mashirika mengi'
                            : 'Delivering deep data analytics across various sectors and organizations',
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: AppColors.textGray,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),
              
              Wrap(
                spacing: AppSizes.md,
                runSpacing: AppSizes.md,
                alignment: WrapAlignment.center,
                children: [
                  _IndustryChip(label: language == 'sw' ? 'Usafirishaji' : 'Logistics'),
                  _IndustryChip(label: language == 'sw' ? 'Chakula na Vinywaji' : 'Food & Beverage'),
                  _IndustryChip(label: language == 'sw' ? 'Kilimo' : 'Agriculture'),
                  _IndustryChip(label: language == 'sw' ? 'Ubunifu' : 'Creative'),
                  _IndustryChip(label: language == 'sw' ? 'Teknolojia' : 'Technology'),
                  _IndustryChip(label: language == 'sw' ? 'NGOs' : 'NGOs'),
                  _IndustryChip(label: language == 'sw' ? 'Makampuni' : 'Corporations'),
                  _IndustryChip(label: language == 'sw' ? 'Biashara za Kati' : 'Mid-Size Businesses'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndustryChip extends StatelessWidget {
  final String label;

  const _IndustryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        border: Border.all(
          color: AppColors.cyan.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyMedium(context).copyWith(
          color: AppColors.darkNavy,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Benefits Section (Keep existing)
class _BenefitsSection extends StatelessWidget {
  final String language;

  const _BenefitsSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

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
          child: AnimatedFadeIn(
            child: Column(
              children: [
                Text(
                  language == 'sw' ? 'KWA NINI MALI AKILI' : 'WHY MALI AKILI',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 48,
                    color: AppColors.darkNavy,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.xl2),
                _BenefitsList(language: language, responsive: responsive),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BenefitsList extends StatelessWidget {
  final String language;
  final Responsive responsive;

  const _BenefitsList({required this.language, required this.responsive});

  @override
  Widget build(BuildContext context) {
    final benefits = [
      _BenefitData(
        title: language == 'sw' ? 'Hakuna Timu ya Data Science Inahitajika' : 'No Data Science Team Required',
        description: language == 'sw' 
            ? 'Pata uchambuzi wa kiwango cha kampuni kubwa bila kuajiri wachambuzi wa bei ya juu'
            : 'Get enterprise-grade analytics without hiring expensive analysts',
      ),
      _BenefitData(
        title: language == 'sw' ? 'Maalum kwa Soko la Afrika Mashariki' : 'Tailored for East African Markets',
        description: language == 'sw'
            ? 'Iliyoundwa hasa kwa ukweli wa biashara za Kitanzania na Kenya'
            : 'Designed specifically for Tanzanian and Kenyan business realities',
      ),
      _BenefitData(
        title: language == 'sw' ? 'Msaada wa Kiswahili na Kiingereza' : 'Swahili & English Support',
        description: language == 'sw'
            ? 'AI chatbot inayozungumza lugha yako na kuelewa muktadha wako'
            : 'AI chatbot that speaks your language and understands your context',
      ),
      _BenefitData(
        title: language == 'sw' ? 'Gharama Ndogo ya BI' : 'Fraction of Traditional BI Costs',
        description: language == 'sw'
            ? 'Ufikio wa bei nafuu kwa uchambuzi wa hali ya juu'
            : 'Affordable access to sophisticated analytics capabilities',
      ),
    ];

    return responsive.isMobile
        ? Column(
            children: benefits.map((benefit) => Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.xl),
              child: _BenefitCard(
                title: benefit.title,
                description: benefit.description,
              ),
            )).toList(),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppSizes.xl,
              mainAxisSpacing: AppSizes.xl,
              childAspectRatio: 1.5,
            ),
            itemCount: benefits.length,
            itemBuilder: (context, index) {
              return _BenefitCard(
                title: benefits[index].title,
                description: benefits[index].description,
              );
            },
          );
  }
}

class _BenefitData {
  final String title;
  final String description;

  _BenefitData({
    required this.title,
    required this.description,
  });
}

class _BenefitCard extends StatelessWidget {
  final String title;
  final String description;

  const _BenefitCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        color: AppColors.mediumGray,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: AppColors.cyan.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.accentGreen,
              size: 24,
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            title,
            style: AppTextStyles.h4(context).copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.darkNavy,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            description,
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: AppColors.textGray,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// CTA Section (Keep existing)
class _CTASection extends StatelessWidget {
  final String language;

  const _CTASection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: responsive.maxContainerWidth),
          padding: EdgeInsets.symmetric(
            horizontal: responsive.horizontalPadding,
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl4,
          ),
          child: AnimatedFadeIn(
            child: Column(
              children: [
                Text(
                  language == 'sw'
                      ? 'Uko Tayari Kubadilisha Data Yako Kuwa Faida?'
                      : 'Ready to Turn Your Data\nInto Competitive Advantage?',
                  style: AppTextStyles.displayMedium(context).copyWith(
                    color: AppColors.white,
                    fontSize: responsive.isMobile ? 32 : 48,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.lg),
                Text(
                  language == 'sw'
                      ? 'Wasiliana nasi kwa ushauri wa bure na uone jinsi Mali Akili inavyoweza kusaidia biashara yako'
                      : 'Contact us for a free consultation and see how Mali Akili can transform your business',
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.white.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.xl2),
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.darkNavy,
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.isMobile ? AppSizes.xl : AppSizes.xl2,
                      vertical: AppSizes.lg,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        language == 'sw' ? 'Panga Ushauri' : 'Schedule Consultation',
                        style: AppTextStyles.buttonLarge(context).copyWith(
                          color: AppColors.darkNavy,
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.darkNavy,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}