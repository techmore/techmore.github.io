# AGENTS.md — Techmore Jekyll Site

This file describes the repository structure, build commands, and code style
conventions for agentic coding agents working in this codebase.

---

## Stack

| Layer | Technology |
|-------|-----------|
| Static site generator | Jekyll (no Gemfile — system gem) |
| CSS framework | Tailwind CSS via CDN (`cdn.tailwindcss.com`) — no build step |
| Custom color scale | `olive` palette, OKLCH hue 110, steps 50–950 |
| Fonts | Inter (body/UI), Instrument Serif (display headings) |
| JavaScript | Vanilla only, inline `<script>` tags |
| Deployment | `refresh.sh` — Linux server only, do not run locally |

---

## Build & Serve Commands

```bash
# Install Jekyll if not present (no Gemfile exists)
gem install jekyll

# Serve locally with live reload — runs at http://localhost:4000
jekyll serve --livereload

# Build static output to ./_site/ without serving
jekyll build
```

There are **no tests, no lint tools, no CI, no package.json, no Makefile**.
Do not create any of these unless explicitly asked.

`refresh.sh` is a server-side deployment script that destroys local files.
Never run it in the working directory.

---

## File Structure

```
_includes/head.html       # <head>, Tailwind CDN, Google Fonts, Tailwind config
_includes/nav.html        # Sticky nav — olive-950 bg, hover dropdowns
_includes/footer.html     # Footer + </body></html>
_layouts/default.html     # Wraps: head → nav → {{ content }} → footer
_config.yml               # title, permalink: pretty, markdown: kramdown
index.html                # Main F.I.R.E. blog page
energy-monitoring.html    # HVAC project hub — project overview + guide cards
phase1_erv_guide.html     # Phase 1 ERV guide — Jekyll layout + inline CSS
phase2_heatpump_guide.html# Phase 2 heat pump guide — Jekyll layout + inline CSS
energy-monitoring/solar.html # Interactive solar payback calculator
books.html                # Main reading list / book notes
modern-western.html       # Modern Western reading pathway
```

Pages using `layout: default` get the site nav and footer automatically.
Guide pages (`phase1_erv_guide.html`, `phase2_heatpump_guide.html`) include a
`<style>` block immediately after front matter for complex custom components.

---

## Jekyll Front Matter

Every page must have exactly this structure — no additional keys:

```yaml
---
layout: default
title: Page Title - Techmore
---
```

- `layout:` is always `default`
- `title:` always ends with ` - Techmore`
- No `permalink`, `date`, `description`, `tags`, or other keys

`_config.yml` uses `permalink: pretty` so pages are served at `/page-name/`
(directory-style URLs). Nav links must match: `/energy-monitoring/`, `/energy-monitoring/solar/`, etc.

---

## HTML & Tailwind Conventions

**Tailwind utility class ordering** — functional groups, not alphabetical:
1. Layout/sizing: `max-w-*`, `mx-auto`, `grid`, `flex`, `gap-*`, `px-*`, `py-*`
2. Background/border: `bg-*`, `rounded-*`, `border*`, `shadow-*`, `overflow-*`
3. Typography: `text-*`, `font-*`, `tracking-*`, `leading-*`, `italic`, `uppercase`
4. State/interaction last: `hover:*`, `transition-*`

```html
<!-- correct order -->
<div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-12 bg-olive-50 rounded-2xl border border-olive-200 text-olive-900 hover:bg-olive-100 transition-colors">

<!-- responsive: always mobile-first, sm: then lg: -->
<main class="px-4 sm:px-6 lg:px-8">
```

