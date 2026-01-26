import 'package:flutter/material.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/footer_widget.dart';
import '../../core/constant/app_colors.dart';
import 'presentation/md_hero_section.dart';
import 'presentation/md_problem_cards.dart';
import 'presentation/md_features_grid.dart';
import 'presentation/md_ai_section.dart';
import 'presentation/md_how_it_works.dart';
import 'presentation/md_download_cta.dart';

class MaliDaftariPage extends StatelessWidget {
  const MaliDaftariPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MDHeroSection(),
            MDProblemCards(),
            MDFeaturesGrid(),
            MDAISection(),
            MDHowItWorks(),
            MDDownloadCTA(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}