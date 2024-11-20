<div align="center">
  <img 
    src="https://cdn.discordapp.com/attachments/1238845782363476039/1307803962145247272/Naara_icone.png?ex=673e45da&is=673cf45a&hm=cefe32486c971cbd80816e1208dec74271e81b53909828be8e31b88d97849792&" 
    alt="Logo de Naara" 
    width="400">
</div>

# **Naara PVP Gamemode**

Bienvenue dans le dépôt officiel du **Naara PVP Gamemode**, un projet unique et innovant pour la plateforme FiveM.

---

### 🎮 **Présentation**
Le **Naara PVP Gamemode** est conçu pour offrir une expérience **PVP immersive** et compétitive. Ce projet repousse les limites de la plateforme FiveM grâce à une intégration optimisée avec [oxmysql](https://github.com/overextended/oxmysql) pour une gestion performante des bases de données.

**Fonctionnalités principales :**
- **Système de matchmaking avancé** : Affrontez des adversaires de votre niveau pour des parties équilibrées.
- **Tournois compétitifs** : Classements dynamiques avec récompenses attractives.
- **Mode battle royale revisité** : Mélange de stratégie et de réflexes pour survivre.
- **Et bien plus** : De nouvelles fonctionnalités sont en cours de développement.

**Pourquoi choisir Naara PVP Gamemode ?**
Ce gamemode a été pensé pour les amateurs de compétition sur FiveM, combinant **qualité**, **innovation** et **fluidité** pour une expérience inégalée.

---

## ⚙️ **Configuration**

Voici les options de configuration pour adapter le gamemode à votre serveur :

```bash
# Configuration globale
setr naara:serverName "Naara - PvP" # Nom du serveur
setr naara:serverIcon "https://cdn.discordapp.com/attachments/1238845782363476039/1307803962145247272/Naara_icone.png" # Icône du serveur
setr naara:serverBanner "https://cdn.discordapp.com/attachments/1224136171530092554/1308255090897059860/Nouveau_projet.png" # Bannière
setr naara:siteLink "https://naara.fr" # Site web
setr naara:tebexLink "https://naara.tebex.io" # Lien Tebex
setr naara:debugLevel 2 # Niveau de débogage

# Présence Discord
setr naara:discordLink "https://discord.gg/NaaraNetwork" # Lien Discord
setr naara:presenceUpdateInterval 5000 # Intervalle de mise à jour
setr naara:discordAppId "1307913029769498644" # ID de l'application Discord
setr naara:presenceAsset "naara" # Ressource visuelle
setr naara:presenceAssetText "Developed by Atoshi" # Texte personnalisé
setr naara:presenceButtonLabel "Github" # Bouton personnalisé
setr naara:presenceButtonLink "https://github.com/atoshit/naara-gamemode" # Lien du bouton

# Logs
setr naara:webhook:gamemodeStart "https://discordapp.com/api/webhooks/..." # Début du gamemode
setr naara:webhook:gamemodeRunning "https://discordapp.com/api/webhooks/..." # Gamemode actif
setr naara:webhook:playerConnecting "https://discordapp.com/api/webhooks/..." # Connexion joueur
setr naara:webhook:playerDropped "https://discordapp.com/api/webhooks/..." # Déconnexion joueur
