# Activer les duels en ligne avec Supabase (offre gratuite)

Le site est statique sur GitHub Pages. Supabase sert uniquement de canal temps réel pour que les deux navigateurs échangent les événements du salon.

1. Créez un compte sur https://supabase.com/ puis un nouveau projet sur le forfait Free. Ce n'est pas un essai temporaire, mais des quotas s'appliquent et Supabase peut mettre en pause les projets gratuits inactifs.
2. Dans le tableau de bord du projet, ouvrez **Project Settings → API** (l'intitulé peut varier) et copiez la **Project URL** ainsi que la clé publique **anon** ou **publishable**.
3. Dans Quiz Arena, ouvrez **Configuration et questions personnalisées**, collez ces deux valeurs, cliquez sur **Enregistrer**, puis **Tester la connexion**.
4. Si le test échoue, vérifiez que le projet est actif, que l'URL et la clé correspondent au même projet, que le navigateur est connecté à Internet et que Realtime/Broadcast est disponible.
5. Ouvrez le site dans deux navigateurs ou appareils. Sur le premier, créez un salon. Copiez le lien et ouvrez-le sur le deuxième appareil. Entrez un pseudo et rejoignez le salon.
6. Quand les deux joueurs apparaissent, le créateur lance le duel.

## Sécurité
- N'utilisez jamais la clé `service_role` dans un fichier HTML public. Elle donne des privilèges élevés.
- La clé `anon`/`publishable` est publique par conception, mais elle ne doit pas donner accès à des données privées sans règles adaptées.
- Les salons de ce prototype sont des canaux Realtime sans base de données ni authentification. Un code de salon peut être deviné et il n'y a pas de protection robuste contre la triche. Ne réutilisez pas ce prototype pour des données sensibles.
- Les scores et événements sont gérés côté navigateur : le prototype est fait pour jouer entre amis, pas pour un tournoi compétitif sécurisé.

## Dépannage
- Si le salon reste en « Connexion… », utilisez **Tester la connexion** et vérifiez les erreurs de console du navigateur.
- Si les deux joueurs ne se voient pas, vérifiez que les deux utilisent exactement le même code/lien et la même configuration Supabase.
- Le test de connexion ne valide pas la logique complète du duel ; essayez d'abord avec deux fenêtres de navigateur.
