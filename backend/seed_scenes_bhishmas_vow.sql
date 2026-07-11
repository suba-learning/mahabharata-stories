-- ============================================================
-- Mahabharata Stories — Full Scene Seed (Bhishma's Vow)
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- Safe to run multiple times — upserts story, deletes old scenes first
--
-- IMAGES: expects frontend/public/images/bhishmas-vow/ to contain
--   scene-01.png (also the Library card cover — hardcoded path)
--   bhishma-scene-2.png … bhishma-scene-7.png
-- Interactive (8) and Seal (9) scenes use NULL images, like Eklavya's Thumb.
-- ============================================================

DO $$
DECLARE
  story_uuid uuid;
BEGIN

  -- Create or update the story (published so RLS allows the anon key to read it)
  INSERT INTO stories (title, slug, lesson, is_published)
  VALUES ('Bhishma''s Vow', 'bhishmas-vow', 'A promise should serve what''s right — not replace it.', true)
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
    story_uuid, 1, 'narration', 'The Terrible Vow',
    'Long ago, a prince named Devavrata stood on a riverbank and gave up everything.

His father, King Shantanu, had fallen in love with Satyavati, a fisherman''s daughter. But her father set one condition: only HER sons could ever sit on the throne.

Devavrata was the crown prince. His children would surely fight for that throne one day.

So, to make his father happy, he made two promises before the gods:

"I will never take the throne. I will never marry, and never have children. And I will serve whoever sits on the throne of Hastinapur — for as long as I live."

The heavens themselves showered flowers. From that day, he was called Bhishma — "he of the terrible vow."',
    'scene-01.png', '12'
  );

  -- Scene 2
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 2, 'narration', 'A Vow Made of Love',
    'Understand this: when Bhishma made his vow, it was beautiful.

It was a son''s gift to his father. It ended a quarrel before it could begin. It kept the kingdom at peace.

His father, overwhelmed, gave him a rare blessing in return: Bhishma could choose the moment of his own death. Nothing could kill him until he allowed it.

And Bhishma became the great guardian of Hastinapur. For decades he protected the throne, trained the princes, and held the kingdom together through storm after storm.

The vow worked — because the vow had a purpose: to keep the kingdom safe and united.

Remember that purpose. Bhishma, slowly, forgot it.',
    'bhishma-scene-2.png', '12'
  );

  -- Scene 3
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 3, 'narration', 'The Throne Changes Hands',
    'Kings died. Generations passed. And the throne of Hastinapur passed into weaker and weaker hands.

Finally it came to the blind king Dhritarashtra — and his eldest son Duryodhana, a prince eaten alive by jealousy.

Duryodhana cheated his cousins, the Pandavas, out of their kingdom. He humiliated them. He plotted to burn them alive in a house of lac.

Bhishma saw ALL of it. He was the eldest, the wisest, the most feared warrior alive. One word from him could have stopped everything.

But he had made a vow: serve whoever sits on the throne.

And so the guardian of Hastinapur guarded... whatever the throne became.',
    'bhishma-scene-3.png', '12'
  );

  -- Scene 4
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 4, 'narration', 'The Silence in the Hall',
    'Then came the darkest day of all.

Duryodhana lured the Pandavas into a rigged game of dice. They lost everything — their kingdom, their freedom, and finally their wife, Draupadi.

She was dragged into the royal hall and humiliated in front of everyone.

She turned to the elders and asked one burning question: "Where is dharma? Where is justice in this hall?"

The mightiest warrior in the world sat right there.

Bhishma lowered his head and said: "The ways of dharma are subtle... I am bound to the throne."

The man who could have stopped it all — hid behind his vow.',
    'bhishma-scene-4.png', '12'
  );

  -- Scene 5
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 5, 'narration', 'The Cage He Built',
    'That night, and many nights after, Bhishma knew.

He knew Duryodhana was wrong. He knew the Pandavas were wronged. He knew the kingdom was rotting from the top.

But every time his heart said "act," his vow answered "you cannot."

Here is the strange thing: the vow had been made to PROTECT the kingdom.

Now the kingdom was being destroyed — and the vow protected only the men destroying it.

The promise was still standing. Its purpose was long dead.

A vow made from love had become a cage. And Bhishma had built it himself, one unbreakable word at a time.',
    'bhishma-scene-5.png', '12'
  );

  -- Scene 6
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 6, 'narration', 'Fighting for the Wrong Side',
    'The great war of Kurukshetra came, as everyone knew it would.

On one side stood the Pandavas — the grandchildren Bhishma loved most, fighting to take back what was stolen from them.

On the other side stood Duryodhana — and the throne.

Bhishma strapped on his armor... and led Duryodhana''s army.

For ten days, the greatest warrior of the age fought brilliantly, unbeatably — for the side he knew was wrong, against the family he knew was right.

Not because he believed in Duryodhana.

Because he had promised.',
    'bhishma-scene-6.png', '12'
  );

  -- Scene 7
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 7, 'narration', 'The Bed of Arrows',
    'On the tenth day, Bhishma finally fell — pierced by so many arrows that when he dropped from his chariot, his body never touched the ground.

He lay on a bed of arrows, using his father''s old blessing to hold death away, watching the war he could have prevented burn everything his vow was meant to protect.

The princes he had raised gathered around him. And from that bed, the old guardian finally spoke freely — teaching them everything about duty, justice, and kingship that he had kept silent for too long.

He had kept his promise perfectly, to the very end.

And the kingdom it was meant to protect lay in ruins around him.

The vow survived. The purpose did not.',
    'bhishma-scene-7.png', '12'
  );

  -- Scene 8 — Interactive ("The Pause")
  -- NOTE: the scenes table has no structured columns for question/options/
  -- reflections/parent_prompt, so the interactive content is embedded as
  -- formatted narration text. Renders as static text until interactive UI exists.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 8, 'interactive', 'The Pause',
    'Bhishma kept his vow even when the throne turned cruel. What do you think he should have done?

A) "He was right. A promise is a promise — especially one made before the gods."
Keeping your word matters, and Bhishma''s honor was legendary. But ask yourself: by the end, WHO was his vow actually protecting? When keeping a promise destroys everything the promise was made for — is that still keeping it?

B) "He should have broken the vow the moment the throne turned wicked."
Maybe. But be careful — would you trust someone who breaks their promises whenever "things change"? Everyone who breaks their word says the circumstances demanded it. How do you tell the difference?

C) "He could have kept the vow but refused the silence — spoken up, refused to fight."
Look closely: his vow said SERVE the throne. Did it ever say "approve of everything"? Did it say "stay silent while Draupadi is humiliated"? Perhaps the vow was never the cage — perhaps he hid inside it.

D) "The real mistake was making a FOREVER promise with no way out."
That might be the deepest answer. Some promises are too absolute for a changing world. Before you promise "always" or "never" — ask what happens if everything changes.

Now think about your own life. Is there a rule you follow just because "that''s how it''s always been done" — at home, at school, in your games? Do you remember what the rule was FOR?

For parents: Share a time when a rule or process at your work outlived its purpose — "we''ve always done it this way" — and what it cost. Did you follow it, question it, or change it? Let your child hear how you decided.',
    NULL, '12'
  );

  -- Scene 9 — The Seal
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 9, 'seal', 'The Seal',
    'A promise is sacred. Keeping it needs wisdom.',
    NULL, '12'
  );

END $$;
