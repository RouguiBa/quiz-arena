# Quiz Arena

https://rouguiba.github.io/quiz-arena/

Quiz Arena est un mini jeu de quiz web en français inspiré des duels de trivia. Il permet de jouer seul ou à deux, en choisissant un thème, en répondant en 10 secondes, et en gagnant des points selon la rapidité et la justesse des réponses.

Le projet est entièrement statique : il fonctionne en ouvrant simplement le fichier HTML dans un navigateur, sans dépendance de build ni de serveur. Le mode multijoueur nécessite uniquement une configuration Supabase gratuite.

## Fonctionnalités
- Mode solo et mode duel local / en ligne
- 7 questions par partie
- 10 secondes par question
- Système de score basé sur la précision et la rapidité
- Question finale avec double pondération
- Plusieurs thèmes prédéfinis
- Sélection de langue : français / anglais
- Ajout, export et import de questions personnalisées
- Récupération optionnelle depuis Open Trivia DB
- Classement global via Supabase
- Interface sombre/violette inspirée des jeux de trivia

## Fichiers du projet
- `index.html` : application complète en front-end, tout en un fichier
- `SUPABASE_SETUP.md` : procédure pour activer le multijoueur gratuit
- `QUESTIONS_EXEMPLE.json` : fichier d’exemple de questions personnalisées
- `quiz-arena-classement-supabase.sql` : script SQL pour créer la table de classement

## Démarrage rapide

### 1) Lancer localement
1. Téléchargez ou décompressez le projet.
2. Ouvrez `index.html` dans un navigateur moderne (Chrome, Edge, Firefox ou Safari).
3. Les questions intégrées et la bibliothèque locale fonctionnent sans installation.
4. L’API Open Trivia DB nécessite Internet et reste optionnelle.

### 2) Jouer en solo
- Ouvrez la page
- Saisissez un pseudo
- Choisissez un thème ou recherchez un sujet personnalisé
- Cliquez sur `Jouer en solo`

### 3) Jouer en duel
- Créez un salon
- Copiez le lien du salon
- Ouvrez ce lien sur un second appareil ou navigateur
- Le second joueur rejoint le salon puis le créateur lance la partie

> Pour le duel en ligne, il faut configurer Supabase. Sans cela, seul le mode solo et les questions intégrées restent utilisables.

## Configurer Supabase pour le multijoueur

1. Créez un compte sur https://supabase.com/
2. Créez un projet gratuit
3. Ouvrez le tableau de bord → `Project Settings` → `API`
4. Copiez la `Project URL` et la clé publique `anon` / `publishable`
5. Dans l’application, ouvrez la section “Configuration et questions personnalisées”
6. Collez ces valeurs, cliquez sur “Enregistrer”, puis sur “Tester la connexion”

Pour la configuration détaillée, consultez aussi `SUPABASE_SETUP.md`.

## Questions personnalisées

Le projet supporte une bibliothèque locale de questions que vous pouvez modifier directement depuis l’interface.

### Format JSON attendu
Le fichier JSON doit contenir un tableau d’objets au format suivant :

```json
[
  {
    "category": "Histoire",
    "q": "En quelle année a été signé le traité de Versailles ?",
    "a": ["1918", "1919", "1920", "1921"],
    "correct": 0
  }
]
```

### Import / export
- `Ajouter à ma bibliothèque locale` : ajoute une question directement depuis le formulaire
- `Exporter les questions JSON` : télécharge le fichier de sauvegarde
- `Importer un fichier JSON de questions` : ajoute les questions depuis un fichier local

Les questions personnalisées sont stockées dans le navigateur où elles ont été ajoutées.

## Classement mondial

Le classement peut être activé avec Supabase pour afficher les meilleurs scores sur plusieurs appareils.

Le fichier `quiz-arena-classement-supabase.sql` contient le script SQL nécessaire pour créer les tables et index utiles.

## Déploiement gratuit sur GitHub Pages

1. Créez un dépôt public nommé `quiz-arena`
2. Téléversez les fichiers suivants à la racine :
   - `index.html`
   - `README.md`
   - `SUPABASE_SETUP.md`
   - `QUESTIONS_EXEMPLE.json`
3. Ouvrez `Settings` → `Pages`
4. Choisissez `Deploy from a branch`
5. Sélectionnez la branche `main` et le dossier `/ (root)`
6. Enregistrez puis attendez le déploiement
7. L’URL sera du type :
   `https://VOTRE-PSEUDO.github.io/quiz-arena/`

## Sécurité et limites importantes

- La clé Supabase utilisée côté navigateur doit être publique (`anon` / `publishable`)
- N’utilisez jamais une clé `service_role` dans un fichier HTML public
- Les salons sont basés sur Realtime Broadcast et ne remplacent pas un système de tournoi sécurisé
- Le projet est destiné à un usage amical et de prototype
- Le classement et les duels nécessitent Internet
- Les quotas gratuits de Supabase et d’Open Trivia DB peuvent varier selon les périodes et l’usage réel

## Dépannage

### Le duel ne se lance pas
- Vérifiez que les deux appareils utilisent la même URL et la même clé Supabase
- Vérifiez que Realtime est activé sur le projet Supabase
- Ouvrez la console du navigateur pour identifier les erreurs

### Le salon reste en connexion
- Testez la configuration depuis l’application
- Vérifiez la disponibilité du projet Supabase et le bon accès Internet

### Les questions manquent
- Changez de thème
- Changez la langue
- Ajoutez des questions personnalisées

## Notes de conception

- Le site est autonome et n’a pas besoin de backend pour jouer en solo
- Le multijoueur est géré côté navigateur via Supabase Realtime
- L’expérience a été pensée pour être simple, rapide et déployable gratuitement

## License

Projet personnel / prototype de démonstration, sans affiliation avec QuizUp ou d’autres marques référencées.
