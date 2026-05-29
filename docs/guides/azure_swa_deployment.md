# Deployment einer GitHub-Webseite mit Azure Static Web Apps

## Ausgangslage & Zielsetzung

Die persönliche Webseite wurde ursprünglich über GitHub Pages bereitgestellt. Ziel dieses Auftrags war es, die bestehende Webseite mithilfe von **Azure Static Web Apps (SWA)** zu spiegeln und automatisiert bereitzustellen.

Zusätzlich sollte die Standard-Azure-URL durch eine benutzerfreundlichere Domain ersetzt werden. Dafür wurde eine eigene Domain über **is-a.dev** eingerichtet.

Da die Webseite mit dem Static Site Generator **Zensical** erstellt wird, musste der Build-Prozess über GitHub Actions erweitert werden.

---

## Ziel des Auftrags

- Spiegelung der GitHub-Webseite auf Azure Static Web Apps
- Automatisierter CI/CD-Workflow über GitHub Actions
- Build der Webseite mit Python und Zensical
- Deployment der generierten Dateien auf Azure
- Unterstützung von Pull Requests (Preview Deployments)
- Nutzung einer eigenen Domain (is-a.dev) statt Azure-Standard-URL

---

## Einrichtung der Azure Static Web App

Im Azure Portal wurde eine Static Web App erstellt und direkt mit dem GitHub Repository verbunden. Azure generierte automatisch einen initialen GitHub Actions Workflow, welcher anschliessend manuell erweitert wurde.

---

## Workflow-Datei

```yaml
name: Azure Static Web Apps CI/CD

on:
  push:
    branches:
      - main

  pull_request:
    types: [opened, synchronize, reopened, closed]
    branches:
      - main

jobs:
  build_and_deploy_job:
    if: github.event_name == 'push' || (github.event_name == 'pull_request' && github.event.action != 'closed')
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          submodules: true

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Install and Build Zensical
        run: |
          pip install zensical
          zensical build

      - name: Build And Deploy
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "site"
          api_location: ""
          output_location: ""
          skip_app_build: true

  close_pull_request_job:
    if: github.event_name == 'pull_request' && github.event.action == 'closed'
    runs-on: ubuntu-latest

    steps:
      - name: Close Pull Request
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          action: "close"
```

---

## Erklärung wichtiger Anpassungen

**Pull Request Support:** Ermöglicht automatische Preview-Deployments für Änderungen vor dem Merge. Jeder Pull Request erstellt eine eigene temporäre Vorschau der Webseite.

**`skip_app_build`:** Verhindert doppelte Build-Prozesse, da die Webseite bereits durch Zensical generiert wird.

**Close PR Job:** Sorgt dafür, dass Preview-Umgebungen nach dem Schliessen eines Pull Requests automatisch entfernt werden.

---

## Zusätzliche Konfigurationsschritte

### Azure Custom Domain Setup

Damit die Webseite nicht über die Azure-Standarddomain läuft, wurde eine eigene Domain eingebunden.

**Schritte im Azure Portal:**

1. Static Web App öffnen
2. Menüpunkt **Custom domains** auswählen
3. Domain hinzufügen (z. B. `vorname-itjournal.is-a.dev`)
4. DNS-Einträge beim Domain-Anbieter setzen
5. Validierung durch Azure abwarten


> Danach ist die Webseite über die eigene Domain erreichbar.

