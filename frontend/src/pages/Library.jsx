import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'

export default function Library() {
  const [stories, setStories] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    fetch('/api/stories')
      .then(res => {
        if (!res.ok) throw new Error(`HTTP ${res.status}`)
        return res.json()
      })
      .then(data => {
        setStories(data)
        setLoading(false)
      })
      .catch(err => {
        setError(err.message)
        setLoading(false)
      })
  }, [])

  if (loading) return <p className="status-message">Loading...</p>
  if (error) return <p className="status-message">Error: {error}</p>

  return (
    <div className="library">
      <p className="kicker">Timeless Tales for Young Minds</p>
      <h1>Mahabharata Stories</h1>
      <div className="divider" />
      <div className="story-list">
        {stories.map(story => (
          <Link key={story.id} to={`/story/${story.slug}`} className="story-card">
            <img
              src={`/images/${story.slug}/scene-01.png`}
              alt=""
              onError={e => { e.target.style.display = 'none' }}
            />
            <div className="story-card-body">
              <h2>{story.title}</h2>
              {story.lesson && <p>{story.lesson}</p>}
            </div>
          </Link>
        ))}
      </div>
    </div>
  )
}
