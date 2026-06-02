# Deployment einer Azure Static Web App via CLI

## Ausgangslage & Zielsetzung

Das persönliche IT-Journal soll auf Azure Static Web Apps (SWA) gehostet werden. Im Gegensatz zum Standard-Workflow mit GitHub Actions soll die Bereitstellung vollständig unabhängig von externen Pipelines direkt über die Kommandozeile gesteuert werden.

Ziel war es, eine Lösung zu entwickeln, bei der sowohl die Infrastruktur als auch das eigentliche Publizieren der Webseiten-Inhalte über lokale Bash-Skripte kontrolliert werden. Inhalte werden lokal verändert und per Befehl direkt in die Cloud publiziert.

---

## Ziele im Überblick

- **Infrastruktur als Code** — Automatische Erstellung der Azure Static Web App über ein Bash-Skript mit dem Azure CLI (`az`).
- **Schnittstellen-Entkopplung** — Einrichtung einer App ohne standardmässige GitHub-Repository-Bindung.
- **Manuelle Publikation per CLI** — Bereitstellung der generierten Webseiten-Dateien aus `./site` via SWA CLI (`swa`).
- **Transparente Fehlerdokumentation** — Aufzeigen von Einschränkungen im universitären Umfeld (Tenant-Sperren) und Bereitstellung eines Token-basierten Workarounds.

---

## Einrichtung der Azure Static Web App via Skript

Die Bereitstellung teilt sich in zwei Phasen: die **einmalige Erstellung** der Cloud-Infrastruktur und das **repetitive Publizieren** der lokalen Daten.

### Skript 1: Infrastruktur aufbauen (`setup-infra.sh`)

Legt die Ressourcengruppe und die Static Web App in Azure an. Durch das Weglassen von Repository-Parametern wird die App für den rein manuellen CLI-Upload konfiguriert.

```bash
#!/bin/bash
RESOURCE_GROUP="rg-davide-journal-test"
SWA_NAME="myitjournal-manual"
LOCATION="westeurope"

echo "Starte Erstellung der Static Web App via Azure CLI"

az staticwebapp create \
  --name "$SWA_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION"
```

### Skript 2: Website publizieren (`publish.sh`)

Liest das Deployment-Token dynamisch aus Azure aus und startet den Upload des lokalen `/site`-Ordners.

```bash
#!/bin/bash
set -e # Bricht bei Fehlern sofort ab

RESOURCE_GROUP="rg-davide-journal-test"
SWA_NAME="myitjournal-manual"

echo "Überspringe Build (Dateien liegen bereit in /site)"

echo "Rufe Deployment-Token live ab"
DEPLOY_TOKEN=$(az staticwebapp secrets list \
  --name "$SWA_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query "properties.apiKey" \
  -o tsv)

echo "Publiziere Website in der Azure SWA"
swa deploy ./site --deployment-token "$DEPLOY_TOKEN" --env production

echo "Fertig! Deine Website ist live."
```

### Erklärung wichtiger Anpassungen

- **Entkopplung vom Repository** — Durch den Verzicht auf `--source` oder `--branch` blockiert Azure keine manuellen CLI-Uploads.
- **Dynamischer Token-Abruf** — `az staticwebapp secrets list` fragt das Deployment-Token vollautomatisch ab. Ein manuelles Kopieren entfällt.
- **`set -e` im Deployment** — Stoppt das Skript sofort, falls eine Aktion (z. B. Token-Abruf oder Upload) fehlschlägt.

---

## Zusätzliche Konfigurationsschritte

### Lokale Berechtigungen setzen

```bash
# Im Hauptverzeichnis myitjournal ausführen:
chmod +x setup-infra.sh publish.sh

# Danach Skript starten via:
./setup-infra.sh
```
---

## Spickzettel

### Lokale Ordnerstruktur & Rechte

| Schritt | Befehl | Beschreibung |
|---|---|---|
| Ordner prüfen | `ls -l` | Der Ordner `site/` mit den HTML-Dateien muss existieren. |
| Rechte vergeben | `chmod +x *.sh` | Macht die Skripte lokal ausführbar. |
| CLI konfigurieren | `swa init` | Erstellt die lokale `swa-cli.config.json` interaktiv. |

### Infrastruktur & Deployment

| Aktion | Befehl / Parameter | Beschreibung |
|---|---|---|
| SWA erstellen | `az staticwebapp create` | Legt die App ohne Git-Zwang in Azure an. |
| Token auslesen | `az staticwebapp secrets list` | Holt den API-Key für den Upload (erfordert Rechte). |
| Code publizieren | `swa deploy ./site` | Lädt den Inhalt von `/site` direkt auf den Azure-Server. |
| Zielumgebung | `--env production` | Schaltet die hochgeladenen Dateien sofort live. |

---

## Fazit

Durch den Einsatz der Azure CLI und des SWA CLI wurde eine schlanke, skriptbasierte Deployment-Infrastruktur definiert. Diese ermöglicht:

- Die theoretische Erstellung von Cloud-Ressourcen ohne grafische Oberfläche.
- Das Publizieren von Webseiten-Inhalten mit einem einzigen Terminal-Befehl (`./publish.sh`).
- Die vollständige Kontrolle über den Veröffentlichungszeitpunkt direkt von der lokalen Kommandozeile aus.

Obwohl restriktive Tenant-Richtlinien den vollautomatischen API-Abruf verhindern können, lässt sich die geforderte Arbeitssequenz — Inhalte bearbeiten → per CLI-Befehl publizieren — dank des Token-Workarounds nahtlos und effizient in der Praxis umsetzen.
