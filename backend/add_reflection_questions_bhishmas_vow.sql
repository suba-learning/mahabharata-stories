-- ============================================================
-- Add reflection questions to Bhishma's Vow
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- (Without these, ReflectionScreen crashes on a null list.)
-- ============================================================

UPDATE stories
SET reflection_questions = '[
  "Bhishma''s vow began as a beautiful gift to his father. At what moment do you think it stopped helping and started hurting?",
  "Is there a rule you follow just because ''it''s always been that way''? Do you know what the rule was originally for?",
  "Bhishma stayed silent in the hall because of his vow. Can keeping a promise ever become an excuse for not doing what''s right?",
  "If you had to make a promise that lasts forever, how would you word it so it could never turn against the very thing it was meant to protect?"
]'::jsonb
WHERE slug = 'bhishmas-vow';
