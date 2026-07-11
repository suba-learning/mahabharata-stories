-- ============================================================
-- Add reflection questions to Eklavya's Thumb
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- (Without these, ReflectionScreen crashes on a null list.)
-- Written to match the live telling (talent, fairness, gatekeeping).
-- ============================================================

UPDATE stories
SET reflection_questions = '[
  "Eklavya was turned away, but taught himself anyway. Have you ever kept working at something after someone told you no?",
  "Dronacharya asked for Eklavya''s thumb to protect the promise he had made to Arjuna. Was there a fairer choice he could have made?",
  "Have you ever seen someone talented get overlooked because they weren''t in the ''right group''? What did you do — or wish you had done?",
  "Eklavya lost his thumb, but people still tell his story thousands of years later. What is something inside you that no one can ever take away?"
]'::jsonb
WHERE slug = 'eklavyas-thumb';
