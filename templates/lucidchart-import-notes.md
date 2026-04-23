# Lucidchart Import Notes

## Inputs in this repo

- Mermaid source files in `diagrams/mermaid`
- Draw.io files in `diagrams/drawio`
- PlantUML sources in `diagrams/plantuml`

## Recommended workflow

1. Import `.drawio` diagrams directly if your Lucidchart plan supports Draw.io imports.
2. If direct import is not available, open `.drawio` in diagrams.net and export as SVG, then import SVG into Lucidchart.
3. Use Mermaid files as version-controlled source and keep Lucidchart files as presentation artifacts.
4. Keep one Lucidchart page per architecture view: 7-tier, SOC, NOC, data flows.

## Styling convention

- Use a consistent color family per tier.
- Keep flow direction top-to-bottom for tier diagrams.
- Add version/date block in bottom-right corner.
- Include a legend for abbreviations (SOC/NOC/XDR/ETL).
