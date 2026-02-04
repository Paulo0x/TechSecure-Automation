#!/bin/bash

CONF_FILE="services.conf"
VERT='\033[0;32m'
ROUGE='\033[0;31m'
NC='\033[0m'

echo "--- État des Services ---"

while read -r service; do
    # On vérifie si le service est actif
    if systemctl is-active --quiet "$service"; then
        echo -e "$service : ${VERT}ACTIF${NC}"
    else
        echo -e "$service : ${ROUGE}INACTIF${NC}"
        # Optionnel : tenter de redémarrer
        # sudo systemctl start "$service"
    fi
done < "$CONF_FILE"
