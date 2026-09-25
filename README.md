# Techmore

Techmore is a personal technical notebook and project hub for F.I.R.E., home energy systems, solar modeling, and practical infrastructure notes.

**Live site:** [techmore.github.io](https://techmore.github.io)

## Start Here

- [Energy monitoring hub](https://techmore.github.io/pages/energy-monitoring/): project context, measured loads, and system decisions
- [Solar option summary](https://techmore.github.io/pages/energy-monitoring/solar-options/): side-by-side build choices and modeled tradeoffs
- [Solar offset calculator](https://techmore.github.io/pages/energy-monitoring/solar/): quick production and payback estimates
- [Will Prowse 2026 model](https://techmore.github.io/pages/energy-monitoring/will-prowse-2026/): battery, inverter, panel, runtime, and rescue-charging model
- [Pecron backup plan](https://techmore.github.io/pages/energy-monitoring/pecron/): a separate portable-storage and critical-load path
- [Repo directory](https://techmore.github.io/pages/repos/): other public Techmore projects

## What Is In This Repo

- F.I.R.E. notes and reading paths
- Energy-monitoring data and home-system guides
- Solar options with costs, production, runtime, circuit coverage, and charging paths
- ERV, heat-pump, networking, UniFi, EV, and general infrastructure notes

## Stack

- Jekyll with the system Ruby gem
- Tailwind CSS via CDN
- Vanilla inline JavaScript
- Google Fonts: Inter and Instrument Serif
- No `Gemfile`, `package.json`, or frontend build pipeline

## Local Authoring

Install Jekyll if it is not already available:

```bash
gem install jekyll
```

Run the site locally:

```bash
jekyll serve --livereload
```

Local development runs at `http://localhost:4000`.

## Important Notes

- Do not run `refresh.sh` locally. It is a server-side deployment script that can destroy local files.
- Generated Jekyll output belongs in `_site/` and is ignored by Git.
- Pages use only this front matter shape:

```yaml
---
layout: default
title: Page Title - Techmore
---
```

## Project Structure

- `_includes/head.html`: shared `<head>`, Tailwind config, and fonts
- `_includes/nav.html`: shared navigation
- `_includes/footer.html`: shared footer
- `_layouts/default.html`: default page shell
- `_config.yml`: Jekyll configuration
- `index.html`: home page and F.I.R.E. feed
- `pages/energy-monitoring.html`: energy hub
- `pages/energy-monitoring/`: solar, battery, and energy-system detail pages
- `pages/phase1_erv_guide.html`: ERV guide
- `pages/phase2_heatpump_guide.html`: heat-pump guide
- `pages/books.html`: books landing page

## Conventions

- Group Tailwind classes by layout, background/border, typography, then interaction.
- Keep page-specific CSS in inline `<style>` blocks where the repo already expects it.
- Keep JavaScript inline and use vanilla JS; prefer `var` for new additions.
- Prefer Tailwind `olive-*` classes or `oklch()` values instead of hex colors.
