-- Apply this migration to an existing Supabase project before deploying the updated app.
alter table public.courts add column if not exists display_name text;
update public.courts set display_name = name where display_name is null or btrim(display_name) = '';
alter table public.courts alter column display_name set default '';
