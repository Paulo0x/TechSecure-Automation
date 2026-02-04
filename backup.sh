#!/bin/bash

# --- CONFIGURATION ---
SOURCE_DIR=$1
BACKUP_DEST="/backup"
LOG_FILE="/var/log/backup.log"
DATE=$(date +%Y%m%d_%H%M%S)

# --- ÉTAPE 2.1 : VÉRIFICATIONS DE SÉCURITÉ ---

# On vérifie si l'utilisateur a bien tapé quelque chose après ./backup.sh
# -z signifie "est vide"
if [ -z "$SOURCE_DIR" ]; then
    echo "Erreur : Tu as oublié d'indiquer le dossier à sauvegarder !"
    echo "Usage : ./backup.sh /chemin/du/dossier"
    exit 1 # On arrête le script ici car il manque une info
fi

# On vérifie si le dossier que l'on veut sauvegarder existe vraiment
# ! -d signifie "n'est pas un dossier"
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Erreur : Le dossier '$SOURCE_DIR' n'existe pas."
    exit 1 # On arrête le script ici
fi

# --- ÉTAPE 2.2 : CRÉATION DU DOSSIER DE SAUVEGARDE ---
if [ ! -d "$BACKUP_DEST" ]; then
    mkdir -p "$BACKUP_DEST"
fi

# --- ÉTAPE 2.3 : LA SAUVEGARDE ET LE LOG ---
FILENAME="backup_${DATE}.tar.gz"

# On tente de créer l'archive
if tar -czf "${BACKUP_DEST}/${FILENAME}" "$SOURCE_DIR" 2>/dev/null; then
    # Si ça a marché, on écrit dans le terminal et dans le fichier log
    RESULTAT="SUCCÈS : Sauvegarde de $SOURCE_DIR faite dans ${FILENAME}"
    echo "$RESULTAT"
    # L'heure et le résultat vont dans le fichier /var/log/backup.log
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $RESULTAT" >> "$LOG_FILE"
else
    # Si ça a échoué (ex: pas de permissions)
    RESULTAT="ÉCHEC : La sauvegarde de $SOURCE_DIR a échoué"
    echo "$RESULTAT"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $RESULTAT" >> "$LOG_FILE"
fi

# --- ÉTAPE 1.3 : ROTATION DES SAUVEGARDES ---

echo "Nettoyage des anciennes sauvegardes..."

# 1. On compte combien on a de fichiers de sauvegarde
NB_BACKUPS=$(ls -1 /backup/backup_*.tar.gz 2>/dev/null | wc -l)

# 2. Si on en a plus de 7, on fait le ménage
if [ "$NB_BACKUPS" -gt 7 ]; then
    # On calcule combien on doit en supprimer
    A_SUPPRIMER=$((NB_BACKUPS - 7))
    
    # On liste par date (ls -tr : t pour temps, r pour inverser le plus vieux en premier)
    # head -n $A_SUPPRIMER : on prend les X premiers (les plus vieux)
    # xargs rm : on les supprime
    ls -1tr /backup/backup_*.tar.gz | head -n "$A_SUPPRIMER" | xargs rm
    
    echo "Rotation effectuée : $A_SUPPRIMER ancienne(s) sauvegarde(s) supprimée(s)."
else
    echo "Rotation : Moins de 7 sauvegardes présentes, rien à supprimer."
fi