!!! info

    Für die Einrichtung der Domain wurde folgende offizielle Anleitung verwendet:  
    [https://blog.wharrison.com.au/2024/07/is-a-dev/](https://blog.wharrison.com.au/2024/07/is-a-dev/)

!!! Hinweis

    Um eine Domain über is-a.dev zu erhalten, müssen bestimmte Bedingungen erfüllt sein. Der Prozess läuft über GitHub: Man forkt das is-a.dev Repository und erstellt einen Pull Request mit der gewünschten Domain-Konfiguration. Werden die Bedingungen nicht erfüllt, wird der Pull Request abgelehnt. Laut der offiziellen Webseite kann die Bearbeitung **24–48 Stunden oder länger** dauern, abhängig von der aktuellen Auslastung.

---

### GitHub Secrets (Deployment Token)

Damit GitHub Actions auf Azure zugreifen kann, ist ein Deployment Secret erforderlich.

**Einrichtung:**

1. GitHub Repository öffnen
2. **Settings → Secrets and variables → Actions**
3. Neues Secret erstellen:
   - **Name:** `AZURE_STATIC_WEB_APPS_API_TOKEN`
   - **Wert:** Den Deployment Token aus dem Azure Portal einfügen — dieser ist in der SWA unter **Overview → Manage deployment token** zu finden

!!! Wichtig

    Der Name des Secrets muss exakt mit dem Namen übereinstimmen, der im YAML-Workflow unter `azure_static_web_apps_api_token` angegeben ist. Stimmen die Namen nicht überein, schlägt das Deployment fehl.

---


## Spickzettel (Cheat Sheet)

### Azure Static Web App einrichten

| Schritt | Wo / Was |
|---|---|
| 1. SWA erstellen | Azure Portal → **Create a resource** → *Static Web App* |
| 2. Repository verbinden | Beim Erstellen: GitHub Account verknüpfen und Repo auswählen |
| 3. Workflow wird generiert | Azure erstellt automatisch eine `.github/workflows/` Datei im Repo |
| 4. Deployment Token holen | SWA → **Overview** → *Manage deployment token* |

### GitHub Actions Workflow

| Einstellung | Wert / Beschreibung |
|---|---|
| `app_location` | `"site"` — Ordner mit den generierten Dateien |
| `skip_app_build` | `true` — verhindert doppelten Build durch Azure |
| `api_location` | `""` — kein API-Backend vorhanden |
| `output_location` | `""` — kein separater Output-Ordner |
| Trigger | `push` auf `main` + `pull_request` Events |

### GitHub Secrets

| Schritt | Wo / Was |
|---|---|
| 1. Secret anlegen | Repo → **Settings** → *Secrets and variables* → *Actions* → *New repository secret* |
| 2. Name | `AZURE_STATIC_WEB_APPS_API_TOKEN` — muss exakt mit dem YAML übereinstimmen |
| 3. Wert | Deployment Token aus Azure Portal (SWA → **Overview** → *Manage deployment token*) |

### Custom Domain (is-a.dev)

| Schritt | Wo / Was |
|---|---|
| 1. Berechtigung prüfen | Bedingungen auf [is-a.dev](https://is-a.dev) lesen — PR wird sonst abgelehnt |
| 2. Repo forken | [github.com/is-a-dev/register](https://github.com/is-a-dev/register) forken |
| 3. Domain beantragen | JSON-Konfigurationsdatei mit gewünschter Domain hinzufügen und Pull Request erstellen |
| 4. Wartezeit | 24–48h oder länger je nach Auslastung |
| 5. Domain in Azure eintragen | SWA → **Custom domains** → Domain hinzufügen |
| 6. DNS-Eintrag setzen | CNAME-Record beim Domain-Anbieter auf Azure-URL zeigen lassen |
| 7. Validierung | Azure prüft den DNS-Eintrag automatisch |

--- 

## Fazit

Durch die Kombination von GitHub Actions, Zensical und Azure Static Web Apps wurde eine vollständige CI/CD-Pipeline aufgebaut. Diese ermöglicht:

- Automatisches Builden der Webseite
- Automatisches Deployment auf Azure
- Preview-Deployments für Pull Requests
- Sichere Authentifizierung über GitHub Secrets
- Nutzung einer eigenen Domain statt Azure-Standard-URL

Damit wurde eine moderne, skalierbare und vollständig automatisierte Hosting-Lösung erfolgreich umgesetzt.