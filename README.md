🛠️ Boîte à Outils d'Administration Système - TechSecure
Ce projet regroupe une suite de scripts Bash automatisant les tâches récurrentes d'administration pour un parc de serveurs Linux (Debian/Ubuntu).

📋 Sommaire
Installation

Outils inclus

Usage

Bonnes pratiques

🚀 Installation
Clonage / Création des répertoires :

Bash
mkdir -p ~/scripts/logs
cd ~/scripts
Permissions : Tous les scripts doivent être rendus exécutables :

Bash
chmod +x *.sh
Fichiers de configuration : Assurez-vous que les fichiers users.csv et services.conf sont présents dans le répertoire.

🛠️ Outils inclus
1. Sauvegarde Automatisée (backup.sh)
Fonction : Compresse un répertoire cible dans /backup.

Sécurité : Vérifie l'existence du dossier source et l'espace disque.

Rotation : Ne conserve que les 7 dernières sauvegardes pour économiser l'espace.

2. Moniteur de Ressources (monitor.sh)
Surveillance : CPU, RAM et Disque.

Alertes : Affichage coloré (Vert/Jaune/Rouge) selon les seuils d'utilisation.

Processus : Affiche les 5 processus les plus gourmands en mémoire.

3. Gestionnaire d'Utilisateurs (create-users.sh)
Automatisation : Création massive à partir d'un fichier CSV.

Sécurité : Génère des mots de passe aléatoires sécurisés pour chaque compte.

Organisation : Crée automatiquement les groupes par département (IT, RH, etc.).

4. Nettoyeur de Système (cleanup.sh)
Mode Dry-run : Par défaut, simule les suppressions sans risque.

Nettoyage : Vide /tmp, les vieux logs et le cache APT.

Option Force : ./cleanup.sh --force pour appliquer réellement les changements.

5. Vérificateur de Services (check-services.sh)
État : Lit une liste de services et vérifie s'ils sont actifs.

Rapport : Affiche un statut coloré pour une lecture rapide.

🖥️ Usage
L'utilisation est centralisée via le script principal qui propose un menu interactif :

Bash
sudo ./sysadmin-tools.sh
Note : L'utilisation de sudo est indispensable pour la création d'utilisateurs, la gestion des services et l'écriture des logs dans /var/log/.

🛡️ Bonnes pratiques
Logs : Toutes les opérations critiques sont enregistrées dans ~/scripts/logs/ ou /var/log/.

Sécurité : Aucun mot de passe n'est stocké en clair.

Validation : Les scripts vérifient systématiquement les arguments avant exécution.
