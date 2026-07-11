-- ============================================================
-- Mahabharata Stories — Full Scene Seed (The Breaking of the Chakravyuha)
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- Safe to run multiple times — upserts story, deletes old scenes first
--
-- IMAGES: expects frontend/public/images/chakravyuha/ to contain
--   scene-01.png (also the Library card cover — hardcoded path)
--   abhimanyu-scene-2.png … abhimanyu-scene-7.png
-- Interactive (7) and Seal (9) scenes use NULL images.
-- ============================================================

DO $$
DECLARE
  story_uuid uuid;
BEGIN

  -- Create or update the story (published so RLS allows the anon key to read it)
  INSERT INTO stories (title, slug, lesson, is_published)
  VALUES ('The Breaking of the Chakravyuha', 'chakravyuha', 'Never enter without knowing the way out — enthusiasm cannot replace a complete plan.', true)
  ON CONFLICT (slug) DO UPDATE
    SET title = EXCLUDED.title,
        lesson = EXCLUDED.lesson,
        is_published = EXCLUDED.is_published;

  SELECT id INTO story_uuid FROM stories WHERE slug = 'chakravyuha';

  -- Clear existing scenes for this story
  DELETE FROM scenes WHERE story_id = story_uuid;

  -- Scene 1
  -- NOTE: image_filename is 'scene-01.png' (not 'abhimanyu-scene-1.png') because
  -- the Library page hardcodes /images/<slug>/scene-01.png as the cover image.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 1, 'narration', 'A Lesson Before Birth',
    'This story begins before its hero was even born.

One quiet evening, the great warrior Arjuna sat with his wife Subhadra, who was expecting their child. To pass the time, he began describing one of war''s deepest secrets: the Chakravyuha — a deadly battle formation shaped like a spinning wheel, with walls of warriors turning in circles within circles.

"Here is how a warrior breaks into it," Arjuna said, and step by step, he explained the way in.

Inside her, their unborn son listened. The old books say he heard every word — and remembered.

But as Arjuna reached the second half of the secret — the way OUT of the wheel — Subhadra drifted off to sleep. The telling stopped. The lesson ended at its halfway point.

The way in, without the way out.

No one thought it would ever matter.',
    'scene-01.png', '12'
  );

  -- Scene 2
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 2, 'narration', 'The Brightest Star',
    'The boy was named Abhimanyu, and he grew like a flame.

Son of Arjuna, nephew of Krishna himself, he seemed to have been born already knowing things that took others a lifetime. The bow obeyed him. Horses trusted him. Older warriors watched him train and shook their heads in wonder.

By sixteen, people said he might one day outshine even his father.

He was brave, brilliant, and beloved.

And somewhere deep in his memory, from before his first breath, he carried half of a terrible secret — and all of the confidence of someone who has never yet needed the missing half.',
    'abhimanyu-scene-2.png', '12'
  );

  -- Scene 3
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 3, 'narration', 'The Spinning Trap',
    'Then came the great war at Kurukshetra.

On the thirteenth day, the enemy commander Drona arranged his army into the Chakravyuha — the spinning wheel of warriors. Rank upon rank, wheel within wheel, thousands of soldiers rotating like the gears of a machine built to swallow armies whole.

In the entire Pandava camp, only one warrior fully knew its secret: Arjuna. The way in AND the way out.

So the enemy made a plan of their own. That morning, they lured Arjuna into a battle far, far away on the other side of the field.

And as the deadly wheel began to turn, the Pandava elders looked at each other and realized the truth:

The only person left who could break the Chakravyuha was a sixteen-year-old boy.

And he only knew half the secret.',
    'abhimanyu-scene-3.png', '12'
  );

  -- Scene 4
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 4, 'narration', 'The Half-Open Door',
    'Abhimanyu did not hide what he did not know.

"I can break into the wheel," he told his uncles. "My father''s telling stopped there. I have never learned the way out."

The elders had a ready answer. "Just open the door, brave one. Break the wall — and we will be right behind you. We will guard your back and cut the way out ourselves."

It sounded like a plan. It was really an assumption.

Nobody asked: what if the door closes behind him? Nobody asked: what is the backup if we cannot follow? The army''s entire hope now rested on one boy, one gap in the wall, and one giant IF.

Abhimanyu tightened his armor, touched his elders'' feet, and smiled.

