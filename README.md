# Mahabharata Stories — Day 1

## 1. Apply the database schema

1. Open [Supabase SQL Editor](https://supabase.com/dashboard/project/jqqybehynmbbxuhtcqot/sql/new)
2. Paste the contents of `backend/supabase_migration.sql`
3. Click **Run**

## 2. Start the backend

```bash
cd backend
npm install
npm run dev
```

Verify: http://localhost:3001/health → `{"status":"ok"}`

Test the endpoint: http://localhost:3001/api/stories/birds-eye-test/scenes

## 3. Start the frontend

```bash
cd frontend
npm install
npm run dev
```

Open http://localhost:5173 — you should see the scene title and narration text.

## Notes

- Backend runs on port 3001; Vite proxies `/api` → `localhost:3001`
- Supabase credentials live in `backend/.env` — never commit this file
- `backend/.gitignore` already excludes it
