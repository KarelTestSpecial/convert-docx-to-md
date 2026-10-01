# convert-docx-to-md

Bulk-converteert alle `.docx`-bestanden in een map naar Markdown met
[pandoc](https://pandoc.org). De uitvoer belandt in een `md_output/`-map.

## Vereisten

- `pandoc` op je PATH (`sudo apt install pandoc` op Debian/Crostini)
- Bash

## Gebruik

```bash
# map als argument
./convert.sh /pad/naar/mijn/documenten

# of vanuit de map met de .docx-bestanden
./convert.sh
```

Elk `rapport.docx` wordt dan `md_output/rapport.md`. Het script meldt hoeveel
bestanden zijn geconverteerd.

## Opmerking

De conversie gebruikt pandoc's standaard docx-lezer. De meeste opmaak
(koppen, lijsten, tabellen) komt goed door; ingebedde objecten en
complexe paginalay-out worden door pandoc doorgaans vereenvoudigd.
