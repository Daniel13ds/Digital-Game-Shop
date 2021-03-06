import express from 'express'
import rewardController from '../controllers/reward'

const rewardRoutes = express.Router()

rewardRoutes.post('/', rewardController.createReward)
rewardRoutes.get('/', rewardController.getRewards)
rewardRoutes.get('/:_id', rewardController.getRewardById)
rewardRoutes.delete('/:_id', rewardController.deleteRewardById)
rewardRoutes.put('/:_id', rewardController.upadateRewardById)

export default rewardRoutes