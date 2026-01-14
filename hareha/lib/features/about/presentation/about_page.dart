import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/app_bar_widget.dart';
import '../../../shared/widgets/footer_widget.dart';
import '../../../shared/widgets/animated_fade_in.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/localization/l10n_provider.dart';
import '../../../core/utils/responsive.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

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
            _StorySection(language: language),
            _ProblemSection(language: language),
            _SolutionSection(language: language),
            _MissionVisionSection(language: language),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

// Hero Section - DARK GRADIENT
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
            vertical: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl4,
          ),
          child: AnimatedFadeIn(
            child: Column(
              children: [
                Text(
                  language == 'sw' ? 'Kuhusu Hareha' : 'About Hareha',
                  style: AppTextStyles.displayLarge(context).copyWith(
                    color: AppColors.white,
                    fontSize: responsive.isMobile ? 40 : 64,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.lg),
                Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Text(
                    language == 'sw'
                        ? 'Kusaidia biashara za Kitanzania kujibuni kwa njia za kisasa'
                        : 'Helping Tanzanian local businesses reinvent themselves',
                    style: AppTextStyles.bodyLarge(context).copyWith(
                      color: AppColors.white.withOpacity(0.9),
                      height: 1.6,
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

// Story Section - WHITE BACKGROUND
class _StorySection extends StatelessWidget {
  final String language;

  const _StorySection({required this.language});

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
            vertical: responsive.verticalPadding,
          ),
          child: AnimatedFadeIn(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language == 'sw' ? 'HADITHI YETU' : 'OUR STORY',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    letterSpacing: 2.0,
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                Text(
                  language == 'sw' ? 'Jinsi Tulivyoanza' : 'How We Started',
                  style: AppTextStyles.h1(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 48,
                    color: AppColors.darkNavy,
                  ),
                ),
                const SizedBox(height: AppSizes.xl),
                Text(
                  language == 'sw'
                      ? 'Hareha ilianzishwa ili kutengeneza suluhisho bora na zenye ufanisi zaidi zinazoongozwa na data kwa biashara. Tuliona hitaji la biashara za Tanzania kukua na kustawi kwa kutumia teknolojia za kisasa, na tukabaini fursa kubwa ya kusaidia biashara ndogo na kubwa kupitia matumizi mahiri ya data na uchambuzi wa taarifa za biashara yako.'
                      : 'Hareha was founded to create better and more effective data-driven business solutions. We saw the need for Tanzanian businesses to grow and thrive using modern technology, and we identified a strong opportunity to support both small and large businesses through smart use of data and analytics.',
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.textGray,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: AppSizes.md),
                Text(
                  language == 'sw'
                      ? 'Tunaamini kwamba kila biashara, kubwa au ndogo, inastahili kuwa na zana za kisasa ambazo zinaweza kusaidia kuboresha shughuli za uwendeshaji wa biashara yako.'
                      : 'We believe that every business, large or small, deserves modern tools that can help improve their operations and increase revenue.',
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.textGray,
                    height: 1.7,
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

// Problem Section - DARK BACKGROUND
class _ProblemSection extends StatelessWidget {
  final String language;

  const _ProblemSection({required this.language});

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
            vertical: responsive.verticalPadding,
          ),
          child: AnimatedFadeIn(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language == 'sw' ? 'TATIZO' : 'THE PROBLEM',
                  style: AppTextStyles.displayLarge(context).copyWith(
                    fontSize: responsive.isMobile ? 48 : 72,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: AppSizes.xl),
                Text(
                  language == 'sw'
                      ? 'Biashara za Kitanzania zinafanya maamuzi gizani. Biashara zisizo rasmi zinafuatilia kila kitu kupitia kumbukumbu na madaftari mauzo yanachanganyika pamoja, hesabu ya bidhaa inapotea, gharama zinatawanyika kwenye karatasi.Biashara inahitaji kujibu maswali: Bidhaa zipi zinazalisha faida? Unatumia kiasi gani kwa kweli kila mwezi? Makampuni makubwa na saizi za kati yana tatizo kinyume: miaka ya data inakaa bila kutumika. Mifumo haionekani. Maarifa yamezikwa. Bila wachambuzi, data hiyo haina msaada kwako. Matokeo ni sawa kwa njia zote mbili: maamuzi muhimu yanayofanywa kwa matumaini badala ya ushahidi.'
                      : 'Tanzanian businesses are making decisions in the dark. Informal businesses track everything through memory and notebooks—sales blur together, inventory counts disappear, expenses scatter across random papers. Growth requires answering questions you can\'t: Which products profit? What do you really spend monthly? Established companies have the opposite problem: years of data sitting unused in spreadsheets. Patterns unseen. Insights buried. Without analysts, that data might as well not exist. Same result either way: critical decisions made on hope rather than evidence.',
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: AppColors.white.withOpacity(0.9),
                    height: 1.7,
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

// Solution Section - WHITE BACKGROUND
class _SolutionSection extends StatelessWidget {
  final String language;

  const _SolutionSection({required this.language});

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
            vertical: responsive.verticalPadding,
          ),
          child: AnimatedFadeIn(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language == 'sw' ? 'SULUHISHO LETU' : 'OUR SOLUTION',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    letterSpacing: 2.0,
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                Text(
                  language == 'sw' ? 'Bidhaa Zetu' : 'Our Products',
                  style: AppTextStyles.h1(context).copyWith(
                    fontSize: responsive.isMobile ? 32 : 48,
                    color: AppColors.darkNavy,
                  ),
                ),
                const SizedBox(height: AppSizes.xl),
                
                // Mali Daftari Card
                Container(
                  padding: const EdgeInsets.all(AppSizes.xl),
                  decoration: BoxDecoration(
                    color: AppColors.cyan.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    border: Border.all(
                      color: AppColors.cyan.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.md,
                          vertical: AppSizes.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cyan,
                          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                        ),
                        child: Text(
                          'MALI DAFTARI',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),
                      Text(
                        language == 'sw'
                            ? 'Jukwaa la Usimamizi wa Biashara'
                            : 'Business Management Platform',
                        style: AppTextStyles.h3(context).copyWith(
                          color: AppColors.darkNavy,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        language == 'sw'
                            ? 'Programu ya simu iliyoundwa kwa wamiliki wa biashara ndogo wanaohitaji kunakili shughuli za kila siku bila ugumu.Rekodi kila mauzo yanapotokea, fuatilia mizigo iliyokuwa store, andika gharama, na simamia shughuli za wafanyakazi wote kutoka kwenye simu yako, na msaidizi wa AI tayari kukuongoza kupitia kila kipengele kwa Kiswahili au Kiingereza. Imeundwa hasa kwa biashara za Kitanzania ambazo ziko tayari kuhamia kutoka vitabu na kumbukumbu hadi data ya mfumo na inayoaminika.'
                            : 'A mobile app designed for small business owners who need to capture daily operations without complexity. Record every sale as it happens, track inventory levels in real-time, log expenses on the go, and monitor staff activities—all from your phone, with an AI assistant ready to guide you through every feature in Swahili or English. Built specifically for Tanzanian businesses that are ready to move from notebooks and memory to systematic, reliable data.',
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: AppColors.textGray,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppSizes.lg),
                
                // Mali Akili Card
                Container(
                  padding: const EdgeInsets.all(AppSizes.xl),
                  decoration: BoxDecoration(
                    color: AppColors.accentPurple.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    border: Border.all(
                      color: AppColors.accentPurple.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.md,
                          vertical: AppSizes.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentPurple,
                          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                        ),
                        child: Text(
                          'MALI AKILI',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),
                      Text(
                        language == 'sw'
                            ? 'Huduma za AI kwa Mashirika Makubwa'
                            : 'AI Services for Large Organizations',
                        style: AppTextStyles.h3(context).copyWith(
                          color: AppColors.darkNavy,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        language == 'sw'
                            ? 'Jukwaa kamili la uchambuzi kwa biashara zilizoimarishwa ambazo tayari zina data lakini hazina ujuzi wa kutoa thamani ya kimkakati kutoka kwake. Tunachukua rekodi zako zilizopo za mauzo, shughuli za wateja, vipimo vya uendeshaji, na data ya kihistoria, kisha tunatumia zana za kitechnolojia kufichua mifumo, kutabiri mwenendo wa baadaye, kutambua fursa, na kutoa mapendekezo ya kimkakati yanayoweza kufanywa—yote bila kuhitaji kuajiri timu ya sayansi ya data iliyojitoa. Inafaa kwa makampuni yaliyotayari kusonga mbele ya maamuzi ya hisia na kushindana kwa kutumia ujuzi wa utabiri uliofichwa katika data yao wenyewe.'
                            : 'A comprehensive analytics platform for established businesses that already have data but lack the expertise to extract strategic value from it. We take your existing sales records, customer transactions, operational metrics, and historical data, then apply machine learning to uncover patterns, predict future trends, identify opportunities, and provide actionable strategic recommendations—all without requiring you to hire a dedicated data science team. Perfect for companies ready to move beyond gut-feel decisions and compete using the predictive intelligence hidden in their own data.',
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: AppColors.textGray,
                          height: 1.6,
                        ),
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

// Mission Vision Section - DARK GRADIENT
class _MissionVisionSection extends StatelessWidget {
  final String language;

  const _MissionVisionSection({required this.language});

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
            vertical: responsive.verticalPadding,
          ),
          child: AnimatedFadeIn(
            child: Column(
              children: [
                Text(
                  language == 'sw' ? 'MAONO & DHAMIRA' : 'MISSION & VISION',
                  style: AppTextStyles.h1(context).copyWith(
                    color: AppColors.white,
                    fontSize: responsive.isMobile ? 32 : 48,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.xl3),
                
                responsive.isMobile
                    ? Column(
                        children: [
                          _buildMissionCard(context, language),
                          const SizedBox(height: AppSizes.xl),
                          _buildVisionCard(context, language),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildMissionCard(context, language)),
                          const SizedBox(width: AppSizes.xl),
                          Expanded(child: _buildVisionCard(context, language)),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMissionCard(BuildContext context, String language) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(
          color: AppColors.white.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.cyan,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: const Icon(
              Icons.flag,
              size: 32,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            language == 'sw' ? 'Dhamira' : 'Mission',
            style: AppTextStyles.h3(context).copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            language == 'sw'
                ? 'Kusaidia biashara za Tanzania kuboresha shughuli zao kupitia teknolojia ya AI na kuwafanya wawe na uwezo wa kushindana katika soko la kimataifa.'
                : 'To help Tanzanian businesses improve their operations through AI technology and enable them to compete in the international market.',
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: AppColors.white.withOpacity(0.9),
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVisionCard(BuildContext context, String language) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(
          color: AppColors.white.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.accentPurple,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: const Icon(
              Icons.visibility,
              size: 32,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            language == 'sw' ? 'Maono' : 'Vision',
            style: AppTextStyles.h3(context).copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            language == 'sw'
                ? 'Kuwa kampuni inayoongoza katika kutoa suluhisho za AI kwa biashara za Afrika Mashariki na kuwa kiongozi katika ubunifu wa teknolojia.'
                : 'To be the leading company in providing AI solutions for East African businesses and be a pioneer in technology innovation.',
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: AppColors.white.withOpacity(0.9),
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}