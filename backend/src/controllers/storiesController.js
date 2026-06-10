import { supabase } from '../supabase.js'

export async function listStories(_req, res) {
  const { data: stories, error } = await supabase
    .from('stories')
    .select('id, title, slug, lesson')
    .eq('is_published', true)
    .order('title', { ascending: true })

  if (error) {
    return res.status(500).json({ error: error.message })
  }

  res.json(stories)
}

export async function getStoryBySlug(req, res) {
  const { slug } = req.params

  const { data: story, error } = await supabase
    .from('stories')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error || !story) {
    return res.status(404).json({ error: 'Story not found' })
  }

  res.json(story)
}

export async function getScenesBySlug(req, res) {
  const { slug } = req.params

  // Look up the story by slug
  const { data: story, error: storyError } = await supabase
    .from('stories')
    .select('id')
    .eq('slug', slug)
    .single()

  if (storyError || !story) {
    return res.status(404).json({ error: 'Story not found' })
  }

  // Fetch all scenes for this story, ordered
  const { data: scenes, error: scenesError } = await supabase
    .from('scenes')
    .select('*')
    .eq('story_id', story.id)
    .order('order', { ascending: true })

  if (scenesError) {
    return res.status(500).json({ error: scenesError.message })
  }

  res.json(scenes)
}
