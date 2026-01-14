import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bar_widget.dart';
import '../../../shared/widgets/footer_widget.dart';
import '../../../core/constant/app_colors.dart';
import 'widgets/hero_section.dart';
import 'widgets/strategic_partner_section.dart';
import 'widgets/service_cards_section.dart';
import 'widgets/cta_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcaseKey = GlobalKey();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(showcaseKey: showcaseKey),
            Container(
              key: showcaseKey,
              child: const StrategicPartnerSection(),
            ),
            const ServiceCardsSection(),
            const CTASection(),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}