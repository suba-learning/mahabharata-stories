-- ============================================================
-- Mahabharata Stories — Full Scene Seed (Karna's Loyalty)
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- Safe to run multiple times — upserts story, deletes old scenes first
-- ============================================================

DO $$
DECLARE
  story_uuid uuid;
BEGIN

  -- Create or update the story (published so RLS allows the anon key to read it)
  INSERT INTO stories (title, slug, lesson, is_published)
  VALUES ('Karna''s Loyalty', 'karnas-loyalty', 'Choose your circle wisely', true)
  ON CONFLICT (slug) DO UPDATE
    SET title = EXCLUDED.title,
        lesson = EXCLUDED.lesson,
        is_published = EXCLUDED.is_published;

  SELECT id INTO story_uuid FROM stories WHERE slug = 'karnas-loyalty';

  -- Clear existing scenes for this story
  DELETE FROM scenes WHERE story_id = story_uuid;

  -- Scene 1
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 1, 'narration', 'The River Child',
    'Long before the great war, a tiny basket drifted down a river at dawn.

Inside lay a newborn baby, born with golden armor on his chest — a gift from the Sun God himself.

A charioteer named Adhiratha found him, and he and his wife Radha raised the boy with all the love in the world. They named him Karna.

He grew gifted beyond any prince. But the world only ever saw one thing: a charioteer''s son.',
    'karna-scene-1.png', '12'
  );

  -- Scene 2
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 2, 'narration', 'The Tournament',
    'Years later, the kingdom held a grand tournament. The princes showed their skills, and Arjuna shone brightest of all.

Then a stranger stepped into the arena.

Karna.

He matched Arjuna shot for shot. The crowd gasped.

But before he could finish, a voice rang out: "Who is your father? What is your lineage?"

Karna''s head dropped. He had no royal name to give.

The arena fell into murmurs. Some mocked him. Some looked away.',
    'karna-scene-2.png', '12'
  );

  -- Scene 3
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 3, 'narration', 'The Gift of a Kingdom',
    'Then one prince stood up.

Duryodhana walked straight to Karna, in front of everyone, and said: "If they will not let you compete because you are not a king — then I make you one."

Right there, he crowned Karna king of Anga.

Whether from friendship, pride, or strategy — Duryodhana gave Karna what no one else had given him: respect.

The murmurs stopped. Karna''s eyes filled with tears.

For the first time in his life, someone had stood up for him.',
    'karna-scene-3.png', '12'
  );

  -- Scene 4
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 4, 'narration', 'What Karna Knows',
    'Years passed. Karna stayed by Duryodhana''s side — through everything.

And slowly, Karna saw who his friend really was.

He saw the jealousy. The scheming. The cruelty toward the Pandavas.

Karna was not blind. Deep down, he knew his friend was often wrong.

But Duryodhana was the only one who had ever chosen him.

So Karna stayed.',
    'karna-scene-4.png', '12'
  );

  -- Scene 5
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 5, 'narration', 'Krishna Comes',
    'Before the great war began, Krishna came to see Karna alone, by the river.

And he told Karna a secret that changed everything:

"You are not a charioteer''s son. You are the eldest brother of the Pandavas. Come to their side — you will be honored as the eldest, and the throne can be yours."

Karna closed his eyes and listened.

Everything he had ever wanted was being offered to him.',
    'karna-scene-5.png', '12'
  );

  -- Scene 6
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 6, 'narration', 'The Answer',
    'Karna opened his eyes.

And he said no.

"When the whole world laughed at me, Duryodhana gave me dignity. He stood by me when no one else would. How can I leave him now — when he needs me most?"

Karna knew the war was coming. He knew which side would win.

He chose to stay anyway.',
    'karna-scene-6.png', '12'
  );

  -- Scene 7
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 7, 'narration', 'The Field of Kurukshetra',
    'The great war came, just as Karna knew it would.

He fought with courage and skill.

He was not perfect — he had stood beside Duryodhana through wrongs he should have stopped.

But he did not run from the choice he had made.

He stood by it until the very end.',
    'karna-scene-7.png', '12'
  );

  -- Scene 8 — Interactive ("The Pause")
  -- NOTE: the scenes table has no structured columns for question/options/
  -- reflections/parent_prompt, so the interactive content is embedded as
  -- formatted narration text. Renders as static text until interactive UI exists.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 8, 'interactive', 'The Pause',
    'Karna knew Duryodhana was often wrong. But Duryodhana was the only one who ever stood up for him. What do you think Karna should have done?

A) "Stay loyal. Duryodhana earned it."
Loyalty is precious — Karna''s gratitude was real. But here''s the hard question: if your friend is doing something wrong, is staying silent beside them really loyalty? Or is it something else?

B) "Leave. His family and the right side mattered more."
Maybe. But remember — the Pandavas never stood up for Karna when he needed it. Duryodhana did. Is it fair to leave the one person who chose you, just because a better offer came along?

C) "Stay with Duryodhana, but speak up against his wrongs."
This might be the hardest path of all. Karna may have known the truth — but knowing is not the same as changing someone. What do you do when the friend you love won''t hear you?

D) "There was no right answer."
You might be right. Some choices have no clean answer — only costs. Karna chose gratitude over victory, and he paid for it. The question is: what would YOU have paid?

Think about your own circle. Has someone ever been kind to you when no one else was? And here''s the harder question — if that person started doing something wrong, what would you do?

For parents: Share a time YOU stayed loyal to someone — or walked away. Let your child hear that you''ve faced this too.',
    'karna-scene-8.png', '12'
  );

  -- Scene 9 — The Seal
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 9, 'seal', 'The Seal',
    'Gratitude is noble. Loyalty needs wisdom.',
    'karna-scene-9-seal.png', '12'
  );

END $$;
