# ┌───────────────┬──────────────────────────────────────────────────────────┐
# │          FILE │ debianpostinstall                                        │
# │   DESCRIPTION │ Debian post install script                               │
# │        AUTHOR │ DexTerre                                                 │
# │       VERSION │ 1.0.0                                                    │
# │               │                                                          │
# │       AIDE    │ Syntaxe: # su - -c "./wheezyserverpostinstall.sh"        │
# │               │ Syntaxe: or # sudo ./wheezyserverpostinstall.sh          │
# │               │                                                          │
# └───────────────┴──────────────────────────────────────────────────────────┘

VERSION="1.0"
LISTE="cron-apt logwatch lsb-release vim locate zsh debian-goodies ssh ntp ntpdate"

# ┌──────────────────────────────────────────────────────────────────────────┐
# │ General Options                                                          │
# └──────────────────────────────────────────────────────────────────────────┘

# Test que le script est lance en root
if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
  exit 1
fi

# ┌──────────────────────────────────────────────────────────────────────────┐
# │ Mise a jour de la liste des depots                                       │
# └──────────────────────────────────────────────────────────────────────────┘

# Update 
echo "Mise a jour de la liste des depots"
aptitude update

# Upgrade
echo "Mise a jour du systeme"
aptitude safe-upgrade

# Installation
echo "Installation des logiciels suivants: $LISTE"
aptitude -y install $LISTE

# ┌──────────────────────────────────────────────────────────────────────────┐
# │ Mise a jour de la liste des depots                                       │
# └──────────────────────────────────────────────────────────────────────────┘

