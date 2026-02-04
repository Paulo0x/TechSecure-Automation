# ⚡ TECHSECURE : PROJECT_AUTOMATA ⚡
> **SÉCURITÉ INFRASTRUCTURE** | **DIVISION AUTOMATISATION** | **v2.0.4**
>
> 🟢 **SYSTEM_STATUS**: ONLINE
> 🔴 **ACCESS**: RESTRICTED_TO_SYSADMIN
> 👤 **OPERATOR**: PAULO_ROOT

---

## 🛰️ CONTEXTE OPÉRATIONNEL
Suite au recrutement chez **TechSecure**, l'objectif était d'éradiquer les erreurs humaines sur une infrastructure de 20 serveurs Linux (Debian/Ubuntu). Cette suite logicielle automatise les déploiements, la surveillance et la protection des données.

```text
          ________________________________________________
         /                                                \
        |    _________________________________________     |
        |   |                                         |    |
        |   |   T E C H S E C U R E _ S Y S T E M     |    |
        |   |                                         |    |
        |   |   > INITIALIZING MODULES...             |    |
        |   |   > ALL SYSTEMS OPERATIONAL             |    |
        |   |_________________________________________|    |
        |                                                  |
         \________________________________________________/
                \__________________________________/
             ___________________________________________

🛠️ MODULES_DE_CONTRÔLE
	💾 01. PROTOCOLE_SAUVEGARDE (backup.sh)
FONCTION : Extraction et archivage chiffré des répertoires critiques.

MÉTHODE : Compression .tar.gz avec horodatage millimétré.

GESTION_FLUX : Rotation intelligente (Purge automatique après 7 cycles).

LOGS : Traçabilité totale dans /var/log/backup.log.

	🖥️ 02. ANALYSEUR_SYSTÈME (monitor.sh)
SENSORS : Monitoring CPU, RAM (Go/%), Disques et Uptime.

HUD : Interface avec alertes colorées dynamiques (Seuils : 70% / 85%).

SCAN : Identification immédiate des 5 processus les plus voraces.

	👥 03. GESTION_IDENTITÉ (create-users.sh)
INJECTION : Création massive d'utilisateurs via parsing CSV.

SÉCURITÉ : Chiffrement des identités et mots de passe aléatoires.

HIÉRARCHIE : Tri automatique par groupes départementaux (IT, RH, COM).

	🧹 04. PROTOCOLE_NETTOYAGE (cleanup.sh)
SÉCURITÉ : Mode SIMULATION par défaut pour éviter tout effacement accidentel.

PURGE : Élimination des fichiers /tmp, vieux logs et résidus APT.

OVERRIDE : Option --force requise pour l'exécution physique.

	🩺 05. SCANNER_DE_SERVICES (check-services.sh)
DIAGNOSTIC : Vérification en temps réel des services critiques (SSH, Cron, Web).

LIVE_MODE : Option --watch pour une surveillance active toutes les 30s.

	⚡ CONSOLE_CENTRALE (sysadmin-tools.sh)
Le point d'entrée unique pour piloter l'infrastructure.

Bash
# Lancement de l'interface de commande
sudo ./sysadmin-tools.sh
MENU : Interface interactive sécurisée.

ERROR_HANDLING : Gestion des arguments et validation des permissions.

	🔓 PROCÉDURE_DÉPLOIEMENT
CLONE : Récupérer les sources depuis le dépôt sécurisé.

PERMS : Activer les droits d'exécution via chmod +x *.sh.

LOGS : Créer l'environnement de logs dans ~/scripts/logs/.
<img width="567" height="499" alt="image" src="https://github.com/user-attachments/assets/3ce3d874-a247-4a3d-9385-f9d8efd96087" />
