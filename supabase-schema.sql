create table if not exists public.memory_jar_documents (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{"jars":[],"entries":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.memory_jar_documents enable row level security;

create policy "Users can read their own memory jar"
  on public.memory_jar_documents for select
  using (auth.uid() = user_id);

create policy "Users can insert their own memory jar"
  on public.memory_jar_documents for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own memory jar"
  on public.memory_jar_documents for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
