import 'dotenv/config'
import express from 'express'
import cors from 'cors'
import storiesRouter from './routes/stories.js'

const app = express()
const PORT = process.env.PORT || 3001

app.use(cors())
app.use(express.json())

app.use('/api/stories', storiesRouter)

app.get('/health', (_req, res) => res.json({ status: 'ok' }))

app.listen(PORT, () => {
  console.log(`Backend running on http://localhost:${PORT}`)
})
