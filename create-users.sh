#!/bin/bash

# On vérifie si un fichier a été donné en argument (Partie 3.2)
FICHIER_CSV=$1

if [ -z "$FICHIER_CSV" ]; then
    echo "Usage: $0 fichier.csv"
    exit 1
fi

# On saute la première ligne (l'en-tête) avec 'tail -n +2'
# IFS=',' permet de dire à Bash que la virgule sépare les colonnes
tail -n +2 "$FICHIER_CSV" | while IFS=',' read -r prenom nom departement fonction
do
    # 1. Générer le login (1ère lettre prenom + nom) en minuscules (Partie 3.2)
    # On utilise tr pour tout mettre en minuscules
    PREMIERE_LETTRE=$(echo "${prenom:0:1}" | tr '[:upper:]' '[:lower:]')
    NOM_MIN=$(echo "$nom" | tr '[:upper:]' '[:lower:]')
    LOGIN="${PREMIERE_LETTRE}${NOM_MIN}"

    # 2. Vérifier si l'utilisateur existe déjà (Partie 3.3)
    if id "$LOGIN" &>/dev/null; then
        echo "L'utilisateur $LOGIN existe déjà, on passe au suivant."
        continue
    fi

    # 3. Créer le groupe du département s'il n'existe pas (Partie 3.3)
    if ! getent group "$departement" &>/dev/null; then
        groupadd "$departement"
        echo "Groupe $departement créé."
    fi

    # 4. Créer l'utilisateur avec son groupe et son dossier (Partie 3.2)
    # -m : crée le dossier /home/login
    # -g : définit le groupe principal
    # -c : ajoute un commentaire (Nom Complet)
    useradd -m -g "$departement" -c "$prenom $nom" "$LOGIN"

    # 5. Générer un mot de passe aléatoire (Partie 3.2)
    PASSWORD=$(openssl rand -base64 12)
    echo "$LOGIN:$PASSWORD" | chpasswd

    echo "Utilisateur créé : $LOGIN (Groupe: $departement) - Pass: $PASSWORD"

    # 6. Logger l'opération (Partie 3.3)
    echo "$(date) - Création de $LOGIN ($prenom $nom)" >> /var/log/user-creation.log

done