**Inline `style=""` attributes** are only used inside `<svg>` elements (where
Tailwind can't reach SVG attributes) or for one-off values that would require a
new utility class. Never use inline styles on non-SVG elements in Tailwind pages.

**Page-level `<style>` blocks** are used only in guide pages with complex
repeated components (callouts, step numbers, code panels). Place the `<style>`
block immediately after the front matter `---` with no blank line. Never link
external `.css` files.

---

## Color System

**Three tiers — use the lowest complexity tier that works:**

**Tier 1 — Tailwind `olive-*` classes** (all standard pages):
```html
class="bg-olive-950 text-olive-50 border-olive-200 hover:bg-olive-800"
```
The olive palette (hue 110) is defined in `_includes/head.html`. Use these
classes for all layout, cards, nav, and prose.

**Tier 2 — Raw `oklch()` literals** (only inside SVG attributes and `<style>` body):
```html
fill="oklch(75% 0.040 110)"   <!-- SVG element fill -->
```
```css
.hero { background: oklch(16% 0.015 110); }
```
Reference values: hue 110 = olive, 145 = green, 60–75 = amber, 25 = red/danger,
240 = blue, 290 = purple. Lightness 16–22% = dark bg; 91–96% = light bg.

**Tier 3 — CSS custom properties** (only inside guide page `<style>` blocks):
```css
:root {
  --bg:      oklch(91% 0.012 106.5);
  --panel:   oklch(96% 0.015 110);
  --border:  oklch(85% 0.028 110);
  --accent:  oklch(35% 0.045 110);    /* dark olive — primary text-level accent */
  --green:   oklch(38% 0.090 145);
  --yellow:  oklch(52% 0.130 75);
  --red:     oklch(45% 0.160 25);
  --muted:   oklch(62% 0.055 110);
  --text:    oklch(22% 0.025 110);
  --subtext: oklch(50% 0.045 110);
  --mono:    'Inter', ui-monospace, monospace;
  --head:    'Instrument Serif', serif;
  --body:    'Inter', system-ui, sans-serif;
}
```
Variable names: single semantic words (`--text`, `--border`, `--accent`);
color+role suffix for pairs (`--amber-bg` / `--amber-bdr`). No `--color-*`
prefix, no camelCase.

---

## Typography

- **Display headings** (`<h1>` on page heroes): `font-display italic text-olive-950`
  — uses Instrument Serif italic via the `font-display` Tailwind family
- **Section headings** (`<h2>`, `<h3>`): `text-olive-950` with Instrument Serif
  (applied globally in `_includes/head.html` via `h1, h2, h3, h4 { font-family: ... }`)
- **Body text**: Inter, `text-olive-800` or `text-olive-700`
- **Monospace/labels**: `font-mono text-xs tracking-widest uppercase text-olive-500`
- **Inline code** (Tailwind pages): `<code class="bg-olive-100 px-1 rounded text-olive-800 font-mono text-xs">`

---

## Code Block Conventions (Guide Pages)

Code blocks use bare `<pre>` with span-based syntax highlighting — no external
highlight library:

```html
<pre class="green"><span class="c"># comment</span>
<span class="k">async def</span> my_func():
    value = <span class="v">42</span>
    return <span class="s">"result"</span></pre>
```

Span classes: `.c` = comments, `.k` = keywords, `.s` = strings, `.v` = values/numbers,
`.fn` = function names. `<pre>` modifier classes (`.green`, `.orange`, `.purple`)
change only the left border accent color. Inline `<code>` is a separate pill style.

---

## SVG Conventions

**Diagram SVGs** — inline, inside a dark container div, oklch colors in attributes:
```html
<div class="bg-olive-950 rounded-2xl p-6 md:p-8 overflow-x-auto">
  <svg viewBox="0 0 720 380" width="100%" style="display:block;max-width:720px;margin:0 auto;">
    <rect x="20" y="32" width="110" height="44" rx="4"
          fill="oklch(20% 0.018 110)" stroke="oklch(35% 0.030 110)" stroke-width="1.5"/>
    <text x="75" y="50" fill="oklch(85% 0.020 110)"
          font-family="monospace" font-size="9" text-anchor="middle">Label</text>
  </svg>
</div>
```

**Icon SVGs** — inline, Tailwind sizing, `currentColor` stroke:
```html
<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="..."/>
</svg>
```

No external SVG files. No `<title>` or `<desc>` tags needed.

---

## HTML Comment Style

**Section separators** in guide pages only — use Unicode box-drawing chars:
```html
<!-- ── SECTION NAME ── -->
```

**Standard component labels** everywhere else:
```html
<!-- Header -->
<!-- Navigation -->
<!-- Phase 1 guide card -->
```

---

## JavaScript

Vanilla JS only. No frameworks, no npm packages, no `.js` files. All scripts
are inline `<script>` tags at the bottom of the page body, before `</main>`:

```html
<script>
    function printGuide(path) {
        var w = window.open(path);
        w.addEventListener('load', function() { w.print(); });
    }
</script>
```

- Use `var` (not `const`/`let`) to match existing code style
- `onclick="..."` attribute is acceptable for simple one-liners on buttons
- `addEventListener` for anything more complex
- No async/await, no `fetch()`, no ES modules

---

## Do Not

- Create separate `.css` or `.js` files — everything is inline or CDN
- Add a Gemfile, package.json, or any build tooling unless explicitly asked
- Use `const`/`let` if adding JS — use `var` to match existing style
- Add front matter keys beyond `layout` and `title`
- Run `refresh.sh` locally — it is a destructive server deployment script
- Use hex colors (`#ffffff`) — use `oklch()` or Tailwind `olive-*` classes
- Use Google Fonts families other than Inter and Instrument Serif in new pages
