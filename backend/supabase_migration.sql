-- ============================================================
-- Mahabharata Stories — Day 1 Migration + Seed
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- ============================================================

-- 1. Create stories table
CREATE TABLE IF NOT EXISTS stories (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title        text NOT NULL,
  slug         text NOT NULL UNIQUE,
  lesson       text,
  is_published boolean NOT NULL DEFAULT false
);

-- 2. Create scenes table
CREATE TABLE IF NOT EXISTS scenes (
  id             uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  story_id       uuid NOT NULL REFERENCES stories(id) ON DELETE CASCADE,
  "order"        integer NOT NULL,
  scene_type     text NOT NULL CHECK (scene_type IN ('narration', 'interactive', 'seal')),
  title          text,
  narration      text,
  image_filename text,
  age_group      text NOT NULL DEFAULT '12'
);

-- 3. Seed the story
INSERT INTO stories (title, slug, lesson, is_published)
VALUES (
  'The Bird''s Eye Test',
  'birds-eye-test',
  'Focus on your goal, not the distractions around it.',
  true
);

-- 4. Seed Scene 1  (references the story we just inserted)
INSERT INTO scenes (story_id, "order", scene_type, title, narration, age_group)
VALUES (
  (SELECT id FROM stories WHERE slug = 'birds-eye-test'),
  1,
  'narration',
  'The Forest Classroom',
  'Deep in the forest, where sunlight fell like gold between ancient trees, Guru Dronacharya gathered his students. The air was still. The princes stood in a line, bows in hand, waiting.',
  '12'
);
