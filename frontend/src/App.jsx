import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Library from './pages/Library'
import StoryPage from './pages/StoryPage'

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Library />} />
        <Route path="/story/:slug" element={<StoryPage />} />
      </Routes>
    </BrowserRouter>
  )
}
