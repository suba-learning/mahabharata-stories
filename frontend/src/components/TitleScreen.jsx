export default function TitleScreen({ story, onBegin }) {
  return (
    <div className="title-screen">
      <p className="kicker">A Story from the Mahabharata</p>
      <h1>{story.title}</h1>
      <div className="divider" />
      {story.lesson && <p className="lesson">{story.lesson}</p>}
      <button className="begin-button" onClick={onBegin}>
        Begin Story
      </button>
    </div>
  )
}
