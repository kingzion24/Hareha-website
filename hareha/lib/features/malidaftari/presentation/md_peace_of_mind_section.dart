import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/app_sizes.dart';
import '../../../../../core/localization/l10n_provider.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../shared/widgets/animated_fade_in.dart';

class MDPeaceOfMindSection extends ConsumerWidget {
  const MDPeaceOfMindSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = context.responsive;
    final language = ref.watch(languageProvider);

    final blocks = language == 'sw'
        ? [
           _BlockData(
            title: 'Taarifa Muhimu',
            body: 'Pata taarifa za papo hapo kwenye simu yako bidhaa zinapopungua, msaidizi mpya anapoingia kwenye mfumo, au mauzo yanapofutwa.',
            imagePath: 'lib/resources/images/notifications.jpeg',
            accent: AppColors.cyan,
            isDouble: false,
          ),
          _BlockData(
            title: 'Udhibiti wa Matumizi',
            body: 'Wewe na timu yako mnaweza kurekodi matumizi na kuambatanisha picha ya risiti ili kukumbuka na kuhakiki matumizi hayo baadaye.',
            imagePath: 'lib/resources/images/expenses_screen_1.jpeg',
            secondImagePath: 'lib/resources/images/expenses_screen_2.jpeg',
            accent: AppColors.accentOrange,
            isDouble: true,
          ),
          _BlockData(
            title: 'Usimamizi na Uwajibikaji',
            body: 'Wewe na wasaidizi wako mnaona kurasa tofauti. Wewe unaona kila kitu; wao wanaona tu kile wanachohitaji kufanya mauzo. Hakuna kuficha taarifa.',
            imagePath: 'lib/resources/images/settings_screen_1.jpeg',
            accent: AppColors.accentPurple,
            isDouble: false,
          ),
          ]
        : [
            _BlockData(
              title: 'Smart Alerts',
              body: 'Get instant alerts on your phone when stock runs low, a new assistant logs in, or a sale is reversed.',
              imagePath: 'lib/resources/images/notifications.jpeg',
              accent: AppColors.cyan,
              isDouble: false,
            ),
            _BlockData(
              title: 'Bulletproof Expenses',
              body: 'you and your team can record expense and also attach the receipt image to remind you of expense you made and also to verify the expense later',
              imagePath: 'lib/resources/images/expenses_screen_1.jpeg',
              secondImagePath: 'lib/resources/images/expenses_screen_2.jpeg',
              accent: AppColors.accentOrange,
              isDouble: true,
            ),
            _BlockData(
              title: 'Total Accountability',
              body: 'You and your assistants see different pages. You see everything; they see only what they need to make a sale. No hiding information.',
              imagePath: 'lib/resources/images/settings_screen_1.jpeg',
              accent: AppColors.accentPurple,
              isDouble: false,
            ),
          ];

