import 'package:flutter_riverpod/flutter_riverpod.dart';

// Language state provider
final languageProvider = StateProvider<String>((ref) => 'sw'); // Default to Swahili

// Helper function to get localized string
String getLocalizedString(
  Map<String, Map<String, String>> strings,
  String key,
  String language,
) {
  return strings[key]?[language] ?? strings[key]?['en'] ?? key;
}

// Extension for easier access
extension LocalizationExtension on WidgetRef {
  String t(Map<String, Map<String, String>> strings, String key) {
    final language = watch(languageProvider);
    return getLocalizedString(strings, key, language);
  }
  
  String translate(Map<String, Map<String, String>> strings, String key) {
    final language = read(languageProvider);
    return getLocalizedString(strings, key, language);
  }
}