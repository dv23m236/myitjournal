# Git & Erstes projekt

## Zielsetzung & Anforderungen

Das Ziel dieses Auftrags war es, ein Projekt auf Github zu veröffentlichen

Dabei sollte ein neues Projektverzeichnis von Grund auf neu sturkturiert, versioniert und als Basis für das persönliche IT-Journal initialisiert werden.

Folgende Anforderungen wurden umgesetzt:

- Erstellung eines neuen, frei benannten Projektverzeichnisses für das Journal
- Initialisierung eines lokalen Git-Repositories in diesem Verzeichnis
- Erstellung eines neuen, leeren Repositories auf GitHub
- Verknüpfung des lokalen Repositories mit dem GitHub-Remote-Repository (`origin`)
- Initialisierung eines neuen Zensical-Projekts über den Getting-Started-Guide
- Durchführung des ersten Commits (*Initial Commit*) und Push der Daten zu GitHub

---

## Lokales Verzeichnis & Git-Initialisierung

Zuerst wurde über das Terminal ein sturkturierter Ordner im lokalen Benutzverzeichnis angelegt und als Git-Repository deklariert.

```bash
mkdir -p ~/myitjournal

cd ~/myitjournal

git init
```

---

## Remote-Verknüpfung mit GitHub
Im nächsten Schritt wurde im Browser auf GitHub ein neues, leeres Repository names `itjournal` erstellt.

!!! Hinweis

    Das Repository wurde bewusst ohne automatische Dateien wie
    `README.md` oder `.gitignore` erstellt,
    da diese lokal durch Zensical generiert werden.

Um die lokale Code-Basis mit der Cloud zu verbinden, wurde die Repository-URL als Remote-Ziel hinzugefügt.

```bash
git remote add origin git@github.com:dv23m236/myitjournal.git
```

---

## Zensical Projekt-Initialisierung

Da die Conda-Umgebung `itjournal` aus dem vorherigen Auftrag bereits alle Abhänigkeiten bereitgestellt, konnte das Zensical-Projekt direkt im frisch verknüpften Ordner generiert werden.

```bash
conda activate itjournal

zensical init
```

!!! info

    Zensical erstellt daraufhin automatisch die notwendige Grundstruktur,
    einschliesslich der Konfigurationsdatei `zensical.toml`
    sowie Beispiel-Verzeichnissen für Dokumentationen und Inhalte.

---

## Der erste Commit

Zum Abschluss wurden alle autoamtisch generierten Systemdateien und Ordnerstrukturen gesammelt, dem Git-Index hinzugefügt und anschliessend auf GitHub hochgeladen

```bash
git add .

git commit -m "feat: initial Zensical project setup and configuration"

git push -u origin main
```

---

## Ergebnis & Validierung

Die lokale Entwicklungsumgebung wurde erfolgreich mit GitHub vebrunden.

Folgende Komponenten funktionieren nun vollständig:

- Lokales Git-Repository
- Remote-Verbindung zu GitHub
- Zensical-Projektstruktur
- Versionskontrolle über Git
- Erstes Deployment der Projektdateien

Das Projekt bildet damit die Grundlage für das weitere IT-Journal.

---

## Spickzettel (Git & Zensical Cheat Sheet)

| Befehl | Beschreibung |
|---|---|
| `git init` | Initialisiert ein neues Git-Repository |
| `git status` | Zeigt den aktuellen Status des Repositories |
| `git add .` | Fügt alle Änderungen zum Staging-Bereich hinzu |
| `git commit -m "Nachricht"` | Erstellt einen Commit mit Nachricht |
| `git push` | Lädt Änderungen zu GitHub hoch |
| `git pull` | Holt Änderungen vom Remote-Repository |
| `git branch -M main` | Benennt den Haupt-Branch in `main` um |
| `git remote -v` | Zeigt konfigurierte Remote-Repositories |
| `zensical init` | Erstellt ein neues Zensical-Projekt |
| `zensical serve` | Startet die lokale Vorschau |
| `zensical build` | Erstellt die statische Website |

--- 

## Fazit

Mit diesem Auftrag wurde die technische Grundlage für ein professionelles IT-Journal geschaffen.

Durch die Kombination aus:

- Git
- GitHub
- Conda
- Python
- Zensical

steht nun eine moderne Entwicklungs- und Dokumentationsumgebung zur Verfügung.

Die Projektstruktur ist versioniert, reproduzierbar und kann zukünftig problemlos erweitert oder veröffentlicht werden. 