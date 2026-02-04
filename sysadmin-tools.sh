#!/bin/bash

show_menu() {
    clear
    echo "-----------------------------------"
    echo "      OUTILS D'ADMINISTRATION      "
    echo "-----------------------------------"
    echo "1. Sauvegarde de répertoire"
    echo "2. Monitoring système"
    echo "3. Créer des utilisateurs"
    echo "4. Nettoyage système"
    echo "5. Vérifier les services"
    echo "6. Quitter"
    echo "-----------------------------------"
}

while true; do
    show_menu
    read -p "Votre choix : " choix
    case $choix in
        1) read -p "Dossier à sauvegarder : " dir; ./backup.sh "$dir" ;;
        2) ./monitor.sh ;;
        3) ./create-users.sh users.csv ;;
        4) ./cleanup.sh ;; # Lancé en simulation par défaut
        5) ./check-services.sh ;;
        6) exit 0 ;;
        *) echo "Choix invalide." ;;
    esac
    read -p "Appuyez sur Entrée pour revenir au menu..." pause
done
