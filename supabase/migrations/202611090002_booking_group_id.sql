-- Run once in Supabase SQL Editor for an existing project.
alter table public.bookings add column if not exists booking_group_id uuid;
create index if not exists bookings_booking_group_id_idx on public.bookings(booking_group_id);
