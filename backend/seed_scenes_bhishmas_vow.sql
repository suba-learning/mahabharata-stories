-- ============================================================
-- Mahabharata Stories — Full Scene Seed (Bhishma's Vow)
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- Safe to run multiple times — upserts story, deletes old scenes first
--
-- IMAGES: expects frontend/public/images/bhishmas-vow/ to contain
--   scene-01.png (also the Library card cover — hardcoded path)
--   bhishma-scene-2.png … bhishma-scene-7.png
-- Interactive (7) and Seal (9) scenes use NULL images, like Eklavya's Thumb.
-- ============================================================

DO $$
DECLARE
  story_uuid uuid;
BEGIN

  -- Create or update the story (published so RLS allows the anon key to read it)
  INSERT INTO stories (title, slug, lesson, is_published)
  VALUES ('Bhishma''s Vow', 'bhishmas-vow', 'A promise should serve what is right — when it stops doing that, keeping it is no longer a virtue.', true)
  ON CONFLICT (slug) DO UPDATE
    SET title = EXCLUDED.title,
        lesson = EXCLUDED.lesson,
        is_published = EXCLUDED.is_published;

  SELECT id INTO story_uuid FROM stories WHERE slug = 'bhishmas-vow';

  -- Clear existing scenes for this story
  DELETE FROM scenes WHERE story_id = story_uuid;

  -- Scene 1
  -- NOTE: image_filename is 'scene-01.png' (not 'bhishma-scene-1.png') because
  -- the Library page hardcodes /images/<slug>/scene-01.png as the cover image.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 1, 'narration', 'The Prince by the River',
    'Long ago, in the kingdom of Hastinapur, there lived a prince named Devavrata — son of King Shantanu and the river goddess Ganga herself.

He was everything a kingdom could dream of. Brilliant in his studies. Unbeatable with a bow. Kind to the smallest servant and fearless before the fiercest warrior.

People would watch him ride past and say the same thing to each other, again and again:

"One day, he will be the greatest king Hastinapur has ever known."

Everyone believed it. His father believed it. Devavrata believed it too.

But the river flows where it will — and so does fate.',
    'scene-01.png', '12'
  );

  -- Scene 2
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 2, 'narration', 'The Terrible Vow',
    'One day, King Shantanu fell in love with Satyavati, a fisherman''s daughter. But her father set a hard condition: only HER sons could ever sit on the throne.

The king could not bear to take the crown from Devavrata. So he said nothing — and grew quieter and sadder each day.

When Devavrata discovered why, he went to the fisherman himself.

"I give up the throne," he said. The fisherman shook his head. "One day YOUR children may claim it back."

So the prince raised his hand and made a vow that shook the heavens:

"Then I will never marry. I will never have children. And I will serve whoever sits on the throne of Hastinapur — forever."

The sky itself rained flowers. The gods gave him a new name: Bhishma — he of the terrible vow. And his grateful father gave him a rare gift: death could never take him until he himself chose the moment.',
    'bhishma-scene-2.png', '12'
  );

  -- Scene 3
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 3, 'narration', 'The Unbreakable Guardian',
    'Decades passed. Kings came and went — his father, then younger brothers, then their sons.

Bhishma served every single one of them with perfect loyalty.

He trained the princes. He guarded the borders. He gave wise counsel. Twice the throne sat empty and was offered to him — the man everyone agreed deserved it most.

He refused. A vow was a vow.

Slowly, the vow became more than a promise. It became who he was. The one thing in the world he would never, ever question.

People stopped saying "Bhishma made a great vow."

They started saying "Bhishma IS his vow."',
    'bhishma-scene-3.png', '12'
  );

  -- Scene 4
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 4, 'narration', 'When Silence Hurt',
    'But thrones do not stay noble forever.

In time, the throne of Hastinapur passed to rulers who were jealous, cruel, and unjust. Bhishma saw it clearly — he was too wise not to.

Then came the darkest day. A rigged dice game. And Draupadi — a queen of the royal family — dragged into open court and humiliated in front of everyone, while grown men stared at the floor.

The mightiest warrior in the kingdom sat in that hall. One word from Bhishma could have stopped it all.

