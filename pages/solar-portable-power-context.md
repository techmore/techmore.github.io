# Solar / Portable Power Page Context

Generated from an AI working session on May 21, 2026.

## Files

- `pages/eg4-solar-no-backfeed-plan.html`
  - Standalone mobile-first HTML page for the barn EG4 solar plan.
  - Uses the Emporia Energy Monitor visual theme: olive/stone palette, Instrument Serif + Inter, compact cards, sticky pill nav.
  - Main goal: daytime solar offset, automatic grid fallback, zero/no intentional export, minimal starting battery.

- `pages/delta-pro-3-issues.html`
  - Standalone mobile-first HTML tab/page for portable power station comparison.
  - Covers EcoFlow DELTA Pro 3 known issue areas and explains why it is oversized for the RV/camping load.
  - Compares Anker C1000/C1000 Gen 2, Pecron F1000LFP/E1000LFP, Bluetti AC180, Jackery Explorer 1000 v2, and EcoFlow Delta 2/3 Plus.

## Solar Plan Data

Emporia export source originally extracted at:

`/Users/techmore/projects/AB-AV1-GUI/1.Working_Folder/emporia-export/`

Key measured values:

- Complete period: January 14, 2026 through May 20, 2026.
- Total measured energy: 7,681.8 kWh over 127 complete days.
- Average daily load: 60.5 kWh/day.
- Median daily load: 55.7 kWh/day.
- Peak daily load: 178.7 kWh on February 8, 2026.
- Peak 15-minute demand: 11.9 kW.
- Electricity rate used: $0.13760/kWh.

Circuit usage as percent of measured mains:

- Heat pump: 44.0%.
- Water heater: 18.1%.
- Master bedroom: 10.3%.
- Kitchen outlets: 4.1%.
- Circuit 14: 3.2%.
- Radon / other: 3.0%.
- Untracked CT gap: 10.2%.

Phase 1 recommendation:

- EG4 FlexBOSS21 + GridBOSS bundle.
- One EG4 314Ah 16 kWh wall battery.
- 9-12 kW DC starter PV.
- Grid remains fallback; battery is only a buffer, not full off-grid sizing.

Water heater section:

- Existing water heater annualized load: about 4,006 kWh/year.
- Existing annual cost at $0.13760/kWh: about $551/year.
- 80-gallon heat pump water heater expected annual cost: about $169-$275/year.
- Estimated annual savings: about $276-$383/year.

## Portable Power Context

RV/camping load assumptions:

- 12 V compressor fridge: typical 40-150 W running, about 0.5-2 kWh/day average.
- Fan: 10-50 W.
- LED lights: 5-20 W total.
- Occasional HP Envy inkjet printer: about 30-50 W while printing.
- Typical peaks under 300 W.
- Daily use estimate: 1-3 kWh.
- Direct 12 V outputs preferred for fridge/fan efficiency.

Current portable recommendation:

- Anker C1000 / C1000 Gen 2 if support, app polish, and shipping certainty matter most.
- Pecron F1000LFP if the $329 sale holds and shipping timing is acceptable.
- Pecron E1000LFP if Pecron expansion capability matters.
- Skip EcoFlow DELTA Pro 3 for this use because it is too expensive/heavy/oversized.

## Integration Notes

These files are currently standalone HTML pages. They can be integrated into the site by:

1. Adding links to them from the site navigation or `pages/index.html`.
2. Optionally wrapping them in the existing Jekyll layout later.
3. Preserving the mobile-first card flow and section order; the current pages are intentionally structured for vertical phone reading.

Suggested public paths after GitHub Pages deploy:

- `/pages/eg4-solar-no-backfeed-plan.html`
- `/pages/delta-pro-3-issues.html`
