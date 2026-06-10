-- ============================================================
-- Add reflection questions to stories
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- ============================================================

ALTER TABLE stories
  ADD COLUMN IF NOT EXISTS reflection_questions jsonb;

UPDATE stories
SET reflection_questions = '[
  "The other princes saw the tree, the sky, and each other. Arjuna saw only the eye. What do you think made that so hard for everyone else?",
  "Think of something important you are working on right now. What are the \"trees and sky\" — the distractions — around your target?",
  "Dronacharya asked the princes to answer honestly before they shot. Why do you think honesty mattered as much as aim?",
  "Is there ever a time when seeing the whole picture is better than seeing only the goal? When might Arjuna''s way not be the right way?"
]'::jsonb
WHERE slug = 'birds-eye-test';
