# Mahabharata Stories

An illustrated storybook web app that retells Mahabharata stories for kids (age ~12),
each with scene-by-scene narration, a reflective "what would you do?" question, and a
closing moral ("seal").

**Live stack:**

| Piece    | Tech                  | Hosted on | Notes |
|----------|-----------------------|-----------|-------|
| Frontend | React + Vite          | Vercel    | `frontend/vercel.json` rewrites `/api/*` → Render backend; serves `frontend/public/images/**` as static files |
| Backend  | Express (`backend/`)  | Render (`mahabharata-stories.onrender.com`) | Thin REST layer over Supabase |
| Database | Supabase (Postgres)   | Supabase project `jqqybehynmbbxuhtcqot` | Data changes are applied manually via Dashboard → SQL Editor |

Deploys are automatic on push/merge to `main` (Vercel and Render both track the repo).
Database changes are **not** automatic — SQL must be run by hand in the
[Supabase SQL Editor](https://supabase.com/dashboard/project/jqqybehynmbbxuhtcqot/sql/new).

---

## For Claude (or any new contributor): how this repo works

This section exists because stories are added one per conversation; read it before
touching anything, it encodes lessons already learned.

### Database schema (source of truth: `backend/supabase_migration.sql` + later ALTERs)

```sql
stories (
  id                   uuid PK,
  title                text NOT NULL,
  slug                 text NOT NULL UNIQUE,   -- URL path: /story/<slug>
  lesson               text,                   -- the moral; NOTE: column is "lesson", NOT "moral"
  is_published         boolean NOT NULL,       -- MUST be true or RLS hides the story from the app
  reflection_questions jsonb                   -- optional; array of open-ended questions
)

scenes (
  id             uuid PK,
  story_id       uuid FK → stories ON DELETE CASCADE,
  "order"        integer NOT NULL,             -- 1-based; quoted, it's a reserved word
  scene_type     text CHECK IN ('narration', 'interactive', 'seal'),
  title          text,
  narration      text,
  image_filename text,                         -- bare filename, or NULL for no image
  age_group      text NOT NULL DEFAULT '12'
)
```

There is **no** `cover_image` column and **no** structured question/options columns.
Don't invent them.

### Conventions that are easy to get wrong

- **Cover image:** the Library page (`frontend/src/pages/Library.jsx`) hardcodes the
  story-card thumbnail as `/images/<slug>/scene-01.png`. So **name scene 1's image
  file `scene-01.png`** and set scene 1's `image_filename = 'scene-01.png'`.
  No separate cover file is needed.
- **Scene images:** live in `frontend/public/images/<slug>/` and are referenced by
  bare filename in `scenes.image_filename` (`SceneView.jsx` builds
  `/images/<slug>/<image_filename>`). Convention for the rest:
  `<hero>-scene-2.png`, `<hero>-scene-3.png`, … (e.g. `eklavya-scene-2.png`).
- **Interactive scenes** (`scene_type = 'interactive'`) have **no special UI** — the
  frontend renders them as plain narration text. Embed the question, `A) … D) …`
  options each followed by a short reflective paragraph, a life-bridge question, and
  a `For parents:` prompt, all inside `narration`. Usually no image (`NULL`).
  See scene 7 in `backend/seed_scenes_eklavyas_thumb.sql` for the canonical format.
- **Seal scene** (`scene_type = 'seal'`): last scene, one-line moral as `narration`
  (typically the same text as `stories.lesson`), image optional.
- **`is_published = true`** is required — RLS (`backend/lockdown_rls.sql`) hides
  unpublished stories and their scenes from the anon key.
- **SQL string literals:** escape apostrophes by doubling them (`Eklavya''s`).

### Adding a new story (the playbook)

1. **Seed SQL** — create `backend/seed_scenes_<slug_with_underscores>.sql` by copying
   the structure of `backend/seed_scenes_eklavyas_thumb.sql`:
   idempotent `DO $$` block → upsert story by slug → `DELETE` old scenes → `INSERT`
   each scene. Typical shape: ~6–7 narration scenes, 1 interactive, 1 seal.
2. **Images** — the user generates the artwork. Claude sessions **cannot save
   chat-attached images to files**; the user uploads them to
   `frontend/public/images/<slug>/` via GitHub's web UI ("Add file → Upload files"
   on the working branch; on mobile, request desktop site). Uploaded phone images
   arrive with UUID filenames — rename them with `git mv` to match the seed SQL
   (view each image to map it to the right scene by content).
