-- ============================================================
-- Mahabharata Stories — Full Scene Seed (Eklavya's Thumb)
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- Safe to run multiple times — upserts story, deletes old scenes first
-- ============================================================

DO $$
DECLARE
  story_uuid uuid;
BEGIN

  -- Create or update the story (published so RLS allows the anon key to read it)
  INSERT INTO stories (title, slug, lesson, is_published)
  VALUES ('Eklavya''s Thumb', 'eklavyas-thumb', 'Your talent is yours — no one can take it unless you let them.', true)
  ON CONFLICT (slug) DO UPDATE
    SET title = EXCLUDED.title,
        lesson = EXCLUDED.lesson,
        is_published = EXCLUDED.is_published;

  SELECT id INTO story_uuid FROM stories WHERE slug = 'eklavyas-thumb';

  -- Clear existing scenes for this story
  DELETE FROM scenes WHERE story_id = story_uuid;

  -- Scene 1
  -- NOTE: image_filename is 'scene-01.png' (not 'eklavya-scene-1.png') because
  -- the Library page hardcodes /images/<slug>/scene-01.png as the cover image.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 1, 'narration', 'The Boy Who Taught Himself',
    'In a forest far from any palace, lived a boy named Eklavya, son of the Nishada chieftain Hiranyadhanu.

He watched the princes of Hastinapura train under the great teacher Dronacharya, and something in him ached to learn archery too.

He walked to the guru''s school and asked to be his student.

Dronacharya looked at him and said no. Eklavya was not a prince. He was not born to the right family.

Eklavya did not argue. He walked back into the forest, gathered clay, and shaped it into a statue of Dronacharya.

Every day, he stood before that silent clay teacher, bow in hand, and practiced as if his guru stood there in the flesh.',
    'scene-01.png', '12'
  );

  -- Scene 2
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 2, 'narration', 'Better Than the Best',
    'Years passed. Eklavya''s arrows found their mark before his mind even finished the thought.

One day, a dog wandered into the forest, barking at the strange sight of a boy shooting alone before a statue.

Eklavya did not want to hurt it. Without looking, he loosed a rapid volley of arrows that filled the dog''s mouth — snug, harmless, silencing the bark completely.

The dog ran back to the Pandava princes, who were hunting nearby. They stared, stunned. No one they knew could shoot like that. Not even Arjuna, whom Dronacharya called his finest student.

They followed the frightened dog back into the forest — and found Eklavya, bowing before a clay statue, calling it ''Guru.''',
    'eklavya-scene-2.png', '12'
  );

  -- Scene 3
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 3, 'narration', 'The Unfair Price',
    'Arjuna could not accept what he had seen. He went straight to Dronacharya. ''You promised me I would be the greatest archer in the world,'' he said. ''But there is a boy in the forest greater than me — and he says you are his teacher.''

Dronacharya walked into the forest to see for himself.

Eklavya recognized him at once and ran forward, overjoyed. He touched his guru''s feet and welcomed him as if a dream had come true.

''You have taught me everything I know,'' Eklavya said. ''Ask me for anything, and it is yours. That is what a guru is owed.''

Dronacharya looked at the boy''s bow, at his impossible skill, at the promise he had made to another student.

Then he said, ''If I am truly your guru, give me my gurudakshina. Give me your right thumb.''',
    'eklavya-scene-3.png', '12'
  );

  -- Scene 4
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 4, 'narration', 'What Was Really Lost',
    'Eklavya did not hesitate.

He raised a blade, and without a flicker of anger or protest, cut off his own thumb, and placed it in his guru''s open hand.

He smiled through the pain, still proud to have given his teacher what was asked.

But something else was taken that day, something the story rarely names out loud.

Eklavya was never unfair to anyone. He built his own path, practiced harder than anyone, and earned every bit of his skill through devotion no one gave him — and it was taken from him simply because his greatness was inconvenient to someone else''s plan.

He never shot an arrow the same way again.',
    'eklavya-scene-4.png', '12'
  );

  -- Scene 5
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 5, 'narration', 'It Happens Today Too',
    'This did not stay in the forest, or in one story from long ago.

It happens in classrooms, in teams, in friend groups — wherever talent shows up in someone who doesn''t seem to ''belong.''

A new kid has the best idea, but the group already has its favorites.

A quiet student solves the hardest problem, but the credit quietly slides to someone else.

Someone works twice as hard for half the recognition, because of where they come from, or who they know, or what they look like.

Eklavya''s story is not just an old legend. It is a mirror.',
    'eklavya-scene-5.png', '12'
  );

  -- Scene 6
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 6, 'narration', 'The Question',
    'So here is the question worth sitting with:

Was it Eklavya''s thumb that Dronacharya really wanted? Or was it something else — a way to make sure the ''right'' student stayed on top?

Talent threatened the plan. So the plan found a price for it.

Eklavya paid that price without complaint. But the world lost an archer greater than any it would ever see again.

What would you have done, in his place — or in Dronacharya''s?',
    'eklavya-scene-6.png', '12'
  );

  -- Scene 7 — Interactive ("What Would You Do?")
  -- NOTE: the scenes table has no structured columns for question/options/
  -- reflections/parent_prompt, so the interactive content is embedded as
  -- formatted narration text. Renders as static text until interactive UI exists.
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 7, 'interactive', 'What Would You Do?',
    'A new student joins your school project group. They''re not your friend, but their ideas are clearly the best. Your best friend feels threatened and wants you to ignore the new student''s ideas and present your friend''s weaker plan instead. What do you do?

A) "Go along with your friend — loyalty matters most."
Loyalty feels safe, but ask yourself: whose feelings are you protecting, and whose ideas are you burying to do it?

B) "Secretly use the new student''s ideas without crediting them."
This gets the best plan on the table — but at the cost of honesty. It''s Dronacharya''s move all over again: taking the value, denying the person credit.

C) "Speak up and suggest the group uses the best ideas, whoever they come from."
This is the hardest option, and the fairest one. It risks your friend''s feelings to do right by someone who earned it.

D) "Stay quiet and let the group decide on their own."
Staying silent feels neutral, but silence usually protects whoever already has the most power in the room.

Have you ever seen someone talented get overlooked because they weren''t in the "right group"? What did you do — or wish you had done?

For parents: Share a time YOU saw someone''s talent get overlooked — and what you did, or wish you had done, about it.',
    NULL, '12'
  );

  -- Scene 8
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 8, 'narration', 'Eklavya''s Real Legacy',
    'Eklavya could no longer draw a bow the way he once did. But he did not disappear from the story in defeat.

He kept practicing, adapting to the fingers that remained, refusing to let one loss define an entire life of discipline.

In later parts of the epic, he is remembered as a warrior of extraordinary skill and unmatched resolve — proof that his gift was never really about one thumb.

Centuries later, people still tell his story — not Dronacharya''s justification, not Arjuna''s jealousy, but Eklavya''s devotion.

His name has outlived the excuse that was used against him.',
    'eklavya-scene-7.png', '12'
  );

  -- Scene 9 — The Seal
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 9, 'seal', 'The Seal',
    'Your talent is yours — no one can take it unless you let them.',
    NULL, '12'
  );

END $$;