    return Container(
      width: double.infinity,
      color: AppColors.lightGray,
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
                      language == 'sw' ? 'Amani ya Akili' : 'Peace of Mind',
                      style: AppTextStyles.displayMedium(context).copyWith(
                        fontSize: responsive.isMobile ? 32 : 42,
                        color: AppColors.darkNavy,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.md),
                    Text(
                      language == 'sw'
                          ? 'Kila kitu kipo sawa, hata usipokuwepo'
                          : "Everything is in order, even when you're not there",
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: AppColors.textGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: responsive.isMobile ? AppSizes.xl2 : AppSizes.xl3),

              ...blocks.asMap().entries.map((entry) {
                final index = entry.key;
                final block = entry.value;
                return AnimatedFadeIn(
                  delay: Duration(milliseconds: 150 * index),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: index < blocks.length - 1
                          ? (responsive.isMobile
                              ? AppSizes.xl2
                              : AppSizes.xl3)
                          : 0,
                    ),
                    child: _PeaceBlock(
                      block: block,
                      isEven: index % 2 == 0,
                      isMobile: responsive.isMobile,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlockData {
  final String title;
  final String body;
  final String imagePath;
  final String? secondImagePath;
  final Color accent;
  final bool isDouble;

  const _BlockData({
    required this.title,
    required this.body,
    required this.imagePath,
    this.secondImagePath,
    required this.accent,
    required this.isDouble,
  });
}

class _PeaceBlock extends StatelessWidget {
  final _BlockData block;
  final bool isEven;
  final bool isMobile;

  const _PeaceBlock({
    required this.block,
    required this.isEven,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextContent(context),
          const SizedBox(height: AppSizes.xl2),
          Center(child: _buildImageWidget()),
        ],
      );
    }

    final textSide = Expanded(
      flex: 5,
      child: _buildTextContent(context),
    );
    final imageSide = Expanded(
      flex: 4,
      child: Center(child: _buildImageWidget()),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: isEven
          ? [textSide, const SizedBox(width: AppSizes.xl3), imageSide]
          : [imageSide, const SizedBox(width: AppSizes.xl3), textSide],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: block.accent,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: Text(
                block.title,
                style: AppTextStyles.h2(context).copyWith(
                  color: AppColors.darkNavy,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.md),
        Text(
          block.body,
          style: AppTextStyles.bodyLarge(context).copyWith(
            color: AppColors.textGray,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  Widget _buildImageWidget() {
    if (block.isDouble) {
      return _DoublePhoneImage(
        imagePath1: block.imagePath,
        imagePath2: block.secondImagePath!,
        accent: block.accent,
      );
    }
    return _PhoneImage(
      imagePath: block.imagePath,
      accent: block.accent,
    );
  }
}

class _PhoneImage extends StatefulWidget {
  final String imagePath;
  final Color accent;

  const _PhoneImage({
    required this.imagePath,
    required this.accent,
  });

  @override
  State<_PhoneImage> createState() => _PhoneImageState();
}

class _PhoneImageState extends State<_PhoneImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final frame = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: _isHovered
                ? widget.accent.withValues(alpha: 0.4)
                : widget.accent.withValues(alpha: 0.2),
            blurRadius: _isHovered ? 32 : 24,
            offset: Offset(0, _isHovered ? 16 : 10),
          ),
        ],
        border: Border.all(
          color: widget.accent.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        child: AspectRatio(
          aspectRatio: 9 / 19.5,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.lightGray,
                child: Center(
                  child: Icon(
                    Icons.phone_android,
                    size: 60,
                    color: AppColors.textGray,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 220),
          child: frame,
        ),
      ),
    );
  }
}

class _DoublePhoneImage extends StatefulWidget {
  final String imagePath1;
  final String imagePath2;
  final Color accent;

  const _DoublePhoneImage({
    required this.imagePath1,
    required this.imagePath2,
    required this.accent,
  });

  @override
  State<_DoublePhoneImage> createState() => _DoublePhoneImageState();
}

class _DoublePhoneImageState extends State<_DoublePhoneImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final stack = SizedBox(
      width: 240,
      height: 370,
      child: Stack(
        children: [
          // Back phone — shifted right and down, slightly faded
          Positioned(
            right: 0,
            top: 20,
            child: Opacity(
              opacity: 0.75,
              child: _buildPhone(widget.imagePath2),
            ),
          ),
          // Front phone
          Positioned(
            left: 0,
            top: 0,
            child: _buildPhone(widget.imagePath1),
          ),
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        child: stack,
      ),
    );
  }

  Widget _buildPhone(String path) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: _isHovered
                ? widget.accent.withValues(alpha: 0.35)
                : widget.accent.withValues(alpha: 0.2),
            blurRadius: _isHovered ? 28 : 20,
            offset: Offset(0, _isHovered ? 14 : 8),
          ),
        ],
        border: Border.all(
          color: widget.accent.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        child: AspectRatio(
          aspectRatio: 9 / 19.5,
          child: Image.asset(
            path,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.lightGray,
                child: Center(
                  child: Icon(
                    Icons.phone_android,
                    size: 50,
                    color: AppColors.textGray,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
