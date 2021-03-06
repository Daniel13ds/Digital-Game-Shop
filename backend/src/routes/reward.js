import express from 'express'
import gameController from '../controllers/game'
import rewardController from '../controllers/reward'

const rewardRoutes = express.Router()

rewardRoutes.post('/', rewardController.createReward)
rewardRoutes.get('/', rewardController.getRewards)
rewardRoutes.get('/:_id', gameController.getGameById)
rewardRoutes.delete('/:_id', gameController.deleteGameById)
rewardRoutes.put('/:_id', gameController.updateGameById)

export default rewardRoutes