# Hareha Website — CLAUDE.md

## Project Overview

This repo contains the official Flutter web application for **Hareha** and its products:
- **Mali Daftari** — Business management platform
- **Mali Akili** — AI-powered companion product

The Flutter project lives in `hareha/` (package name: `mali_daftari_website`).

## Tech Stack

| Concern | Library |
|---|---|
| Framework | Flutter (web target) |
| Routing | `go_router ^14.6.2` |
| State management | `flutter_riverpod ^2.6.1` |
| Fonts | `google_fonts ^6.2.1` |
| Scroll animations | `visibility_detector ^0.4.0+2` |
| External links | `url_launcher ^6.3.1` |

## Project Structure

```
hareha/
  lib/
    main.dart
    core/
      constant/       # AppColors, AppSizes, AppStrings, AppTextStyles
      router/         # AppRouter (go_router config)
      theme/          # AppTheme (dark-only)
      localization/
      utils/
    features/
      home/           # Landing / hero page
      about/          # About Hareha
      mali_akili/     # Mali Akili product page
      malidaftari/    # Mali Daftari product page
      contact/        # Contact page
    resources/
      images/         # Static assets
    shared/           # Shared widgets
```

## Routes

| Path | Page |
|---|---|
| `/` | HomePage |
| `/about` | AboutPage |
| `/mali-daftari` | MaliDaftariPage |
| `/mali-akili` | MaliAkiliPage |
| `/contact` | ContactPage |

All route transitions use `FadeTransition`.

## Design System

- **Theme**: Dark only (`AppTheme.darkTheme`)
- **Background**: `#0A0E1A` (dark navy) → `#0F1729` (dark blue)
- **Primary accent**: Cyan `#06B6D4`
- **Secondary accent**: Purple `#8B5CF6`
- **Font**: Google Fonts (see `AppTheme`)
- **Color constants**: `lib/core/constant/app_colors.dart`
- **Size constants**: `lib/core/constant/app_sizes.dart`
- **Text style constants**: `lib/core/constant/app_text_styles.dart`

## Common Commands

```bash
# Run web (Chrome)
cd hareha && flutter run -d chrome

# Build web
cd hareha && flutter build web --release

# Get dependencies
cd hareha && flutter pub get

# Analyze
cd hareha && flutter analyze
```

## Conventions

- Feature-based folder structure — each feature owns its own `presentation/` layer
- Widgets extracted into `presentation/widgets/` sub-folders inside each feature
- All colors, sizes, and strings come from `core/constant/` — no magic values inline
- No light theme; always use `AppTheme.darkTheme`
- Animations triggered on scroll via `VisibilityDetector`
