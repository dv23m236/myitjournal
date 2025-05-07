# Persönliche Notizen

## SSH

### SSH Key generieren
ssh-keygen

### Ins Verzeichnis wechseln
cd .ssh/

### Schlüssel anzeigen
cat id_x.pub 

### Schlüssel kopieren
pbcopy < id_x.pub

### Schlüssel auf den gewünschten Rechner kopieren
ssh-copy-id root@IP-Adresse


## Homebrew

### Homebrew installieren
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Homebrew in dein Verzeichnis hinzufügen
echo >> /Users/benutzer.name/.zprofile

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/benutzer.name/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

### Mit Homebrew Applikationen installieren:
- Git installieren
- brew install git
- Tmux installieren
- brew install tmux 

### Heruntergeladen tmux.conf Datei einbinden
cd  ~/Downloads 

mv tmux.conf ~/

~ (opt + N)


## Vim

### Vim installieren
brew install vim

### tmux.config Datei öffnen
vim .tmux.conf

### In der Datei etwas ausführen
Shift + . (Punkt) —> „set number“ damit man Zahlen an den Ränder hat in der Config Datei

### Datei speichern und schliessen
wq


## Vagrant

### Vagrant File anschauen
vim Vagrantfile

### Status der virtuellen Maschinen anzeigen
vagrant status

### Vm’s erstellen 
Um eine beliebige zu erstellen: vagrant up „vm-name“

Um alle zu erstellen: vagrant up

### Auf die VM einloggen
vagrant ssh „vm-name“
### Von einer VM auf die andere einloggen
ssh „vm-ip“

PW: „vagrant“

### Vagrant Plugin installieren
vagrant plugin install vagrant-hosts

Das dazu dient, die /etc/hosts-Dateien sowohl auf dem Host als auch in den VMs zu verwalten.


## Tmux

### Eigene tmux config
ctrl + A —> opt + 7 = Vertikal spalten

ctrl + A —> - = Horizontal spalten

ctrl + A —>  C = neues Fenster

ctrl + A —> Pfeiltaste L od. R = Tab/Pane wechseln

exit = schliessen

tmux attach = verbinden auf die bereits laufende tmux Session

tmux detach = trennen von einer laufenden tmux Session, ohne sie zu beenden


## OverTheWire Levels

### Level 0
ssh bandit0@bandit.labs.overthewire.org -p 2220

PW: bandit0

### Level 1
cat readme

PW: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

### Level 2
cat ./-

PW: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

### Level 3
cat spaces\ in\ this\ filename 

PW: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

### Level 4
ls

cd inhere/

find

cat …Hiding-From-You

PW: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

### Level 5
find . -type f -exec file --mime {} + | grep "text/" | cut -d: -f1

PW: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

### Level 6
find inhere -type f -size 1033c ! -executable

cat inhere/maybehere07/.file2

PW: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

### Level 7
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null

cat /var/lib/dpkg/info/bandit7.password

PW: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

### Level 8
grep "millionth" data.txt

PW: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

### Level 9
sort data.txt | uniq -u

PW: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

### Level 10
strings data.txt | grep "=="

PW: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

### Level 11
base64 -d data.txt

PW: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

### Level 12
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'

PW: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4