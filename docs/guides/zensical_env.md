# Zensical Environment

## Zielsetzung & Anforderungen

Das Ziel dieses Auftrags war es, eine dedizierte Arbeitsumgebung für das IT-Journal aufzusetzen.

Darin enthalten sein sollten:

- Die Erstellung einer isolierten vorutellen Umgebung
- Die Installation einer aktuellen Python-Version
- Die Einrichtung des Dokumentations-Frameworks Zensical

Folgende Kriterien mssten erfüllt werden:

- Erstellung und Aktivierung einer Conda-Umgebung mit dem Namen `itjournal`
- Installation einer aktuellen Python-Version inklusive des Paketmanagers `pip`
- Installation von Zensical über `pip`
- Erfolgreicher Funktionstest des CLI-Tools mittels des `--help`-Flags

---

## Einrichtung der Umgebung & Python-Installation

Da Conda im vorherigen Auftrag bereits erfolgreich über Homebrew installiert wurde, konnte die Umgebung direkt über das Terminal (iTerm2) angelegt werden.

```bash
conda create --name itjournal python=3.14 -y

conda activate itjournal
```

!!! Hinweis

    Mit der Installation von Python wird der Python-Paketmanager `pip`
    automatisch mitgeliefert.

---

## Installation von Zensical

Nachdem die Umgebung `itjournal` aktiviert wurde (erkennbar am Präfix in der Terminal-Eingabezeile), wurde das Zensical über `pip` installiert

```bash
# Installieren des Zensical-Pakets aus dem Python Package Index (PyPI)
pip install zensical
```

---

## Funktionstest & Validierung

Um sicherzustellen, dass die Isntallation fehlerfrei verlaufen ist und die Sytempfade korrekt gesetzt wurden, wurde die CLI von Zensical überprüft.

```bash
# Aufrufen der Zensical-Hilfe-Funktion
zensical --help
```

### Ergebnis / Validierung

Der befehl wurde erfolgreich ausgeführt
Das Terminal gab die offizielle Hilfemeldung von Zensical aus, welche alle verfügbaren befehle wie:

- `init`
- `build`
- `serve`

sowie weitere Optionen auflistet.

Damit ist die Umgebung vollsätndig einsatzbereit.

---

## Spickzettel

| Befehl | Beschreibung |
|---|---|
| `conda env list` | Zeigt alle vorhandenen Conda-Umgebungen |
| `conda activate itjournal` | Aktiviert die Arbeitsumgebung |
| `conda deactivate` | Verlässt die aktuelle Umgebung |
| `pip list` | Listet installierte Python-Pakete auf |
| `pip install <paket>` | Installiert ein Python-Paket |
| `zensical --help` | Zeigt alle verfügbaren Zensical-Befehle |
| `zensical init` | Erstellt ein neues Zensical-Projekt |
| `zensical serve` | Startet die lokale Entwicklungsumgebung |
| `zensical build` | Erstellt die statische Dokumentationsseite |

---

## Fazit

Mit der Einrichtung der isolierten Conda-Umgebung `itjournal` steht nun eine stabile und reproduzierbare Entwicklungsumgebung für das IT-Journal zur Verfügung.

Durch die Kombination aus:

- Conda
- Python
- pip
- Zensical

können zukünftige Dokuemntationen und Projekte sauber getrennt, verwaltet und erweitert werden.