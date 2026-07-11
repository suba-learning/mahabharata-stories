-- ============================================================
-- Add reflection questions to The Breaking of the Chakravyuha
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- (Without these, the closing screen shows no questions.)
-- ============================================================

UPDATE stories
SET reflection_questions = '[
  "Abhimanyu knew the way in but not the way out. Have you ever rushed into something exciting before knowing how you would finish it?",
  "The elders'' whole plan was ''we''ll be right behind you.'' What questions should they have asked BEFORE the battle began — not during it?",
  "Is there something important that only one person knows how to do — in your class, your team, or your family? What would happen if that person weren''t there tomorrow?",
  "Courage was not what failed inside the wheel. What is the difference between being brave and being ready?"
]'::jsonb
WHERE slug = 'chakravyuha';
