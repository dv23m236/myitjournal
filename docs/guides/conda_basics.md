# Python- & Wumgebungsverwaltung mit Conda

## Ausgangslage & Zielsetzung

Für die Entwicklung von Projekten (wie z. B. der späteren Installation von Zensical) wird eine saubere Struktur benötigt, um Python-Versionen und Projektabhängigkeiten voneinander zu trennen.  

Die globale Installation von Paketen direkt auf dem Mac soll vermieden werden, um Versionskonflikte zu verhindern.

## Ziel des Auftrags
Einruchtung von Miniconda sowie das Erlernen des gurndlegenden Workflows zur:

- Erstellung virtueller Umgebungen
- Aktivierung und Deaktivierung
- Installation spzeifischer Pyhton-Versionen
- Verwaltung und Entfernung von Paketen und Umgebungen

---

# Installation der Conda-Umgebung
Die Installation von Miniconda erfolgte zentral über den Paketmanager Homebrew.

---

## Installation

### Miniconda über Homebrew Cask installieren
```bash
brew install --cask miniconda
```

---

### Conda für die Zsh-Shell registieren und initialisieren
```bash
conda init zsh
```

!!! Hinweis

    Nach der Initialisierung muss das Terminal einmal neu gestartet oder mit folgendem Befehl neu geladen werden:

    ```bash
    source ~/.zshrc
    ```


---

## Workflow: Handhabung von Umgebungen

Um den Umgang mit isolierten Umgebungen zu testen, wurde der vollständige Lebenszyklus einer Testumgebung durchgefhürt:

1. Erstellen
2. Aktivieren
3. Deaktivieren
4. Löschen

---

### Testumgebung erstellen

Es wird eine isolierte Umgebung mit dem Namen `test_env` generiert:

```bash
conda create --name test_env
```

---

### Umgebung aktivieren

Um die erstellte Umgebung zu wechseln, wird der `activate` Befehl genutzt.

```bash
conda activate test_env
```

---

### Umgebung deaktivieren

Nach Abschluss der Arbeiten wird die Umgebung wieder verlassen.

Das System kehrt automatisch in die Standard-Umgebung (`base`) zurück.

```bash
conda deactivate
```

---

### Umgebung löschen

Wird eine Umgebung nicht mehr benötigt, kann sie mitsamt aller installierten Abhängigkeiten restlos vom System entfernt werden.

```bash
conda env remove --name test_env
```

---

## Fortgeschrittene Kofniguration: Spezifische Python-Versionen & Pakete

### Erstellung mit expliziter Python-Version

Ein zentrales Feature von Conda ist es, ältere oder spezifische Python-Versionen für Projekte zu kapseln.
Hier wurde beispielhaft eine Umgebung names `my_test_env`mit Python 3.14 erstellt:

```bash
conda create --name my_test_env python=3.14
```

---

### Paketinstallation 
Nachdem eine spezifische Umgebung aktiviert wurde, lassen sich Pakete isoliert installieren, ohne andere Projekte oder das Basissystem zu beeinflussen.

Im Rahmen des Auftrages wurde das Data-Science-Paket `numpy`installiert.

```bash
# 1. Zielumgebung aktivieren
conda activate my_test_env

# 2. Paket über die Conda-Repositories installieren
conda install numpy
```

---

## Spickzettel (Conda Cheat Sheet)

| Befehl | Beschreibung |
|---|---|
| `conda env list` oder `conda info --envs` | Zeigt alle auf dem System existierenden Umgebungen an |
| `conda list` | Listet alle installierten Pakete innerhalb der aktuell aktiven Umgebung auf |
| `conda search <paketname>` | Sucht in den Online-Repositories nach verfügbaren Paketversionen |


## Fazit

Mit Conda lassen sich python-Projekte sauber voneineander isolieren.
Dadurch können unterschiedliche Python-Versionen und Paketstände parallel betreiben werden, ohne das Hauptsystem zu beeinflussen.
Diese Struktur bildet die Grundlage für reporoduzierbare Enwicklungsumgebungen und erleichtert spätere Projektinstallationen erhelblich