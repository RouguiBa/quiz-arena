# Quiz Arena — démarrage gratuit
 
 https://rouguiba.github.io/quiz-arena/
 
Jeu de quiz web en français inspiré des duels de trivia : interface sombre/violette, 7 questions, 10 secondes par question, score basé sur la rapidité, question finale doublée, questions intégrées, récupération facultative depuis Open Trivia DB et ajout/import/export de questions locales.

## Fichiers
- `index.html` : application autonome côté navigateur.
- `SUPABASE_SETUP.md` : activer le multijoueur gratuit.
- `QUESTIONS_EXEMPLE.json` : exemple de questions personnalisées importables.

## Lancer en local
1. Décompressez le ZIP.
2. Ouvrez `index.html` dans un navigateur récent (Chrome, Firefox, Safari).
3. Les questions intégrées et la bibliothèque locale fonctionnent sans installation. L'API Open Trivia DB requiert Internet.
4. Pour un vrai duel entre deux appareils, configurez Supabase en suivant `SUPABASE_SETUP.md`. Le mode en ligne ne peut pas fonctionner avec la seule ouverture du fichier HTML.

## Publier gratuitement avec GitHub Pages
1. Connectez-vous à GitHub et créez un dépôt public nommé `quiz-arena`.
2. Cliquez sur **Add file → Upload files** et téléversez `index.html`, `README.md`, `SUPABASE_SETUP.md` et `QUESTIONS_EXEMPLE.json` à la racine.
3. Ouvrez **Settings → Pages**.
4. Sous **Build and deployment**, choisissez **Deploy from a branch**, branche `main`, dossier `/(root)`, puis **Save**.
5. Attendez le déploiement. L'URL sera du type `https://VOTRE-PSEUDO.github.io/quiz-arena/`.
6. Partagez cette URL. Une fois Supabase configuré, les liens de duel contiendront `?room=CODE`.

## Important — configuration publique
Le navigateur utilise une clé Supabase publique (`anon` ou `publishable`) conçue pour être visible côté client. N'y mettez jamais une `service_role` key ou un secret privé. Protégez les tables avec RLS si vous en créez. Pour ce prototype, les salons utilisent Supabase Realtime Broadcast sans table SQL.

## Limites du prototype
- L'offre gratuite des fournisseurs a des quotas et peut changer.
- Le multijoueur nécessite Internet et un projet Supabase configuré avec Realtime disponible.
- Les questions personnalisées sont enregistrées uniquement dans le navigateur où elles ont été ajoutées. Exportez-les en JSON pour les sauvegarder ou les importer ailleurs.
- Les scores sont synchronisés pendant le salon, mais ce prototype n'inclut pas de comptes, de classement mondial persistant ni de protection anti-triche forte.
