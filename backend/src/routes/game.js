import express from 'express'
import gameController from '../controllers/game'

const gameRoutes = express.Router()

gameRoutes.post('/games', gameController.createGame)
gameRoutes.get('/games', gameController.getGames)
gameRoutes.get('/games/:_id', gameController.getGameById)
gameRoutes.delete('/games/:_id', gameController.deleteGameById)
gameRoutes.put('/games/:_id', gameController.updateGameById)

export default gameRoutes