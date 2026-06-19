# Hareha Website

Marketing website for **Hareha** and its products (**Mali Daftari**, **Mali Akili**) — a
Tanzanian business-management / AI platform. It is a single Flutter app targeting the **web**,
served at **[hareha.com](https://hareha.com)**.

The Flutter project lives in the [`hareha/`](./hareha) subdirectory, not the repo root.

## Project structure

```
Hareha-website/
├── .github/workflows/deploy.yml   # CI/CD: build + deploy to GitHub Pages
└── hareha/                        # Flutter app (run all flutter commands here)
    ├── lib/                       # source (feature-first layout)
    ├── web/                       # web entrypoint + CNAME (custom domain)
    └── pubspec.yaml
```

## Local development

```bash
cd hareha

flutter pub get          # install deps (run after pulling pubspec changes)
flutter run -d chrome    # local dev server
flutter analyze          # static analysis / lint
flutter test             # run tests
flutter build web        # production build -> build/web
```

## Branching & deployment

We use two long-lived branches:

| Branch        | Purpose                                                              |
| ------------- | ------------------------------------------------------------------- |
| `development` | Day-to-day work. Commit and push freely here. **Does not deploy.**  |
| `main`        | Production. **Every push/merge here auto-deploys to hareha.com.**   |

### Workflow

1. **Work on `development`.**
   ```bash
   git checkout development
   # ...make changes...
   git add -A && git commit -m "..." && git push
   ```
2. **Ship to production** by merging `development` into `main` (via a Pull Request on GitHub,
   or locally):
   ```bash
   git checkout main
   git merge development
   git push        # <-- this triggers the deploy
   ```
3. The **"Manual Flutter Web Deployment"** GitHub Actions workflow runs automatically on the
   push to `main`: it builds `hareha/` with `flutter build web --release` and publishes
   `build/web` to GitHub Pages. The live site updates in a few minutes.

You can also trigger a deploy by hand: **Actions → Manual Flutter Web Deployment → Run workflow**
(the workflow keeps a `workflow_dispatch` trigger for this).

### Hosting details

- **Host:** GitHub Pages (Settings → Pages → Source = *GitHub Actions*).
- **Custom domain:** `hareha.com`, set via [`hareha/web/CNAME`](./hareha/web/CNAME). Because the
  site serves from the domain root, the build uses the default `--base-href "/"` (no override).
  Flutter copies `web/CNAME` into the build output on every run, so the domain persists across
  deploys.

## Notes

- The app is **web-first**; mobile/desktop embedders exist but are unused.
- Architecture, theming, localization, and conventions are documented in the codebase. See
  `hareha/lib/core/` for routing, theme, constants (all UI copy), and localization.
