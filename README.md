# 🛠️ TechSecure : Automatisation SysAdmin

Ce dépôt contient une suite d'outils d'automatisation développée pour **TechSecure** afin de gérer une infrastructure de serveurs Linux (Debian/Ubuntu). L'objectif est de remplacer les tâches manuelles chronophages par des scripts Bash robustes, sécurisés et documentés.

> **STATUS**: [ OPERATIONAL ] <img width="330" height="201" alt="image" src="https://github.com/user-attachments/assets/6c64b67a-6c7c-46b3-80c4-599649cd1193" />


![Capture de mon menu]
---

## 🚀 Fonctionnalités Principales

### 💾 01. Sauvegarde Automatisée (`backup.sh`)
* **Archivage** : Crée des archives `.tar.gz` avec horodatage précis.
* **Sécurité** : Vérification de l'espace disque disponible et de l'existence du répertoire source avant exécution.
* **Rotation** : Conservation stricte des 7 dernières sauvegardes pour optimiser le stockage.
* **Traçabilité** : Journalisation complète dans `/var/log/backup.log`.

### 🖥️ 02. Moniteur de Ressources (`monitor.sh`)
* **Surveillance** : Analyse en temps réel du CPU, de la RAM (Go/%), de l'espace disque et de l'Uptime.
* **HUD Visuel** : Alertes colorées selon des seuils critiques (Vert < 70%, Jaune 70-85%, Rouge > 85%).
* **Processus** : Liste les 5 processus consommant le plus de ressources système.

### 👥 03. Gestionnaire d'Utilisateurs (`create-users.sh`)
* **Batch Mode** : Création massive d'utilisateurs à partir d'un fichier CSV.
* **Sécurité** : Génération de mots de passe aléatoires sécurisés pour chaque nouveau compte.
* **Organisation** : Création automatique des groupes par département et des répertoires personnels.

### 🧹 04. Nettoyeur de Système (`cleanup.sh`)
* **Sécurité** : Mode "Dry-run" par défaut pour simuler les suppressions sans risque.
* **Purge** : Nettoie `/tmp`, les logs compressés et le cache APT.
* **Action** : Utilisation de l'option `--force` pour confirmer le nettoyage réel.

### 🩺 05. Santé des Services (`check-services.sh`)
* **Diagnostic** : Vérifie l'état (actif/inactif) des services listés dans `services.conf`.
* **Monitoring** : Mode `--watch` disponible pour une surveillance continue toutes les 30 secondes.

---

## ⚡ Console Centrale (`sysadmin-tools.sh`)

L'intégralité des modules est pilotable via une interface interactive unique. Elle gère la validation des arguments, les permissions et le retour au menu après chaque opération.

### Utilisation :
```bash
sudo ./sysadmin-tools.sh
-----------------------------------------------------------------------------------------

🔓 Installation et Configuration
Permissions : Tous les scripts doivent être rendus exécutables :

Bash
chmod +x *.sh
Fichiers Source : Assurez-vous que les fichiers de configuration sont présents :

users.csv : Liste des collaborateurs à créer.

services.conf : Liste des services à surveiller.

Logs : Les rapports sont archivés dans /var/log/ pour une consultation ultérieure.
