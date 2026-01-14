import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/app_sizes.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/localization/l10n_provider.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/animated_fade_in.dart';

class AppShowcase extends ConsumerWidget {
  const AppShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
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
                      language == 'sw' ? 'Msaidizi wako wa Kimkakati katika Biashara' : 'Your Strategic Partner in Business',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        color: AppColors.darkNavy,
                        fontSize: responsive.isMobile ? 36 : 48,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Text(
                        language == 'sw'
                            ? 'Katika Hareha, tunakualika kwa ujumbe wa kina ulioundwa ili kukusaidia kupata ushauri wa kina unaotokana na AI ulioundwa kipekee ili kufikia malengo yako mahususi na kuendesha ufanisi unaoendelea.'
                            : 'At Hareha, we warmly invite you to arrange an in-depth consultation designed to assist you with a strategic roadmap that aligns seamlessly with your distinct needs and objectives, and innovative approaches to boost operational efficiency.',
                        style: AppTextStyles.bodyLarge(context).copyWith(
                          color: AppColors.darkGray,
                          height: 1.7,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: AppSizes.xl),
                    _LearnMoreButton(language: language),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl4),
              
              // Stats Section
              _buildStatsSection(context, responsive, language),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl3 : AppSizes.xl5),
              
              // AI Services Title
              AnimatedFadeIn(
                child: Column(
                  children: [
                    Text(
                      language == 'sw' ? 'Usahihi wa Biashara Unaotumia AI' : 'AI-Powered Business Precision',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        color: AppColors.darkNavy,
                        fontSize: responsive.isMobile ? 32 : 42,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      language == 'sw'
                          ? 'Kutumia Nguvu ya AI kwa Usahihi wa Biashara na Ufanisi Uliobora'
                          : 'Harnessing the Power of AI for Unmatched Business Precision and Efficiency',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: responsive.isMobile ? AppSizes.xl : AppSizes.xl2),
              
              // Service Cards Grid
              _buildServiceCards(context, responsive, language),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, Responsive responsive, String language) {
    return AnimatedFadeIn(
      child: responsive.isMobile
          ? Column(
              children: [
                _StatCard(
                  value: '100%',
                  label: language == 'sw' ? 'Mikakati kwa Ukuaji wa Biashara na Upanuzi wa Soko' : 'Strategies for Business Growth and Market Expansion',
                ),
                const SizedBox(height: AppSizes.lg),
                _StatCard(
                  value: '90%',
                  label: language == 'sw' ? 'Ushirikiano wa Kimataifa na Kampuni za Kimataifa' : 'Global Corporations and International Enterprises',
                ),
                const SizedBox(height: AppSizes.lg),
                _StatCard(
                  value: '10k',
                  label: language == 'sw' ? 'Wauza Ushirikiano ili Kuboresha Mauzo na Mkakati' : 'Companies collaborate to optimize goals and innovate',
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _StatCard(
                    value: '100%',
                    label: language == 'sw' ? 'Mikakati kwa Ukuaji wa Biashara na Upanuzi wa Soko' : 'Strategies for Business Growth and Market Expansion',
                  ),
                ),
                const SizedBox(width: AppSizes.xl),
                Expanded(
                  child: _StatCard(
                    value: '90%',
                    label: language == 'sw' ? 'Ushirikiano wa Kimataifa na Kampuni za Kimataifa' : 'Global Corporations and International Enterprises',
                  ),
                ),
                const SizedBox(width: AppSizes.xl),
                Expanded(
                  child: _StatCard(
                    value: '10k',
                    label: language == 'sw' ? 'Wauza Ushirikiano ili Kuboresha Mauzo na Mkakati' : 'Companies collaborate to optimize goals and innovate',
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildServiceCards(BuildContext context, Responsive responsive, String language) {
    final services = [
      _ServiceCardData(
        icon: Icons.analytics_outlined,
        iconColor: AppColors.accentOrange,
        title: language == 'sw' ? 'Uchambuzi wa Data wa Kina' : 'Data Analytics Deep Insights',
        description: language == 'sw'
            ? 'Timu yetu inatoa uchambuzi na maarifa ya biashara yako. Tunakusaidia kutumia data yako nzuri ili kufanya maamuzi ya kimkakati...'
            : 'Our team offers data analytics and insights for your business. We use tools to turn your data into smart decisions, insights but also a clear roadmap to drive your business toward success.',
      ),
      _ServiceCardData(
        icon: Icons.lightbulb_outline,
        iconColor: AppColors.cyan,
        title: language == 'sw' ? 'Ubunifu wa Bidhaa' : 'Product Innovation',
        description: language == 'sw'
            ? 'Timu yetu inatoa uchambuzi na maarifa ya biashara yako. Tunakusaidia kutumia zana za data za kisasa ili kufanya maamuzi ya kimkakati...'
            : 'Our team offers data analytics and insights for your business. We use tools to turn your data into smart decisions, insights but also a clear roadmap to drive your business toward success.',
      ),
      _ServiceCardData(
        icon: Icons.school_outlined,
        iconColor: AppColors.accentPurple,
        title: language == 'sw' ? 'Ushauri wa Mkakati wa AI Pro' : 'AI Strategy Pro Consulting',
        description: language == 'sw'
            ? 'Timu yetu inatoa uchambuzi na maarifa ya biashara yako. Tunakusaidia kutumia data yako nzuri ili kufanya maamuzi ya kimkakati...'
            : 'Our team offers data analytics and insights for your business. We use tools to turn your data into smart decisions, insights but also a clear roadmap to drive your business toward success.',
      ),
      _ServiceCardData(
        icon: Icons.chat_bubble_outline,
        iconColor: AppColors.accentPink,
        title: language == 'sw' ? 'Mazungumzo ya AI' : 'Consultation AI Chatbots',
        description: language == 'sw'
            ? 'Timu yetu inatoa uchambuzi na maarifa ya biashara yako. Tunakusaidia kutumia data yako nzuri ili kufanya maamuzi ya kimkakati...'
            : 'Our team offers data analytics and insights for your business. We use tools to turn your data into smart decisions, insights but also a clear roadmap to drive your business toward success.',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: responsive.isMobile ? 1 : (responsive.isTablet ? 2 : 4),
        crossAxisSpacing: AppSizes.lg,
        mainAxisSpacing: AppSizes.lg,
        childAspectRatio: responsive.isMobile ? 1.2 : 0.85,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return AnimatedFadeIn(
          delay: Duration(milliseconds: 100 * index),
          child: _ServiceCard(
            icon: services[index].icon,
            iconColor: services[index].iconColor,
            title: services[index].title,
            description: services[index].description,
          ),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.displayLarge(context).copyWith(
              color: AppColors.darkNavy,
              fontSize: 64,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            label,
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: AppColors.darkGray,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ServiceCardData {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  _ServiceCardData({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
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
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.xl),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusXl),
            border: Border.all(
              color: _isHovered ? widget.iconColor.withOpacity(0.5) : AppColors.mediumGray.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? widget.iconColor.withOpacity(0.2) : Colors.black.withOpacity(0.05),
                blurRadius: _isHovered ? 30 : 10,
                offset: Offset(0, _isHovered ? 15 : 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 28,
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              Text(
                widget.title,
                style: AppTextStyles.h4(context).copyWith(
                  color: AppColors.darkNavy,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSizes.sm),
              Expanded(
                child: Text(
                  widget.description,
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: AppColors.darkGray,
                    height: 1.6,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LearnMoreButton extends StatelessWidget {
  final String language;

  const _LearnMoreButton({required this.language});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkNavy),
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              language == 'sw' ? 'Jifunze Zaidi' : 'Learn More',
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: AppColors.darkNavy,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            const Icon(
              Icons.arrow_forward,
              size: 18,
              color: AppColors.darkNavy,
            ),
          ],
        ),
      ),
    );
  }
}