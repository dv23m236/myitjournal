# GitHub Pages

## Zielsetzung & Anforderungen

Nachdem das IT-Journal lokal aufgesetzt und auf GitHub versioniert wurde, bestand das Ziel dieses Auftrags darin, die Dokumentation weltweit als statische Website bereitzustellen.

Das Journal soll dadurch über einen einfachen Web-Link erreichbar sein, sodass Ausbilder direkt auf die gerenderten Inhalte zugreifen können.

Folgende Anforderungen wurden umgesetzt:

- Analyse des Video-Tutorials  
  *"How to Use GitHub Pages in 2026?"*
- Generierung der statischen HTML-Dateien aus den Markdown-Inhalten mittels Zensical
- Aktivierung und Konfiguration von GitHub Pages
- Veröffentlichung der gerenderten Website
- Dokumentation der finalen Live-URL

---

## Vorbereitung & Build-Prozess

Zensical arbeitet als statischer Website-Generator.

Das bedeutet, dass die geschriebenen Markdown-Dateien vor der Veröffentlichung in HTML-, CSS- und JavaScript-Dateien umgewandelt werden müssen.

```bash
conda activate itjournal

zensical build
```

!!! info

    Beim Build-Prozess erstellt Zensical automatisch die vollständige
    statische Website-Struktur.

    Dazu gehören unter anderem:

    - HTML-Dateien
    - CSS-Dateien
    - JavaScript-Dateien
    - Navigationsstrukturen
    - Suchindexe und Metadaten

---

## Deployment auf GitHub Pages

Die Veröffentlichung der Seite erfolgte gemäss den offiziellen Zensical-Publishing-Instruktionen über GitHub Pages.

### Repository-Einstellungen öffnen

Auf GitHub wurde das Repository `myitjournal` geöffnet und anschliessend in den Reiter **Settings** gewechselt.

---

### Pages-Menü aufrufen

In der linken Navigationsleiste wurde der Menüpunkt **Pages** ausgewählt.

---

### Build & Deployment konfigurieren

Unter **Source** wurde die Option:

- `Deploy from a branch`

ausgewählt.

Anschliessend wurden folgende Einstellungen vorgenommen:

| Einstellung | Wert |
|---|---|
| Branch | `main` |
| Veröffentlichungsordner | `/docs` oder Build-Ordner |

!!! Hinweis

    Der genaue Veröffentlichungsordner hängt von der Konfiguration
    des jeweiligen Zensical-Projekts ab.

    Häufig verwendete Ordner sind:

    - `docs/`
    - `site/`
    - `public/`

---


### Deployment speichern

Nach dem Klick auf **Save** startet GitHub automatisch eine Deployment-Pipeline im Hintergrund.

Diese Pipeline wird über **GitHub Actions** ausgeführt und veröffentlicht die Website automatisch auf den GitHub-Servern.

---

## Validierung & Live-URL

Nachdem die GitHub-Actions-Pipeline erfolgreich durchgelaufen ist
(erkennbar am grünen Haken im Repository),
wurde die Website offiziell veröffentlicht.

### Wo ist die Seite veröffentlicht?

Die Website wird auf den globalen Servern von GitHub Pages gehostet.

Die URL-Struktur von GitHub Pages folgt standardmässig folgendem Muster:

```text
https://dv23m236.github.io/myitjournal/
```

---

## Ergebnis / Validierung

Die Veröffentlichung der Website war erfolgreich.

Folgende Komponenten funktionieren nun vollständig:

- Automatische HTML-Generierung über Zensical
- Hosting über GitHub Pages
- Öffentliche Erreichbarkeit über eine Live-URL
- Automatische Deployment-Pipeline über GitHub Actions
- Zentrale Online-Dokumentation des IT-Journals

Damit ist das IT-Journal nun weltweit über den Browser erreichbar.

---

## Spickzettel (GitHub Pages & Deployment Cheat Sheet)

| Befehl / Bereich | Beschreibung |
|---|---|
| `zensical build` | Erstellt die statische Website |
| `git add .` | Fügt neue Änderungen zum Staging hinzu |
| `git commit -m "Nachricht"` | Erstellt einen neuen Commit |
| `git push` | Lädt Änderungen zu GitHub hoch |
| `zensical serve` | Startet die lokale Vorschau |
| GitHub → Settings → Pages | Öffnet die GitHub-Pages-Konfiguration |
| `Deploy from a branch` | Aktiviert Deployment über einen Branch |
| GitHub Actions | Führt automatisierte Deployments aus |

---

## Fazit

Mit GitHub Pages wurde das IT-Journal erfolgreich öffentlich bereitgestellt.

Durch die Kombination aus:

- Git
- GitHub
- GitHub Pages
- Zensical
- automatisierten Deployments

steht nun eine moderne und professionelle Dokumentationsplattform zur Verfügung.

Änderungen am Projekt können zukünftig lokal entwickelt,
über Git versioniert und automatisch online veröffentlicht werden.