#!/bin/bash

# Couleurs
VERT='\033[0;32m'
JAUNE='\033[1;33m'
ROUGE='\033[0;31m'
NC='\033[0m' # No Color

# Infos générales (Partie 2.1)
echo -e "--- Rapport pour : **$(hostname)** ---"
echo "Date : $(date)"
echo "Uptime : $(uptime -p)"

# 1. CPU (On récupère juste la partie avant la virgule)
CPU_RAW=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU=${CPU_RAW%,*} # Enlève la virgule et tout ce qui suit
CPU=${CPU%.*} # Enlève le point et tout ce qui suit (au cas où)

# 2. RAM
RAM_RAW=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
RAM=${RAM_RAW%,*}
RAM=${RAM%.*}

# 3. DISQUE
DISQUE_RAW=$(df / | grep / | awk '{print $5}' | sed 's/%//')
DISQUE=${DISQUE_RAW%,*}
DISQUE=${DISQUE%.*}

# Fonction pour afficher avec couleur (Partie 2.2)
check_alert() {
    local label=$1
    local valeur=$2
    if [ "$valeur" -lt 70 ]; then
        echo -e "${label} : ${VERT}${valeur}% (OK)${NC}"
    elif [ "$valeur" -ge 70 ] && [ "$valeur" -le 85 ]; then
        echo -e "${label} : ${JAUNE}${valeur}% (ATTENTION)${NC}"
    else
        echo -e "${label} : ${ROUGE}${valeur}% (DANGER)${NC}"
    fi
}

check_alert "Utilisation CPU" "$CPU"
check_alert "Utilisation RAM" "$RAM"
check_alert "Utilisation Disque" "$DISQUE"

# Top 5 Processus (Partie 2.4)
echo -e "\n--- Top 5 Processus (Mémoire) ---"
ps aux --sort=-%mem | head -n 6 | awk '{print $11, $4"%"}'
