import { Router } from 'express'
import { listStories, getStoryBySlug, getScenesBySlug } from '../controllers/storiesController.js'

const router = Router()

router.get('/', listStories)
router.get('/:slug', getStoryBySlug)
router.get('/:slug/scenes', getScenesBySlug)

export default router
