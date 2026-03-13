# Techmore

Static Jekyll site for the main F.I.R.E. blog, energy-monitoring project pages, and supporting reference content.

## Stack

- Jekyll
- Tailwind CSS via CDN
- Vanilla inline JavaScript
- Google Fonts: Inter and Instrument Serif

## Local Development

Install Jekyll if it is not already available:

```bash
gem install jekyll
```

Run the site locally:

```bash
jekyll serve --livereload
```

Build static output:

```bash
jekyll build
```

Local development runs at `http://localhost:4000`.

## Important Notes

- Do not run `refresh.sh` locally. It is a deployment script intended for the server and can destroy local files.
- This repo does not use a `Gemfile`, `package.json`, CI, or a CSS/JS build pipeline.
- Pages should use only:

```yaml
---
layout: default
title: Page Title - Techmore
---
```

## Project Structure

- `_includes/head.html`: shared `<head>` content, Tailwind config, fonts
- `_includes/nav.html`: shared navigation
- `_includes/footer.html`: shared footer
- `_layouts/default.html`: default page shell
- `_config.yml`: Jekyll config
- `index.html`: home page / F.I.R.E. feed
- `pages/energy-monitoring.html`: energy hub
- `pages/phase1_erv_guide.html`: ERV guide
- `pages/phase2_heatpump_guide.html`: heat pump guide
- `pages/energy-monitoring/solar.html`: solar offset calculator
- `pages/books.html`: books landing page

## Conventions

- Tailwind utility classes should be grouped by layout, then background/border, then typography, then interaction.
- Keep CSS inline in page-level `<style>` blocks only where the repo already expects it.
- Keep JavaScript inline in `<script>` tags; use vanilla JS and prefer `var` for new additions to match existing style.
- Prefer Tailwind `olive-*` classes or `oklch()` values instead of hex colors.
