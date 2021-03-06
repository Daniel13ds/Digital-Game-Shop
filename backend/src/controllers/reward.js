import Reward from '../models/reward'

const rewardController = {
    createReward: async (req, res) => {
        const { body } = req
        try {
            const reward = await Reward.create(body)
            res
                .status(201)
                .json(reward)
        } catch (error) {
            res
                .status(400)
                .json({ error: error })
        }
    },
    getRewards: async (req , res) => {
        try {
            const rewards = await Reward.find()
            res
                .status(200)
                .json(rewards)
        } catch (error) {
            res
                .status(400)
                .json({ error: error })
        }
    },
    getRewardById: async (req, res) => {
        const { _id } = req.params
        try {
            const reward = await Reward.findById(_id)
            res
                .status(200)
                .json(reward)
        } catch (error) {
            res
                .status(404)
                .json({ error: error })
        }
    },
    deleteRewardById: async (req, res) => {
        const { _id } = req.params
        try {
            const reward = await Reward.findByIdAndDelete(_id)
            res
                .status(200)
                .json(reward)
        } catch (error) {
            res
                .status(404)
                .json({ error: error })
        }
    },
    upadateRewardById: async (req, res) => {
        const { _id } = req.params
        const { body } = req
        try {
            const reward = await Reward.findByIdAndUpdate(_id, body)
            if (!reward) {
                res
                    .status(404)
                    .json({ error: error })
            } else {
                res
                    .status(200)
                    .json(reward)
            }
        } catch (error) {
            res
                .status(500)
                .json({ error: error })
        }
    }
}

export default rewardController