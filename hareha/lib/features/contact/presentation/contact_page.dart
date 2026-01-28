import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/widgets/app_bar_widget.dart';
import '../../../shared/widgets/footer_widget.dart';
import '../../../shared/widgets/animated_fade_in.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/localization/l10n_provider.dart';
import '../../../core/utils/responsive.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

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
            _ContactInfoSection(language: language),
            _FAQSection(language: language),
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
                  language == 'sw' ? 'Wasiliana Nasi' : 'Get In Touch',
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
                        ? 'Tuko hapa kukusaidia. Wasiliana nasi kwa maswali, ushauri au msaada wowote.'
                        : 'We\'re here to help. Contact us for any questions, consultations or support.',
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

// Contact Info Section - WHITE BACKGROUND
class _ContactInfoSection extends StatelessWidget {
  final String language;

  const _ContactInfoSection({required this.language});

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
            child: responsive.isMobile
                ? Column(
                    children: [
                      _ContactCard(
                        icon: Icons.email_outlined,
                        title: language == 'sw' ? 'Barua Pepe' : 'Email',
                        value: 'hareha.communications@gmail.com',
                        onTap: () => _launchEmail('hareha.communications@gmail.com'),
                      ),
                      const SizedBox(height: AppSizes.lg),
                      _ContactCard(
                        icon: Icons.phone_outlined,
                        title: language == 'sw' ? 'Simu' : 'Phone',
                        value: '+255-688-996-287',
                        onTap: () => _launchPhone('+255-688-996-287'),
                      ),
                      const SizedBox(height: AppSizes.lg),
                      _ContactCard(
                        icon: Icons.location_on_outlined,
                        title: language == 'sw' ? 'Mahali' : 'Address',
                        value: 'Dar es Salaam, Tanzania',
                        onTap: null,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _ContactCard(
                          icon: Icons.email_outlined,
                          title: language == 'sw' ? 'Barua Pepe' : 'Email',
                          value: 'hareha.communications@gmail.com',
                          onTap: () => _launchEmail('hareha.communications@gmail.com'),
                        ),
                      ),
                      const SizedBox(width: AppSizes.lg),
                      Expanded(
                        child: _ContactCard(
                          icon: Icons.phone_outlined,
                          title: language == 'sw' ? 'Simu' : 'Phone',
                          value: '+255-688-996-287',
                          onTap: () => _launchPhone('+255-688-996-287'),
                        ),
                      ),
                      const SizedBox(width: AppSizes.lg),
                      Expanded(
                        child: _ContactCard(
                          icon: Icons.location_on_outlined,
                          title: language == 'sw' ? 'Mahali' : 'Address',
                          value: 'Dar es Salaam, Tanzania',
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          child: Container(
            padding: const EdgeInsets.all(AppSizes.xl),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              border: Border.all(
                color: _isHovered ? AppColors.cyan : AppColors.lightGray,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? AppColors.cyan.withOpacity(0.15)
                      : Colors.black.withOpacity(0.05),
                  blurRadius: _isHovered ? 20 : 10,
                  offset: Offset(0, _isHovered ? 8 : 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.cyan.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 32,
                    color: AppColors.cyan,
                  ),
                ),
                const SizedBox(height: AppSizes.md),
                Text(
                  widget.title,
                  style: AppTextStyles.h4(context).copyWith(
                    color: AppColors.darkNavy,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.sm),
                Text(
                  widget.value,
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: AppColors.textGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// FAQ Section - WHITE BACKGROUND - EXACT Walawe Style
class _FAQSection extends StatelessWidget {
  final String language;

  const _FAQSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    final faqs = [
      _FAQData(
        question: language == 'sw' 
            ? 'Hareha ni nini na inafanya nini?'
            : 'What is Hareha and what does it do?',
        answer: language == 'sw'
            ? 'Hareha ni kampuni ya teknolojia inayotoa suluhisho mbili kuu: Mali Daftari (jukwaa la usimamizi wa biashara) na Mali Akili (huduma za AI na business intelligence). Tunasaidia biashara za Tanzania kuboresha shughuli zao kupitia teknolojia.'
            : 'Hareha is a technology company offering two main solutions: Mali Daftari (business management platform) and Mali Akili (AI and business intelligence services). We help Tanzanian businesses improve their operations through technology.',
      ),
      _FAQData(
        question: language == 'sw'
            ? 'Ni nani anaweza kutumia Mali Daftari?'
            : 'Who can use Mali Daftari?',
        answer: language == 'sw'
            ? 'Mali Daftari imeundwa kwa biashara ndogo na za kati (SMEs) Tanzania. Ikiwa una duka au biashara inayohitaji kusimamia mali, mauzo na wafanyakazi, Mali Daftari ni suluhisho sahihi kwako.'
            : 'Mali Daftari is designed for Tanzanian small and medium enterprises (SMEs). If you run a shop or business that needs to manage inventory, sales and employees, Mali Daftari is the right solution for you.',
      ),
      _FAQData(
        question: language == 'sw'
            ? 'Mali Akili inafaa kwa nani?'
            : 'Who is Mali Akili for?',
        answer: language == 'sw'
            ? 'Mali Akili imekusudiwa kwa mashirika makubwa, makampuni, NGOs, na taasisi za serikali ambazo zina data nyingi lakini hazina timu maalum ya uchambuzi wa data. Inatoa uchambuzi wa AI, utabiri, na mapendekezo ya kimkakati.'
            : 'Mali Akili is designed for larger organizations, corporations, NGOs, and government institutions that have lots of data but lack dedicated data analysis teams. It provides AI-powered analytics, predictions, and strategic recommendations.',
      ),
      _FAQData(
        question: language == 'sw'
            ? 'Je, ninaweza kujaribu huduma kabla ya kununua?'
            : 'Can I try the services before purchasing?',
        answer: language == 'sw'
            ? 'Ndio! Tunatoa ushauri wa bure kwa wote wanaotaka kujua zaidi kuhusu Mali Daftari na Mali Akili. Wasiliana nasi kupanga mkutano wa kuzungumza kuhusu mahitaji yako na jinsi tunaweza kukusaidia.'
            : 'Yes! We offer free consultations for everyone interested in learning more about Mali Daftari and Mali Akili. Contact us to schedule a meeting to discuss your needs and how we can help.',
      ),
      _FAQData(
        question: language == 'sw'
            ? 'Ninaweza kuwasiliana vipi kwa msaada?'
            : 'How can I contact you for support?',
        answer: language == 'sw'
            ? 'Unaweza kuwasiliana nasi kupitia barua pepe (hareha.communications@gmail.com), simu (+255-688-996-287), au kutembelea ofisi zetu Dar es Salaam. Tunatoa msaada wa 24/7 kwa wateja wetu.'
            : 'You can contact us via email (hareha.communications@gmail.com), phone (+255-688-996-287), or visit our office in Dar es Salaam. We provide 24/7 support for our customers.',
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
            vertical: responsive.verticalPadding,
          ),
          child: Column(
            children: [
              // FAQ Header
              AnimatedFadeIn(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            language == 'sw' 
                                ? 'Maswali Yanayoulizwa Mara kwa Mara' 
                                : 'Frequently Asked\nQuestions',
                            style: AppTextStyles.displayMedium(context).copyWith(
                              fontSize: responsive.isMobile ? 32 : 48,
                              color: AppColors.darkNavy,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (responsive.isDesktop) ...[
                      const SizedBox(width: AppSizes.xl2),
                      Expanded(
                        child: Text(
                          language == 'sw'
                              ? 'Hapa kuna maswali yanayoulizwa mara kwa mara kuhusu Hareha na huduma zetu. Ikiwa huna jibu linalokutosheleza, wasiliana nasi moja kwa moja.'
                              : 'Here are some frequently asked questions with answers to clarify doubts. If you don\'t find what you\'re looking for, contact us directly.',
                          style: AppTextStyles.bodyMedium(context).copyWith(
                            color: AppColors.textGray,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              if (responsive.isMobile) ...[
                const SizedBox(height: AppSizes.lg),
                Text(
                  language == 'sw'
                      ? 'Hapa kuna maswali yanayoulizwa mara kwa mara kuhusu Hareha na huduma zetu.'
                      : 'Here are some frequently asked questions with answers to clarify doubts.',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: AppColors.textGray,
                    height: 1.7,
                  ),
                ),
              ],
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl : AppSizes.xl2),
              
              // FAQ Items
              ...faqs.asMap().entries.map((entry) {
                return Column(
                  children: [
                    AnimatedFadeIn(
                      delay: Duration(milliseconds: 100 * entry.key),
                      child: _FAQItem(
                        question: entry.value.question,
                        answer: entry.value.answer,
                      ),
                    ),
                    if (entry.key < faqs.length - 1) 
                      const SizedBox(height: AppSizes.md),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FAQData {
  final String question;
  final String answer;

  _FAQData({
    required this.question,
    required this.answer,
  });
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(
          color: _isExpanded 
              ? AppColors.cyan 
              : AppColors.lightGray,
          width: _isExpanded ? 2 : 1,
        ),
        boxShadow: _isExpanded
            ? [
                BoxShadow(
                  color: AppColors.cyan.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: AppTextStyles.h4(context).copyWith(
                        fontSize: 18,
                        color: AppColors.darkNavy,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.add,
                      color: _isExpanded ? AppColors.cyan : AppColors.textGray,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isExpanded ? null : 0,
            child: _isExpanded
                ? Container(
                    padding: const EdgeInsets.only(
                      left: AppSizes.lg,
                      right: AppSizes.lg,
                      bottom: AppSizes.lg,
                    ),
                    child: Text(
                      widget.answer,
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
                        height: 1.7,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}