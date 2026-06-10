import { useEffect } from 'react'

export default function SceneView({ slug, scene, sceneNumber, totalScenes, onNext, onPrev, onFinish }) {
  const isLast = sceneNumber === totalScenes

  useEffect(() => {
    window.scrollTo({ top: 0 })
  }, [scene.id])
  return (
    <div className={`scene-card${scene.scene_type === 'seal' ? ' seal' : ''}`} key={scene.id}>
      {scene.image_filename && (
        <img
          src={`/images/${slug}/${scene.image_filename}`}
          alt={scene.title}
        />
      )}
      <div className="scene-body">
        <h2>{scene.title}</h2>
        <p className="narration">{scene.narration}</p>
      </div>
      <div className="scene-nav">
        <button onClick={onPrev} disabled={sceneNumber === 1}>Previous</button>
        <span className="progress">Scene {sceneNumber} of {totalScenes}</span>
        {isLast && onFinish
          ? <button onClick={onFinish}>Reflect</button>
          : <button onClick={onNext} disabled={isLast}>Next</button>}
      </div>
    </div>
  )
}
