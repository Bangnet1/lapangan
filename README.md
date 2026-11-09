# Badminton Center Manager

A React + TypeScript + Tailwind admin app for managing badminton court rentals.

## Configuration
- 5 courts; operating hours 07:00–23:00
- Default/off-peak rate: Rp50,000/hour
- Peak rate: Rp65,000/hour (sample default; adjust in Settings before production)
- Custom deposit amount; admin-only access
- Supabase database with RLS and overlap constraint
- Deploy target: Cloudflare Pages

## Development
```bash
npm install
cp .env.example .env
# Set VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY
npm run dev
```

## Build
```bash
npm run build
```
Output directory: `dist`.

## Supabase setup
1. Create a Supabase project.
2. Run `supabase/schema.sql` in the SQL Editor.
3. Add the first admin user in Supabase Auth.
4. Set that user's `app_metadata.role` to `admin` using a trusted server-side/admin mechanism. Never set authorization roles from user-editable metadata.
5. Add URL and publishable key to Cloudflare Pages environment variables.

Never expose the Supabase service-role key in the browser.

## Current scope
Booking schedules are stored in Supabase when an authenticated admin session is active. Each selected court can have its own duration; overlap validation is scoped to the same court and rejects only intersecting time ranges. Existing Supabase projects must apply the SQL files in `supabase/migrations/` before deploying the updated app. Expenses and some finance features remain local/demo data until their database integration is completed.
