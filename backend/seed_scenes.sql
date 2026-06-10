-- ============================================================
-- Mahabharata Stories — Full Scene Seed (Birds Eye Test)
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- Safe to run multiple times — deletes old scenes first
-- ============================================================

DO $$
DECLARE
  story_uuid uuid;
BEGIN

  SELECT id INTO story_uuid FROM stories WHERE slug = 'birds-eye-test';

  -- Clear existing scenes for this story
  DELETE FROM scenes WHERE story_id = story_uuid;

  -- Scene 1
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 1, 'narration', 'The Forest Classroom',
    'Long ago, deep in a forest that smelled of rain and earth, there was no school with walls or benches.

There was just a clearing. Some trees. And one teacher.

His name was Dronacharya.

He was the greatest archery teacher in the land. Kings sent their sons to him. Not to sit and read. But to learn by doing.

His students were princes. Some wore white. Some wore black. All of them were talented. All of them wanted to be the best.

But Dronacharya knew — talent is not enough.

He had one lesson left to teach them. And today was the day.',
    'scene-01.png', '12'
  );

  -- Scene 2
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 2, 'narration', 'The Announcement',
    'One morning, Dronacharya walked into the clearing carrying something small in his hand.

A parrot.

But not a real one. A wooden parrot, painted bright green, with a tiny red beak.

The princes looked at each other. What is this?

Dronacharya smiled — the kind of smile that meant something interesting was about to happen.

"Today," he said quietly, "is a test."

Every prince stood up straight immediately.

"I am going to place this parrot on that branch." He pointed to a tree at the edge of the clearing. "One by one, you will raise your bow. You will aim. But before you release your arrow — I will ask you a question."

He paused.

"Answer honestly. Then shoot."',
    'scene-02.png', '12'
  );

  -- Scene 3
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 3, 'narration', 'The Parrot on the Branch',
    'Dronacharya walked slowly to the tree.

He reached up and placed the little green parrot on a branch — not too high, not too low. Just right.

The princes watched in silence.

The parrot sat there, small and still, its tiny painted eye catching the light.

Dronacharya walked back and stood before them.

"Who is first?"',
    'scene-03.png', '12'
  );

  -- Scene 4
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 4, 'narration', 'The Question',
    'One by one, the princes stepped forward.

Each one raised his bow. Drew back the arrow. Took aim.

And each time, Dronacharya asked the same question.

"Tell me — what do you see?"

The first prince looked carefully. "I see the parrot, Guruji. And the branch. And the tree. And the sky behind it."

Dronacharya nodded slowly. "Put down your bow. Step aside."

The next prince stepped up. "I see the forest. The parrot is sitting in the middle of it. It''s a beautiful—"

"Put down your bow."

Another prince. "I see you, Guruji. And the other princes watching me. And the parrot, of course, and—"

"Step aside."

One after another. All of them saw many things.

The clearing was very quiet now.',
    'scene-04.png', '12'
  );

  -- Scene 5
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 5, 'narration', 'Only Arjuna Remained',
    'Then it was Arjuna''s turn.

He was not the biggest prince. He was not the loudest. But when he picked up his bow, something changed in the air.

He raised it slowly. Drew the arrow back.

His eyes didn''t move.

Dronacharya leaned forward.

"Arjuna. What do you see?"

Arjuna didn''t blink.

"The eye," he said. "I see only the eye of the bird."

Dronacharya paused. "Not the parrot?"

"No, Guruji."

"Not the branch? The tree? The sky?"

"No." Arjuna''s voice was calm and steady. "Only the eye."

Dronacharya was quiet for a long moment.

Then — "Release."

The arrow flew.

Straight. Clean. Perfect.

The parrot''s eye.',
    'scene-05.png', '12'
  );

  -- Scene 6
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 6, 'narration', 'The Lesson',
    'The forest was silent.

Then Dronacharya spoke — not loudly, but every prince heard every word.

"Did you see what just happened?"

Nobody answered.

"Every one of you looked at the whole world before you aimed. The tree. The sky. Me. Each other." He paused. "And so you were ready to shoot at everything — which means you were ready to hit nothing."

He looked at Arjuna.

"But this one saw only what mattered. One target. One eye. Everything else — disappeared."

He turned back to the group.

"This is not just archery. This is how you must approach everything important in your life."

He let that sit.

"When the goal is in front of you — what do you see?"',
    'scene-06.png', '12'
  );

  -- Scene 7 — The Seal
  INSERT INTO scenes (story_id, "order", scene_type, title, narration, image_filename, age_group)
  VALUES (
    story_uuid, 7, 'seal', 'The Seal',
    'When it matters most — see only the eye.',
    'scene-07-seal.png', '12'
  );

END $$;
