# Projet-Info

Ce projet contient trois jeux classiques implémentés en Pascal : le Pendu, le Tic Tac Toe et le Puissance 4. Chaque jeu a ses propres fichiers de code source et utilise des unités pour organiser les différentes fonctionnalités.

## Structure du projet

Le projet est organisé en plusieurs dossiers, chacun contenant les fichiers nécessaires pour un jeu spécifique :

- `Pendu/`
- `TicTacToe/`
- `Puissance4/`

### Pendu

Le jeu du Pendu consiste à deviner un mot en proposant des lettres. Le joueur a un nombre limité de tentatives pour deviner le mot avant que le pendu ne soit complété.

#### Fichiers principaux

- `main.pas` : Point d'entrée du jeu.
- `partie.pas` : Gère le déroulement de la partie.
- `parametres.pas` : Gère les paramètres du jeu.
- `typeDonnees.pas` : Définit les types de données utilisés dans le jeu.
- `dictionnaire.pas` : Contient les mots à deviner.
- `animation.pas` : Gère les animations de texte.
- `affichageJeu.pas` : Gère l'affichage du jeu.

### Tic Tac Toe

Le Tic Tac Toe est un jeu de stratégie où deux joueurs s'affrontent pour aligner trois de leurs symboles (X ou O) horizontalement, verticalement ou en diagonale.

#### Fichiers principaux

- `main.pas` : Point d'entrée du jeu.
- `partie.pas` : Gère le déroulement de la partie.
- `typesTicTacToe.pas` : Définit les types de données utilisés dans le jeu.
- `logiqueTicTacToe.pas` : Contient la logique du jeu.
- `affichageTicTacToe.pas` : Gère l'affichage du jeu.
- `animation.pas` : Gère les animations de texte.

### Puissance 4

Le Puissance 4 est un jeu de stratégie où deux joueurs s'affrontent pour aligner quatre de leurs jetons horizontalement, verticalement ou en diagonale.

#### Fichiers principaux

- `main.pas` : Point d'entrée du jeu.
- `partie.pas` : Gère le déroulement de la partie.
- `parametres.pas` : Gère les paramètres du jeu.
- `typesPuissance4.pas` : Définit les types de données utilisés dans le jeu.
- `logiquePuissance4.pas` : Contient la logique du jeu.
- `affichagePuissance4.pas` : Gère l'affichage du jeu.
- `animation.pas` : Gère les animations de texte.

## Compilation et exécution

Pour compiler et exécuter les jeux, vous pouvez utiliser un compilateur Pascal comme Free Pascal Compiler (FPC). Voici les étapes générales pour compiler et exécuter un jeu :

1. Ouvrez un terminal.
2. Naviguez jusqu'au dossier du jeu que vous souhaitez compiler.
3. Utilisez la commande `fpc main.pas` pour compiler le jeu.
4. Exécutez le fichier binaire généré (par exemple, `./main` sur Unix ou `main.exe` sur Windows).

## Exemple de compilation

Pour compiler et exécuter le jeu du Pendu :

```sh
cd /Endroit/du/Projet/Pendu
fpc main.pas && ./main
```
