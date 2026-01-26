import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/about/presentation/about_page.dart';
import '../../features/contact/presentation/contact_page.dart';
import '../../features/mali_akili/presentation/mali_akili_page.dart';
import '../../features/malidaftari/mali_daftari_page.dart';

class AppRouter {
  static const String home = '/';
  static const String about = '/about';
  static const String maliDaftari = '/mali-daftari';
  static const String maliAkili = '/mali-akili';
  static const String contact = '/contact';
  
  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: about,
        name: 'about',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AboutPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: maliDaftari,
        name: 'mali-daftari',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MaliDaftariPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: maliAkili,
        name: 'mali-akili',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MaliAkiliPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: contact,
        name: 'contact',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ContactPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    ),
  );
}