Enthusiasm filled the morning. It felt almost like a strategy.',
    'abhimanyu-scene-4.png', '12'
  );

  -- Scene 5
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 5, 'narration', 'Alone Inside',
    'Abhimanyu struck the wheel like lightning.

The wall of warriors cracked open — he had done it! Sixteen years old, and he had broken a formation that terrified veterans of a hundred battles.

But behind him, the trap snapped shut. The enemy king Jayadratha slammed the gap closed, holding back all the uncles, all the elders, all the help that was supposed to follow.

The plan had lasted less than a minute.

Inside the spinning wheel, Abhimanyu fought as no one had ever fought — one boy against the greatest warriors of the age. Even his enemies'' hearts shook at his brilliance. He fought on when his chariot broke, when his bow shattered, when everything was gone.

But no one was coming, and there was no way out — because no one had ever taught him one.

The wheel closed over the brightest star of his generation.

He never walked out of it.',
    'abhimanyu-scene-5.png', '12'
  );

  -- Scene 6
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 6, 'narration', 'It Happens Today Too',
    'This did not stay on an ancient battlefield.

It happens wherever everything depends on one person — and nobody has a plan for the day that person isn''t there.

A group project where only one student understands how the whole thing actually works. When she''s sick on presentation day, the project collapses.

A team where one player calls all the plays. A family where only one person knows where the important things are. A company where a single engineer is the only one who understands the system everyone depends on — until the day they leave.

And it happens inside each of us, too: the thrill of diving into something big and exciting — a competition, a project, a promise — with no idea how we''ll get out the other side.

The way in, without the way out.

The Chakravyuha is not just an ancient formation. It spins quietly through classrooms, teams, and workplaces every single day.',
    'abhimanyu-scene-6.png', '12'
  );

  -- Scene 7 — Interactive ("What Would You Do?")
  -- NOTE: the scenes table has no structured columns for question/options/
  -- reflections/parent_prompt, so the interactive content is embedded as
  -- formatted narration text. Renders as static text until interactive UI exists.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 7, 'interactive', 'What Would You Do?',
    'Your robotics team''s big competition is next week. Only one teammate, Maya, understands how the robot''s code works — she built it alone because she''s the fastest. Someone says: "Let her just finish it herself. Teaching the rest of us would waste time." What do you do?

A) "Agree — let Maya finish alone. It''s the fastest way to win."
Fast, yes. But you''ve just built a Chakravyuha around your whole team. If Maya is sick on competition day, the wheel closes — and nobody inside knows the way out.

B) "Ask Maya to write everything down — after the competition."
Better than nothing. But ''after'' has a way of never arriving. And notes on a page are like Arjuna''s half-story: hearing the way in is not the same as having walked it.

C) "Slow down now: Maya teaches two teammates how the code works, even if it costs a practice day."
This is the hardest one, and the truest. It feels slower this week — and it''s the only version of the team that survives a surprise. An exit plan always looks like wasted time, right up until the moment it''s everything.

D) "Tell the coach it''s their problem to fix."
The coach can help — but a team that hands its thinking to someone else has learned nothing. The elders outside the wheel were sure someone else would handle it, too.

Have you ever rushed into something exciting with no idea how you''d finish it? And is there something right now that only YOU know how to do — that someone else should learn?

For parents: Share a "bus factor" story from YOUR work or home — a time when only one person knew how something critical worked, and they left, burned out, or fell ill. What did it cost, and what do you do differently now?',
    NULL, '12'
  );

  -- Scene 8
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 8, 'narration', 'What the Wheel Teaches',
    'That evening, when Arjuna returned and learned what had happened, his grief shook the battlefield. The war would never be the same again.

But across the centuries, Abhimanyu''s story has never been told as a story of failure. He is remembered as the bravest of the brave — the boy who did the impossible with only half a map.

Because courage was never what failed that day.

The plan failed. The plan that lived in only one head. The secret that was never fully taught. The assumption that help would always arrive. The door with no way back.

So the wheel leaves us with two lessons, spinning together like the formation itself:

Never enter something big without knowing how you''ll get out.

And never let something important live in only one person''s head — including yours. Teach it. Share it. Finish the telling.

Abhimanyu deserved the whole secret. So does everyone who depends on you.',
    'abhimanyu-scene-7.png', '12'
  );

  -- Scene 9 — The Seal
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 9, 'seal', 'The Seal',
    'Never enter without knowing the way out — enthusiasm cannot replace a complete plan.',
    NULL, '12'
  );

END $$;