The word never came.

"I am bound to the throne," he said, head bowed, "whoever sits upon it."

His vow had been made to protect the kingdom. Now it was protecting the very people who were tearing the kingdom apart.',
    'bhishma-scene-4.png', '12'
  );

  -- Scene 5
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 5, 'narration', 'It Happens Today Too',
    'This did not stay in an ancient palace hall.

It happens wherever people follow a rule long after they''ve forgotten what the rule was for.

A team keeps a tradition that once brought everyone together — but now leaves someone out, every single time.

A class, a club, a family, a company keeps doing something that everyone quietly senses is wrong. Everyone waits for someone else to say it first.

And when anyone asks why, the answer is always the same:

"But we''ve always done it this way."

That sentence has protected more broken things than any army ever has.',
    'bhishma-scene-5.png', '12'
  );

  -- Scene 6
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 6, 'narration', 'The Question',
    'So here is the question worth sitting with:

Was Bhishma''s vow still protecting the kingdom — or was Bhishma protecting the vow itself?

The promise had been made to SERVE something: his father''s happiness, the kingdom''s peace, what was right. Somewhere along the way, the promise quietly took the place of the thing it was made to serve.

Rules exist for a reason. Promises exist for a purpose.

But what happens when the reason is gone, the purpose is lost — and only the rule remains, standing guard over nothing?

Bhishma never asked himself that question.

That was the real tragedy. Not that he kept his vow — but that he stopped asking what it was for.',
    'bhishma-scene-6.png', '12'
  );

  -- Scene 7 — Interactive ("What Would You Do?")
  -- NOTE: the scenes table has no structured columns for question/options/
  -- reflections/parent_prompt, so the interactive content is embedded as
  -- formatted narration text. Renders as static text until interactive UI exists.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 7, 'interactive', 'What Would You Do?',
    'Your friend group made a pact at the start of the year: "we always sit together at lunch, no outsiders." Months later, a new student is eating alone every day and clearly needs a friend. Some of the group say the pact is the pact. What do you do?

A) "Keep the pact — a promise is a promise, no exceptions."
Promises matter, and keeping your word is a real strength. But ask yourself: what was the pact FOR? Bhishma kept his promise perfectly, to the very end — and look what it ended up protecting.

B) "Secretly talk to the new student outside lunch, but keep the pact publicly."
That kindness is real — but it hides. The new student still eats alone at the table where it matters most, and the broken rule stays safely unquestioned.

C) "Tell the group the pact was made to bring us together, not to shut someone out — and invite the new student."
This is the hardest one, and the truest. It honors what the pact was FOR instead of what it SAYS. That''s the question Bhishma never asked out loud.

D) "Wait for a teacher or someone else to fix it."
Waiting feels safe. But remember the hall of Hastinapur — the silence of the strongest person in the room is exactly what lets the wrong thing continue.

Have you ever kept following a rule or promise even after you felt it was doing more harm than good? What made it hard to change?

For parents: Share a time YOU followed a rule at work or home long after it stopped making sense — "because we''ve always done it this way." What did it cost, and what finally made you change it?',
    NULL, '12'
  );

  -- Scene 8
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 8, 'narration', 'Wisdom on the Bed of Arrows',
    'The great war came, as it had to. And at its end, Bhishma lay on a bed of arrows on the battlefield — kept alive by his father''s long-ago gift, waiting for the moment he would choose to let go.

And there, something remarkable happened.

For the first time in his long life, Bhishma spoke completely freely.

Day after day, kings and princes from both sides of the war gathered around him, and he poured out everything he had learned — about duty, about kingship, about justice, about mercy.

And about his own vow. What it had given him. And honestly, openly, what it had cost.

In the end, his greatest gift to the world was not his loyalty.

It was his wisdom — including the hardest wisdom of all: knowing where he had gone wrong, and saying it out loud so others would not have to learn it the same way.',
    'bhishma-scene-7.png', '12'
  );

  -- Scene 9 — The Seal
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 9, 'seal', 'The Seal',
    'A promise should serve what is right — when it stops doing that, keeping it is no longer a virtue.',
    NULL, '12'
  );

END $$;
