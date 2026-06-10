import { useState, useEffect } from 'react'
import { useParams, Link } from 'react-router-dom'
import TitleScreen from '../components/TitleScreen'
import SceneView from '../components/SceneView'
import ReflectionScreen from '../components/ReflectionScreen'

export default function StoryPage() {
  const { slug } = useParams()
  const [story, setStory] = useState(null)
  const [scenes, setScenes] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [started, setStarted] = useState(false)
  const [reflecting, setReflecting] = useState(false)
  const [currentIndex, setCurrentIndex] = useState(0)

  useEffect(() => {
    setLoading(true)
    setError(null)
    setStarted(false)
    setReflecting(false)
    setCurrentIndex(0)

    Promise.all([
      fetch(`/api/stories/${slug}`),
      fetch(`/api/stories/${slug}/scenes`),
    ])
      .then(async ([storyRes, scenesRes]) => {
        if (!storyRes.ok) throw new Error(`HTTP ${storyRes.status}`)
        if (!scenesRes.ok) throw new Error(`HTTP ${scenesRes.status}`)
        setStory(await storyRes.json())
        setScenes(await scenesRes.json())
        setLoading(false)
      })
      .catch(err => {
        setError(err.message)
        setLoading(false)
      })
  }, [slug])

  if (loading) return <p className="status-message">Loading...</p>
  if (error) return <p className="status-message">Error: {error}</p>
  if (!story || !scenes.length) return <p className="status-message">No story found.</p>

  if (!started) {
    return (
      <div>
        <Link to="/" className="back-link">&larr; All Stories</Link>
        <TitleScreen story={story} onBegin={() => setStarted(true)} />
      </div>
    )
  }

  const hasQuestions = Array.isArray(story.reflection_questions) && story.reflection_questions.length > 0

  if (reflecting && hasQuestions) {
    return (
      <ReflectionScreen
        story={story}
        onBack={() => {
          setReflecting(false)
          setCurrentIndex(0)
        }}
      />
    )
  }

  return (
    <SceneView
      slug={slug}
      scene={scenes[currentIndex]}
      sceneNumber={currentIndex + 1}
      totalScenes={scenes.length}
      onNext={() => setCurrentIndex(i => i + 1)}
      onPrev={() => setCurrentIndex(i => i - 1)}
      onFinish={hasQuestions ? () => setReflecting(true) : null}
    />
  )
}
