# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Ultron Workspace

This project is registered in the Ultron workspace as **`hareha`** (Personal — incepta).
Ultron-side context files live at `~/zion24/ultron/z/hareha/`:

- `context-loader.md` — files to read at session start (read FIRST)
- `CLAUDE.md` — Ultron-side rules and notes
- `learnings.md` — past mistakes and lessons (read BEFORE starting work)

This repo's own `CLAUDE.md` (below) remains the source of truth for architecture.

## Project

Marketing website for **Hareha** and its products (**Mali Daftari**, **Mali Akili**) — a Tanzanian business-management/AI platform. It is a single Flutter app that targets the **web** primarily (mobile/desktop embedders are present but unused). The pubspec name is `mali_daftari_website`; the app class is `HarehaWebsite`.

The Flutter project lives in the `hareha/` subdirectory, not the repo root. Run all commands from `hareha/`.

## Commands

```bash
cd hareha

flutter pub get                 # install deps (run after pulling pubspec changes)
flutter run -d chrome           # local dev server (web)
flutter build web               # production build -> build/web
flutter analyze                 # static analysis / lint (flutter_lints)
flutter test                    # run all tests
flutter test test/widget_test.dart -p '<name>'   # single test by name
```

There is no separate format/lint step beyond `flutter analyze`; use `dart format .` for formatting.

## Architecture

Feature-first layout under `lib/`:

- `lib/core/` — app-wide infrastructure: `router/` (GoRouter config), `theme/`, `constant/` (colors, sizes, text styles, **all UI copy**), `localization/`, `utils/`.
- `lib/features/<feature>/presentation/` — one folder per page (`home`, `about`, `contact`, `mali_akili`, `malidaftari`). Pages compose section widgets kept in a `widgets/` (or `presentation/`) subfolder.
- `lib/shared/widgets/` — cross-feature widgets (app bar, footer, language switcher, responsive container, fade-in animation).
- `lib/resources/images/` — image assets (declared in `pubspec.yaml`).

Note the `malidaftari` feature is laid out slightly differently: the page is `lib/features/malidaftari/mali_daftari_page.dart` and its section widgets live in `lib/features/malidaftari/presentation/` (`md_*.dart`). Other features keep the page inside `presentation/`.

### Routing
`lib/core/router/app_router.dart` defines all routes as static path constants on `AppRouter` with a single `GoRouter`. Every route uses a `CustomTransitionPage` with a fade transition. Add new pages here. Unknown routes render a "Page not found" scaffold.

### Localization (custom, not flutter_localizations)
Despite `generate: true` in pubspec, there are **no .arb files**. Localization is hand-rolled in `lib/core/localization/l10n_provider.dart`:
- Strings live as nested `Map<String, Map<String, String>>` (`{ key: { 'en': ..., 'sw': ... } }`) in `lib/core/constant/app_strings.dart`.
- Current language is a Riverpod `StateProvider<String>` (`languageProvider`), **defaulting to Swahili (`'sw'`)**.
- Access via the `WidgetRef` extension: `ref.t(AppStrings.home, 'heroTitle')` (reactive `watch`) or `ref.translate(...)` (one-shot `read`). Missing keys fall back to `en`, then the key itself.
- When adding user-facing text, add both `en` and `sw` entries to the relevant map in `app_strings.dart` — do not hardcode strings in widgets.

### State management
Riverpod. App is wrapped in `ProviderScope` (`main.dart`). Use `ConsumerWidget`/`ConsumerStatefulWidget` when you need `ref` (e.g. for localization or the language switcher).

### Theming & responsiveness
- App is **dark-theme-only** (`AppTheme.darkTheme`, `themeMode: ThemeMode.dark`) and disables text scaling via a `MediaQuery` override in `main.dart`. Colors/sizes/text styles come from `lib/core/constant/`.
- Responsiveness goes through `lib/core/utils/responsive.dart`: use `context.responsive` for `isMobile`/`isTablet`/`isDesktop`, breakpoint-aware padding, `gridColumns()`, and the `value({mobile, tablet, desktop})` helper. Breakpoints are defined in `app_sizes.dart`.

### Web performance conventions
- Use `OptimizedImage` (`lib/core/utils/image_optimizer.dart`) instead of raw `Image.asset` — it sets `cacheWidth/cacheHeight` and tuned filter quality.
- `CustomScrollBehavior` (`lib/core/utils/scroll_behavior.dart`) is wired into `MaterialApp.router` for web scrolling.
- Scroll-triggered animations use `visibility_detector` (see `shared/widgets/animated_fade_in.dart`).
- External links / launching use `url_launcher`.
