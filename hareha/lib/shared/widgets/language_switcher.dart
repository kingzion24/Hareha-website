import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/app_sizes.dart';
import '../../core/localization/l10n_provider.dart';

class LanguageSwitcher extends ConsumerWidget {
  final bool showLabel;
  final LanguageSwitcherStyle style;

  const LanguageSwitcher({
    super.key,
    this.showLabel = false,
    this.style = LanguageSwitcherStyle.compact,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    switch (style) {
      case LanguageSwitcherStyle.compact:
        return _CompactSwitcher(
          language: language,
          onLanguageChanged: (lang) =>
              ref.read(languageProvider.notifier).state = lang,
        );
      case LanguageSwitcherStyle.dropdown:
        return _DropdownSwitcher(
          language: language,
          showLabel: showLabel,
          onLanguageChanged: (lang) =>
              ref.read(languageProvider.notifier).state = lang,
        );
      case LanguageSwitcherStyle.toggle:
        return _ToggleSwitcher(
          language: language,
          onLanguageChanged: (lang) =>
              ref.read(languageProvider.notifier).state = lang,
        );
    }
  }
}

enum LanguageSwitcherStyle {
  compact,
  dropdown,
  toggle,
}

// Compact pill-style switcher (used in app bar)
class _CompactSwitcher extends StatelessWidget {
  final String language;
  final Function(String) onLanguageChanged;

  const _CompactSwitcher({
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mediumGray),
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageButton(
            label: 'EN',
            isActive: language == 'en',
            onTap: () => onLanguageChanged('en'),
          ),
          _LanguageButton(
            label: 'SW',
            isActive: language == 'sw',
            onTap: () => onLanguageChanged('sw'),
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.cyan : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodySmall(context).copyWith(
            color: isActive ? AppColors.white : AppColors.darkNavy,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Dropdown style switcher
class _DropdownSwitcher extends StatelessWidget {
  final String language;
  final bool showLabel;
  final Function(String) onLanguageChanged;

  const _DropdownSwitcher({
    required this.language,
    required this.showLabel,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel) ...[
          Text(
            'Language:',
            style: AppTextStyles.bodyMedium(context),
          ),
          const SizedBox(width: AppSizes.sm),
        ],
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.sm,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.mediumGray),
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: DropdownButton<String>(
            value: language,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down, size: 20),
            style: AppTextStyles.bodyMedium(context),
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'sw', child: Text('Kiswahili')),
            ],
            onChanged: (value) {
              if (value != null) onLanguageChanged(value);
            },
          ),
        ),
      ],
    );
  }
}

// Toggle switch style
class _ToggleSwitcher extends StatelessWidget {
  final String language;
  final Function(String) onLanguageChanged;

  const _ToggleSwitcher({
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'EN',
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontWeight: language == 'en' ? FontWeight.w600 : FontWeight.w400,
            color: language == 'en' ? AppColors.cyan : AppColors.textGray,
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        Switch(
          value: language == 'sw',
          onChanged: (value) => onLanguageChanged(value ? 'sw' : 'en'),
          activeThumbColor: AppColors.cyan,
        ),
        const SizedBox(width: AppSizes.sm),
        Text(
          'SW',
          style: AppTextStyles.bodyMedium(context).copyWith(
            fontWeight: language == 'sw' ? FontWeight.w600 : FontWeight.w400,
            color: language == 'sw' ? AppColors.cyan : AppColors.textGray,
          ),
        ),
      ],
    );
  }
}