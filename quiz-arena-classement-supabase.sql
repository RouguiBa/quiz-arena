-- Quiz Arena : classement mondial partagé
-- À exécuter une seule fois dans Supabase > SQL Editor > New query.
-- Note : les politiques publiques conviennent à un prototype sans compte utilisateur.
-- Pour un classement compétitif anti-triche, ajoute ensuite Supabase Auth et des écritures validées côté serveur.

create table if not exists public.qa_leaderboard (
  player_id text primary key,
  username text not null default 'Joueur',
  xp integer not null default 0 check (xp >= 0),
  solo_best integer not null default 0 check (solo_best >= 0),
  wins integer not null default 0 check (wins >= 0),
  losses integer not null default 0 check (losses >= 0),
  matches integer not null default 0 check (matches >= 0),
  updated_at timestamptz not null default now()
);

alter table public.qa_leaderboard enable row level security;

drop policy if exists "Leaderboard is publicly readable" on public.qa_leaderboard;
create policy "Leaderboard is publicly readable"
on public.qa_leaderboard for select
to anon, authenticated
using (true);

drop policy if exists "Players can create leaderboard row" on public.qa_leaderboard;
create policy "Players can create leaderboard row"
on public.qa_leaderboard for insert
to anon, authenticated
with check (
  char_length(username) between 1 and 20
  and xp >= 0 and solo_best >= 0 and wins >= 0 and losses >= 0 and matches >= 0
);

drop policy if exists "Players can update leaderboard rows" on public.qa_leaderboard;
create policy "Players can update leaderboard rows"
on public.qa_leaderboard for update
to anon, authenticated
using (true)
with check (
  char_length(username) between 1 and 20
  and xp >= 0 and solo_best >= 0 and wins >= 0 and losses >= 0 and matches >= 0
);

grant select, insert, update on public.qa_leaderboard to anon, authenticated;
