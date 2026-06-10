import { Link } from 'react-router-dom'

export default function ReflectionScreen({ story, onBack }) {
  return (
    <div className="reflection">
      <p className="kicker">Pause &amp; Reflect</p>
      <h1>What Do You See?</h1>
      <div className="divider" />
      <ol className="reflection-questions">
        {story.reflection_questions.map((q, i) => (
          <li key={i}>{q}</li>
        ))}
      </ol>
      <div className="reflection-actions">
        <button className="back-button" onClick={onBack}>Read Again</button>
        <Link to="/" className="begin-button done-link">All Stories</Link>
      </div>
    </div>
  )
}
