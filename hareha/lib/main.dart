import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/scroll_behavior.dart';

void main() {
  // Optimize for web
  if (kIsWeb) {
    // Reduce unnecessary rebuilds and optimize performance
    WidgetsFlutterBinding.ensureInitialized();
  }
  
  runApp(
    const ProviderScope(
      child: HarehaWebsite(),
    ),
  );
}

class HarehaWebsite extends StatelessWidget {
  const HarehaWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hareha - Empowering Tanzanian Businesses with AI & Technology',
      debugShowCheckedModeBanner: false,
      
      // Use custom dark theme
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      
      // Performance optimizations for web
      scrollBehavior: CustomScrollBehavior(),
      
      // Router configuration
      routerConfig: AppRouter.router,
      
      // Builder for additional customizations
      builder: (context, child) {
        return MediaQuery(
          // Prevent text scaling issues
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
    );
  }
}