-- ============================================================
-- Add reflection questions to Karna's Loyalty
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- (Without these, ReflectionScreen crashes on a null list.)
-- ============================================================

UPDATE stories
SET reflection_questions = '[
  "Karna knew Duryodhana was often wrong, but stayed. Is staying silent beside a friend who does wrong really loyalty — or something else?",
  "Has someone ever been kind to you when no one else was? What do you feel you owe them?",
  "If that person started doing something wrong, what would you do?",
  "Karna chose gratitude over victory — and paid for it. What would you have chosen, and what would it have cost you?"
]'::jsonb
WHERE slug = 'karnas-loyalty';
