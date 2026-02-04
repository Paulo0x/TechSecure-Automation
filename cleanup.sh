#!/bin/bash

# --- CONFIGURATION ---
FORCE=false
LOG_FILE="/var/log/cleanup.log"

# Vérification de l'option -f ou --force (Partie 4.2)
if [[ "$1" == "-f" || "$1" == "--force" ]]; then
    FORCE=true
fi

echo "--- Nettoyage du système ---"
ESPACE_AVANT=$(df -h / | awk 'NR==2 {print $4}')
echo "Espace disponible avant : $ESPACE_AVANT"

# Fonction pour supprimer ou simuler (Partie 4.2)
clean_action() {
    local description=$1
    local commande=$2

    if [ "$FORCE" = true ]; then
        echo "Exécution : $description"
        eval "$commande"
    else
        echo "[SIMULATION] Serait supprimé : $description"
    fi
}

# --- LES TÂCHES DE NETTOYAGE (Partie 4.1) ---

# 1. Fichiers /tmp plus vieux que 7 jours
clean_action "Fichiers temporaires (>7j)" "find /tmp -type f -mtime +7 -delete"

# 2. Logs compressés (.gz) plus vieux que 30 jours
clean_action "Anciens logs compressés (>30j)" "find /var/log -name '*.gz' -mtime +30 -delete"

# 3. Cache APT (paquets téléchargés)
clean_action "Cache des paquets APT" "apt-get clean"

# --- RÉSULTAT ---
if [ "$FORCE" = true ]; then
    ESPACE_APRES=$(df -h / | awk 'NR==2 {print $4}')
    echo "Nettoyage terminé. Espace après : $ESPACE_APRES"
    echo "$(date) - Nettoyage forcé effectué" >> "$LOG_FILE"
else
    echo "Fin de simulation. Utilisez './cleanup.sh --force' pour appliquer."
fi
