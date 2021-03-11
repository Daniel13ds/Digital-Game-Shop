import express from 'express'
import gameController from '../controllers/game'

const gameRoutes = express.Router()

gameRoutes.post('/', gameController.createGame)
gameRoutes.get('/', gameController.getGames)
gameRoutes.get('/:_id', gameController.getGameById)
gameRoutes.delete('/:_id', gameController.deleteGameById)
gameRoutes.put('/:_id', gameController.updateGameById)

export default gameRout