3. **PR** — commit SQL + images on a feature branch, push, open a PR to `main`.
4. **Deploy images/code** — merge the PR; Vercel redeploys `main` automatically.
5. **Deploy data** — run the seed SQL in
   [Supabase SQL Editor](https://supabase.com/dashboard/project/jqqybehynmbbxuhtcqot/sql/new)
   (paste → Run → expect "Success. No rows returned").
   ⚠️ **Remote/cloud Claude sessions cannot do this step**: the sandbox egress
   policy blocks `*.supabase.co` (403 at the proxy). Either the user runs the SQL in
   the Dashboard, or a *local* Claude Code session on the user's machine can run it.
6. **Verify** — the Library page shows the new story card with cover + lesson;
   click through all scenes checking each image loads.

### Existing stories

#### 1. The Bird's Eye Test — `birds-eye-test`

- **Lesson:** Focus on your goal, not the distractions around it.
- **Seed:** `backend/seed_scenes.sql` (story row itself is created by `supabase_migration.sql`)
- **Images:** `frontend/public/images/birds-eye-test/` — `scene-01.png` … `scene-06.png`, `scene-07-seal.png`
- **Scenes (7):** all narration except the seal — The Forest Classroom · The Announcement ·
  The Parrot on the Branch · The Question · Only Arjuna Remained · The Lesson · The Seal.
  No interactive scene (predates that pattern).

#### 2. Karna's Loyalty — `karnas-loyalty`

- **Lesson:** Choose your circle wisely
- **Seed:** `backend/seed_scenes_karnas_loyalty.sql`
- **Images:** `frontend/public/images/karnas-loyalty/` — `karna-scene-1.png` … `karna-scene-8.png`,
  `karna-scene-9-seal.png`, plus a duplicate `scene-01.png` added only to satisfy the
  Library cover convention (see above; newer stories avoid the duplicate by naming
  scene 1's file `scene-01.png` in the first place)
- **Scenes (9):** 7 narration (The River Child · The Tournament · The Gift of a Kingdom ·
  What Karna Knows · Krishna Comes · The Answer · The Field of Kurukshetra),
  1 interactive (The Pause, **with** an image — unusual), 1 seal
- **Extra:** has `reflection_questions` (4 questions) set by
  `backend/add_reflection_questions_karnas_loyalty.sql`, which enables the app's
  "Reflect" screen after the last scene

#### 3. Eklavya's Thumb — `eklavyas-thumb`

- **Lesson:** Your talent is yours — no one can take it unless you let them.
- **Seed:** `backend/seed_scenes_eklavyas_thumb.sql` — **canonical template for new stories**
- **Images:** `frontend/public/images/eklavyas-thumb/` — `scene-01.png`,
  `eklavya-scene-2.png` … `eklavya-scene-7.png` (7 files; the interactive and seal
  scenes have no image)
- **Scenes (9):** 6 narration (The Boy Who Taught Himself · Better Than the Best ·
  The Unfair Price · What Was Really Lost · It Happens Today Too · The Question),
  1 interactive (What Would You Do?, no image), 1 closing narration
  (Eklavya's Real Legacy, uses `eklavya-scene-7.png`), 1 seal (no image)
- **No `reflection_questions` yet** — the interactive scene carries the reflection
  content inline instead
- **Status note:** a replacement for `eklavya-scene-4.png` (hand without visible
  thumb) may arrive later; swap the file, keep the filename

---

## Local development

1. **Database** — schema already applied in production Supabase. For a fresh project,
   run `backend/supabase_migration.sql` then the seed files in the SQL Editor.
2. **Backend**
   ```bash
   cd backend
   npm install
   npm run dev        # http://localhost:3001
   ```
   Requires `backend/.env` with `SUPABASE_URL` and `SUPABASE_ANON_KEY`
   (never committed; `.gitignore` covers it).
   Health check: http://localhost:3001/health → `{"status":"ok"}`
3. **Frontend**
   ```bash
   cd frontend
   npm install
   npm run dev        # http://localhost:5173, proxies /api → localhost:3001
   ```
