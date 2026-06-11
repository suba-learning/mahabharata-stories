-- ============================================================
-- Lock down Row Level Security: anon key becomes read-only
-- Run this in: Supabase Dashboard → SQL Editor → New query
--
-- After this runs, the anon key (used by the backend) can only
-- SELECT published content. Future seeding/admin writes must use
-- the service_role key or the SQL Editor.
-- ============================================================

ALTER TABLE stories ENABLE ROW LEVEL SECURITY;
ALTER TABLE scenes ENABLE ROW LEVEL SECURITY;

-- Drop any pre-existing policies with these names (safe re-run)
DROP POLICY IF EXISTS "Public read published stories" ON stories;
DROP POLICY IF EXISTS "Public read scenes of published stories" ON scenes;

-- Anyone may read published stories
CREATE POLICY "Public read published stories"
  ON stories FOR SELECT
  USING (is_published = true);

-- Anyone may read scenes belonging to published stories
CREATE POLICY "Public read scenes of published stories"
  ON scenes FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM stories
      WHERE stories.id = scenes.story_id
        AND stories.is_published = true
    )
  );

-- No INSERT/UPDATE/DELETE policies are created, so with RLS
-- enabled, all writes via the anon key are now rejected.
