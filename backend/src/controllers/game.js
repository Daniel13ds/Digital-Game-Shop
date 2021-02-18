import Game from '../models/game'

const gameController = {
    createGame: async (req, res) => {
        const { body } = req
        try {
            const game = await Game.create(body)
            res
                .status(201)
                .json(game)
        } catch (error) {
            res
                .status(400)
                .json({ error: error })
        }
    },
    getGames: async (req, res) => {
        try {
            const games = await Game.find()
            res
                .status(200)
                .json(games)
        } catch (error) {
            res
                .status(400)
                .json({ error: error })
        }
    },
    getGameById: async (req, res) => {
        const { _id } = req.params
        try {
            const game = await Game.findById(_id)
            res
                .status(200)
                .json(game)
        } catch (error) {
            res
                .status(404)
                .json({ error: error })
        }
    },
    deleteGameById: async (req, res) => {
        const { _id } = req.params
        try {
            const game = await Game.findByIdAndDelete(_id)
            res
                .status(200)
                .json(game)
        } catch (error) {
            res
                .status(404)
                .json({ error: error })
        }
    },
    updateGameById: async (req, res) => {
        const { _id } = req.params
        const { body } = req
        try {
            const game = await Game.findByIdAndUpdate(_id, body)
            if (!game) {
                res
                    .status(404)
                    .json({ error: error })
            } else {
                res
                    .status(200)
                    .json(game)
            }
        } catch (error) {
            res
                .status(500)
                .json({ error: error })
        }
    }
}

export default gameController